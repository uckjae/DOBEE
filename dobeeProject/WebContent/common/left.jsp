<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <head>
    <html>
    <style>
    .text-primary {
  color: black !important;
}
    </style>
    </html>
<div class="side-navbar-wrapper">

		<!-- Sidebar Header    -->
		<div class="sidenav-header d-flex align-items-center justify-content-center">
			<!-- User Info-->
			<div class="sidenav-header-inner text-center">
				<img src="./img/logo.png" alt="person"
					class="img-fluid rounded-circle" width="300px" height=200px">
				
			</div>
			<!-- Small Brand information, appears on minimized sidebar-->
			<div class="sidenav-header-logo" >
				<a href="index.html" class="brand-small text-center"> <strong class="text-primary" style="color: black">B</strong><strong 
					class="text-primary" style="color: black">D</strong></a>
			</div>
		</div>


		<!-- Sidebar Navigation Menus-->
		<div class="main-menu">
<!-- 			<h5 class="sidenav-heading">Main</h5>
 -->			<ul id="side-main-menu" class="side-menu list-unstyled">
				<li><a href="#"> <i class="fas fa-home fa-2x" style="color:#888888;">&nbsp;메인</i>
				</a></li>
				<li><a href="#"> <i class="fas fa-clipboard-list fa-2x" style="color:#888888;">&nbsp;공지사항</i>
				</a></li>				
				<li><a href="#exampledropdownDropdown" aria-expanded="false"
					data-toggle="collapse"> <i class="fas fa-briefcase fa-2x" style="color:#888888;">&nbsp;근무</i></a>
					<ul id="exampledropdownDropdown" class="collapse list-unstyled ">
						<li><a href="#">부재 일정 신청</a></li>
						<li><a href="#">연장 근무 신청</a></li>
						<li><a href="#">부재 일정 관리</a></li>
						<li><a href="#">근무 내역 확인</a></li>
					</ul>
				</li>
				
				<li><a href="#exampledropdownDropdown2" aria-expanded="false"
					data-toggle="collapse"> <i class="fas fa-receipt fa-2x" style="color:#888888;">&nbsp;비용</i></a>
					<ul id="exampledropdownDropdown2" class="collapse list-unstyled ">
						<li><a href="reciptRegit.do">정산 신청</a></li>
						<li><a href="#">카드 관리</a></li>
						<li><a href="debitList.do">비용 현황</a></li>
					</ul>
				</li>
										
				<li><a href="project.do"> <i class="fas fa-tasks fa-2x" style="color:#888888;">&nbsp;프로젝트</i></a></li>
				<li><a href="chat.jsp"> <i class="fas fa-comments fa-2x" style="color:#888888;">&nbsp;채팅</i></a></li>
			</ul>
		</div>

	</div>
	</head>