const SocketIO = require('socket.io');
var db = require('./database');

module.exports = (server, app) => {

    const io = SocketIO(server, { path: '/socket.io' });

    app.set('io', io); //라우터에서 io 객체를 쓸 수 있게 저장 -> req.app.get('io')로 접근 가능

    const selfchat = io.of('/selfchat');

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




    selfchat.on('connection', (socket) => {
        socket.on('send message to self', function (username, msg) {
            console.log('메시지 넘어오니??');
            console.log('username'+username);
            console.log('msg'+msg);

            db((err, conn) => {
                //'나에게' 채팅방이 기존에 있는지 없는지 체크
                var check_chatroom = "select * from chatroom where chatroomname=?";
                conn.query(check_chatroom, username, function(err, result){

                    if(err){
                        console.error('에러 발생'+err);
                        return conn.rollback(function () {
                            conn.release();
                            throw err;
                        });
                    }
                    if(result.length>0){ //기존 '나에게' 채팅방이 있는 경우 -> 기존 방에 업데이트하기
                        if (err) {
                            conn.release();  // 반드시 해제해야 함
                            throw err;
                        }

                        var sql = "insert into chatcontent(chatcontent, chattime, chatseq, mail) values(?, ?, (select chatseq from chatroom where chatroomname=?), (select mail from user where name=?))"
                        conn.query(sql, [msg, currentDate, username, username], function (err, result) {
                            if (err) { //에러나면 rollback
                                return conn.rollback(function () {
                                    conn.release();
                                    throw err;
                                });
                            }
                            console.log('기존 대화방에 대화 내용 저장 완료');
                        });

                    } else if(result.length == 0){ //기존 방이 없는 경우 >> 새로 만들기
                        //트랜잭션 시작
                        conn.beginTransaction(function (err) {
                            if (err) {
                                conn.release();  // 반드시 해제해야 함
                                throw err;
                            }

                            var sql1 = "insert into chatroom(chatroomname, chatcode) values(?, (select chatcode from chatcode where chattype='SELF'))";
                            conn.query(sql1, username, function (err, result) {
                                if (err) { //에러나면 rollback
                                    return conn.rollback(function () {
                                        conn.release();
                                        throw err;
                                    });
                                }
                                console.log('채팅방 만들기 성공');

                                //'나에게' 채팅방 참여자 만들기
                                var sql2 = "insert into chatusers(chatseq, mail) values((select chatseq from chatroom where chatroomname=?), (SELECT MAIL FROM USER WHERE NAME=?))";

                                conn.query(sql2, [username, username], function (err, result) {
                                    if (err) { //에러나면 rollback
                                        return conn.rollback(function () {
                                            conn.release();
                                            throw err;
                                        });
                                    }

                                    var sql3 = "insert into chatcontent(chatcontent, chattime, chatseq, mail) values (?,?, (select chatseq from chatroom where chatroomname=?), (select mail from user where name=?))"
                                    conn.query(sql3, [msg, currentDate, username, username], function (err, result) {
                                        if (err) { //에러나면 rollback
                                            return conn.rollback(function () {
                                                conn.release();
                                                throw err;
                                            });
                                        }
                                        conn.commit(function (err) {
                                            if (err) {
                                                return conn.rollback(function () {
                                                    conn.release();
                                                    throw err;
                                                });
                                            }
                                            console.log('새로운 채팅방 만들고 대화 내용 저장 커밋 완료');
                                            return conn.release();
                                        });
                                    });
                                })
                            });
                        }); //transaction end

                    }; //기존 방이 없는 경우 끝
                }); //체크하는 쿼리 끝
            }); //db 연결 끝
            socket.emit('receive message', msg, currentDate);




        });




    });


};