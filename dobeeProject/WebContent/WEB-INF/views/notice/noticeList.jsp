<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<c:import url="/common/tag.jsp"/>
<!-- notice DataTables css-->
<link rel="stylesheet"href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"type="text/css"/>
<!-- notice DataTables css-->
<link rel="stylesheet" href="./css/notice.datatables.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

 <style>
  @import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body {
   font-family: 'Noto Serif KR', serif;
}

</style>
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
    	    "order": [[ 0, "desc" ]],
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
