<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="/common/tag.jsp" />
		<style >
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body{
   font-family: 'Noto Serif KR', serif;
}
	
	</style>
	
</head>
 <!-- DataTables js-->
		<link rel="stylesheet"href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"type="text/css"/>
		<link rel="stylesheet" href="./css/notice.datatables.css">
		<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"type="text/javascript"></script>
  <!-- /DataTables js-->
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



<body>
	<!-- Side Navbar -->
    <nav class="side-navbar">
    <c:import url="/common/Left_Admin.jsp" />
    </nav>

    <div class="page">
      <!-- navbar-->
      <c:import url="/common/top.jsp"/>
      
      <div id="content-wrapper">
            <!-- !! Content !! -->
            <section class="dashboard-counts section-padding">
        <div class="container-fluid">
        	<table id="myTable" class="dataTable display">
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
            
            
            	
      </div>
      
    </div>
</body>
</html>