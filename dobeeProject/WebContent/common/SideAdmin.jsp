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
						<a><i class="fa fa-briefcase" aria-hidden="true"></i><span>사원</span></a>
						<ul class="nav nav-children">
							<li><a href="adminMain.do">사원목록</a></li>
							<li><a href="addUser.do">사원등록</a></li>
							<li><a href="teamManagement.do">팀관리</a></li>
						</ul>
					</li>
					<li class="nav-parent">
						<a><i class="fa fa-credit-card" aria-hidden="true"></i><span>법인 카드</span></a>
						<ul class="nav nav-children">
							<!-- <li><a href="reciptRegit.do">정산신청</a></li> -->
							<li><a href="AdminDebit.do">법인카드 등록</a></li>
							<li><a href="ListDebit.do">법인카드 관리</a></li>
						</ul>
					</li>
					
					
				</ul>
			</nav>
		</div>
	</div>
</aside>