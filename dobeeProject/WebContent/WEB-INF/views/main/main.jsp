<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html class="fixed">
<head>

<c:import url="/common/HeadTag.jsp" />

<!-- Full Calendar Original -->
<link href='assets/vendor/fullcalendar-ori/packages/core/main.css' rel='stylesheet' />
<link href='assets/vendor/fullcalendar-ori/packages/bootstrap/main.css' rel='stylesheet' />
<link href='assets/vendor/fullcalendar-ori/packages/timegrid/main.css' rel='stylesheet' />
<link href='assets/vendor/fullcalendar-ori/packages/daygrid/main.css' rel='stylesheet' />
<link href='assets/vendor/fullcalendar-ori/packages/list/main.css' rel='stylesheet' />

<script src='assets/vendor/fullcalendar-ori/packages/core/main.js'></script>
<script src='assets/vendor/fullcalendar-ori/packages/interaction/main.js'></script>
<script src='assets/vendor/fullcalendar-ori/packages/bootstrap/main.js'></script>
<script src='assets/vendor/fullcalendar-ori/packages/daygrid/main.js'></script>
<script src='assets/vendor/fullcalendar-ori/packages/timegrid/main.js'></script>
<script src='assets/vendor/fullcalendar-ori/packages/list/main.js'></script>

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
				
					<div class="col-md-8">
						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a> <a href="#"
										class="fa fa-times"></a>
								</div>
								<h2 class="panel-title">Calendar</h2>
							</header>
							<div class="panel-body">
								<!-- Float Calendar div -->
								<div class="calendarArea" style="width:100%">
									<div id="calendar"></div>
								</div>	

							</div>
						</section>
					</div>
					
				
				
					<div class="col-md-4">
						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
									<a href="#" class="fa fa-times"></a>
								</div>
	
								<h2 class="panel-title">
									<span class="va-middle"><i class="fa fa-check"> </i> 마감이 임박한 업무</span>
								</h2>
							</header>
									
							<div class="panel-body">
								<ul class="widget-todo-list">	
									
									<c:forEach items="${utList}" var="utl">
										<li>
											<div class="checkbox-custom checkbox-default">
												<label class="todo-label" for="todoListItem1">
													<span>${utl.title }</span></a>
													<p class="text-xs text-muted mb-none">${utl.pjtName }</p>
												</label>
												
											</div>
											<div class="todo-actions">
												<a class="todo-remove" href="pjtKanban.do?pjtSeq=${utl.pjtSeq}"> <i class="fa-chevron-right"></i>
												</a>
											</div>
										</li>
									</c:forEach>	
									
									<li>
										<div class="checkbox-custom checkbox-default">
											<input type="checkbox" checked="" id="todoListItem1"
												class="todo-check"> <label class="todo-label"
												for="todoListItem1"><span>Lorem ipsum
													dolor sit amet</span></label>
										</div>
										<div class="todo-actions">
											<a class="todo-remove" href="#"> <i
												class="fa fa-times"></i>
											</a>
										</div>
									</li>
																		
								</ul>
							</div>
																
							<div class="panel-footer">

							</div>
						</section>
					</div>
				
					<div class="col-md-4">
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
											<!--
											<tr>
												<th class="notSeq" style="width: 20%; text-align: center;">#</th>
												<th class="nsContent" style="width: 30%; text-align: center;">일정</th>
												<th class="startTime" style="width: 25%; text-align: center;">시작일</th>
												<th class="endTime" style="width: 25%; text-align: center;">종료일</th>
											</tr>
											-->
										</thead>
										<tbody>
											<!-- 
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
											 -->
											<tr>
												<td class="nottitle"> <label class="todo-label"
												for="todoListItem1"><span>Lorem ipsum
													dolor sit amet</span></label></td>
											</tr>
											<tr>
												<td class="nottitle"> <label class="todo-label"
												for="todoListItem1"><span>Lorem ipsum
													dolor sit amet</span></label></td>
											</tr>	
											<tr>
												<td class="nottitle"> <label class="todo-label"
												for="todoListItem1"><span>Lorem ipsum
													dolor sit amet</span></label></td>
											</tr>	
											<tr>
												<td class="nottitle"> <label class="todo-label"
												for="todoListItem1"><span>Lorem ipsum
													dolor sit amet</span></label></td>
											</tr>
											<tr>
												<td class="nottitle"> <label class="todo-label"
												for="todoListItem1"><span>Lorem ipsum
													dolor sit amet</span></label></td>
											</tr>		
										</tbody>
									</table>
								</div>

							</div>
						</section>
					</div>
					
					<div class="col-md-8 col-lg-4 col-xl-8">
						<div class="row">
							<div class="col-md-12 col-lg-6 col-xl-6">
								<section class="panel panel-featured-left panel-featured-primary">
									<div class="panel-body">
										<div class="widget-summary">
											<div class="widget-summary-col widget-summary-col-icon">
												<div class="summary-icon bg-primary">
													<i class="fa fa-life-ring"></i>
												</div>
											</div>
											
											<div class="widget-summary-col">
												<div class="summary">
													<h4 class="title">진행중인 프로젝트</h4>
													<div class="info">
														<strong class="amount">1281</strong>
														<span class="text-primary">(14 unread)</span>
													</div>
												</div>
												<div class="summary-footer">
													<a class="text-muted text-uppercase">(view all)</a>
												</div>
											</div>
										</div>
									</div>
								</section>
							</div>
							<div class="col-md-12 col-lg-6 col-xl-6">
								<section class="panel panel-featured-left panel-featured-secondary">
									<div class="panel-body">
										<div class="widget-summary">
											<div class="widget-summary-col widget-summary-col-icon">
												<div class="summary-icon bg-secondary">
													<i class="fa fa-usd"></i>
												</div>
											</div>
											<div class="widget-summary-col">
												<div class="summary">
													<h4 class="title">진행중인 업무 개수</h4>
													<div class="info">
														<strong class="amount">$ 14,890.30</strong>
													</div>
												</div>
												<div class="summary-footer">
													<a class="text-muted text-uppercase">(withdraw)</a>
												</div>
											</div>
										</div>
									</div>
								</section>
							</div>
							<div class="col-md-12 col-lg-6 col-xl-6">
								<section class="panel panel-featured-left panel-featured-tertiary">
									<div class="panel-body">
										<div class="widget-summary">
											<div class="widget-summary-col widget-summary-col-icon">
												<div class="summary-icon bg-tertiary">
													<i class="fa fa-shopping-cart"></i>
												</div>
											</div>
											<div class="widget-summary-col">
												<div class="summary">
													<h4 class="title">이번달 지출 총액</h4>
													<div class="info">
														<strong class="amount">$ 14,890.30</strong>
													</div>
												</div>
												<div class="summary-footer">
													<a class="text-muted text-uppercase">(statement)</a>
												</div>
											</div>
										</div>
									</div>
								</section>
							</div>
							<div class="col-md-12 col-lg-6 col-xl-6">
								<section class="panel panel-featured-left panel-featured-quartenary">
									<div class="panel-body">
										<div class="widget-summary">
											<div class="widget-summary-col widget-summary-col-icon">
												<div class="summary-icon bg-quartenary">
													<i class="fa fa-user"></i>
												</div>
											</div>
											<div class="widget-summary-col">
												<div class="summary">
													<h4 class="title">팀원 수</h4>
													<div class="info">
														<strong class="amount">3765</strong>
													</div>
												</div>
												<div class="summary-footer">
													<a class="text-muted text-uppercase">(report)</a>
												</div>
											</div>
										</div>
									</div>
								</section>
							</div>
						</div>
					</div>
					
					<div class="col-md-6">
						<section class="panel">
							<header class="panel-heading">
								<h2 class="panel-title">참여중인 프로젝트</h2>
							</header>
								<div class="panel-body">
									<div class="table-responsive">
										<table class="table table-striped mb-none">
											<thead>
												<tr>
													<th>#</th>
													<th>프로젝트</th>
													<th>상태</th>
													<th>진행도</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${list}" var="n" varStatus="status">
													<tr>
														<td>${status.index + 1}</td>
														<td>${n.pjtName}</td>
														<td><span class="label label-success">${n.pjtProgress}</span></td>
														<td>
															<div class="progress progress-sm progress-half-rounded m-none mt-xs light">
																<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
																	100%
																</div>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</section>

						</div>
					
				</div>
				
						
				
				
				


				

				<!-- end: page -->
			</section>
		</div>

		<!-- 오른쪽 사이드 시작 -->
		<c:import url="/common/RightSide.jsp" />
		<!-- 오른쪽 사이드 끝 -->
	</section>
	<!-- end : main Content -->

	<c:import url="/common/RightSide.jsp"></c:import>

	<c:import url="/common/BottomTag.jsp"></c:import>
	
	<script>
		window.onload = function(){
			var eventList = [];
	
			$.ajax ({
				url : "ntpToCal.do",
				dataType : "json",
				success : function(data) {
					var events = [];
					events = data.NTPTC;
	
					$.each(events, (index, element) => {
						if(element.entry == "NOTICE") {
							eventList.push ({
								title : element.title,
								start : element.startTime,
								end : element.endTime,
								color : "#f54c4c"	
							})
						} else if (element.entry == "TASK") {
							eventList.push ({
								title : element.title,
								start : element.startTime,
								end : element.endTime,
								color : "#ffc107"	
							})
						} else if (element.entry == "PROJECT") {
							eventList.push ({
								title : element.title,
								start : element.startTime,
								end : element.endTime,
								color : "#69a854"	
							})
						}
					});
				},
				complete : function () {
					var calendarEl = document.getElementById('calendar');
	
				    var calendar = new FullCalendar.Calendar(calendarEl, {
				      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
				      header: {
				    	left : 'prev,today,next',
						center : 'title',
						right: 'dayGridMonth,dayGridWeek,timeGridDay,listWeek'
				      },
				      timeFormat : 'h:mm',
				      navLinks: true, // can click day/week names to navigate views
				      businessHours: {
					      startTime : '09:00',
					      endTime : '18:00'
					  },
					  eventLimit : true,
				      editable: false,
				      events: eventList
				    });
				    calendar.render();
				}
			});		
		}
		
/* 
		var isWork = ${sessionScope.user.isWork }
		if (isWork != null) {
			window.onbeforeunload = function() {
			    return "페이지 넘어갈때마다 팝업창이 뜨는거는 정말 거지같은데???";
			}
		}
*/
	</script>
	
</body>
</html>