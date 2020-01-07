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
				<li><a href="index.html"> <i class="fas fa-home fa-2x" style="color:#888888;"></i>Home
				</a></li>
				<li><a href="forms.html"> <i class="fas fa-clipboard-list fa-2x" style="color:#888888;"></i>Board
				</a></li>
				<li><a href="charts.html"> <i class="fas fa-briefcase fa-2x" style="color:#888888;"></i>Work</a></li>
				<li><a href="tables.html"> <i class="fas fa-receipt fa-2x"  style="color:#888888;"></i>Bills
				</a></li>
				<li><a href="#exampledropdownDropdown" aria-expanded="false"
					data-toggle="collapse"> <i class="icon-interface-windows"></i>Example	dropdown
				</a>
					<ul id="exampledropdownDropdown" class="collapse list-unstyled ">
						<li><a href="#">Page</a></li>
						<li><a href="#">Page</a></li>
						<li><a href="#">Page</a></li>
					</ul></li>
				<li><a href="login.html"> <i class="icon-interface-windows"></i>Login
						page
				</a></li>
				<li><a href="#"> <i class="icon-mail"></i>Demo
						<div class="badge badge-warning">6 New</div></a></li>
			</ul>
		</div>

	</div>
</nav>