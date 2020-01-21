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
		
		.btn-info.btn-sm reason {
			background-color: navy;
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
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
					<!-- 작업 여기부터~!~!~!~~! -->
					

					<section class="panel">
						<header class="panel-heading">
							<div class="panel-actions">
								<a href="#" class="fa fa-caret-down"></a>
								<a href="#" class="fa fa-times"></a>
							</div>
					
							<h2 class="panel-title">Table</h2>
						</header>
						<div class="panel-body">
							<table class="table table-bordered table-striped mb-none" id="extTable" data-swf-path="assets/vendor/jquery-datatables/extras/TableTools/swf/copy_csv_xls_pdf.swf">
								
								<thead id="thead">
									<tr>
										<th width="8%">신청 번호</th>
										<th width="15%">신청 ID</th>
										<th width="10%">신청자명</th>
										<th width="9%">신청 일자</th>
										<th width="8%">부재 항목</th>
										<th width="8%">승인 여부</th>
										<th>기간</th>
										<td width="8%">상세보기</td>
									</tr>
								</thead>
				
								<tbody id="tbody">
									<c:forEach items="${extListMgr}" var="el">
										<tr>
											<td class="bSeq">${el.aplSeq }</td>
											<td class="bMail">${el.drafter }</td>
											<td class="bName">${el.name }</td>
											<td class="bReqDate">${el.reqDate}</td>
											<td class="bEntry">${el.entry }</td>
											<td class="bIsAuth">
												<button	disabled="disabled" class="btn btn-info btn-sm ${el.isAuth }"> ${el.isAuth} </button>
											</td>
											<td class="bTerm">${el.startAt } - ${el.endAt }</td>
											<td class="bReason">
												<button	class="btn btn-info btn-sm reason" data-toggle="modal"
													data-target="#myModal" 
													data-aplSeq="${el.aplSeq}" data-reason="${el.reason}" data-rejReason="${el.rejReason}"> 사유 확인
												</button>
												
										</tr>
									</c:forEach>
								</tbody>
				
								<tfoot>
								</tfoot>
								
							</table>
						</div>
					</section>
					
					<!-- 
					Modal Primary
					<a class="mb-xs mt-xs mr-xs modal-basic btn btn-primary" href="#modalPrimary">Primary</a>
					
					<div id="myModal" class="zoom-anim-dialog modal-block modal-block-primary modal-block-lg mfp-hide">
						<section class="panel">
						<form action="absManage.do" method="POST">
							<header class="panel-heading">
								<h2 class="panel-title">부재 신청 사유</h2>
							</header>
							<div class="panel-body">
								<div class="modal-wrapper">
									<div class="modal-text">
										<input type="hidden" id="modalAplSeq" name="aplSeq">
									
										<br>
										<div id="divReason">
											<h3>부재 신청 사유</h3>
											<input type="text" id="modalReason" name="reason" readonly="readonly">
										</div>
										<br>
										<select id="entrySelectorInModal" name="isAuth">
											<option value="미승인">항목 선택</option>
											<option value="승인">승인</option>
											<option value="반려">반려</option>
											<option value="미승인">보류</option>
										</select>
										
										<div id="divRejReason">
											<h3>부재 신청 반려 사유 입력</h3>
											<input type="text" id="modalRejReason" name="rejReason" placeholder="반려 시 사유를 입력하세요.">
										</div>
									</div>
								</div>
							</div>
							<footer class="panel-footer">
								<div class="row">
									<div class="col-md-12 text-right">
										<button type="submit" class="btn btn-primary modal-confirm">확인</button>
										<button type="reset" class="btn btn-primary modal-confirm">초기화</button>
										<button class="btn btn-default modal-dismiss">취소</button>
									</div>
								</div>
							</footer>
							
						</form>
						</section>
					</div> -->
					
					
					
					<<!-- Modal  -->
					<section id="modal_breakreason">
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<h2>부재 신청 사유</h2>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									
									<form action="absManage.do" method="POST">
										<div class="modal-body">
											<div class="row">
												<div class="col-md-1"></div>
												<div class="col-md-10">
												
													<input type="hidden" id="modalAplSeq" name="aplSeq">
													
													<br>
													<div id="divReason">
														<h3>부재 신청 사유</h3>
														<input type="text" id="modalReason" name="reason" readonly="readonly">
													</div>
													<br>
													<select id="entrySelectorInModal" name="isAuth">
														<option value="미승인">항목 선택</option>
														<option value="승인">승인</option>
														<option value="반려">반려</option>
														<option value="미승인">보류</option>
													</select>
													
													<div id="divRejReason">
														<h3>부재 신청 반려 사유 입력</h3>
														<input type="text" id="modalRejReason" name="rejReason" placeholder="반려 시 사유를 입력하세요.">
													</div>
												</div>
												<div class="col-md-1"></div>
											</div>
										</div>
										
										<div class="modal-footer">
											<input type="submit" class="btn btn-default" value="확인">
											&nbsp;&nbsp;
											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										</div>
									</form>
									
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
			
			let aplSeq = "";
			let reason = "";
			let rejReason = "";

			$('.btn-sm').click('show.bs.modal', function(e) {
				aplSeq = $(this).data('aplseq');
				reason = $(this).data('reason');
				rejReason = $(this).data('rejreason');
				
				$('#modalAplSeq').val(aplSeq);
				$('#modalReason').val(reason);
				$('#modalRejReason').val(rejReason);
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
		
	</script>
		
	</body>
</html>