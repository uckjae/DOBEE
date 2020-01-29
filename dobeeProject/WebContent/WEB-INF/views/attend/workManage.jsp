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
	</style>
	
<!-- Head Tag Script -->
<c:import url="/common/HeadTag.jsp"/>

<!-- Modal -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<!-- Table Style -->
<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
<link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />

<!-- Moment.js -->
<script src="https://npmcdn.com/moment@2.14.1"></script>


	
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
										<i class="fa fa-briefcase" aria-hidden="true"></i>
									</a>
								</li>
								<li><span>근무</span></li>
								<li><span>근무 내역 관리</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
					<!-- 작업 여기부터~!~!~!~~! -->
					
					
					<section class="panel">
						<header class="panel-heading">
							<h3 class="panel-title">근무 현황 차트</h3>
						</header>
						<div class="panel-body" style="min-height: 560px;">
							<div id="divAttChart" class="col-md-12">
								<div id="inputYearMonth" style="padding: 20px;">
									<!-- input Year Month with Icon -->
								</div>
								<canvas id="attChart" width="500px" height="230px"></canvas>
							</div>
						<div id="legendColor" style="align-items: center">
							<div class="row">
								<div class="col-md-12">
									<div class="col-md-5"></div>
									<div class="col-md-1">
										<button id="attendColor" class="btn btn-info btn-sm" style="border:none; background-color: rgba(129, 242, 41, 1); "><b>출근/퇴근</b></button>
									</div>
									<div class="col-md-1">
										<button id="extendColor" class="btn btn-info btn-sm" style="border:none; background-color: rgba(255, 39, 0, 1); "><b>연장 근무</b></button>
									</div>
									<div class="col-md-5"></div>
								</div>
							</div>
						</div>
					</div>
					</section>
					
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
											<!-- 
											<select id="yearSelector">
												<option hidden="">==년도 별==</option>
												Ajax
											</select>
											
											<select id="monthSelector">
												<option hidden="">==월    별==</option>
												Ajax
											</select>
											 -->
											<select id="yearMonthSelector">
												<option hidden="">Year-Month</option>
												<!-- Ajax -->
											</select>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					
					<%-- 
					<section class="panel">
						<div class="panel-body" style="min-height: 560px;">
							<div class="row">
								<div class="col-md-12">
									<h1>임시로 캘린더를 뿌립시다</h1>
									<canvas id="myCal" width="500px" height="250px"></canvas>
								</div>
							</div>
						</div>
					</section>
					 --%>
					 
					<section class="panel">
						<header class="panel-heading">
							<h3 class="panel-title">연장근무 신청 현황</h3>
						</header>
						<div class="panel-body">
							<table class="table table-bordered table-striped mb-none" id="extTable" data-swf-path="assets/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf">
								<thead>
									<tr>
										<th width="8%">신청 번호</th>
										<th>기간</th>
										<th width="17%">신청 일자</th>
										<th width="20%">승인여부</th>
										<th width="8%">수정/삭제</th>
									</tr>
								</thead>
								<tbody>
									
									<c:forEach items="${extList}" var="el">
										<tr>
											<td class="tseq">		${el.aplSeq }</td>
											<td class="tterm">		${el.startAt } - ${el.endAt }</td>
											<td class="tregdate">	${el.reqDate }</td>
											<td class="notauth"><button type="button" class="btn btn-info btn-sm ${el.isAuth }" data-toggle="modal" data-target="#myModal"
																		data-aplSeq="${el.aplSeq }" data-reason="${el.reason }" data-rejReason="${el.rejReason }">${el.isAuth }</button>
											</td>
											<td class="teditdelete">
												<c:choose>
													<c:when test="${el.isAuth == '미승인'}">
														<button class="mb-xs mt-xs btn-sm btn-default" onclick="location.href='editExtApply.do?aplSeq=${el.aplSeq}'">수정/삭제</button>
													</c:when>
													<c:otherwise>
														-
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
					</section>	
					
					
					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true"
						style="display: none;">
						<div class="modal-dialog modal-lg cascading-modal" role="document">
							<div class="modal-content">
								<!--Header-->
								<div class="modal-header light-blue darken-3 white-text"
									style="text-align: center; padding-top: 25px; padding-bottom: 25px;">
									<button type="button" class="close" data-dismiss="modal"
										style="margin-top: -9px;">
										<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">
										<i class="fa fa-comments-o fa-2x"></i>&nbsp;Reason
									</h4>
								</div>
								<!--Body-->
								<div class="container-fluid">
									<div class="modal-body mb-0" style="margin-top: 30px;">
										<div class="form-group">
											<input type="hidden" id="modalAplSeq" name="aplSeq">
											<label class="col-md-3 control-label"><i
												class="fa fa-comment-o fa-2x"></i><span style="font-size: 15px">&nbsp;&nbsp;부재 신청 사유</span></label>
											<div class="col-md-9">
												<input type="text" id="modalReason" name="reason" class="form-control" style="height: 35px;" readonly="readonly">
											</div>
										</div>
										<br>
										<div class="form-group">
											<label class="col-md-3 control-label" for="userList"><i
												class="fa fa-times fa-2x"></i><span style="font-size: 15px">&nbsp;&nbsp;부재 신청 반려 사유</span></label>
											<div class="col-md-9">
												<input type="text" id="modalRejReason" name="rejReason" class="form-control" style="height: 35px;" readonly="readonly">
											</div>
										</div>
										<br>
									</div>
								</div>
								<div class="modal-footer">
									<div class="row">
										<div class="col-md-4"></div>
										<div class="col-md-4 text-center">
											<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
										</div>
										<div class="col-md-4"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
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
	
	<!-- Table Script -->
	<script src="assets/vendor/select2/select2.js"></script>
	<script src="assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
	<script src="assets/vendor/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
	<script src="assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
	
	
	<script type="text/javascript">	
		window.onload = function(){

			let aplSeq = "";
			let reason = "";
			let rejReason = "";

			$('.btn-sm').click('show.bs.modal', function(e) {
					
				aplSeq = $(this).data('aplseq');
				reason = $(this).data('reason');
				rejReason = $(this).data('rejReason');			

				$('#modalAplSeq').val(aplSeq);
				$('#modalReason').val(reason);
				$('#modalRejReason').val(rejReason);
			});
			
			$('#extTable').DataTable({
				/*language option*/
				"language" : {
					"emptyTable" : "데이터가 없습니다.",
					"lengthMenu" : "_MENU_ 개씩 보기",
					"info" : "현재 _START_ - _END_ / _TOTAL_건",
					"infoEmpty" : "데이터 없음",
					"infoFiltered" : "( _MAX_건의 데이터에서 필터링됨 )",
					"search" : "검색: ",
					"zeroRecords" : "일치하는 데이터가 없습니다.",
					"loadingRecords" : "로딩중...",
					"processing" : "잠시만 기다려 주세요",
					"paginate" : {
						"next" : "다음",
						"previous" : "이전"
					}
				},
				"columnDefs" : [{
					className : "dt-center",
					"targets" : [ 1 ],
				}]
			});

			$.ajax({
				url : "overTimeYearMonthList.do",
				dataType : "json",
				success : function(data) {
					var myArray = [];
					myArray = data.OTYMList;
					console.log('myArray : ' + myArray);
					for (var i = 0; i<myArray.length; i++) {
						var option = document.createElement("option");
						$('#yearMonthSelector').append("<option value="+myArray[i] + ">"+ myArray[i].substr(0,4)+"년 "+myArray[i].substr(6,2)+"월 </option>")
					}
				}			
			});

			
			var ctx = document.getElementById('attChart').getContext('2d');

			var minValue = moment('1970-01-01 06:00:00').valueOf();
			var dArray = [];
			let dLabel = [];
			
			var today = new Date();
			var yyyy = today.getFullYear();
			var mm = today.getMonth();
			var month = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'];
			
			$('#inputYearMonth').append("<i class='fa fa-list-alt fa-2x' id='iIinputYearMonth'>&nbsp;&nbsp;"+yyyy+"년 "+month[mm]+"월</i>")

			$.ajax({
				type : 'POST',
				url : 'getChartData.do?ym='+yyyy+"-"+month[mm],
				dataType : "json",
				success : function(data) {
					dArray = data.CD;
				},
				complete : function() {
					// 해당 달의 일 수 가져오기 (여기서는 2월)
					let daySize = new Date(yyyy,mm,0).getDate();

					// 해당 달의 일 수 x축 레이블에 추가
					
					let attInit = [];
					let attEnd = [];
					let extInit = [];
					let extEnd = [];

					let attInitAbs = [];
					let attInitRel = [];
					let attEndRel = [];
					let extInitRel = [];
					let extEndRel = [];

					// 레이블 값, moment value 절대값, 상대값 배열 초기과
					for (let i=1; i<=daySize; i++) {
						dLabel[i] = i;
						
						attInit[i] = null;
						attEnd[i] = null;
						extInit[i] = null;
						extEnd[i] = null;

						attInitAbs[i] = null;
						attInitRel[i] = null;
						attEndRel[i] = null;
						extInitRel[i] = null;
						extEndRel[i] = null;
					}

					// dArray = 11개 entry = 연장/근태 별로 있음
					// dLabel = 29 한달의 일수가 들어가 있음
					for (let j =0; j<dArray.length; j++) {
						for (let i=1; i<dLabel.length; i++) {
							if (dLabel[i] == dArray[j].days) {
								if (dArray[j].entry === '근태') {
									attInit[i] = '1970-01-01 '+dArray[j].attTime;
									attInitAbs[i] = moment(attInit[i]).valueOf()+10.8e6;
									attInitRel[i] = moment(attInit[i]).valueOf();
									attEnd[i] = '1970-01-01 '+dArray[j].offTime;
									attEndRel[i] = moment(attEnd[i]).valueOf()-attInitRel[i];
								} else if (dArray[j].entry === '승인') {
									extInit[i] = '1970-01-01 '+dArray[j].attTime;

									if (attInitAbs[i] == null) {
										extInitRel[i] = moment(extInit[i]).valueOf()+10.8e6;
										extEnd[i] = '1970-01-01 '+dArray[j].offTime;
										extEndRel[i] = moment(extEnd[i]).valueOf()-moment(extInit[i]).valueOf();
									} else {
										extInitRel[i] = moment(extInit[i]).valueOf()-attEndRel[i]-attInitRel[i];
										extEnd[i] = '1970-01-01 '+dArray[j].offTime;
										extEndRel[i] = moment(extEnd[i]).valueOf()-extInitRel[i]-attEndRel[i]-attInitRel[i];
									}
								}

								
							}
						}
					}

					let attChart = new Chart(ctx, {

					    type: 'bar',
					    data: {
					        labels: dLabel,
					       
					        datasets: [{
					        	stack : 'Stack 0',
					            label: '출근',
					            data: attInitAbs,
					            backgroundColor: 'rgba(255, 255, 0, 0)',
					            borderColor: 'rgba(255, 255, 0, 0.0 )',
					            borderWidth: 1,
					            barTickness : 1,
					        },
					        {
					        	stack : 'Stack 0',
					            label: '퇴근',
					            data: attEndRel,
					            backgroundColor: 'rgba(129, 242, 41, 1)',
					            borderColor: 'rgba(129, 242, 41, 0.5)',
					            borderWidth: 1

					        },
					        {
					        	stack : 'Stack 0',
					            label: '연장근무 시작',
					            data: extInitRel,
					            backgroundColor: 'rgba(255, 255, 0, 0)',
					            borderColor: 'rgba(255, 255, 0, 0)',
					            borderWidth: 1,
					        },
					        {
					        	stack : 'Stack 0',
					            label: '연장근무 종료',
					            data: extEndRel,
					            backgroundColor: 'rgba(255, 39, 0, 1)',
					            borderColor: 'rgba(255, 39, 0, 0.5)',
					            borderWidth: 1
					        }]
					    },

					    options: {
						    legend : {
								display : false,
								position : 'bottom',
								labels : {
									fontSize : 12
								}
							},
						    layout : {
							    padding : {
								    left : 20,
					    			right : 20,
									top : 10,
									bottom : 10
								}
							},
					    	responsive : true,
							tooltips: {
								callbacks: {
									title: function(tooltipItem, data) {
										let label = tooltipItem[0].xLabel;
										let dsi = tooltipItem[0].datasetIndex;

										if (dsi == 0) {
											return label + "일  출근 시간";
										} else if (dsi == 1) {
											return label + "일 근무";
										} else if (dsi == 2) {
											return label + "일  연장근무 시작";
										} else if (dsi == 3) {
											return label + "일  연장근무";
										}		
									},
									label: function(tooltipItem) {
										console.log("tooltipItem : ",tooltipItem);

										let workHour = moment(tooltipItem.yLabel+10.8e6);
										
										if (tooltipItem.datasetIndex == 0) {
											let absTime = moment(tooltipItem.yLabel-10.8e6);	
											return absTime.format('HH시 mm 분 A');
										} else if (tooltipItem.datasetIndex == 1) {
											return workHour.format('hh시간 mm분');
										} else if (tooltipItem.datasetIndex == 2) {
											return "연장근무 시작";
										} else if (tooltipItem.datasetIndex == 3) {
											return workHour.format('hh시간 mm분');
										}

									}
								}
							},
							scales: {
								x: {
									type: 'time',
									display: true,
									offset: true,
									time: {
										unit: 'day',
										displayFormats : {
											day : 'MMM D'
										}
									}
								},
								yAxes : [{
									tooltipFormat : 'HH:mm',
									type : 'linear',
									beingAtZero : false,
									stacked : true,
									ticks : {
										min : moment('1970-01-01 09:00:00').valueOf(),
										max : moment('1970-01-02 04:00:00').valueOf(),
										stepSize : 3.6e6,

										callback: value => {
											let date = moment(value-10.8e6);
											if(date.diff(moment('1970-01-01 00:00:00'), 'minutes') === 0) {
												return null;
											}
											return date.format('h:mm A');
										}
										
									}
								}]
							},
						}
					});
					
				}
			});


			$('#yearMonthSelector').change(function() {
				let ym = $(this).val();
				console.log('ym : '+ ym);

				let yyyy = ym.substr(0,4);
				let mm = ym.substr(6,2);
				
				$('#inputYearMonth').empty();
				$('#inputYearMonth').append("<i class='fa fa-list-alt fa-2x' id='iIinputYearMonth'>&nbsp;&nbsp;"+yyyy+"년 "+mm+"월</i>")
				
				let dArray = [];
				// 해당 달의 일 수 가져오기 (여기서는 2월)
				let daySize = new Date(yyyy,mm,0).getDate();
				// 해당 달의 일 수 x축 레이블에 추가
				let dLabel = [];
				
				let attInit = [];
				let attEnd = [];
				let extInit = [];
				let extEnd = [];

				let attInitAbs = [];
				let attInitRel = [];
				let attEndRel = [];
				let extInitRel = [];
				let extEndRel = [];
				
				$.ajax({
					type : 'POST',
					url : 'getChartData.do?ym='+ym,
					success : function(data) {
						dArray = data.CD;
						console.log("이거 확인 : ", dArray)
					},
					complete : function() {
						
						// 레이블 값, moment value 절대값, 상대값 배열 초기과
						for (let i=1; i<=daySize; i++) {
							dLabel[i] = i;
							
							attInit[i] = null;
							attEnd[i] = null;
							extInit[i] = null;
							extEnd[i] = null;

							attInitAbs[i] = null;
							attInitRel[i] = null;
							attEndRel[i] = null;
							extInitRel[i] = null;
							extEndRel[i] = null;
						}

						// dArray = 11개 entry = 연장/근태 별로 있음
						// dLabel = 29 한달의 일수가 들어가 있음
						for (let j =0; j<dArray.length; j++) {
							for (let i=1; i<dLabel.length; i++) {
								if (dLabel[i] == dArray[j].days) {
									if (dArray[j].entry === '근태') {
										attInit[i] = '1970-01-01 '+dArray[j].attTime;
										attInitAbs[i] = moment(attInit[i]).valueOf()+10.8e6;
										attInitRel[i] = moment(attInit[i]).valueOf();
										attEnd[i] = '1970-01-01 '+dArray[j].offTime;
										attEndRel[i] = moment(attEnd[i]).valueOf()-attInitRel[i];
									} else if (dArray[j].entry === '승인') {
										extInit[i] = '1970-01-01 '+dArray[j].attTime;
										if (attInitAbs[i] == null) {
											extInitRel[i] = moment(extInit[i]).valueOf()+10.8e6;
											extEnd[i] = '1970-01-01 '+dArray[j].offTime;
											extEndRel[i] = moment(extEnd[i]).valueOf()-moment(extInit[i]).valueOf();
										} else {
											extInitRel[i] = moment(extInit[i]).valueOf()-attEndRel[i]-attInitRel[i];
											extEnd[i] = '1970-01-01 '+dArray[j].offTime;
											extEndRel[i] = moment(extEnd[i]).valueOf()-extInitRel[i]-attEndRel[i]-attInitRel[i];
										}	
									}

									
								}
							}
						}

						$('#attChart').remove();
						let newChart = "<canvas id='attChart' width='auto' height='auto'></canvas>";
						$('#divAttChart').append(newChart);
						
						let ctx = document.getElementById('attChart').getContext('2d');
						
						let attChart = new Chart(ctx, {
							type: 'bar',
						    data: {
						        labels: dLabel,
						        
						        datasets: [{
						        	stack : 'Stack 0',
						            label: '출근',
						            data: attInitAbs,
						            backgroundColor: 'rgba(255, 255, 0, 0)',
						            borderColor: 'rgba(255, 255, 0, 0.0 )',
						            borderWidth: 1,
						            barTickness : 1,
						        },
						        {
						        	stack : 'Stack 0',
						            label: '퇴근',
						            data: attEndRel,
						            backgroundColor: 'rgba(129, 242, 41, 1)',
						            borderColor: 'rgba(129, 242, 41, 0.5)',
						            borderWidth: 1
					
						        },
						        {
						        	stack : 'Stack 0',
						            label: '연장근무 시작',
						            data: extInitRel,
						            backgroundColor: 'rgba(255, 255, 0, 0)',
						            borderColor: 'rgba(255, 255, 0, 0)',
						            borderWidth: 1,
						        },
						        {
						        	stack : 'Stack 0',
						            label: '연장근무 종료',
						            data: extEndRel,
						            backgroundColor: 'rgba(255, 39, 0, 1)',
						            borderColor: 'rgba(255, 39, 0, 0.5)',
						            borderWidth: 1
						        }]
						    },
					
						    options: {
							    legend : {
									display : false,
									position : 'bottom',
									labels : {
										fontSize : 12
									}
								},
							    layout : {
								    padding : {
									    left : 20,
						    			right : 20,
										top : 10,
										bottom : 10
									}
								},
						    	responsive : true,
						    	tooltips: {
									callbacks: {
										title: function(tooltipItem, data) {
											let label = tooltipItem[0].xLabel;
											let dsi = tooltipItem[0].datasetIndex;

											if (dsi == 0) {
												return label + "일  출근 시간";
											} else if (dsi == 1) {
												return label + "일 근무";
											} else if (dsi == 2) {
												return label + "일  연장근무 시작";
											} else if (dsi == 3) {
												return label + "일  연장근무";
											}		
										},
										label: function(tooltipItem) {
											console.log("tooltipItem : ",tooltipItem);

											let workHour = moment(tooltipItem.yLabel+10.8e6);
											
											if (tooltipItem.datasetIndex == 0) {
												let absTime = moment(tooltipItem.yLabel-10.8e6);	
												return absTime.format('HH시 mm 분 A');
											} else if (tooltipItem.datasetIndex == 1) {
												return workHour.format('hh시간 mm분');
											} else if (tooltipItem.datasetIndex == 2) {
												return "연장근무 시작";
											} else if (tooltipItem.datasetIndex == 3) {
												return workHour.format('hh시간 mm분');
											}

										}
									}
								},
								scales: {
									x: {
										type: 'time',
										display: true,
										offset: true,
										time: {
											unit: 'day',
											displayFormats : {
												day : 'MMM D'
											}
										}
									},
									yAxes : [{
										type : 'linear',
										beingAtZero : false,
										stacked : true,
										ticks : {
											min : moment('1970-01-01 09:00:00').valueOf(),
											max : moment('1970-01-02 04:00:00').valueOf(),
											stepSize : 3.6e6,
					
											callback: value => {
												let date = moment(value-10.8e6);
												if(date.diff(moment('1970-01-01 00:00:00'), 'minutes') === 0) {
													return null;
												}
												return date.format('h:mm A');
											}
					
											
										}
									}]
								},
							}

						});
						//차트 끝~
						
					}
				})
				
			});
			
		}
	
	</script>
		
	</body>
</html>