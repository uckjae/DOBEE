<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<h2> Warning </h2>
					<h5><c:out value="${user.name}"></c:out>님  현재 관리자 아이디로 로그인하였습니다</h5>
					<hr style=" width: 25%; display: block; margin: 0px auto;">
					<h6>여기서 수정된 모든 내용은 실제로 반영되며</h6>
					<h6>삭제된 내용은 복구할 수 없습니다.</h6>
					<hr style=" width: 10%; display: block; margin: 0px auto;">
					<h6> Your URL : 이건 왜 뜨게하는 거야???? </h6>
					<h6> LOGIN ID : <c:out value="${user.mail}"></c:out> </h6>
					<div class="container-login100-form-btn" style="height: 20%">
						<a class="button btn-prev" href="adminMain.do">
							관리자 페이지로 이동하기
						</a>
					</div>
				</form>
			</div>
		
	</div>
</body>
</html>