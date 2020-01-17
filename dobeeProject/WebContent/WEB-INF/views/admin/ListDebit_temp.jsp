<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<c:import url="/common/HeadTag.jsp"/>
<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
<link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />
<script type="text/javascript">
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


	
  </script>
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
						<h2>Blank Page</h2>
					
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
					
					<!-- start: page -->
					
					<section class="panel">
        <div class="container-fluid">
        	<table id="myTable" class="table table-bordered table-striped mb-none">
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
							<td>${debitList.valDate}</td>
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
		<c:import url="/common/RightSide.jsp"/>
	
			
			<!-- 오른쪽 사이드바 끝!! -->
		</section>
		

		<%-- <c:import url="/common/BottomTag.jsp"/> --%>
		 
	</body>
</html>