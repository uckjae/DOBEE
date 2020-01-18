const SocketIO = require('socket.io');
var db = require('./database');

module.exports = (server, app) => {

    const io = SocketIO(server, { path: '/socket.io' });

    app.set('io', io); //라우터에서 io 객체를 쓸 수 있게 저장 -> req.app.get('io')로 접근 가능

    const self = io.of('/self');
    const group = io.of('/group');
    const dm = io.of('/dm');


    function getFormatDate(date) {
        var year = date.getFullYear();              //yyyy
        var month = (1 + date.getMonth());          //M
        month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
        var day = date.getDate();                   //d
        day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
        var hour = date.getHours();
        hour = hour > 10 ? hour : '0' + hour;
        var minute = date.getMinutes();
        minute = minute > 10 ? minute : '0' + minute;
        return year + '/' + month + '/' + day + " " + hour + ":" + minute;
    }

    var date = new Date();
    var currentDate = getFormatDate(date);

    function checkChatRoom(chatRoomName, chatType) {
        return new Promise(function (resolve, reject) {
            var sql = "select * from chatroom where chatroomname=? AND CHATCODE=(SELECT CHATCODE FROM CHATCODE WHERE CHATTYPE=?) ";
            var check = "";
            db((err, conn) => {
                conn.query(sql, [chatRoomName, chatType], function(err, result) {
                    if (err) {
                        reject(new Error("에러 발생"));
                    }
                    if (result.length > 0) {
                        resolve("yes");
                    } else {
                        resolve("no");
                    }
                    conn.release();
                });
            });
        });

    }

    //나에게 채팅방 만들기(프로미스)
    function makeSelfChatRoom(chatRoomName, chatType, name) {

        return new Promise(function(resolve, reject){

            var sql1 = "insert into chatroom(chatroomname, chatcode) values(?, (select chatcode from chatcode where chattype=?))";
            var sql2 = "insert into chatusers(chatseq, mail) values((select chatseq from chatroom where chatroomname=?), (SELECT MAIL FROM USER WHERE MAIL=?))"
            db((err, conn) => {
                conn.beginTransaction(function (err) {
                    if (err) {
                        conn.release();  // 반드시 해제해야 함
                        reject(new Error("에러 발생"));
                        throw err;
                    }
                    conn.query(sql1, [chatRoomName, chatType], function(err, result){
                        if (err) {
                            conn.release();  // 반드시 해제해야 함
                            throw err;
                        }
                        conn.query(sql2, [chatRoomName, name], function(err, result){
                            if (err) {
                                conn.release();  // 반드시 해제해야 함
                                throw err;
                            }
                            conn.commit(function (err) {
                                if (err) {
                                    return conn.rollback(function () {
                                        conn.release();
                                        throw err;
                                    });
                                }
                                console.log('새로운 채팅방 만들기 완료');
                                resolve("yes");
                                return conn.release();
                            });
                        })
                    });

                });
            });
        });
    }


    function makeDmChatRoom(chatRoomName, chatType, chatUsers) {
        return new Promise(function(resolve, reject){
            var sql1 = "insert into chatroom(chatroomname, chatcode) values(?, (select chatcode from chatcode where chattype=?))";
            var sql2 = "insert into chatusers(chatseq, mail) values((select chatseq from chatroom where chatroomname=?), (SELECT MAIL FROM USER WHERE NAME=?))";

            db((err, conn) => {
                conn.beginTransaction(function (err) {
                    if (err) {
                        throw err;
                    }
                    //채팅방 먼저 만들기
                    conn.query(sql1, [chatRoomName, chatType], function(err, result){
                        if (err) {
                            throw err;
                        }

                        console.log('첫번째 쿼리문 완료');

                        conn.query(sql2, [chatRoomName, chatUsers[0]], function(err, result){
                            if (err) {
                                throw err;
                            }
                            console.log('두번째 쿼리문 완료?');
                            conn.query(sql2, [chatRoomName, chatUsers[1]], function(err, result) {
                                if (err) {
                                    throw err;

                                }
                                conn.commit(function (err) {
                                    if (err) {
                                        conn.rollback(function () {
                                            throw err;
                                            reject(new Error('commit 실패'));
                                        });
                                    }
                                    resolve('commit success');
                                });
                            });
                        });
                    });
                });//transaction end



                conn.release();
            }); //db end
        })
    }



    //채팅 내용 저장하기
    /*function insertChatContent(chatContent, chatRoomName, mail) {
        console.log('채팅 내용 저장하기 -> 채팅방 이름 가져오니??'+chatRoomName);
        db((err, conn) => {
            var sql = "insert into chatcontent(chatcontent, chattime, chatseq, mail) values (?,?, (select chatseq from chatroom where chatroomname=?), (select mail from user where mail=?))"
            conn.query(sql, [chatContent, currentDate, chatRoomName, mail], function (err, result) {
                if (err) { //에러나면 rollback
                    conn.release();
                    throw err;
                }
                if(result.length > 0 ){
                    console.log('기존 채팅방에 대화 내용 저장 커밋 완료');
                } else {
                }
                conn.release();

            });
        });
    }*/

    function insertChatContent(chatContent, chatRoomName, mail) {
        return new Promise(function(resolve, reject){
            db((err, conn) => {
                var sql = "insert into chatcontent(chatcontent, chattime, chatseq, mail) values (?,?, (select chatseq from chatroom where chatroomname=?), (select mail from user where mail=?))"
                conn.query(sql, [chatContent, currentDate, chatRoomName, mail], function (err, result) {
                    if (err) { //에러나면 rollback
                        reject(new Error("에러 발생"));
                    } else {
                        resolve("yes");
                    }
                });
            });
        });
    }
    //나에게 채팅방
    self.on('connection', (socket) => {
        socket.on('send message to self', function (chatRoomName, chatType, chatContent, mail) {

            console.log('넘어오니??'+chatType+'/'+chatRoomName + "/ 내용 : "+chatContent+"/ 글쓴이 : "+mail)

            //기존 채팅방 있는지 확인하는 함수 실행
            checkChatRoom(chatRoomName, chatType).then(function(data) {
                //기존 채팅방이 있는 경우insertChatContent
                if (data == "yes") {
                    console.log('기존 채팅방 있니???');
                    insertChatContent(chatContent, chatRoomName, mail);
                    //기존 채팅방이 없는 경우
                } else if ((data == "no")) {
                    console.log('elseif 타니???');
                    makeSelfChatRoom(chatRoomName, chatType, mail).then(function(data) {
                        if (data == "yes") {
                            console.log('나에게 채팅방 만드는 함수 성공');
                            insertChatContent(chatContent, chatRoomName, mail);
                        } else {
                            console.log('나에게 채팅방 만드는 함수 실패');
                            return;
                        }

                    });
                }
            });
            socket.emit('receive message to self', chatContent, currentDate);
        });

        socket.on('disconnect', (socket) => {
            console.log('self 네임 스페이스 접속 해제');

        })

    }); //나에게 채팅방 끝


    group.on('connection', (socket) => {
        console.log('그룹 채팅 참여');

        socket.on('send message to group', function (chatRoomName, chatType, chatContent, userMail, userName) {
            insertChatContent(chatContent, chatRoomName, userMail);

            group.emit('receive message to group', chatContent, currentDate, userName);
        });
        socket.on('disconnect', (socket) => {
            console.log('group 네임 스페이스 접속 해제');
        })

    });


    dm.on('connection', (socket) => {
        console.log('dm 채팅방 연결');
        socket.on('send message to dm', function (chatRoomName, chatType, chatContent, chatUsers) {
            console.log('어떻게 넘어오니?? 채팅방 이름 : ' + chatRoomName + "타입 : "+chatType+"내용 : "+chatContent+" 참가자들 : "+chatUsers);
            //수신자
            var fromName = chatUsers[0];
            //기존 채팅방 있는지 확인하는 함수 실행
            checkChatRoom(chatRoomName, chatType).then(function(data) {
                //기존 채팅방이 있는 경우
                if (data == "yes") {
                    console.log('기존 채팅방 있니???')
                    insertChatContent(chatContent, chatRoomName, fromName);
                    //기존 채팅방이 없는 경우
                } else if ((data == "no")) {
                    makeDmChatRoom(chatRoomName, chatType, chatUsers).then(function(data){
                        console.log('dm 채팅방 만들기 함수 실행 결과'+data);
                        if(data == 'commit success'){

                            insertChatContent(chatContent, chatRoomName, chatUsers[0]);
                            console.log('대화내용 저장 완료');
                        } else {
                            console.log('대화내용 저장 실패!!!!!!!');
                        }
                    }).catch(function(err) {console.log('에러?'+err)})
                }
            });
            dm.emit('receive message to dm', chatContent, currentDate, chatUsers[0]);
        });

        socket.on('disconnect', (socket) => {
            console.log('DM 네임 스페이스 접속 해제');
        })

    }); //dm 채팅방 끝

};