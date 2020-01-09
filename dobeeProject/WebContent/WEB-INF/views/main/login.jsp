<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>MainPage</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
	<c:import url="/common/tag.jsp"/>

<style type="css/main.css">

</style>

</head>
<body>
	
	  <img src="img/dobeelogo.png" alt="AVATAR" style="float: left; width:15%; height: 26%">
	
	<div class="limiter" style="height: 20%">
	  
		<div class="container-login100" style="width: 65%">
						
              <img src="img/workplace.PNG" alt="AVATAR" style="width:40%; height: 400px">
				
		
			<div class="wrap-login100 p-t-85 p-b-20">
				<form class="login100-form validate-form" style="height: 30%" action="/dobeeProject/login?${_csrf.parameterName}=${_csrf.token}" method="post">
					
					<div class="wrap-input100 validate-input m-t-85 m-b-35" data-validate = "Enter username">
						<input class="input100" type="text" name="email">
						<span class="focus-input100" data-placeholder="E-mail"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-50" data-validate="Enter password">
						<input class="input100" type="password" name="password">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>
					<c:if test="${param.error != null}">
					   <div>
					     	로그인실패<br>
					     	<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
					      		이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
							</c:if>
					   </div>
					</c:if> 
					
					<div class="form-group">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="customControlInline">
								<label class="custom-control-label" for="customControlInline">ID 저장</label>
							</div>
						</div>
						
					<div class="form-group">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="customControl">
								<label class="custom-control-label" for="customControl">ID 유지</label>
							</div>
						</div>
					
					<div class="container-login100-form-btn" style="height: 20%">
						<button class="login100-form-btn">
							Login
						</button>
						 
						
							<ul class="login-more p-t-190">
						<li class="m-b-8">
							<span class="txt1">
								아이디 및 찾기
							</span>
							<a href="#" class="txt2">
								Username 
							</a>
							
							<a href="#" class="txt2">
								Password?
							</a>
						</li>
    				</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	


</body>
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
</html>