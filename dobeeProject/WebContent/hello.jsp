<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>admin login</title>
    <!-- Bootstrap core CSS -->
    <link href="css/cover/bootstrap.min.css" rel="stylesheet">
    
    <link href="css/cover/cover.css" rel="stylesheet">
    <script src="assets/js/ie-emulation-modes-warning.js"></script>
  </head>
  <body>

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
              
            </div>
          </div>

          <div class="inner cover">
            <h1 class="cover-heading">Waning</h1>
            
            <br>
            <hr>
            <p class="lead">안녕하세요!<c:out value="${user.mail}"></c:out>님 </p>
            <p class="lead">현재 관리자 아이디로 로그인하였습니다</p>
            <p class="lead">이곳에서 수정된 모든 내용은 실제로 반영되며 삭제된 내용은 복구할 수 없습니다.</p>
            <p class="lead">접근을 위해서는 아래 버튼을 누르세요</p>
            <br>
            <p class="lead">
              <a href="adminMain.do" class="btn btn-lg btn-default">이동하기</a>
            </p>
          </div>

          <div class="mastfoot">
            <div class="inner">
              <p>Waning System <a href="http://getbootstrap.com">Page</a>, by <a href="https://twitter.com/mdo">@DoBee</a>.</p>
            </div>
          </div>

        </div>

      </div>

    </div>

    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
