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
</head>
<body>
    <div class="form-body">
    
        <!--시작  -->
        <div class="website-logo">
            <a href="#">
                <div class="logo">
                    <img class="logo-size" src="img/logo-light.svg" alt="">
                </div>
            </a>
        </div>
        <!--끝 -->
        
        <div class="row">
        
            <div class="img-holder">
                <div class="bg"></div>
                <div class="info-holder">
                </div>
            </div>
            
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <h3>도비에 오신 걸 환영합니다.</h3>
                        <p>Dobby is free</p>
                        <div class="page-links">
                            <a href="login2.html" class="active">ID 찾기</a>
                        </div>
                        
                        <form  action="/dobeeProject/login?${_csrf.parameterName}=${_csrf.token}" method="post">
                            <input class="form-control" type="text" name="name" placeholder="이름을 입력하세요" required>
                            <input class="form-control" type="text" name="phone" placeholder="휴대폰번호를 입력하세요" required>
                            <c:if test="${param.error != null}">
							   <div>
							     	이름,휴대폰 번호를 잘못입력하였습니다.<br>
							     	<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
							      		이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
									</c:if>
							   </div>
							</c:if>
                            <div class="form-button">
                                <button id="submit" type="submit" class="ibtn">확인</button> <a href="forget2.html">Forget password?</a>
                            </div>
                        </form>
                        
                       <!--  <div class="other-links">
                            <span>Or login with</span><a href="#">Facebook</a><a href="#">Google</a><a href="#">Linkedin</a>
                        </div> -->
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