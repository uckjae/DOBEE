<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Side Navbar -->
    <nav class="side-navbar">
<div class="side-navbar-wrapper">
		<!-- Sidebar Header    -->
		<div class="sidenav-header d-flex align-items-center justify-content-center">
			<!-- User Info-->
			<div class="sidenav-header-inner text-center">
				<img src="./img/dobeelogo1.png" alt="person"
					class="img-fluid rounded-circle" width="300px" height=400px">
				
			</div>
			<!-- Small Brand information, appears on minimized sidebar-->
			<div class="sidenav-header-logo">
				<a href="index.html" class="brand-small text-center"> <strong class="text-primary">B</strong><strong 
					class="text-primary">D</strong></a>
			</div>
		</div>


		<!-- Sidebar Navigation Menus-->
		<div class="main-menu">
		    <h5 class="sidenav-heading">전체일정</h5>
			<ul id="side-main-menu" class="side-menu list-unstyled">
				<li><a href="#"><i class="fas fa-home fa-2x"></i>메인</a></li>
				<li><a href="noticeList.do"><i class="fas fa-clipboard-list fa-2x"></i>공지사항</a></li>
				<h5 class="sidenav-heading">My근무</h5>				
				<li><a href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>근무</a>
					<ul id="exampledropdownDropdown" class="collapse list-unstyled ">
						<li><a href="breakApply.do">부재 일정 신청</a></li>
						<li><a href="extendApply.do">연장 근무 신청</a></li>
						<li><a href="breakManage.do">부재 일정 관리</a></li>
						<li><a href="workManage.do">근무 내역 확인</a></li>
						<li><a href="absManage.do">관리자 승인 페이지</a></li>
					</ul>
				</li>
				
				<h5 class="sidenav-heading">정산관리</h5>
				<li><a href="#exampledropdownDropdown2" aria-expanded="false"
					data-toggle="collapse"> <i class="fas fa-receipt fa-2x"></i>비용</a>
					<ul id="exampledropdownDropdown2" class="collapse list-unstyled ">
						<li><a href="reciptRegit.do">정산 신청</a></li>
						<li><a href="reciptRegit.do">카드 관리</a></li>
						<li><a href="reciptRegit.do">비용 현황</a></li>
					</ul>
				</li>
								
				<li><a href="pjtMain.do"> <i class="fas fa-tasks fa-2x"></i>프로젝트</a></li>
				<li><a href="chat.do"><i class="fas fa-comments fa-2x"></i></a></li>
			</ul>
		</div>
	</div>
	</nav>