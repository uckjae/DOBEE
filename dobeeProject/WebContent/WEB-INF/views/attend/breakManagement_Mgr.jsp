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
						<h2>부재 신청 관리</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-briefcase" aria-hidden="true"></i>
									</a>
								</li>
								<li><span>근무</span></li>
								<li><span>부재 신청 관리</span></li>
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
											<a href="#popular1" data-toggle="tab"><i class="fa fa-star"></i> 연차 정보</a>
										</li>
										<li>
											<a href="#recent1" data-toggle="tab">조회 옵션</a>
										</li>
									</ul>
									<div class="tab-content">
										<div id="popular1" class="tab-pane active" style="height: 50px;">
											
											Lorem Ipsum is beautiful things, I god a stomachache in 3 AM.
										</div>
										<div id="recent1" class="tab-pane" style="height:50px;">
											<select id="selectEntry">
												<option value="">항목별</option>
												<!-- Ajax -->
											</select>
										
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</section>
					
					
					<section class="panel">
						<header class="panel-heading">
							<h2 class="panel-title">부재 신청 목록</h2>
						</header>
						<div class="panel-body">
							<table class="table table-bordered table-striped mb-none" id="brkTable" data-swf-path="assets/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf">
								<thead>
									<tr>
										<th width="8%">신청 번호</th>
										<th width="15%">신청 ID</th>
										<th width="15%">신청자명</th>
										<th width="9%">신청 일자</th>
										<th width="8%">부재 항목</th>
										<th width="10%" style="min-width: 90px;">연차 사용 일수</th>
										<th>기간</th>
										
										<th width="8%">승인 여부</th>
									</tr>
								</thead>
								<tbody>
									
									<c:forEach items="${brkListMgr}" var="bl">
										<tr>
											<td class="bSeq">		${bl.aplSeq }</td>
											<td class="bMail">		${bl.drafter }</td>
											<td class="bName">		${bl.name }</td>
											<td class="bReqDate">	${bl.reqDate}</td>
											<td class="bEntry">		${bl.entry }</td>
											<td class="bUsed" style="text-align: center;">		${bl.useBreak }</td>
											<td class="bTerm">		${bl.startAt } - ${bl.endAt }</td>
											
											<td class="bIsAuth">
												<button class="btn btn-info btn-sm ${bl.isAuth }" data-toggle="modal" data-target="#myModal" data-mail="${bl.drafter}" data-aplSeq="${bl.aplSeq}" data-reason="${bl.reason}" data-rejReason="${bl.rejReason}">${bl.isAuth }</button>			
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
								<form action="absManage.do" method="POST">
									<div class="container-fluid">
										<div class="modal-body mb-0" style="margin-top: 30px;">
										<input type="hidden" id="modalAplSeq" name="aplSeq">
										<input type="hidden" id="modalMail" name="mail" disabled>
											<div class="form-group">
												<label class="col-md-3 control-label"><i
													class="fa fa-comment-o fa-2x"></i><span style="font-size: 15px">&nbsp;&nbsp;부재 신청 사유</span></label>
												<div class="col-md-9">
													<input type="text" id="modalReason" name="reason" class="form-control" style="height: 35px;" readonly="readonly">
												</div>
											</div>
											<br>
											<div class="form-group">
												<label class="col-md-3 control-label"><i
													class="fa fa-comment-o fa-2x"></i><span style="font-size: 15px">&nbsp;&nbsp;승인 여부</span></label>
												<div class="col-md-9">
													<select id="entrySelectorInModal" name="isAuth" style="width:100%">
														<option value="미승인">항목 선택</option>
														<option value="승인">승인</option>
														<option value="반려">반려</option>
														<option value="미승인">보류</option>
													</select>
												</div>
											</div>
											<br>
											<div class="form-group">
												<label class="col-md-3 control-label" for="userList"><i
													class="fa fa-times fa-2x"></i><span style="font-size: 15px">&nbsp;&nbsp;부재 신청 반려 사유</span></label>
												<div class="col-md-9">
													<input type="text" id="modalRejReason" name="rejReason" class="form-control" style="height: 35px;" placeholder="반려 시 사유를 입력하세요.">
												</div>
											</div>
											<br>
										</div>
									</div>
									<div class="modal-footer">
										<div class="row">
											<div class="col-md-4"></div>
											<div class="col-md-4 text-center">
												<button class="btn btn-primary" data-dismiss="modal" onclick="modalSubmit(this)">확인</button>
												<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
											</div>
											<div class="col-md-4"></div>
										</div>
									</div>
								</form>
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
				var wsocket;
				connect();//알람을위한 웹소켓 connect
				// 부재항목 Option Ajax Loading ********************
				$.ajax({
					url : "breakEntryListMgr.do",
					dataType : "json",
					success : function(data) {
						var eArray = [];
						eArray = data.breakEntryListMgr;
						for (var i=0; i<eArray.length; i++) {
							$('#selectEntry').append("<option value=" + eArray[i].apyCode + ">" + eArray[i].entry + "</option>");
						}
					}
				});
	
				let aplSeq = "";
				let reason = "";
				let rejReason = "";
				let isAuth = "";
				let mail = "";
	
				$('.btn-sm').click('show.bs.modal', function(e) {
						
					aplSeq = $(this).data('aplseq');
					console.log('시퀀스 : '+aplSeq);
					reason = $(this).data('reason');
					console.log('이유 ' +reason);
					rejReason = $(this).data('rejreason');
					console.log(rejReason);			
					mail = $(this).data('mail');
	
					$('#modalAplSeq').val(aplSeq);
					$('#modalReason').val(reason);
					$('#modalRejReason').val(rejReason);
					$('#modalMail').val(mail);
	
				});
				
				// 부재항목 Option 변경시 List Ajax 처리
				$('#selectEntry').change(function() {
	
					$.ajax ({
						url : "getBreakListByEntry.do",
						dataType : "json",
						success : function (data) {
							$('#tbody').empty();
							/*
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
							*/
						},
						error : function(error) {
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				});
	
			
				$('#brkTable').DataTable({
					/*language option*/
					"language" : {
						"emptyTable" : "데이터가 없습니다.",
						"lengthMenu" : "페이지당 _MENU_ 개씩 보기",
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
	
			}

			/* 알람 */
			
			function send(command) {
				var jsonData = new Object();
				jsonData.cmd = command;
				jsonData.content = $('#entrySelectorInModal').val();
				jsonData.mail = $('#modalMail').val();

				var parsedData = JSON.stringify(jsonData);
				
				wsocket.send(parsedData);
			}
			/* /알람  */
			
			//모달 전송함수
			function modalSubmit(data){
				send("breakMGR");
				$(data).closest('form').submit();
			}
			
		</script>
		
	</body>
</html>