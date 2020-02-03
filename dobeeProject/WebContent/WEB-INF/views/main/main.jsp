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
<script type="text/javascript">
console.log("MAIN!!");
</script>
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
					<h2>메인</h2>

					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="index.html"> <i class="fa fa-home"></i>
							</a></li>
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
								<h2 class="panel-title"><i class="fa fa-calendar"></i>&nbsp;나의 일정</h2>
							</header>
							<div class="panel-body">
								<!-- Float Calendar div -->
								<div class="calendarArea" style="width:100%">
									<div id="calendar"></div>
								</div>	

							</div>
						</section>
					</div>
					
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
					</script>
					
					<div class="col-md-4">
						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
									<a href="#" class="fa fa-times"></a>
								</div>
	
								<h2 class="panel-title">
									<span class="va-middle"><i class="fa fa-check"></i>&nbsp;마감이 임박한 업무</span>
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
								</ul>
							</div>
							<div class="panel-footer" style="height:55px;">
							</div>
						</section>
						<section class="panel">
								<header class="panel-heading">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
										<a href="#" class="fa fa-times"></a>
									</div>
									<h2 class="panel-title">
										<span class="va-middle"><i class="fa fa-group"></i>&nbsp;출근한 팀원</span>
									</h2>
								</header>
								<div class="panel-body">
									<div class="content">
										<ul class="simple-user-list">
										<c:forEach items="${requestScope.onWorkTeamMemberList}" var="teamMember">
											<li>
												<figure class="image rounded">
													<img src="assets/images/!sample-user.jpg" alt="Joseph Doe Junior" class="img-circle">
													<%-- <img src="img/${teamMember.myPic}" alt="Joseph Doe Junior" class="img-circle"> --%>
												</figure>
												<span class="title">${teamMember.name}</span>
												<span class="message truncate">${teamMember.name}</span>
											</li>
										</c:forEach>
										</ul>
									</div>
								</div>
								<div class="panel-footer" style="height:55px;">
								</div>
							</section>
					</div>
					<div class="row">
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
													<th class="nsContent" style="width: 30%; text-align: center;">제목</th>
													<th class="startTime" style="width: 25%; text-align: center;">작성일</th>
													<th class="count" style="width: 25%; text-align: center;">조회수</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${requestScope.recentNoticeList}" var="n">
													<tr>
														<td class="notSeq" style="text-align: center;">${n.notSeq}</td>
														<td class="nsContent" style="text-align: center;">
														<a href="noticeDetail.do?notSeq=${n.notSeq}" style="text-decoration: none;">${n.title}</a>
														</td>
														<td class="startTime" style="text-align: center;">
														  <fmt:formatDate value="${n.regDate}" pattern="yyyy-MM-dd HH:mm"/>
														</td>
														<td class="count" style="text-align: center;">${n.count}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
	
								</div>
							</section>
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
												<c:forEach items="${requestScope.pjtList}" var="pjtList" varStatus="status">
														<tr>
															<td>${status.index + 1}</td>
															<td><a href="pjtKanban.do?pjtSeq=${pjtList.pjtSeq}" style="text-decoration: none;">${pjtList.pjtName}</a></td>
															<td><span class="label label-success">${pjtList.pjtProgress}</span></td>
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
	/* var isWork = ${sessionScope.user.isWork }
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
	} */
	</script>
	
</body>
</html>