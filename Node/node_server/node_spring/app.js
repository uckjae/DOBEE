var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
//server 함수에 app을 담아줌
//var http = require('http').Server(app);
//var io = require('socket.io')(http);
//var mysql = require('mysql');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var app = express();

var dbConfig = {
  host : '192.168.6.55',
  port:3306,
  user : 'dobee',
  password : '1004',
  database:'dobee',
  connectionLimit : 50,
  waitForConnections : false
};

//connection pool 사용하기
var pool = mysql.createPool(dbConfig);

io.on('connection', function(socket) {
  console.log('한명의 유저가 접속했습니다.');

  //시간 구하는 함수
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


  socket.on('disconnect', function () {
    console.log('접속 해제');

  });

  //일단 나에게 채팅 하기
  //회원 이름이랑 메시지를 파라미터로 받기
  socket.on('send message to self', function (username, msg) {

    var username = username;
    var msg = msg;

    pool.getConnection(function (err, conn) {

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
    io.emit('receive message', msg, currentDate);
  });

});

app.listen(5000, function(){
  console.log('3000포트 연결 완료');})
/*http.listen(5000,function(){
  console.log('3000포트 연결 완료');
});*/

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
