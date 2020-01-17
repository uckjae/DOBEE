<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<c:import url="/common/HeadTag.jsp"/>
</head>
 <style>
  @import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body {
   font-family: 'Noto Serif KR', serif;
}

</style>



</head>
<body>
	
	  <img src="./img/beemain2.png" alt="AVATAR" style="float: left; width:15%; height: 26%">
	
	<div class="limiter" style="height: 20%">
	  
		<div class="container-login100" style="width: 65%">
						
              <img src="img/workplace.PNG" alt="AVATAR" style="width:40%; height: 400px">
				
		
			<div class="wrap-login100 p-t-85 p-b-20">
				<form class="login100-form validate-form" style="height: 30%" action="/dobeeProject/login?${_csrf.parameterName}=${_csrf.token}" method="post">
					
					<div class="wrap-input100 validate-input m-t-85 m-b-35" data-validate = "Enter username">
						<input class="input100" type="text" name="mail">
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
								<label class="custom-control-label" for="customControl">로그인 유지</label>
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
</html>