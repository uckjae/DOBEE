<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html class="fixed">
<head>


<c:import url="/common/HeadTag.jsp"/>
	
		<script src="assets/vendor/jquery/jquery.js"></script>
	
<script type="text/javascript">
		$(document).ready(function() {
		
	});
</script>

</head>

<body>
	<section class="body">

		<!-- start: header -->
		<c:import url="/common/Top.jsp" />
		<!-- end: header -->

		<div class="inner-wrapper">
			<!-- start: sidebar -->
			<c:import url="/common/SideAdmin.jsp" />
			<!-- end: sidebar -->

			<!-- start : main Content -->
			<section role="main" class="content-body">
				<header class="page-header">
					<h2>법인카드 목록</h2>

					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="index.html"> <i class="fa fa-home"></i>
							</a></li>
							<li><span>법인카드관리</span></li>
							<li><span>법인카드 목록</span></li>
						</ol>

						<a class="sidebar-right-toggle" data-open="sidebar-right"><i
							class="fa fa-chevron-left"></i></a>
					</div>
				</header>
				
				
				<!-- 작업 여기부터~!~!~!~~! -->
				
				
				<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
									<a href="#" class="fa fa-times"></a>
								</div>
						
								<h2 class="panel-title">Default</h2>
							</header>
							<div class="panel-body">
								<!-- <div class="row">
									<div class="col-sm-6">
										<div class="mb-md">
											<button id="addToTable" class="btn btn-primary">Add <i class="fa fa-plus"></i></button>
										</div>
									</div>
								</div> -->
								
								
								<table class="table table-bordered table-striped mb-none" id="datatable-editable">
								<thead>
										<tr>
											<th style="width: auto">번호</th>
											<th style="width: auto">카드번호</th>
											<th style="width: auto">카드사</th>
											<th style="width: auto">명의자 이름</th>
											<th style="width: auto">카드별칭</th>
											<th style="width: auto">카드구분</th>
											<th style="width: auto">유효기간</th>
											<th style="width: auto">수정 및 삭제</th>
										</tr>
									</thead>
									
									
									<tbody>
									<c:forEach items="${debitList}" var="debitList" varStatus="status">
										<tr class="gradeX">
									
											<td>${status.index+1}</td>
											<td>${debitList.cardNum}</td>
											<td>${debitList.corp}</td>
											<td>${debitList.name}</td>
											<td>${debitList.nickName}</td>
											<td>${debitList.entry}</td>
											<td><fmt:formatDate value="${debitList.valDate}" pattern="yyyy-MM-dd" /></td>
										
											<td class="actions">
												<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
												<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
												<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
												<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</section>
			
				<!-- end: page -->
			</section>
		</div>


		<!-- 오른쪽 사이드바!! -->
		<c:import url="/common/RightSide.jsp" />
		<!-- 오른쪽 사이드바 끝!! -->
	</section>
		<!-- 모달창 -->
		<div id="dialog" class="modal-block mfp-hide">
			<section class="panel">
				<header class="panel-heading">
					<h2 class="panel-title">Are you sure?</h2>
				</header>
				<div class="panel-body">
					<div class="modal-wrapper">
						<div class="modal-text">
							<p>Are you sure that you want to delete this row?</p>
						</div>
					</div>
				</div>
				<footer class="panel-footer">
					<div class="row">
						<div class="col-md-12 text-right">
							<button id="dialogConfirm" class="btn btn-primary">Confirm</button>
							<button id="dialogCancel" class="btn btn-default">Cancel</button>
						</div>
					</div>
				</footer>
			</section>
		</div>
	
		
			
			
			
		
		<!--  vendor -->
		<!-- <script src="assets/vendor/jquery/jquery.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script> -->
		<!-- Specific Page Vendor -->
		<!-- <script src="assets/vendor/select2/select2.js"></script>
		<script src="assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
		<script src="assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script> -->
		
		<!-- Theme Base, Components and Settings -->
		<!-- <script src="assets/javascripts/theme.js"></script> -->
		
		<!-- Theme Custom -->
		<!-- <script src="assets/javascripts/theme.custom.js"></script>
		 -->
		<!-- Theme Initialization Files -->
		<!-- <script src="assets/javascripts/theme.init.js"></script>
 -->
		
		
<c:import url="/common/BottomTag.jsp"/>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/select2/select2.js"></script>
		<script src="assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
		<script src="assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script> 

<!-- Examples -->
		<script src="assets/javascripts/tables/examples.datatables.editable.js"></script>
	
	
</body>
</html>