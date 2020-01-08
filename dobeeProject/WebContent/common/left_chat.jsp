<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<nav class="side-navbar">
	<div class="side-navbar-wrapper">

		<!-- Sidebar Header    -->
		<div class="sidenav-header d-flex align-items-center justify-content-center">
			<!-- User Info-->
			<div class="sidenav-header-inner text-center">
				<img src="img/dobee.png" alt="person"
					class="img-fluid rounded-circle" >
				
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
				<li><a href="index.html"> <i class="icon-home"></i>Home
				</a></li>
				<li><a href="forms.html"> <i class="icon-form"></i>Forms
				</a></li>
				<li><a href="charts.html"> <i class="fa fa-bar-chart"></i>Charts
				</a></li>
				<li><a href="tables.html"> <i class="icon-grid"></i>Tables
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
				<li><a href="chat.jsp"> <i class="fas fa-comments"></i>Chat</a></li>
			</ul>
		</div>

	</div>
</nav>