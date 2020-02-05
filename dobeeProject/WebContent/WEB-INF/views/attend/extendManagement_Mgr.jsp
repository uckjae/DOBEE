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
			width : 80%;
			border : none;
			border-radius: 5px;
		}
		 
	</style>
	
<!-- Head Tag Script -->
<c:import url="/common/HeadTag.jsp"/>

<!-- Modal -->
<link rel="stylesheet" href="assets/vendor/pnotify/pnotify.custom.css" />

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
						<h2>연장 근무 관리</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-briefcase" aria-hidden="true"></i>
									</a>
								</li>
								<li><span>근무</span></li>
								<li><span>연장 근무 신청 관리</span></li>
							</ol>
					
							<i class="fa fa-chevron-left"></i>
						</div>
					</header>
					<!-- 작업 여기부터~!~!~!~~! -->
					
					
					<section class="panel">
						<header class="panel-heading">
							<h2 class="panel-title">연창근무 신청 목록</h2>
						</header>
						<div class="panel-body">
							<table class="table table-bordered table-striped mb-none" id="extTable" data-swf-path="assets/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf">
								
								<thead>
									<tr>
										<th width="10%">신청 번호</th>
										<th width="15%">신청 ID</th>
										<th width="10%">신청자명</th>
										<th width="10%">신청 일자</th>
										
										<th width="10%">부재 항목</th>
										<th>기간</th>
										<!-- <td width="8%">사유</td> -->
										<th width="10%">승인 여부</th>
									</tr>
								</thead>
								
								<tbody id="tbody">
									<c:forEach items="${extListMgr}" var="el">
										<tr>
											<td class="bSeq" style="text-align: center;">${el.aplSeq }</td>
											<td class="bMail">${el.drafter }</td>
											<td class="bName" style="text-align: center;">${el.name }</td>
											<td class="bReqDate" style="text-align: center;">${el.reqDate}</td>
											<td class="bEntry" style="text-align: center;">${el.entry }</td>
											<td class="bTerm">${el.startAt } - ${el.endAt }</td>												
											<td class="bIsAuth" style="text-align: center;">
												<button	class="btn btn-info btn-sm ${el.isAuth }" data-toggle="modal"
													data-target="#myModal" 
													data-aplSeq="${el.aplSeq}" data-reason="${el.reason}" data-rejReason="${el.rejReason}" data-mail="${el.drafter}"> ${el.isAuth}
												</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
								
								<tfoot>
								</tfoot>
								
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
										<i class="fa fa-check fa-2x"></i>&nbsp;Reason
									</h4>
								</div>
								
								<!--Body-->	
								<form action="absManage.do" method="POST">
									<div class="container-fluid">
										<div class="modal-body mb-0" style="margin-top: 30px;">
										<input type="hidden" id="modalAplSeq" name="aplSeq">
										<input type="hidden" id="modalMail" disabled>
											<div class="form-group">
												<label class="col-md-3 control-label"><i
													class="fa fa-comment-o fa-2x"></i><span style="font-size: 15px">&nbsp;&nbsp;연장 근무 신청 사유</span></label>
												<div class="col-md-9">
													<textarea id="modalReason" name="reason" class="form-control" rows="3" data-plugin-textarea-autosize="" style="height: 200px" readonly="readonly"></textarea>
												
													<!-- <input type="text" id="modalReason" name="reason" class="form-control" style="height: 35px;" readonly="readonly"> -->
												</div>
											</div>
											<br>
											<div class="form-group">
												<label class="col-md-3 control-label"><i
													class="fa fa-tasks fa-2x"></i><span style="font-size: 15px">&nbsp;&nbsp;승인 여부</span></label>
												<div class="col-md-9">
													<select id="entrySelectorInModal" name="isAuth" style="width:100%">
														<option value="미승인">항목 선택</option>
														<option value="승인">승인</option>
														<option value="반려">반려</option>
														<option value="미승인">미승인</option>
													</select>
												</div>
											</div>
											<br>
											<div class="form-group">
												<label class="col-md-3 control-label" for="userList"><i
													class="fa fa-times fa-2x"></i><span style="font-size: 15px">&nbsp;&nbsp;연장 근무 반려 사유</span></label>
												<div class="col-md-9">
													<textarea id="modalRejReason" name="rejReason" class="form-control" rows="3" data-plugin-textarea-autosize="" data-plugin-maxlength maxlength="3000" style="height: 200px" placeholder="반려 시 사유를 입력하세요."></textarea>
													<!-- <input type="text" id="modalRejReason" name="rejReason" class="form-control" style="height: 35px;" placeholder="반려 시 사유를 입력하세요."> -->
												</div>
											</div>
											<br>
										</div>
									</div>
									<div class="modal-footer">
										<div class="row">
											<div class="col-md-4"></div>
											<div class="col-md-4 text-center">
												<button class="btn btn-primary" onclick="modalSubmit(this)" data-dismiss="modal">확인</button>
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

		</section>

		<c:import url="/common/BottomTag.jsp"/>
		
		
<!-- SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT// -->
	
	<!-- Table Script -->
	<script src="assets/vendor/select2/select2.js"></script>
	<script src="assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
	<script src="assets/vendor/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
	<script src="assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
	
	<!-- Modal Script -->
	<script src="assets/vendor/pnotify/pnotify.custom.js"></script>
	<script src="assets/javascripts/ui-elements/examples.modals.js"></script>
	
	
		<script>
  			
		window.onload = function(){
			var wsocket;//알람을 위한 웹소켓 연결
			connect();//알람을 위한 웹소켓 연결
			
			let aplSeq = "";
			let reason = "";
			let rejReason = "";
			let mail = "";
			
			$('.btn-sm').click('show.bs.modal', function(e) {
				aplSeq = $(this).data('aplseq');
				reason = $(this).data('reason');
				rejReason = $(this).data('rejreason');
				mail = $(this).data('mail');
				
				$('#modalAplSeq').val(aplSeq);
				$('#modalReason').val(reason);
				$('#modalRejReason').val(rejReason);
				$('#modalMail').val(mail);
			});

			
			$('#extTable').DataTable({
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
			send("extendMGR");
			$(data).closest('form').submit();
		}

		//모달 전송함수
		function modalSubmit(data){
			var formData = $(data).closest('form').serialize();
			
			$.ajax({
				type : "post",
 	 			url : "ajax/apply/extManage.do",
 	 			dataType : "text",
 				data : formData,
 				success : function(responseData){
 					if(responseData == "success"){
 						swal({
	 						   title: "처리 완료",
	 						   text: "연장 근무 신청이 처리되었습니다.",
	 						   icon: "success" //"info,success,warning,error" 중 택1
	 						}).then((YES) => {
	 							location.href="extManage.do";
	 							send("extendMGR");
	 					});
 					}
 				},
 				error : function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
 			});
			
		}
		
	</script>
		
	</body>
</html>