<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html class="fixed">
<head>

		<!-- Basic -->
		<meta charset="UTF-8">

		<title>Advanced Tables | Okler Themes | Porto-Admin</title>
		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="Porto Admin - Responsive HTML5 Template">
		<meta name="author" content="okler.net">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
		<link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

		<!-- Head Libs -->
		<script src="assets/vendor/modernizr/modernizr.js"></script>

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
    
      <div class="content" style="margin-right: 50px">
      	
		<div class="comment-form-wrap pt-xl-2">
			<h1 class="text-center mb-3 bread">공지사항 리스트</h1>
			
			
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
		</div><!--공지사항 리스트 제목  -->
	  </div><!--공지사항 콘텐츠  -->
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
