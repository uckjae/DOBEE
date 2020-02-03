<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>EMAILCERTIFICATION</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">

<style >
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body{
   font-family: 'Noto Serif KR', serif;
}
	
	</style>

</head>
<body>
	


	<div class="limiter" >
	  
		
			<div class ="container">	
			
              <img src="img/workplace.PNG" alt="AVATAR" style="width:20%; height: 200px; display: block; margin: 0px auto; ">
				</div>
				
				<br>
			<hr style=" width: 25%; display: block; margin: 0px auto;">
			<div class="wrap-login100 p-t-85 p-b-20" style="align-content: center; display: block; margin: 0px auto;">
				<form class="login100-form validate-form" style=" height: 50%; text-align: center; ">
				<h2> HELLO, ${name } 님 </h2>	<br>
					<h5> DoBee를 이용하시려면 메일 인증 버튼을 클릭하여 다음 단계를 진행하세요</h5>
					<hr>
					<h6> YOUR URL : 192,............. </h6>
					<br>
					<h6> LOGIN ID : ${mail} </h6>
					<br>
					<div class="container-login100-form-btn" style="height: 20%">
						<button class="login100-form-btn">
							Email Authentication / 메일 인증
						</button>
						</div>
				</form>
			</div>
		
	</div>
	

	

</body>
</html>