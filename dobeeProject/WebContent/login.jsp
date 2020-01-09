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

<style type="css/main.css">

</style>

</head>
<body>
	
	  <img src="img/dobeelogo.png" alt="dobeelogo" style="float: left; width:10%; height: 14%">
	
	<div class="limiter" style="height: 20%">
	  
		<div class="container-login100" style="width: 65%">
						
              <img src="img/workplace.PNG" alt="AVATAR" style="width:40%; height: 400px">
			<div class="wrap-login100 p-t-85 p-b-20">
				<form class="login100-form validate-form" style="height: 30%">
					
					<div class="wrap-input100 validate-input m-t-85 m-b-35" data-validate = "Enter username">
						<input class="input100" type="text" name="username">
						<span class="focus-input100" data-placeholder="E-mail"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-50" data-validate="Enter password">
						<input class="input100" type="password" name="password">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>
					
					
					<div class="form-group">
				
					<div class ="col-md-12"> 
					 <div class="row">
						<div class="col-md-6" style="float: left">
							<div class="custom-control custom-checkbox" >
								<input type="checkbox" class="custom-control-input" id="customControlInline">
								<label class="custom-control-label" for="customControlInline" >ID 저장</label>
							</div>
							</div>
						<div class="col-md-6" style="float: right">
							<div class="custom-control custom-checkbox" >
								<input type="checkbox" class="custom-control-input" id="customControl">
								<label class="custom-control-label" for="customControl" >로그인 유지</label>
							</div>
							</div>
						</div>
					</div>
					</div>
					
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
						</div>
						
						<hr>
							
							<div class="container">
							<dl>
							<dt class="m-b-8" style="text-align: center;">
							
							<a href="#" class="txt2" style="float: inherit; color: darkgray;" > 아이디 찾기 </a>
							<span class="bar" aria-hidden="true" style="color: darkgray;">|</span>
							
							<a href="#" class="txt2" style="color: darkgray;"> 비밀번호 찾기 </a>
							</dt>
		    				</dl>
		    				</div>
					
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
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

</body>
</html>