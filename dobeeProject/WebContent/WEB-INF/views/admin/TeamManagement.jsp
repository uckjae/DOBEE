<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html class="fixed">
<head>


<c:import url="/common/HeadTag.jsp" />

<script src="assets/vendor/jquery/jquery.js"></script>
<link
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
<!-- 	<link href="assets/vendor/jquery-datatables-bs3/examples/css/datatables.css"/>
	<link href="assets/vendor/jquery-datatables/media/css/jquery.dataTables.min.css"/>
	<link href="assets/vendor/jquery-datatables/media/css/jquery.dataTables_themeroller.css"/> -->

<script type="text/javascript">
	$(document).ready(function() {
	});
</script>

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
					<h2>팀 관리</h2>

					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li><a href="#"> <i class="fa fa-credit-card"></i></a></li>
							<li><span>사원</span></li>
							<li><span>팀 관리</span></li>
						</ol>

						<i class="fa fa-chevron-left"></i>
					</div>
				</header>


				<!-- 작업 여기부터~!~!~!~~! -->


				<section class="panel">
					<header class="panel-heading">
						<div class="panel-actions">
							<!-- <a href="#" class="fa fa-caret-down"></a> <a href="#"
								class="fa fa-times"></a> -->
						</div>

						<h2 class="panel-title">팀 관리</h2>
					</header>
					<div class="panel-body">
					<!-- 팀 코드 추가 버튼 추가 -->					
						<div class="row">
								<div class="col-sm-6">
									<div class="mb-md">
										<button id="addToTable" class="btn btn-primary">Add <i class="fa fa-plus"></i></button>
									</div>
								</div>
						</div>


						<table class="table display" id="datatable-editable">
							<thead>
								<tr>
									<th style="width: auto">번호</th>
									<th style="width: auto">팀코드</th>
									<th style="width: auto">팀이름</th>
									<th style="width: 8em">수정삭제</th>
								</tr>
							</thead>


							<tbody>

								<c:forEach items="${teamList}" var="team" varStatus="status">
									<tr class="gradeX">
										<td>${status.index+1}</td>
										<td>${team.teamCode}</td>
										<td>${team.teamName}</td>
										
										<td class="actions"><a href="#"
											class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
											<a href="#" class="hidden on-editing cancel-row"><i
												class="fa fa-times"></i></a> <a href="#"
											class="on-default edit-row"><i class="fa fa-pencil"></i></a>
											<a href="#" class="on-default remove-row"><i
												class="fa fa-trash-o"></i></a></td>
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
	<!-- 모달창 (삭제시 뜨는 )-->
	<div id="dialog" class="modal-block mfp-hide">
		<section class="panel">
			<header class="panel-heading">
				<h2 class="panel-title">정말 실행 하시겠습니까?</h2>
			</header>
			<div class="panel-body">
				<div class="modal-wrapper">
					<div class="modal-text">
						<p style="color:red">정말로 데이타를 지우시겠습니까? 해당 팀에 참여된 모든 사원 데이터가 사라집니다!</p>
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

	<div id="dialogOnlyNumber" class="modal-block mfp-hide">
		<section class="panel">
			<header class="panel-heading">
				<h2 class="panel-title">입력값이 올바르지 않습니다.</h2>
			</header>
			<div class="panel-body">
				<div class="modal-wrapper">
					<div class="modal-text">
						<p>팀 코드는 숫자만 입력 가능합니다.</p>
					</div>
				</div>
			</div>
			<footer class="panel-footer">
				<div class="row">
					<div class="col-md-12 text-right">
						<button id="onlyNumber" class="btn btn-default">확인</button>
					</div>
				</div>
			</footer>
		</section>
	</div>





	<!-- 수정 유효성 모달창 끝 -->





	<c:import url="/common/BottomTag.jsp" />
	<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
	<script src="assets/vendor/select2/select2.js"></script>
	<script src="assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
	
	
	
	
	
	
	
	<script src="assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
	<!-- Examples -->
	<script src="assets/javascripts/tables/examples.datatables.editable_team.js"></script>



	
</body>
</html>