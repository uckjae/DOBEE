<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed">
<head>
<c:import url="/common/HeadTag.jsp"/>
</head>
	<body>
		<section class="body">

			<!-- start: header -->
			<c:import url="/common/Top.jsp"/>
			<!-- end: header -->


			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<c:import url="/common/Side.jsp"/>
				<!-- end: sidebar -->

				<!-- start : main Content -->
				<section role="main" class="content-body">
					<header class="page-header">
						<h2>프로젝트 현황</h2>
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="#">
										<i class="fa fa-tasks"></i>
									</a>
								</li>
								<li><span>프로젝트 현황</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
					<div class="row">
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
						
						<div class="col-md-6">
							<section class="panel">
								<header class="panel-heading">
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
											<p class="text-xs text-muted mb-none">Average Profile Visits</p>
										</div>
									</section>
									<section class="panel">
										<div class="panel-body">
											<div class="circular-bar circular-bar-xs m-none mt-xs mr-md pull-right">
												<div class="circular-bar-chart" data-percent="45" data-plugin-options='{ "barColor": "#2baab1", "delay": 300, "size": 50, "lineWidth": 4 }'>
													<strong>Average</strong>
													<label><span class="percent">45</span>%</label>
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
						</div>
					</div>
					
						<div class="row">
						<div class="col-md-6">
							<section class="panel">
								<header class="panel-heading">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
										<a href="#" class="fa fa-times"></a>
									</div>
									<h2 class="panel-title">Best Seller</h2>
									<p class="panel-subtitle">Customize the graphs as much as you want, there are so many options and features to display information using JSOFT Admin Template.</p>
								</header>
								<div class="panel-body">

									<!-- Flot: Basic -->
									<div class="chart chart-md" id="flotDashBasic">
										<canvas id="myChart" width="400" height="400"></canvas>
										
									
									</div>
									
								</div>
							</section>
						</div>
						<div class="col-md-6">
							<section class="panel">
								<header class="panel-heading">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
										<a href="#" class="fa fa-times"></a>
									</div>
									<h2 class="panel-title">Server Usage</h2>
									<p class="panel-subtitle">It's easy to create custom graphs on JSOFT Admin Template, there are several graph types that you can use, such as lines, bars, pie charts, etc...</p>
								</header>
								<div class="panel-body">

									<!-- Flot: Curves -->
									<div class="chart chart-md" id="flotDashRealTime"></div>
								</div>
							</section>
						</div>
					</div>
					<!-- end: page -->
				</section>
			</div>

    <!-- 오른쪽 사이드 시작 -->
    <c:import url="/common/RightSide.jsp"/>
    <!-- 오른쪽 사이드 끝 -->
		</section>
	<!-- end : main Content -->
		<!-- Chart.js -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
		
		<c:import url="/common/BottomTag.jsp"></c:import>
	
		<script>


		/*프로젝트 현황 차트!!*/
		var chartData = { datasets: [{ backgroundColor: ['red','yellow','blue'], data: [10, 20, 30] }], // 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남 labels: ['red','yellow','blue'] };


		var ctx = document.getElementById('myChart');

		console.log('가져와!!')
		console.dir(ctx)

		var myDoughnutChart = new Chart(ctx, {
		    type: 'doughnut',
		    data: chartData,
		    options: options
		});

		
</script>
		
	</body>
</html>