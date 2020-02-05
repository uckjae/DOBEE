<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html class="fixed">
<head>


<c:import url="/common/HeadTag.jsp"/>
	
	<script src="assets/vendor/jquery/jquery.js"></script>
	<link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"/>
<!-- 	<link href="assets/vendor/jquery-datatables-bs3/examples/css/datatables.css"/>
	<link href="assets/vendor/jquery-datatables/media/css/jquery.dataTables.min.css"/>
	<link href="assets/vendor/jquery-datatables/media/css/jquery.dataTables_themeroller.css"/> -->
	


</head>

<body>
	<section class="body">

		<!-- start: header -->
		<c:import url="/common/TopAdmin.jsp"/>
		<!-- end: header -->

		<div class="inner-wrapper">
			<!-- start: sidebar -->
			<c:import url="/common/SideAdmin.jsp" />
			<!-- end: sidebar -->

			<!-- start : main Content -->
			<section role="main" class="content-body">
				<header class="page-header">
					<h2>법인카드 관리</h2>

					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-credit-card"></i></a></li>
							<li><span>법인카드</span></li>
							<li><span>법인카드 관리</span></li>
						</ol>

						<a class="sidebar-right-toggle" data-open="sidebar-right"><i
							class="fa fa-chevron-left"></i></a>
					</div>
				</header>
				
				
				<!-- 작업 여기부터~!~!~!~~! -->
				
				
				<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
							
								</div>
						
								<h2 class="panel-title">법인카드 관리</h2>
							</header>
							<div class="panel-body">
								
								
								
								<table class="table display" id="datatable-editable">
								<thead>
										<tr>
											<th style="width: auto">번호</th>
											<th style="width: auto">카드번호</th>
											<th style="width: auto">카드사</th>
											<th style="width: auto">명의자 이름</th>
											<th style="width: auto">카드별칭</th>
											<th style="width: auto">카드구분</th>
											<th style="width: auto">유효기간</th>
											<th style="width: 7em">수정삭제</th>
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
											<td>${debitList.valDate}</td>
											<%-- <td><fmt:formatDate value="${debitList.valDate}" pattern="yyyy-MM-dd" /></td> --%>
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

	</section>
		<!-- 모달창 (삭제시 뜨는 )-->
		<div id="dialog" class="modal-block mfp-hide">
			<section class="panel">
				<header class="panel-heading">
					<h2 class="panel-title">정말 실행 하시겠습니까?</h2>
				</header>
				<div class="panel-body">
					<div class="modal-wrapper">
						<div class="modal-text">
							<p>정말로 데이타를 지우시겠습니까? 다시 복원 될 수 없습니다!!</p>
						</div>
					</div>
				</div>
				<footer class="panel-footer">
					<div class="row">
						<div class="col-md-12 text-right">
							<button id="dialogConfirm" class="btn btn-primary">확인</button>
							<button id="dialogCancel" class="btn btn-default">취소</button>
						</div>
					</div>
				</footer>
			</section>
		</div>
		<!-- 삭제 모달창 끝  -->
		
		
		<!-- 수정 유호성 불통일때 뜨는 모달창 시작-->
	 <div id="dialogEditDate" class="modal-block mfp-hide">
			<section class="panel">
				<header class="panel-heading">
					<h2 class="panel-title">입력값이 올바르지 않습니다.</h2>
				</header>
				<div class="panel-body">
					<div class="modal-wrapper">
						<div class="modal-text">
							<p>날짜값은 2020-02-02 형태로 입력해주세요.</p>
						</div>
					</div>
				</div>
				<footer class="panel-footer">
					<div class="row">
						<div class="col-md-12 text-right">
							<button id="dateConfirm" class="btn btn-default">확인</button>
						</div>
					</div>
				</footer>
			</section>
		</div>
		
		
		 <div id="dialogEditCardNum" class="modal-block mfp-hide">
			<section class="panel">
				<header class="panel-heading">
					<h2 class="panel-title">입력값이 올바르지 않습니다.</h2>
				</header>
				<div class="panel-body">
					<div class="modal-wrapper">
						<div class="modal-text">
							<p>카드번호/카드구분/유효기간을 양식에 맞게 입력해주세요.</p>
							<p>카드번호: 실제 카드번호만 입력가능합니다.</p>
							<p>카드구분: 법인(공용)/법인(개인)/법인(체크) 중 하나만 입력가능합니다.</p>
							<p>유효기간: "MM/YY" 같은 형식으로 입력해주세요.</p>
						</div>
					</div>
				</div>
				<footer class="panel-footer">
					<div class="row">
						<div class="col-md-12 text-right">
							<button id="cardConfirm" class="btn btn-default">확인</button>
						</div>
					</div>
				</footer>
			</section>
		</div>
		
		
		 <div id="dialogEditEntry" class="modal-block mfp-hide">
			<section class="panel">
				<header class="panel-heading">
					<h2 class="panel-title">입력값이 올바르지 않습니다.</h2>
				</header>
				<div class="panel-body">
					<div class="modal-wrapper">
						<div class="modal-text">
							<p>[법인(공용), 법인(개인), 법인(체크)] 중 하나만 입력 해 주세요.</p>
						</div>
					</div>
				</div>
				<footer class="panel-footer">
					<div class="row">
						<div class="col-md-12 text-right">
							<button id="entryConfirm" class="btn btn-default">확인</button>
						</div>
					</div>
				</footer>
			</section>
		</div>
		
		
		
		<!-- 수정 유효성 모달창 끝 -->	
			
		
		
		
		
<c:import url="/common/BottomTag.jsp"/>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/select2/select2.js"></script>
		<script src="assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
		<script src="assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script> 

<!-- Examples -->
		<script src="assets/javascripts/tables/examples.datatables.editable.js"></script>
	
	
</body>
</html>