<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside id="sidebar-left" class="sidebar-left">

	<div class="sidebar-header">
		<!-- <div class="sidebar-title">Navigation</div> -->
		<div class="sidebar-toggle hidden-xs"
			data-toggle-class="sidebar-left-collapsed" data-target="html"
			data-fire-event="sidebar-left-toggle">
			<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
		</div>
	</div>
	<div class="nano">
		<div class="nano-content">
			<nav id="menu" class="nav-main" role="navigation">
				<ul class="nav nav-main">
					<li class="nav-active">
						<a href="adminMain.do"><i class="fa fa-home" aria-hidden="true"></i><span>메인</span></a>
					</li>
					<li class="nav-parent">
						<a><i class="fa fa-briefcase" aria-hidden="true"></i><span>사원관리</span></a>
						<ul class="nav nav-children">
							<li><a href="breakApply.do">사원목록</a></li>
							<li><a href="addUser.do">사원등록</a></li>
							<li><a href="teamManagement.do">팀관리</a></li>
						</ul>
					</li>
					<li class="nav-parent">
						<a><i class="fa fa-credit-card" aria-hidden="true"></i><span>비용</span></a>
						<ul class="nav nav-children">
							<li><a href="reciptRegit.do">정산신청</a></li>
							<li><a href="reciptRegit.do">카드관리</a></li>
							<li><a href="reciptRegit.do">비용현황</a></li>
						</ul>
					</li>
					<li class="nav-parent">
						<a><i class="fa fa-tasks" aria-hidden="true"></i><span>프로젝트</span></a></a>
						<ul class="nav nav-children">
							<li><a href="forms-basic.html"> 메인 </a></li>
							<li><a href="forms-advanced.html"> 칸반보드 </a></li>
							<li><a href="forms-validation.html"> 일정 </a></li>
							<li><a href="forms-layouts.html"> 프로젝트 현황 </a></li>
						</ul>
					</li>
					
					<li>
						<a href="chat.do">
						<i class="fa fa-comments" aria-hidden="true"></i><span>채팅</span></a>
					</li>
					
				</ul>
			</nav>

			<hr class="separator" />

			<div class="sidebar-widget widget-tasks">
				<div class="widget-header">
					<h6>Projects</h6>
					<div class="widget-toggle">+</div>
				</div>
				<div class="widget-content">
					<ul class="list-unstyled m-none">
						<li><a href="#">JSOFT HTML5 Template</a></li>
						<li><a href="#">Tucson Template</a></li>
						<li><a href="#">JSOFT Admin</a></li>
					</ul>
				</div>
			</div>
			<hr class="separator" />

			<div class="sidebar-widget widget-stats">
				<div class="widget-header">
					<h6>Company Stats</h6>
					<div class="widget-toggle">+</div>
				</div>
				<div class="widget-content">
					<ul>
						<li><span class="stats-title">Stat 1</span> <span
							class="stats-complete">85%</span>
							<div class="progress">
								<div
									class="progress-bar progress-bar-primary progress-without-number"
									role="progressbar" aria-valuenow="85" aria-valuemin="0"
									aria-valuemax="100" style="width: 85%;">
									<span class="sr-only">85% Complete</span>
								</div>
							</div></li>
						<li><span class="stats-title">Stat 2</span> <span
							class="stats-complete">70%</span>
							<div class="progress">
								<div
									class="progress-bar progress-bar-primary progress-without-number"
									role="progressbar" aria-valuenow="70" aria-valuemin="0"
									aria-valuemax="100" style="width: 70%;">
									<span class="sr-only">70% Complete</span>
								</div>
							</div></li>
						<li><span class="stats-title">Stat 3</span> <span
							class="stats-complete">2%</span>
							<div class="progress">
								<div
									class="progress-bar progress-bar-primary progress-without-number"
									role="progressbar" aria-valuenow="2" aria-valuemin="0"
									aria-valuemax="100" style="width: 2%;">
									<span class="sr-only">2% Complete</span>
								</div>
							</div></li>
					</ul>
				</div>
			</div>
		</div>

	</div>

</aside>