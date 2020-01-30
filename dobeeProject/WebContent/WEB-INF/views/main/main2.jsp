<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html class="fixed">
<head>

<c:import url="/common/HeadTag.jsp" />

</head>
<body>
	<section class="body">

		<!-- start: header -->
		<c:import url="/common/Top.jsp" />
		<!-- end: header -->


		<div class="inner-wrapper">
			<!-- start: sidebar -->
			<c:import url="/common/Side.jsp" />
			<!-- end: sidebar -->

			<!-- start : main Content -->
			<section role="main" class="content-body">
				<header class="page-header">
					<h2>메인입니다.</h2>

					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="index.html"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>Dashboard</span></li>
						</ol>
						
						<a class="sidebar-right-toggle" data-open="sidebar-right"><i
							class="fa fa-chevron-left"></i></a>
					</div>
				</header>

				<div class="row">
				<!-- 컨텐츠 시작 -->
				
					<!-- 공지사항 시작 -->			
					<div class="col-md-6">
						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a> <a href="#"
										class="fa fa-times"></a>
								</div>
								<h2 class="panel-title">공지사항</h2>
							</header>
							<div class="panel-body">

								<div class="table-responsive">
									<table class="table table-striped mb-none">
										<thead>
											<tr>
												<th class="notSeq" style="width: 20%; text-align: center;">#</th>
												<th class="nsContent" style="width: 30%; text-align: center;">일정</th>
												<th class="startTime" style="width: 25%; text-align: center;">시작일</th>
												<th class="endTime" style="width: 25%; text-align: center;">종료일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list}" var="n">
												<tr>
													<td class="notSeq" style="text-align: center;">${n.notSeq}</td>
													<td class="nsContent" style="text-align: center;">
													<a href="noticeDetail.do?notSeq=${n.notSeq}">${n.nsContent}</a>
													</td>
													<td class="startTime" style="text-align: center;">
													  <fmt:formatDate value="${n.startTime}" pattern="yyyy-MM-dd HH:mm"/>
													</td>
													<td class="startTime" style="text-align: center;">
													  <fmt:formatDate value="${n.endTime}" pattern="yyyy-MM-dd HH:mm"/>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</section>
					</div>
					<!-- 공지사항 끝 -->
					
					
					
					<!--  켈린더 -->
		
		
		
		
					
					<!--  켈린더 끝 -->
					
					
					
				
				<!--  프로젝트 진행상황 -->
				<div class="row">
					<div class="col-lg-12">
							<section></section>
					
					</div>
				</div>
				<!--  프로젝트 진행상황  끝 -->




				<!--  개인 업무 to do list-->
				<div class="row">
						<div class="col-xl-3 col-lg-6">
							<section class="panel panel-transparent">
								<header class="panel-heading">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
										<a href="#" class="fa fa-times"></a>
									</div>

									<h2 class="panel-title">My Profile</h2>
								</header>
								<div class="panel-body">
									<section class="panel panel-group">
										<header class="panel-heading bg-primary">

											<div class="widget-profile-info">
												<div class="profile-picture">
													<img src="assets/images/!logged-user.jpg">
												</div>
												<div class="profile-info">
													<h4 class="name text-semibold">John Doe</h4>
													<h5 class="role">Administrator</h5>
													<div class="profile-footer">
														<a href="#">(edit profile)</a>
													</div>
												</div>
											</div>

										</header>
										<div id="accordion">
											<div class="panel panel-accordion panel-accordion-first">
												<div class="panel-heading">
													<h4 class="panel-title">
														<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse1One">
															<i class="fa fa-check"></i> Tasks
														</a>
													</h4>
												</div>
												<div id="collapse1One" class="accordion-body collapse in">
													<div class="panel-body">
														<ul class="widget-todo-list">
															<li>
																<div class="checkbox-custom checkbox-default">
																	<input type="checkbox" checked="" id="todoListItem1" class="todo-check">
																	<label class="todo-label" for="todoListItem1"><span>Lorem ipsum dolor sit amet</span></label>
																</div>
																<div class="todo-actions">
																	<a class="todo-remove" href="#">
																		<i class="fa fa-times"></i>
																	</a>
																</div>
															</li>
															<li>
																<div class="checkbox-custom checkbox-default">
																	<input type="checkbox" id="todoListItem2" class="todo-check">
																	<label class="todo-label" for="todoListItem2"><span>Lorem ipsum dolor sit amet</span></label>
																</div>
																<div class="todo-actions">
																	<a class="todo-remove" href="#">
																		<i class="fa fa-times"></i>
																	</a>
																</div>
															</li>
															<li>
																<div class="checkbox-custom checkbox-default">
																	<input type="checkbox" id="todoListItem3" class="todo-check">
																	<label class="todo-label" for="todoListItem3"><span>Lorem ipsum dolor sit amet</span></label>
																</div>
																<div class="todo-actions">
																	<a class="todo-remove" href="#">
																		<i class="fa fa-times"></i>
																	</a>
																</div>
															</li>
															<li>
																<div class="checkbox-custom checkbox-default">
																	<input type="checkbox" id="todoListItem4" class="todo-check">
																	<label class="todo-label" for="todoListItem4"><span>Lorem ipsum dolor sit amet</span></label>
																</div>
																<div class="todo-actions">
																	<a class="todo-remove" href="#">
																		<i class="fa fa-times"></i>
																	</a>
																</div>
															</li>
															<li>
																<div class="checkbox-custom checkbox-default">
																	<input type="checkbox" id="todoListItem5" class="todo-check">
																	<label class="todo-label" for="todoListItem5"><span>Lorem ipsum dolor sit amet</span></label>
																</div>
																<div class="todo-actions">
																	<a class="todo-remove" href="#">
																		<i class="fa fa-times"></i>
																	</a>
																</div>
															</li>
															<li>
																<div class="checkbox-custom checkbox-default">
																	<input type="checkbox" id="todoListItem6" class="todo-check">
																	<label class="todo-label" for="todoListItem6"><span>Lorem ipsum dolor sit amet</span></label>
																</div>
																<div class="todo-actions">
																	<a class="todo-remove" href="#">
																		<i class="fa fa-times"></i>
																	</a>
																</div>
															</li>
														</ul>
														<hr class="solid mt-sm mb-lg">
														<form method="get" class="form-horizontal form-bordered">
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="input-group mb-md">
																		<input type="text" class="form-control">
																		<div class="input-group-btn">
																			<button type="button" class="btn btn-primary" tabindex="-1">Add</button>
																		</div>
																	</div>
																</div>
															</div>
														</form>
													</div>
												</div>
											</div>
											
											
										
										</div>
									</section>

								</div>
							</section>
						</div>
					<!--  자기 할 일 to do list 끝 -->


					<!--  알림 / 메시지 (자기것만) 표시  할 수 있음??-->
				
						<div class="col-xl-3 col-lg-6">
						
						여기에  알림 / 메시지 코드
						<!--메시지  -->
							<div class="panel panel-accordion">
												<div class="panel-heading">
													<h4 class="panel-title">
														<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse1Two">
															 <i class="fa fa-comment"></i> Messages
														</a>
													</h4>
												</div>
												<div id="collapse1Two" class="accordion-body collapse">
													<div class="panel-body">
														<ul class="simple-user-list mb-xlg">
															<li>
																<figure class="image rounded">
																	<img src="assets/images/!sample-user.jpg" alt="Joseph Doe Junior" class="img-circle">
																</figure>
																<span class="title">Joseph Doe Junior</span>
																<span class="message">Lorem ipsum dolor sit.</span>
															</li>
															<li>
																<figure class="image rounded">
																	<img src="assets/images/!sample-user.jpg" alt="Joseph Junior" class="img-circle">
																</figure>
																<span class="title">Joseph Junior</span>
																<span class="message">Lorem ipsum dolor sit.</span>
															</li>
															<li>
																<figure class="image rounded">
																	<img src="assets/images/!sample-user.jpg" alt="Joe Junior" class="img-circle">
																</figure>
																<span class="title">Joe Junior</span>
																<span class="message">Lorem ipsum dolor sit.</span>
															</li>
															<li>
																<figure class="image rounded">
																	<img src="assets/images/!sample-user.jpg" alt="Joseph Doe Junior" class="img-circle">
																</figure>
																<span class="title">Joseph Doe Junior</span>
																<span class="message">Lorem ipsum dolor sit.</span>
															</li>
														</ul>
													</div>
												</div>
											</div>
						
						</div>
					
					
					
					
					
					
					
					
					<!--  알림 / 메시지 (자기것만) 표시  할 수 있음??  끝 -->
				</div>  <!-- 자기 할 일 & 알림 메시지 로우 디브 끝 -->
				
				







				<!-- end: page -->
				</div>
			</section>
		</div>

		<!-- 오른쪽 사이드 시작 -->
		<c:import url="/common/RightSide.jsp" />
		<!-- 오른쪽 사이드 끝 -->
	</section>
	<!-- end : main Content -->

	<c:import url="/common/RightSide.jsp"></c:import>

	<c:import url="/common/BottomTag.jsp"></c:import>
</body>
</html>