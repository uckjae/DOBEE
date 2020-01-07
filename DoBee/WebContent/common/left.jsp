<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<nav class="side-navbar">
	<div class="side-navbar-wrapper">

		<!-- Sidebar Header    -->
		<div class="sidenav-header d-flex align-items-center justify-content-center">
			<!-- User Info-->
			<div class="sidenav-header-inner text-center">
				<img src="img/dobeemain.png" alt="person"
					class="img-fluid rounded-circle" width="300px" height=200px">
				
			</div>
			<!-- Small Brand information, appears on minimized sidebar-->
			<div class="sidenav-header-logo">
				<a href="index.html" class="brand-small text-center"> <strong>B</strong><strong
					class="text-primary">D</strong></a>
			</div>
		</div>


		<!-- Sidebar Navigation Menus-->
		<div class="main-menu">
			<h5 class="sidenav-heading">Main</h5>
			<ul id="side-main-menu" class="side-menu list-unstyled">
				<li><a href="#"> <i class="fas fa-home fa-2x" style="color:#888888;"></i>Home
				</a></li>
				<li><a href="#"> <i class="fas fa-clipboard-list fa-2x" style="color:#888888;"></i>공지사항
				</a></li>				
				<li><a href="#exampledropdownDropdown" aria-expanded="false"
					data-toggle="collapse"> <i class="fas fa-briefcase fa-2x" style="color:#888888;"></i>근무</a>
					<ul id="exampledropdownDropdown" class="collapse list-unstyled ">
						<li><a href="#">부재일정 신청</a></li>
						<li><a href="#">연장근무 신청</a></li>
						<li><a href="#">부재일정 관리</a></li>
						<li><a href="#">근무내역 확인</a></li>
					</ul>
				</li>
				
				<li><a href="#exampledropdownDropdown2" aria-expanded="false"
					data-toggle="collapse"> <i class="fas fa-receipt fa-2x" style="color:#888888;"></i>비용</a>
					<ul id="exampledropdownDropdown2" class="collapse list-unstyled ">
						<li><a href="#">카드 관리</a></li>
						<li><a href="#">정산 신청</a></li>
						<li><a href="#">비용 현황</a></li>
					</ul>
				</li>
										
				<li><a href="#"> <i class="fas fa-tasks fa-2x" style="color:#888888;"></i>프로젝트</a></li>
				<li><a href="#"> <i class="fas fa-comments fa-2x" style="color:#888888;"></i>채팅</a></li>
			</ul>
		</div>

	</div>
</nav>