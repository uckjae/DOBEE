<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/common/HeadTag.jsp"/>
<link rel="stylesheet" href="assets/vendor/pnotify/pnotify.custom.css" />
<header class="header">
		<div class="logo-container">
			<a href="main.do" class="logo">
				<img src="./img/beemain2.png" height="44" alt="로고" />
			</a>
			<div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
				<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
			</div>
		</div>
	
		<!-- start: search & user box -->
		<div class="header-right">
			<span class="separator"></span>
			<div id="userbox" class="userbox">
				<a href="#" data-toggle="dropdown">
					<figure class="profile-picture">
					<!-- 등록된 사원 사진 뿌려주기!! -->
						<img src="upload/${user.myPic}" onError="this.src='img/avatar.jpg'" alt="사원" class="img-circle" />
					</figure>
					<div class="profile-info">
						<span class="name" id="name">${user.name}</span>
						<span class="role" id="mail">${user.mail}</span>
					</div>
	
					<i class="fa custom-caret"></i>
				</a>
	
				<div class="dropdown-menu">
					<ul class="list-unstyled">
						<li class="divider"></li>
						<li>
							<a role="menuitem" tabindex="-1" style="color:red;"><i class="fa fa-power-off"></i>관리자</a>
						</li>
						<li>
							<a role="menuitem" tabindex="-1" href="#" onclick="document.getElementById('logout-form').submit();"><i class="fa fa-sign-out"></i>로그아웃</a>
							<form id="logout-form" action='<c:url value='/logout'/>' method="POST">
 										<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
							</form>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- end: search & user box -->
	</header>
			
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="assets/vendor/pnotify/pnotify.custom.js"></script>

	
