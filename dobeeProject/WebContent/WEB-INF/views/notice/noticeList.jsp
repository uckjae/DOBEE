<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html class="fixed">
<head>

		<!-- Basic -->
		<c:import url="/common/HeadTag.jsp"/>
		<meta name="author" content="okler.net">
		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
		<link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />
	</head>


<body>


	<script>
     $(document).ready(function(){
		$('#datatable-default').DataTable({
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
    	    "order": [[ 0, "desc" ]],
    	    "columnDefs": [
    	        {
        	      className: "dt-center", "targets": [1],
      	        }
    	      ]
			});	
	});


     </script>

    
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
						<h2>공지사항</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>Pages</span></li>
								<li><span>Notice </span></li>
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
						         
								<h2 class="panel-title">
								<img src="img/noticeicon.png" style="width:3%; height:3%;">
								&nbsp;&nbsp;공지사항</h2>
							</header>
			
			
	<div class="panel-body">   
	<!-- table-->
	<!-- option display -->
	<table id="datatable-default" class="table table-bordered table-striped mb-none">
		<thead>
			<tr>
				<th class="notSeq" style="width: 10%">No</th>
				<th class="title" style="width: 60%">제목</th>
				<th class="regdate" style="width: 20%">작성일</th>
				<th class="count" style="width: 10%">조회수</th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach items="${list}" var="n" >
			<tr>
				<td class="notSeq">${n.notSeq}</td>
				<td class="title">
				  <a href="noticeDetail.do?notSeq=${n.notSeq}">${n.title}</a>
				</td>
				<td class="regdate">
				<fmt:formatDate value="${n.regDate}" pattern="yyyy-MM-dd HH:mm"/>
				</td>				
				<td class="count">${n.count}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	
	<p class="article-comment margin-small">
		<a class="btn-write button" href="noticeWrite.do">글쓰기</a>
	</p>
	
		</div> <!--테이블 div종료  -->
		</section>
		
		
		
	  </section>
	  </div>
	
				<!-- 오른쪽 사이드바!! -->
		<c:import url="/common/RightSide.jsp"/>
	
			
			<!-- 오른쪽 사이드바 끝!! -->
		</section>

		<!-- Vendor -->
		<script src="assets/vendor/jquery/jquery.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- Specific Page Vendor -->
		<script src="assets/vendor/select2/select2.js"></script>
		<script src="assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
		<script src="assets/vendor/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
		<script src="assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>


		<!-- Examples -->
		<script src="assets/javascripts/tables/examples.datatables.default.js"></script>
		<script src="assets/javascripts/tables/examples.datatables.row.with.details.js"></script>
		<script src="assets/javascripts/tables/examples.datatables.tabletools.js"></script>
		
		
		
		
</body>
</html>
