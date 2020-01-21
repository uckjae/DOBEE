<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="fixed">
<head>

<c:import url="/common/HeadTag.jsp"/>


	
		<script src="assets/vendor/jquery/jquery.js"></script>
		
	<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
		<link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />	
<!-- <script type="text/javascript">
$(document).ready(function(){
		$('#myTable').DataTable({
			/*language option*/
			"language": {
 	        "emptyTable": "데이터가 없습니다.",
 	        "lengthMenu": "페이지당 _MENU_ 개씩 보기",
 	        "info": "현재 _START_ - _END_ / _TOTAL_건",
 	        "infoEmpty": "데이터 없음",
 	        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
 	        "search": "검색: ",
 	        "zeroRecords": "일치하는 데이터가 없습니다.",
 	        "loadingRecords": "로딩중...",
 	        "processing": "잠시만 기다려 주세요",
 	        "paginate": {
 	            "next": "다음",
 	            "previous": "이전"
 	        }
 	    },
 	    "columnDefs": [
 	        {
     	      className: "dt-center", "targets": [1],
   	        }
 	      ]
			});
	});
		</script> -->
</head>
	<body>
		<section class="body">

			<!-- start: header -->
			<c:import url="/common/Top.jsp"/>
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<c:import url="/common/SideAdmin.jsp"/>
				<!-- end: sidebar -->
				
			<!-- start : main Content -->
				<section role="main" class="content-body">
					<header class="page-header">
						<h2>법인카드 목록</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>법인카드관리</span></li>
								<li><span>법인카드 목록</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
					<!-- 작업 여기부터~!~!~!~~! -->
					
				<div id="datatable-editable_wrapper" class="dataTables_wrapper no-footer">
				
				
							<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
									<a href="#" class="fa fa-times"></a>
								</div>
						
								<h2 class="panel-title">법인카드 목록</h2>
							</header>
							<div class="panel-body">
								<div class="row">
									
								</div>
								<table class="table table-bordered table-striped mb-none" id="myTable">
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
										<tr>
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
						
						
						
				<!--  @@@@@@@@@@@@@@@@@ 원본-->
			<%-- 		<section class="panel">
					<header class="panel-heading">
						<div class="panel-actions">
							<a href="#" class="fa fa-caret-down"></a>
							<a href="#" class="fa fa-times"></a>
						</div>
				
						<h2 class="panel-title">법인카드 목록</h2>
					</header>
			<div class="panel-body">
				<form action="#" method="post">
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
					</tr>
				</thead>
				
				
				<tbody>
					<c:forEach items="${debitList}" var="debitList" varStatus="status">
						<tr>
							<td>${status.index+1}</td>
							<td>${debitList.cardNum}</td>
							<td>${debitList.corp}</td>
							<td>${debitList.name}</td>
							<td>${debitList.nickName}</td>
							<td>${debitList.entry}</td>
							<td><fmt:formatDate value="${debitList.valDate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
					
		
				</tbody>
					</table>
				</form>
			</div>
		</section> --%>
		<!-- 원본 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	</div> 
					<!-- start: page -->
					<!-- end: page -->
				</section>
			</div>




			<!-- 오른쪽 사이드바!! -->
		<c:import url="/common/RightSide.jsp"/>
			<!-- 오른쪽 사이드바 끝!! -->
		<c:import url="/common/BottomTag.jsp"/>
			
			
		</section>
	<!-- Specific Page Vendor -->
		<script src="assets/vendor/select2/select2.js"></script>
		<script src="assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
		<script src="assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script> 
	<!-- Examples -->	
	   <script src="assets/javascripts/tables/examples.datatables.editable.js"></script> 
	  
	</body>
</html>