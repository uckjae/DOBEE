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
    //var sql1 = "insert into chatroom(chatroomname, chatcode) values(?, (select chatcode from chatcode where chattype='SELF'))";

    // var sql2 = "insert into chatusers(chatseq, mail) values((select chatseq from chatroom where chatroomname=?), (SELECT MAIL FROM USER WHERE NAME=?))";
    //나에게 채팅방 만들기
    function makeSelfChatRoom(chatRoomName, chatType, name) {

        var sql1 = "insert into chatroom(chatroomname, chatcode) values(?, (select chatcode from chatcode where chattype=?))";
        var sql2 = "insert into chatusers(chatseq, mail) values((select chatseq from chatroom where chatroomname=?), (SELECT MAIL FROM USER WHERE NAME=?))"
        db((err, conn) => {
            conn.beginTransaction(function (err) {
                if (err) {
                    conn.release();  // 반드시 해제해야 함
                    throw err;
                }
                //채팅방 먼저 만들기
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
                            return conn.release();
                        });
                    })
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
    /*//DM 채팅방 만들기
    function makeDmChatRoom(chatRoomName, chatType, chatUsers) {
        var sql1 = "insert into chatroom(chatroomname, chatcode) values(?, (select chatcode from chatcode where chattype=?))";
        var sql2 = "insert into chatusers(chatseq, mail) values((select chatseq from chatroom where chatroomname=?), (SELECT MAIL FROM USER WHERE NAME=?))";

        db((err, conn) => {
            conn.beginTransaction(function (err) {
                if (err) {
                    return conn.release();
                    throw err;
                }
                //채팅방 먼저 만들기
                conn.query(sql1, [chatRoomName, chatType], function(err, result){
                    if (err) {
                        conn.release();
                        throw err;
                    }
                    
                    console.log('첫번째 쿼리문 완료');

                    conn.query(sql2, [chatRoomName, chatUsers[0]], function(err, result){
                        if (err) {
                            conn.release();
                            throw err;
                        }
                        console.log('두번째 쿼리문 완료?');
                        conn.query(sql2, [chatRoomName, chatUsers[1]], function(err, result) {
                            if (err) {
                                conn.release();
                                throw err;

                            }
                            conn.commit(function (err) {
                                if (err) {
                                    conn.rollback(function () {
                                        conn.release();
                                        throw err;
                                    });
                                }
                                console.log('dm 새로운 채팅방 만들기 완료');
                            });
                        });
                    });
                });
                });//transaction end
            conn.release();
            }); //db end
    }*/




    //채팅 내용 저장하기
    function insertChatContent(chatContent, chatRoomName, name) {
        console.log('채팅 내용 저장하기 -> 채팅방 이름 가져오니??'+chatRoomName);
        db((err, conn) => {
            var sql = "insert into chatcontent(chatcontent, chattime, chatseq, mail) values (?,?, (select chatseq from chatroom where chatroomname=?), (select mail from user where name=?))"
            conn.query(sql, [chatContent, currentDate, chatRoomName, name], function (err, result) {
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
    }

    //나에게 채팅방
    self.on('connection', (socket) => {
        socket.on('send message to self', function (chatRoomName, chatType, chatContent, name) {

            console.log('넘어오니??'+chatType+'/'+chatRoomName + "/ 내용 : "+chatContent+"/ 글쓴이 : "+name)

            //기존 채팅방 있는지 확인하는 함수 실행
            checkChatRoom(chatRoomName, chatType).then(function(data) {
                //기존 채팅방이 있는 경우
                if (data == "yes") {
                    console.log('기존 채팅방 있니???');
                    insertChatContent(chatContent, chatRoomName, name);
                    //기존 채팅방이 없는 경우
                } else if ((data == "no")) {
                    console.log('elseif 타니???');
                    makeSelfChatRoom(chatRoomName, chatType, name);
                    insertChatContent(chatContent, chatRoomName, name);

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

        socket.on('send message to group', function (chatRoomName, chatType, chatContent, name) {

            console.log('그룹채팅넘어오니??'+chatType+'/'+chatRoomName +"/" + chatContent + "/" +name);

            insertChatContent(chatContent, chatRoomName, name);
            group.emit('receive message to group', chatContent, currentDate, name);
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
                    })
                }
            });
            dm.emit('receive message to dm', chatContent, currentDate, chatUsers[0]);
        });

        socket.on('disconnect', (socket) => {
            console.log('DM 네임 스페이스 접속 해제');
        })

    }); //dm 채팅방 끝

};