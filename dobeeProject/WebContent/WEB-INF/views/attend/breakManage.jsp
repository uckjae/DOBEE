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

<!-- Table Style -->
<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
<link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />


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
						<h2>부재 일정 관리</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-briefcase" aria-hidden="true"></i>
									</a>
								</li>
								<li><span>근무</span></li>
								<li><span>부재 일정 관리</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
					<!-- 작업 여기부터~!~!~!~~! -->
					
					<section class="panel">
						<header class="panel-heading">
							<h3 class="panel-title">부재 신청 현황</h3>
						</header>
						<div class="panel-body">
							<table class="table table-bordered table-striped mb-none" id="brkTable" data-swf-path="assets/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf">
								<thead>
									<tr>
										<th width="13%">부재항목</th>
										<th>기간</th>
										<th width="13%">연차 사용 일수</th>
										<th width="17%">신청 일자</th>
										<th width="20%">승인여부</th>
										<th width="8%">수정/삭제</th>
									</tr>
								</thead>
								<tbody>
									
									<c:forEach items="${brkList}" var="bl">
										<tr>
											<td class="bcategory">	${bl.entry }</td>
											<td class="tterm">		${bl.startAt } - ${bl.endAt }</td>
											<td class="tused">		${bl.useBreak }</td>
											<td class="tregdate">	${bl.reqDate }</td>
											<td class="notauth"><button type="button" class="btn btn-info btn-sm ${bl.isAuth }" data-toggle="modal" data-target="#myModal"
																		data-aplSeq="${bl.aplSeq }" data-reason="${bl.reason }" data-rejReason="${bl.rejReason }">${bl.isAuth }</button>
											</td>
											<td class="teditdelete">
												<c:choose>
													<c:when test="${bl.isAuth == '미승인'}">
														<button class="mb-xs mt-xs btn-sm btn-default" onclick="location.href='editApply.do?aplSeq=${bl.aplSeq}'">수정 / 삭제</button>
													</c:when>
													<c:otherwise>
														&nbsp;-
													</c:otherwise>
												</c:choose>
											</td>
											
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
					</section>
					
					
					<section class="panel">
						<div class="col-md-6 col-lg-12 col-xl-12">
							<div class="row">
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-primary">
										<div class="panel-body">
											<div class="widget-summary widget-summary-sm">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-primary">
														<i class="fa fa-life-ring"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">남은 연차</h4>
														<div class="info">
															<strong class="amount" id="remainVacation">불러오는 중...</strong>
														</div>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								
								<div class="col-md-12 col-lg-6 col-xl-6">
									<section class="panel panel-featured-left panel-featured-primary">
										<div class="panel-body">
											<div class="widget-summary widget-summary-sm">
												<div class="widget-summary-col widget-summary-col-icon">
													<div class="summary-icon bg-primary">
														<i class="fa fa-life-ring"></i>
													</div>
												</div>
												<div class="widget-summary-col">
													<div class="summary">
														<h4 class="title">사용 연차</h4>
														<div class="info">
															<strong class="amount" id="usedVacation">불러오는 중...</strong>
														</div>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
							</div>
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
	
	<!-- Table Script -->
	<script src="assets/vendor/select2/select2.js"></script>
	<script src="assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
	<script src="assets/vendor/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
	<script src="assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>

	
		<script>
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

				// 연차 정보 가져오기
				$.ajax ({
					url : "getVacationInBM.do",
					dataType : "json",
					success : function (data) {
						$('#remainVacation').html(data.totalVacation[0].totalBreak - data.totalVacation[0].usedBreak)
						$('#usedVacation').html(data.totalVacation[0].usedBreak)						
					},
					error : function(error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
	
				// 년도 Option Ajax Loading
				$.ajax({
					url : "breakYearList.do",
					dataType : "json",
					success : function(data) {
						var yArray = [];
						yArray = data.breakYearList;
						for (var i=0; i<yArray.length; i++) {
							var option = document.createElement("option");
							$(option).text(yArray[i]+'년');
							$("#selectYear").append(option);
						}
					}				
				});	


				$('#brkTable').DataTable({
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
				
				
				// 월 Option Ajax Loading
				$.ajax({
					url : "breakYearMonthList.do",
					dataType : "json",
					success : function(data) {
						var ymArray = [];
						ymArray = data.breakYearMonthList;
						for (var i = 0; i<ymArray.length; i++) {
							var option = document.createElement("option");
							$(option).text(ymArray[i]);
							$("#selectMonth").append(option);
						}
					}			
				});
	
				// 부재항목 Option Ajax Loading
				$.ajax({
					url : "breakEntryList.do",
					dataType : "json",
					success : function(data) {
						var eArray = [];
						eArray = data.breakEntryList;
						for (var i=0; i<eArray.length; i++) {
							$('#selectEntry').append("<option value=" + eArray[i].apyCode + ">" + eArray[i].entry + "</option>");
						}
					}
				});
				
				// 승인여부 Option Ajax Loading
				$.ajax({
					url : "breakIsAuthList.do",
					dataType : "json",
					success : function(data) {
						var aArray = [];
						aArray = data.breakIsAuthList;
						for (var i=0; i<aArray.length; i++) {
							var option = document.createElement("option");
							$(option).text(aArray[i]);
							$('#selectIsAuth').append(option);
						}
					}
				});
	
				
				// 년도 Option 변경시 List Ajax 처리
				$('#selectYear').change(function() {
					
					$.ajax ({
						url : "getBreakListByYear.do",
						dataType : "json",
						success : function (data) {
							$('#tbody').empty();
							var byArray = [];
							byArray = data.byYear;
							for (var i=0; i<byArray.length; i++) {	
								$('#tbody').append(
									'<tr> <td class="bcategory">' + byArray[i].entry +'</td>' +
										'<td class="tterm">' +	byArray[i].startAt +' - '+ byArray[i].endAt + '</td>' +
										'<td class="tused">' +	byArray[i].usingBreak + '</td>' +
										'<td class="tregdate">' +	byArray[i].reqDate + '</td>'+
										'<td class="notauth"><button type="button" class="btn btn-info btn-sm '+byArray[i].isAuth+'" data-toggle="modal" data-target="#myModal'+byArray[i].aplSeq+'">'+ byArray[i].isAuth +'</button></td>'+
									'</tr>'
									+
									'<div class="modal fade" id="myModal'+byArray[i].aplSeq+'" role="dialog">'+
										'<div class="modal-dialog modal-lg"> <div class="modal-content"> <div class="modal-header">'+
										'<button type="button" class="close" data-dismiss="modal">&times;</button>'+
										'<h4 class="modal-title">상세 사유</h4> </div> <div class="modal-body"> <h3>부재 사유</h3> <h4>사유</h4>'+
										'<h5>'+byArray[i].reason+'</h5> </div> <div class="modal-footer">'+
									'<button type="button" class="btn btn-default" data-dismiss="modal">OK</button> </div> </div> </div> </div>'		
								);
							}	
						},
						error : function(error) {
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					})
				});
	
				// 월 Option 변경시 List Ajax 처리
				$('#selectMonth').change(function() {
	
					$.ajax ({
						url : "getBreakYearMonthList.do",
						dataType : "json",
						success : function (data) {
							$('#tbody').empty();
							var bymArray = [];
							bymArray = data.byYMonth;
							for (var i=0; i<bymArray.length; i++) {	
								$('#tbody').append(
									'<tr> <td class="bcategory">' + bymArray[i].entry +'</td>' +
										'<td class="tterm">' +	bymArray[i].startAt +' - '+ bymArray[i].endAt + '</td>' +
										'<td class="tused">' +	bymArray[i].usingBreak + '</td>' +
										'<td class="tregdate">' +	bymArray[i].reqDate + '</td>'+
										'<td class="notauth"><button type="button" class="btn btn-info btn-sm '+bymArray[i].isAuth+'" data-toggle="modal" data-target="#myModal'+bymArray[i].aplSeq+'">'+ bymArray[i].isAuth +'</button></td>'+
									'</tr>'
									+
									'<div class="modal fade" id="myModal'+bymArray[i].aplSeq+'" role="dialog">'+
										'<div class="modal-dialog modal-lg"> <div class="modal-content"> <div class="modal-header">'+
										'<button type="button" class="close" data-dismiss="modal">&times;</button>'+
										'<h4 class="modal-title">상세 사유</h4> </div> <div class="modal-body"> <h3>부재 사유</h3> <h4>사유</h4>'+
										'<h5>'+bymArray[i].reason+'</h5> </div> <div class="modal-footer">'+
									'<button type="button" class="btn btn-default" data-dismiss="modal">OK</button> </div> </div> </div> </div>'		
								);
							}	
						},
						error : function(error) {
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				});
	
				// 부재항목 Option 변경시 List Ajax 처리
				$('#selectEntry').change(function() {
	
					$.ajax ({
						url : "getBreakListByEntry.do",
						dataType : "json",
						success : function (data) {
							$('#tbody').empty();
							var beArray = [];
							beArray = data.byEntry;
							for (var i=0; i<beArray.length; i++) {	
								$('#tbody').append(
									'<tr> <td class="bcategory">' + beArray[i].entry +'</td>' +
										'<td class="tterm">' +	beArray[i].startAt +' - '+ beArray[i].endAt + '</td>' +
										'<td class="tused">' +	beArray[i].usingBreak + '</td>' +
										'<td class="tregdate">' +	beArray[i].reqDate + '</td>'+
										'<td class="notauth"><button type="button" class="btn btn-info btn-sm '+beArray[i].isAuth+'" data-toggle="modal" data-target="#myModal'+beArray[i].aplSeq+'">'+ beArray[i].isAuth +'</button></td>'+
									'</tr>'
									+
									'<div class="modal fade" id="myModal'+beArray[i].aplSeq+'" role="dialog">'+
										'<div class="modal-dialog modal-lg"> <div class="modal-content"> <div class="modal-header">'+
										'<button type="button" class="close" data-dismiss="modal">&times;</button>'+
										'<h4 class="modal-title">상세 사유</h4> </div> <div class="modal-body"> <h3>부재 사유</h3> <h4>사유</h4>'+
										'<h5>'+beArray[i].reason+'</h5> </div> <div class="modal-footer">'+
									'<button type="button" class="btn btn-default" data-dismiss="modal">OK</button> </div> </div> </div> </div>'		
								);
							}	
						},
						error : function(error) {
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				});
	
				// 승인여부 Option 변경시 List Ajax 처리
				$('#selectIsAuth').change(function() {
	
					$.ajax ({
						url : "getBreakListByIsAuth.do",
						dataType : "json",
						success : function (data) {
							$('#tbody').empty();
							var biaArray = [];
							biaArray = data.byIsAuth;
							for (var i=0; i<biaArray.length; i++) {	
								$('#tbody').append(
									'<tr> <td class="bcategory">' + biaArray[i].entry +'</td>' +
										'<td class="tterm">' +	biaArray[i].startAt +' - '+ biaArray[i].endAt + '</td>' +
										'<td class="tused">' +	biaArray[i].usingBreak + '</td>' +
										'<td class="tregdate">' +	biaArray[i].reqDate + '</td>'+
										'<td class="notauth"><button type="button" class="btn btn-info btn-sm '+biaArray[i].isAuth+'" data-toggle="modal" data-target="#myModal'+biaArray[i].aplSeq+'">'+ biaArray[i].isAuth +'</button></td>'+
									'</tr>'
									+
									'<div class="modal fade" id="myModal'+biaArray[i].aplSeq+'" role="dialog">'+
										'<div class="modal-dialog modal-lg"> <div class="modal-content"> <div class="modal-header">'+
										'<button type="button" class="close" data-dismiss="modal">&times;</button>'+
										'<h4 class="modal-title">상세 사유</h4> </div> <div class="modal-body"> <h3>부재 사유</h3> <h4>사유</h4>'+
										'<h5>'+biaArray[i].reason+'</h5> </div> <div class="modal-footer">'+
									'<button type="button" class="btn btn-default" data-dismiss="modal">OK</button> </div> </div> </div> </div>'		
								);
							}
						},
						error : function(error) {
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				});
	
			}
			
		</script>
		
	</body>
</html>