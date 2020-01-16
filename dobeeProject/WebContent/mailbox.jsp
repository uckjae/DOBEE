<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed sidebar-left-collapsed">
	<head>
		<c:import url="/common/HeadTag.jsp"/>
	</head>
	<body>
		<section class="body">

			<!-- start: header -->
			<c:import url="./common/Top.jsp"/>
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<c:import url="./common/Side.jsp"/>
				<!-- end: sidebar -->

				<section role="main" class="content-body">
					<header class="page-header">
						<h2>Inbox</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>Mailbox</span></li>
								<li><span>Inbox</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
					<section class="content-with-menu mailbox">
						<div class="content-with-menu-container" data-mailbox data-mailbox-view="folder">
							<div class="inner-menu-toggle">
								<a href="#" class="inner-menu-expand" data-open="inner-menu">
									Show Menu <i class="fa fa-chevron-right"></i>
								</a>
							</div>
							
							<menu id="content-menu" class="inner-menu" role="menu">
								<div class="nano">
									<div class="nano-content">
										<div class="inner-menu-toggle-inside">
											<a href="#" class="inner-menu-collapse">
												<i class="fa fa-chevron-up visible-xs-inline"></i><i class="fa fa-chevron-left hidden-xs-inline"></i> Hide Menu
											</a>
							
											<a href="#" class="inner-menu-expand" data-open="inner-menu">
												Show Menu <i class="fa fa-chevron-down"></i>
											</a>
										</div>
							
										<div class="inner-menu-content">
											<ul class="list-unstyled mt-xl pt-md">
												<li>
													<a href="mailbox-folder.html" class="menu-item active">Inbox <span class="label label-primary text-normal pull-right">43</span></a>
												</li>
												<li>
													<a href="mailbox-folder.html" class="menu-item">Important</a>
												</li>
												<li>
													<a href="mailbox-folder.html" class="menu-item">Sent</a>
												</li>
												<li>
													<a href="mailbox-folder.html" class="menu-item">Drafts</a>
												</li>
												<li>
													<a href="mailbox-folder.html" class="menu-item">Trash</a>
												</li>
											</ul>
							
											<hr class="separator" />
							
							
											<div class="sidebar-widget m-none">
												<div class="widget-header">
													<h6 class="title">Chat</h6>
													<span class="widget-toggle">+</span>
												</div>
												<div class="widget-content">
													<ul class="list-unstyled mailbox-bullets">
														<li>
															<a href="#" class="menu-item">Amy Doe <span class="ball green"></span></a>
														</li>
														<li>
															<a href="#" class="menu-item">Joey Doe <span class="ball green"></span></a>
														</li>
														<li>
															<a href="#" class="menu-item">Robert Doe <span class="ball orange"></span></a>
														</li>
														<li>
															<a href="#" class="menu-item">John Doe <span class="ball red"></span></a>
														</li>
														<li>
															<a href="#" class="menu-item">Uncle Doe <span class="ball red"></span></a>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</menu>
							<div class="inner-body mailbox-folder">
								<!-- START: .mailbox-header -->
								<header class="mailbox-header">
									<div class="row">
										<div class="col-sm-6">
											<h1 class="mailbox-title text-light m-none">
												<a id="mailboxToggleSidebar" class="sidebar-toggle-btn trigger-toggle-sidebar">
													<span class="line"></span>
													<span class="line"></span>
													<span class="line"></span>
													<span class="line line-angle1"></span>
													<span class="line line-angle2"></span>
												</a>
							
												Inbox
											</h1>
										</div>
										<div class="col-sm-6">
											<div class="search">
												<div class="input-group input-search">
													<input type="text" class="form-control" name="q" id="q" placeholder="Search...">
													<span class="input-group-btn">
														<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
													</span>
												</div>
											</div>
										</div>
									</div>
								</header>
								<!-- END: .mailbox-header -->
							
								<!-- START: .mailbox-actions -->
								<div class="mailbox-actions">
									<ul class="list-unstyled m-none pt-lg pb-lg">
										<li class="ib mr-sm">
											<div class="btn-group">
												<a href="#" class="item-action fa fa-chevron-down dropdown-toggle" data-toggle="dropdown"></a>
							
												<ul class="dropdown-menu" role="menu">
													<li><a href="#">All</a></li>
													<li><a href="#">None</a></li>
													<li><a href="#">Read</a></li>
													<li><a href="#">Unread</a></li>
													<li><a href="#">Starred</a></li>
													<li><a href="#">Unstarred</a></li>
												</ul>
											</div>
										</li>
										<li class="ib mr-sm">
											<a class="item-action fa fa-refresh" href="#"></a>
										</li>
										<li class="ib mr-sm">
											<a class="item-action fa fa-tag" href="#"></a>
										</li>
										<li class="ib">
											<a class="item-action fa fa-times text-danger" href="#"></a>
										</li>
									</ul>
								</div>
								<!-- END: .mailbox-actions -->
							
								<div id="mailbox-email-list" class="mailbox-email-list">
									<div class="nano">
										<div class="nano-content">
											<ul id="" class="list-unstyled">
							
												<li class="unread">
													<a href="mailbox-email.html">
														<div class="col-sender">
															<div class="checkbox-custom checkbox-text-primary ib">
																<input type="checkbox" id="mail1">
																<label for="mail1"></label>
															</div>
															<p class="m-none ib">Okler Themes</p>
														</div>
														<div class="col-mail">
															<p class="m-none mail-content">
																<span class="subject">Check out our new Porto Admin theme! &nbsp;â&nbsp;</span>
																<span class="mail-partial">We are proud to announce that our new theme Porto Admin is ready, wants to know more about it?</span>
															</p>
															<p class="m-none mail-date">11:35 am</p>
														</div>
													</a>
												</li>
							
												<li>
													<a href="mailbox-email.html">
														<i class="mail-label" style="border-color: #EA4C89"></i>
							
														<div class="col-sender">
															<div class="checkbox-custom checkbox-text-primary ib">
																<input type="checkbox" id="mail2">
																<label for="mail2"></label>
															</div>
															<p class="m-none ib">Okler Themes</p>
														</div>
														<div class="col-mail">
															<p class="m-none mail-content">
																<span class="subject">Porto Admin theme! &nbsp;â&nbsp;</span>
																<span class="mail-partial">Check it out.</span>
															</p>
															<i class="mail-attachment fa fa-paperclip"></i>
															<p class="m-none mail-date">3:35 pm</p>
														</div>
													</a>
												</li>
							
												<li>
													<a href="mailbox-email.html">
														<div class="col-sender">
															<div class="checkbox-custom checkbox-text-primary ib">
																<input type="checkbox" id="mail3">
																<label for="mail3"></label>
															</div>
															<p class="m-none ib">Okler Themes</p>
														</div>
														<div class="col-mail">
															<p class="m-none mail-content">
																<span class="subject">Check out our new Porto Admin theme! &nbsp;â&nbsp;</span>
																<span class="mail-partial">We are proud to announce that our new theme Porto Admin is ready, wants to know more about it?</span>
															</p>
															<p class="m-none mail-date">Jul 03</p>
														</div>
													</a>
												</li>
							
							
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<!-- end: page -->
				</section>
			</div>

			<aside id="sidebar-right" class="sidebar-right">
				<div class="nano">
					<div class="nano-content">
						<a href="#" class="mobile-close visible-xs">
							Collapse <i class="fa fa-chevron-right"></i>
						</a>
			
						<div class="sidebar-right-wrapper">
			
							<div class="sidebar-widget widget-calendar">
								<h6>Upcoming Tasks</h6>
								<div data-plugin-datepicker data-plugin-skin="dark" ></div>
			
								<ul>
									<li>
										<time datetime="2014-04-19T00:00+00:00">04/19/2014</time>
										<span>Company Meeting</span>
									</li>
								</ul>
							</div>
			
							<div class="sidebar-widget widget-friends">
								<h6>Friends</h6>
								<ul>
									<li class="status-online">
										<figure class="profile-picture">
											<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
									<li class="status-online">
										<figure class="profile-picture">
											<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
									<li class="status-offline">
										<figure class="profile-picture">
											<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
									<li class="status-offline">
										<figure class="profile-picture">
											<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
								</ul>
							</div>
			
						</div>
					</div>
				</div>
			</aside>
		</section>
		<c:import url="/common/BottomTag.jsp"/>


	</body>
</html>