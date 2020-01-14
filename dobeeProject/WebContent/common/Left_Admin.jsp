<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<ul id="side-main-menu" class="side-menu list-unstyled">
				<li><a href="#exampledropdownDropdown" aria-expanded="false"
					data-toggle="collapse"> <i class="fas fa-briefcase fa-2x" style="color:#888888;">&nbsp;사원관리</i></a>
					<ul id="exampledropdownDropdown" class="collapse list-unstyled ">
						<li><a href="adminMain.do">사원 목록</a></li>
						<li><a href="addUser.do">사원 등록</a></li>
					</ul>
				</li>
				<li><a href="#"> <i class="fas fa-clipboard-list fa-2x" style="color:#888888;">&nbsp;권한관리</i>
				</a></li>	
				
				
				<li><a href="#exampledropdownDropdown" aria-expanded="false"
					data-toggle="collapse"> <i class="fas fa-briefcase fa-2x" style="color:#888888;">&nbsp;법인카드관리</i></a>
					<ul id="exampledropdownDropdown" class="collapse list-unstyled ">
						<li><a href="AdminDebit.do">법인카드 등록</a></li>
						<li><a href="AdminDebit.do">법인카드 목록</a></li>
					</ul>
				</li>
				
				
			
							
				
			</ul>
		</div>
	</div>