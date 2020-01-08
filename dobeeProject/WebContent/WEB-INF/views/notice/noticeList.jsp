<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="/common/tag.jsp"/>
<!-- notice DataTables css-->
<link rel="stylesheet"href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"type="text/css"/>
<!-- notice DataTables css-->
<link rel="stylesheet" href="./css/notice.datatables.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>


<body>
    <!-- notice DataTables js-->
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"type="text/javascript">
	</script>

	<script>
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

<!-- Side Navbar -->
    <nav class="side-navbar">
      <c:import url="/common/left.jsp"/>
    </nav>
    
    <div class="page" >
      <!-- navbar-->
      <c:import url="/common/top.jsp"/>
      
      <script> /*view 객체 생성*/
		window.onload = function(){
			var app = new Vue ({
				el : '#navbar',
				data : []
			})
		}		
  	</script>
  	   <div id="navbar">
  	     <b-card-header header-tag="nav">
  	       <b-nav card-header pills>
	        <b-nav-item active>공지사항</b-nav-item>
	       </b-nav>
         </b-card-header>
         </div>
      
      <div class="content" style="margin-right: 50px">
		<div class="comment-form-wrap pt-xl-2">
			<h1 class="text-center mb-3 bread">공지사항 리스트</h1>
			<div class="table-responsive">
    
	<!-- table-->
	<!-- option display  -->
	<table id="myTable" class="dataTable display">
		<thead>
			<tr>
				<th style="width: 10%">No</th>
				<th style="width: 60%">제목</th>
				<th style="width: 20%">작성일</th>
				<th style="width: 10%">조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>no 1</td>
				<td>안녕하세요</td>
				<td>2019-09-09</td>
				<td>632</td>
			</tr>
			<tr>
				<td>no 2</td>
				<td>배부르다</td>
				<td>2019-08-08</td>
				<td>522</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>필독바랍니다.</td>
				<td>2020-01-01</td>
				<td>1222</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>필독바랍니다.</td>
				<td>2020-01-01</td>
				<td>1222</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>필독바랍니다.</td>
				<td>2020-01-01</td>
				<td>1222</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>필독바랍니다.</td>
				<td>2020-01-01</td>
				<td>1222</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>필독바랍니다.</td>
				<td>2020-01-01</td>
				<td>1222</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>필독바랍니다.</td>
				<td>2020-01-01</td>
				<td>1222</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>필독바랍니다.</td>
				<td>2020-01-01</td>
				<td>1222</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>필ssd.</td>
				<td>2020-01-01</td>
				<td>1222</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>필rewrewr다.</td>
				<td>2020-01-01</td>
				<td>1222</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>필독바랍니다.</td>
				<td>2020-01-01</td>
				<td>1222</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>필erw다.</td>
				<td>2020-01-01</td>
				<td>1222</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>필독바랍니다.</td>
				<td>2020-01-01</td>
				<td>1222</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>필twte니다.</td>
				<td>2020-01-01</td>
				<td>1222</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>wtuuu니다.</td>
				<td>2020-01-01</td>
				<td>1222</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>필hhhhhh니다.</td>
				<td>2020-01-01</td>
				<td>1222</td>
			</tr>
			<tr>
				<td>no 3</td>
				<td>필독바랍니다.</td>
				<td>2020-01-01</td>
				<td>1222</td>
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
