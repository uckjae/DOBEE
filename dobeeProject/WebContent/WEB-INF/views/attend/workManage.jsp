<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed">
<head>
	<style>
		.btn-info.btn-sm.반려 {
			border-color:lightgray;
			background-color:red;
		}
		
		.btn-info.btn-sm.미승인 {
			border-color:lightgray;
			background-color:gray;
		}
		
		.btn-info.btn-sm.승인 {
			border-color:lightgray;
			background-color:green;
		}
		
		.btn-info.btn-sm {
			background-color: #e0da28;
		} 
	</style>
	
<!-- Head Tag Script -->
<c:import url="/common/HeadTag.jsp"/>

<!-- Modal -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
	
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
						<h2>근무 내역 관리</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>Pages</span></li>
								<li><span>Blank Page</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
					<!-- 작업 여기부터~!~!~!~~! -->
					
					
					<section class="panel">
						<div class="row">
							<div class="col-md-12">
								<div class="tabs tabs-primary">
									<ul class="nav nav-tabs">
										<li class="active">
											<a href="#popular1" data-toggle="tab"><i class="fa fa-suitcase"></i>근태 상황</a>
										</li>
										<li>
											<a href="#recent1" data-toggle="tab"><i class="fa fa-search"></i>조회 옵션</a>
										</li>
									</ul>
									<div class="tab-content">
										<div id="popular1" class="tab-pane active" style="height: 50px;">
											<div class="col-md-2">
												<h4>정상 근무 일 수</h4>
											</div>
											<div class="col-md-2" id="normal">
												300
											</div>
											
											<div class="col-md-2">
												<h4>야근 일 수</h4>
											</div>
											<div class="col-md-2" id="extend">
												200
											</div>
											
											<div class="col-md-2">
												<h4>결근 일 수</h4>
											</div>
											<div class="col-md-2" id="abs">
												65
											</div>
											
										</div>
										<div id="recent1" class="tab-pane" style="height:50px;">
											<select id="yearSelector">
												<option hidden="">==년도 별==</option>
												<!-- Ajax -->
											</select>
											
											<select id="monthSelector">
												<option hidden="">==월    별==</option>
												<!-- Ajax -->
											</select>
										
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</section>
					
					
					<section class="panel">
						<div class="panel-body" style="min-height: 560px;">
							<div class="row">
								<div class="col-md-12">
									<h1>차트</h1>
									<canvas id="stackedBar" width="500px" height="250px"></canvas>
								</div>
							</div>
						</div>
					</section>
					
					
					<!-- start: page -->
					<!-- end: page -->
				</section>
			</div>

					<!-- start: page -->
					<!-- end: page -->
		</section>

			<!-- 오른쪽 사이드바!! -->
		<c:import url="/common/RightSide.jsp"/>
			
			<!-- 오른쪽 사이드바 끝!! -->
		</section>

		<c:import url="/common/BottomTag.jsp"/>
		
		
<!-- SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT// -->
	
	<!-- Chart.js -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	
	<!-- Choi's TABLE SET -->
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"type="text/javascript"></script>
	
	
	
		<script type="text/javascript">	
			window.onload = function(){
	
				$.ajax({
					url : "overTimeYearList.do",
					dataType : "json",
					success : function(data) {
						var yArray = [];
						yArray = data.OTYList;
						for (var i = 0; i<yArray.length; i++) {
							var option = document.createElement("option");
							$(option).text(yArray[i]+'년');
							$("#yearSelector").append(option);
						}
					}				
				});	
	
				$.ajax({
					url : "overTimeMonthList.do",
					dataType : "json",
					success : function(data) {
						var mArray = [];
						mArray = data.OTMList;
						for (var i = 0; i<mArray.length; i++) {
							var option = document.createElement("option");
							$(option).text(mArray[i]+'월');
							$("#monthSelector").append(option);
						}
					}			
				});
	
	
	 			var ctx = document.getElementById('stackedBar').getContext('2d');
	 			
				var stackedBar = new Chart(ctx, {
				    type: 'bar',
	 				// var xIndex = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
			    	// 놀고 있는 손 뭐하니 코딩해라
				    data: {
				        labels: xIndex,
				        datasets: [{
				            label: '# of Votes',
				            data: [12, 19, 3, 5, 2, 3],
				            backgroundColor: [
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)',
				                'rgba(153, 102, 255, 0.2)',
				                'rgba(255, 159, 64, 0.2)'
				            ],
				            borderColor: [
				                'rgba(255, 99, 132, 1)',
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(75, 192, 192, 1)',
				                'rgba(153, 102, 255, 1)',
				                'rgba(255, 159, 64, 1)'
				            ],
				            borderWidth: 1
				        }]
				    },
				    options: {
				        scales: {
					        xAxes : [{
						        staked : true
						    }],
				            yAxes: [{
					            stacked : true,
				                ticks: {
				                    beginAtZero: true
				                }
				            }]
				        }
				    }
				});
			}
			
	
	/* 
			#("#yearSelector").change(function() {
				alert("뭐시여~");
				$.ajax({
					url : "overTimeMonthList.do",
					dataType : "json",
					success : function(data) {
						console.log(data.OTMList);
						var mArray = [];
						mArray = data.OTMList;
						for (var i = 0; i<mArray.length; i++) {
							var option = document.createElement("option");
							$(option).text(mArray[i]+'월');
							$("#monthSelector").append(option);
						}
					}			
				})		
			});
	*/
	
		</script>
		
	</body>
</html>