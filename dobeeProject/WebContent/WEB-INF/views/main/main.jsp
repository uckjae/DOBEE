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
				
					<div class="col-md-9">
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
					
					<div class="col-md-3">
						<section class="panel panel-transparent">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a> <a href="#"
										class="fa fa-times"></a>
								</div>

								<h2 class="panel-title">My Stats</h2>
							</header>
							<div class="panel-body">
								<section class="panel">
									<div class="panel-body">
										<div class="small-chart pull-right" id="sparklineBarDash"></div>
										<script type="text/javascript">
												var sparklineBarDashData = [5, 6, 7, 2, 0, 4 , 2, 4, 2, 0, 4 , 2, 4, 2, 0, 4];
											</script>
										<div class="h4 text-bold mb-none">488</div>
										<p class="text-xs text-muted mb-none">Average Profile
											Visits</p>
									</div>
								</section>
								<section class="panel">
									<div class="panel-body">
										<div
											class="circular-bar circular-bar-xs m-none mt-xs mr-md pull-right">
											<div class="circular-bar-chart" data-percent="45"
												data-plugin-options='{ "barColor": "#2baab1", "delay": 300, "size": 50, "lineWidth": 4 }'>
												<strong>Average</strong> <label><span
													class="percent">45</span>%</label>
											</div>
										</div>
										<div class="h4 text-bold mb-none">12</div>
										<p class="text-xs text-muted mb-none">Working Projects</p>
									</div>
								</section>
								<section class="panel">
									<div class="panel-body">
										<div class="small-chart pull-right" id="sparklineLineDash"></div>
										<script type="text/javascript">
												var sparklineLineDashData = [15, 16, 17, 19, 10, 15, 13, 12, 12, 14, 16, 17];
											</script>
										<div class="h4 text-bold mb-none">89</div>
										<p class="text-xs text-muted mb-none">Pending Tasks</p>
									</div>
								</section>
								<section class="panel">
									<div class="panel-body">
										<div class="small-chart pull-right" id="sparklineLineDash"></div>
										<script type="text/javascript">
												var sparklineLineDashData = [15, 16, 17, 19, 10, 15, 13, 12, 12, 14, 16, 17];
											</script>
										<div class="h4 text-bold mb-none">89</div>
										<p class="text-xs text-muted mb-none">Pending Tasks</p>
									</div>
								</section>
								<section class="panel">
									<div class="panel-body">
										<div class="small-chart pull-right" id="sparklineLineDash"></div>
										<script type="text/javascript">
												var sparklineLineDashData = [15, 16, 17, 19, 10, 15, 13, 12, 12, 14, 16, 17];
											</script>
										<div class="h4 text-bold mb-none">89</div>
										<p class="text-xs text-muted mb-none">Pending Tasks</p>
									</div>
								</section>
								<section class="panel">
									<div class="panel-body">
										<div class="small-chart pull-right" id="sparklineLineDash"></div>
										<script type="text/javascript">
												var sparklineLineDashData = [15, 16, 17, 19, 10, 15, 13, 12, 12, 14, 16, 17];
											</script>
										<div class="h4 text-bold mb-none">89</div>
										<p class="text-xs text-muted mb-none">Pending Tasks</p>
									</div>
								</section>
								<section class="panel">
									<div class="panel-body">
										<div class="small-chart pull-right" id="sparklineLineDash"></div>
										<script type="text/javascript">
												var sparklineLineDashData = [15, 16, 17, 19, 10, 15, 13, 12, 12, 14, 16, 17];
											</script>
										<div class="h4 text-bold mb-none">89</div>
										<p class="text-xs text-muted mb-none">Pending Tasks</p>
									</div>
								</section>
							</div>
						</section>
					</div>
					
					
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
					<div class="col-md-6">
						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a> <a href="#"
										class="fa fa-times"></a>
								</div>
								<h2 class="panel-title">Server Usage</h2>
								<p class="panel-subtitle">It's easy to create custom graphs
									on JSOFT Admin Template, there are several graph types that you
									can use, such as lines, bars, pie charts, etc...</p>
							</header>
							<div class="panel-body">

								<!-- Flot: Curves -->
								<div class="chart chart-md" id="flotDashRealTime"></div>

							</div>
						</section>
					</div>
				</div>

				<!-- start: page -->
				<div class="row">
					<div class="col-md-6 col-lg-12 col-xl-6">
						<section class="panel">
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-8">
										<div class="chart-data-selector" id="salesSelectorWrapper">
											<h2>
												Sales: <strong> <select class="form-control"
													id="salesSelector">
														<option value="JSOFT Admin" selected>JSOFT Admin</option>
														<option value="JSOFT Drupal">JSOFT Drupal</option>
														<option value="JSOFT Wordpress">JSOFT Wordpress</option>
												</select>
												</strong>
											</h2>

											<div id="salesSelectorItems"
												class="chart-data-selector-items mt-sm">
												<!-- Flot: Sales JSOFT Admin -->
												<div class="chart chart-sm" data-sales-rel="JSOFT Admin"
													id="flotDashSales1" class="chart-active"></div>
												<script>

														var flotDashSales1Data = [{
														    data: [
														        ["Jan", 140],
														        ["Feb", 240],
														        ["Mar", 190],
														        ["Apr", 140],
														        ["May", 180],
														        ["Jun", 320],
														        ["Jul", 270],
														        ["Aug", 180]
														    ],
														    color: "#0088cc"
														}];

														// See: assets/javascripts/dashboard/examples.dashboard.js for more settings.

													</script>

												<!-- Flot: Sales JSOFT Drupal -->
												<div class="chart chart-sm" data-sales-rel="JSOFT Drupal"
													id="flotDashSales2" class="chart-hidden"></div>
												<script>

														var flotDashSales2Data = [{
														    data: [
														        ["Jan", 240],
														        ["Feb", 240],
														        ["Mar", 290],
														        ["Apr", 540],
														        ["May", 480],
														        ["Jun", 220],
														        ["Jul", 170],
														        ["Aug", 190]
														    ],
														    color: "#2baab1"
														}];

														// See: assets/javascripts/dashboard/examples.dashboard.js for more settings.

													</script>

												<!-- Flot: Sales JSOFT Wordpress -->
												<div class="chart chart-sm" data-sales-rel="JSOFT Wordpress"
													id="flotDashSales3" class="chart-hidden"></div>
												<script>

														var flotDashSales3Data = [{
														    data: [
														        ["Jan", 840],
														        ["Feb", 740],
														        ["Mar", 690],
														        ["Apr", 940],
														        ["May", 1180],
														        ["Jun", 820],
														        ["Jul", 570],
														        ["Aug", 780]
														    ],
														    color: "#734ba9"
														}];

														// See: assets/javascripts/dashboard/examples.dashboard.js for more settings.

													</script>
											</div>

										</div>
									</div>
									<div class="col-lg-4 text-center">
										<h2 class="panel-title mt-md">Sales Goal</h2>
										<div class="liquid-meter-wrapper liquid-meter-sm mt-lg">
											<div class="liquid-meter">
												<meter min="0" max="100" value="35" id="meterSales"></meter>
											</div>
											<div class="liquid-meter-selector" id="meterSalesSel">
												<a href="#" data-val="35" class="active">Monthly Goal</a> <a
													href="#" data-val="28">Annual Goal</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>

				<div class="row">
					<div class="col-xl-3 col-lg-6">
						<section class="panel panel-transparent">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a> <a href="#"
										class="fa fa-times"></a>
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
													<a class="accordion-toggle" data-toggle="collapse"
														data-parent="#accordion" href="#collapse1One"> <i
														class="fa fa-check"></i> Tasks
													</a>
												</h4>
											</div>
											<div id="collapse1One" class="accordion-body collapse in">
												<div class="panel-body">
													<ul class="widget-todo-list">
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
														<li>
															<div class="checkbox-custom checkbox-default">
																<input type="checkbox" id="todoListItem2"
																	class="todo-check"> <label class="todo-label"
																	for="todoListItem2"><span>Lorem ipsum
																		dolor sit amet</span></label>
															</div>
															<div class="todo-actions">
																<a class="todo-remove" href="#"> <i
																	class="fa fa-times"></i>
																</a>
															</div>
														</li>
														<li>
															<div class="checkbox-custom checkbox-default">
																<input type="checkbox" id="todoListItem3"
																	class="todo-check"> <label class="todo-label"
																	for="todoListItem3"><span>Lorem ipsum
																		dolor sit amet</span></label>
															</div>
															<div class="todo-actions">
																<a class="todo-remove" href="#"> <i
																	class="fa fa-times"></i>
																</a>
															</div>
														</li>
														<li>
															<div class="checkbox-custom checkbox-default">
																<input type="checkbox" id="todoListItem4"
																	class="todo-check"> <label class="todo-label"
																	for="todoListItem4"><span>Lorem ipsum
																		dolor sit amet</span></label>
															</div>
															<div class="todo-actions">
																<a class="todo-remove" href="#"> <i
																	class="fa fa-times"></i>
																</a>
															</div>
														</li>
														<li>
															<div class="checkbox-custom checkbox-default">
																<input type="checkbox" id="todoListItem5"
																	class="todo-check"> <label class="todo-label"
																	for="todoListItem5"><span>Lorem ipsum
																		dolor sit amet</span></label>
															</div>
															<div class="todo-actions">
																<a class="todo-remove" href="#"> <i
																	class="fa fa-times"></i>
																</a>
															</div>
														</li>
														<li>
															<div class="checkbox-custom checkbox-default">
																<input type="checkbox" id="todoListItem6"
																	class="todo-check"> <label class="todo-label"
																	for="todoListItem6"><span>Lorem ipsum
																		dolor sit amet</span></label>
															</div>
															<div class="todo-actions">
																<a class="todo-remove" href="#"> <i
																	class="fa fa-times"></i>
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
																		<button type="button" class="btn btn-primary"
																			tabindex="-1">Add</button>
																	</div>
																</div>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
										<div class="panel panel-accordion">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a class="accordion-toggle" data-toggle="collapse"
														data-parent="#accordion" href="#collapse1Two"> <i
														class="fa fa-comment"></i> Messages
													</a>
												</h4>
											</div>
											<div id="collapse1Two" class="accordion-body collapse">
												<div class="panel-body">
													<ul class="simple-user-list mb-xlg">
														<li>
															<figure class="image rounded">
																<img src="assets/images/!sample-user.jpg"
																	alt="Joseph Doe Junior" class="img-circle">
															</figure> <span class="title">Joseph Doe Junior</span> <span
															class="message">Lorem ipsum dolor sit.</span>
														</li>
														<li>
															<figure class="image rounded">
																<img src="assets/images/!sample-user.jpg"
																	alt="Joseph Junior" class="img-circle">
															</figure> <span class="title">Joseph Junior</span> <span
															class="message">Lorem ipsum dolor sit.</span>
														</li>
														<li>
															<figure class="image rounded">
																<img src="assets/images/!sample-user.jpg"
																	alt="Joe Junior" class="img-circle">
															</figure> <span class="title">Joe Junior</span> <span
															class="message">Lorem ipsum dolor sit.</span>
														</li>
														<li>
															<figure class="image rounded">
																<img src="assets/images/!sample-user.jpg"
																	alt="Joseph Doe Junior" class="img-circle">
															</figure> <span class="title">Joseph Doe Junior</span> <span
															class="message">Lorem ipsum dolor sit.</span>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</section>

							</div>
						</section>
					</div>
					<div class="col-xl-3 col-lg-6">
						<section class="panel panel-transparent">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a> <a href="#"
										class="fa fa-times"></a>
								</div>

								<h2 class="panel-title">My Stats</h2>
							</header>
							<div class="panel-body">
								<section class="panel">
									<div class="panel-body">
										<div class="small-chart pull-right" id="sparklineBarDash"></div>
										<script type="text/javascript">
												var sparklineBarDashData = [5, 6, 7, 2, 0, 4 , 2, 4, 2, 0, 4 , 2, 4, 2, 0, 4];
											</script>
										<div class="h4 text-bold mb-none">488</div>
										<p class="text-xs text-muted mb-none">Average Profile
											Visits</p>
									</div>
								</section>
								<section class="panel">
									<div class="panel-body">
										<div
											class="circular-bar circular-bar-xs m-none mt-xs mr-md pull-right">
											<div class="circular-bar-chart" data-percent="45"
												data-plugin-options='{ "barColor": "#2baab1", "delay": 300, "size": 50, "lineWidth": 4 }'>
												<strong>Average</strong> <label><span
													class="percent">45</span>%</label>
											</div>
										</div>
										<div class="h4 text-bold mb-none">12</div>
										<p class="text-xs text-muted mb-none">Working Projects</p>
									</div>
								</section>
								<section class="panel">
									<div class="panel-body">
										<div class="small-chart pull-right" id="sparklineLineDash"></div>
										<script type="text/javascript">
												var sparklineLineDashData = [15, 16, 17, 19, 10, 15, 13, 12, 12, 14, 16, 17];
											</script>
										<div class="h4 text-bold mb-none">89</div>
										<p class="text-xs text-muted mb-none">Pending Tasks</p>
									</div>
								</section>
							</div>
						</section>
						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a> <a href="#"
										class="fa fa-times"></a>
								</div>

								<h2 class="panel-title">
									<span
										class="label label-primary label-sm text-normal va-middle mr-sm">198</span>
									<span class="va-middle">Friends</span>
								</h2>
							</header>
							<div class="panel-body">
								<div class="content">
									<ul class="simple-user-list">
										<li>
											<figure class="image rounded">
												<img src="assets/images/!sample-user.jpg"
													alt="Joseph Doe Junior" class="img-circle">
											</figure> <span class="title">Joseph Doe Junior</span> <span
											class="message truncate">Lorem ipsum dolor sit.</span>
										</li>
										<li>
											<figure class="image rounded">
												<img src="assets/images/!sample-user.jpg"
													alt="Joseph Junior" class="img-circle">
											</figure> <span class="title">Joseph Junior</span> <span
											class="message truncate">Lorem ipsum dolor sit.</span>
										</li>
										<li>
											<figure class="image rounded">
												<img src="assets/images/!sample-user.jpg" alt="Joe Junior"
													class="img-circle">
											</figure> <span class="title">Joe Junior</span> <span
											class="message truncate">Lorem ipsum dolor sit.</span>
										</li>
									</ul>
									<hr class="dotted short">
									<div class="text-right">
										<a class="text-uppercase text-muted" href="#">(View All)</a>
									</div>
								</div>
							</div>
							<div class="panel-footer">
								<div class="input-group input-search">
									<input type="text" class="form-control" name="q" id="q"
										placeholder="Search..."> <span class="input-group-btn">
										<button class="btn btn-default" type="submit">
											<i class="fa fa-search"></i>
										</button>
									</span>
								</div>
							</div>
						</section>
					</div>
					<div class="col-xl-6 col-lg-12">
						<section class="panel">
							<header class="panel-heading panel-heading-transparent">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a> <a href="#"
										class="fa fa-times"></a>
								</div>

								<h2 class="panel-title">Company Activity</h2>
							</header>
							<div class="panel-body">
								<div class="timeline timeline-simple mt-xlg mb-md">
									<div class="tm-body">
										<div class="tm-title">
											<h3 class="h5 text-uppercase">November 2013</h3>
										</div>
										<ol class="tm-items">
											<li>
												<div class="tm-box">
													<p class="text-muted mb-none">7 months ago.</p>
													<p>
														It's awesome when we find a good solution for our
														projects, JSOFT Admin is <span class="text-primary">#awesome</span>
													</p>
												</div>
											</li>
											<li>
												<div class="tm-box">
													<p class="text-muted mb-none">7 months ago.</p>
													<p>Checkout! How cool is that!</p>
													<div class="thumbnail-gallery">
														<a class="img-thumbnail lightbox"
															href="assets/images/projects/project-4.jpg"
															data-plugin-options='{ "type":"image" }'> <img
															class="img-responsive" width="215"
															src="assets/images/projects/project-4.jpg"> <span
															class="zoom"> <i class="fa fa-search"></i>
														</span>
														</a>
													</div>
												</div>
											</li>
										</ol>
									</div>
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
	/* var isWork = ${sessionScope.user.isWork }
		if (isWork != null) {
			window.onbeforeunload = function() {
			    return "페이지 넘어갈때마다 팝업창이 뜨는거는 정말 거지같은데???";
			}
	} */
	</script>
</body>
</html>