<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="/common/tag.jsp"/>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"
	type="text/css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>


<body>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		type="text/javascript"></script>

	<script>
     $(document).ready(function(){
		$('#myTable').DataTable();
	});
     </script>

<!-- Side Navbar -->
    <nav class="side-navbar">
      <c:import url="/common/left.jsp" />
    </nav>
    
    <div class="page" >
      <!-- navbar-->
      <c:import url="/common/top.jsp"/>
      
      <div class="content" style="margin-right: 50px">
		<div class="comment-form-wrap pt-xl-2">
			<h1 class="text-center mb-3 bread">공지사항</h1>
			<div class="table-responsive">
    
	<!-- 테이블 go -->
	<table id="myTable" style="width: 100%">
		<thead>
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Row 1 Data 1</td>
				<td>안녕하세요</td>
				<td>Row 1 Data 2</td>
				<td>Row 1 Data 2</td>
			</tr>
			<tr>
				<td>Row 1 Data 1</td>
				<td>안녕하세요</td>
				<td>Row 1 Data 2</td>
				<td>Row 1 Data 2</td>
			</tr>
			<tr>
				<td>Row 1 Data 1</td>
				<td>안녕하세요</td>
				<td>Row 1 Data 2</td>
				<td>Row 1 Data 2</td>
			</tr>

		</tbody>
	</table>
	
		</div>
		</div>
	</div>
	</div>
	<c:import url="/common/bottom.jsp"/>
	
	<!-- JavaScript files-->
    <script src="./vendor/popper.js/umd/popper.min.js"> </script>
    <script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="./js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="./vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="./vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="./vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- Main File-->
    <script src="./js/front.js"></script>
    <script src="https://kit.fontawesome.com/5d4e7bbd25.js" crossorigin="anonymous"></script>
	

</body>
</html>
