<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>iofrm</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/fontawesome-all.min.css">
    <link rel="stylesheet" type="text/css" href="css/iofrm-style.css">
    <link rel="stylesheet" type="text/css" href="css/iofrm-theme2.css">
    <!--폰트  -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="form-body">
        <div class="website-logo">
            <a href="#">
                <div class="logo">
                    <img class="logo-size" src="img/logo-light.svg" alt="">
                </div>
            </a>
        </div>
        <div class="row">
            <div class="img-holder">
                <div class="bg"></div>
                <div class="info-holder">
                </div>
            </div>
            <div class="form-holder">
                <div class="form-content" style="font-family: 'Nanum Gothic', sans-serif;">
                    <div class="form-items">
                        <img src="img/beemain2.png" height="150" width="340"/>
                        <br><br>
                        
                        
                        <div class="page-links">
                            <a href="login2.html" class="active">Login</a>
                        </div>
                        <form  action="/dobeeProject/login?${_csrf.parameterName}=${_csrf.token}" method="post">
                            <input class="form-control" type="text" name="mail" placeholder="E-mail Address" required>
                            <input class="form-control" type="password" name="password" placeholder="Password" required>
                            <c:if test="${param.error != null}">
							   <div style="color: #906561;">
							     	로그인실패<br/>
							     	아이디와 비밀번호를 확인하세요
							     	
							   </div>
							</c:if> 
                            <div class="form-button" >
                                <button id="submit" type="submit" class="ibtn">Login</button>
                                <a style="text-decoration: none;" href="findId.do">메일 찾기 /</a>                           
                                <a style="text-decoration: none;" href="findPassWord2.do">비밀번호 찾기</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>