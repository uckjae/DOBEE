<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<title>EMAILCERTIFICATION</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">

<style >
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body{
   font-family: 'Noto Serif KR', serif;
}
	
	</style>
	
	
	<script type="text/javascript">
		function sendPwdForm (){
			var formData = $('#pwdForm').serialize();
			console.log(formData);
			/* $.ajax({
				url: "ajax/admin/resetPwdResult.do",
				data: formData,
				success: function(){
					console.log("성공");
				},
				error: function(){
					console.log("Error");
				}
			}) */
		}
	</script>
</head>
<body>
	<c:set var="user" value="${requestScope.user }"/>


	<div class="limiter" >
	  
		
			<div class ="container">	
			
              <img src="img/workplace.PNG" alt="AVATAR" style="width:20%; height: 165px; display: block; margin: 0px auto; ">
				</div>
				
				<br>
			<hr style=" width: 30%; display: block; margin: 0px auto;">
			<div class="wrap-login100 p-t-85 p-b-20" style="align-content: center; display: block; margin: 0px auto;">
				<form action="resetPwdResult.do" id="pwdForm" class="login100-form validate-form" style=" height: 40%; text-align: center; " method="post">
				<h3> HELLO, <c:out value="${user.name}"/> 님 </h3>	<br>
					<h6> 입사를 축하드립니다 ^^ ! </h6> 
					<br>
					<h6> 사이트 이용을 위해 비밀 번호를 설정 해주세요.<c:out value="${user.mail}"/> </h6>
						<input type="hidden" name="mail" value="${user.mail}">			
					<div class="wrap-input100 validate-input m-t-85 m-b-35" data-validate = "Enter username">
						<input class="input100" type="text" name="password">
						<span class="focus-input100" data-placeholder="새로운 비밀번호 입력"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-50" data-validate="Enter password">
						<input class="input100" type="text" name="confirmPassword">
						<span class="focus-input100" data-placeholder="비밀번호 재입력"></span>
					</div>
					
					<br>
					<div class="container-login100-form-btn" style="height: 20%">
						<button class="login100-form-btn" onclick="sendPwdForm()">
							비밀 번호 설정 완료
						</button>
						</div>
				</form>
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