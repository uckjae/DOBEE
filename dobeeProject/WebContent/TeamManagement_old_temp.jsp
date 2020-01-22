<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta>
<title>Insert title here</title>
</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

	function modify(data){
		console.log("modify() in!!")
		console.log(data);
		var tr = $(data).closest('tr');
		var teamCode = "";
		teamCode = $(data).parent().prev().prev().text();
		$(tr).empty();
		
		$.ajax({
			url:"ajax/admin/getTeam.do",
			data: {'teamCode' : teamCode},
			type: "POST",
			dataType: "json",
			success: function(team){
				console.log(team);
				console.log(team.teamCode);
				var firstTd = $('<td>');
					$(firstTd).text("수정");
				var secTd = $('<td>');
					$(secTd).html('<input type="text" name="teamCode" id="teamCode" value="${team.teamCode}">');
				var thirdTd = $('<td>');
					$(thirdTd).html('<input type="text" name="teamName" id="teamName" value="${team.teamName}">');
				var fourthTd = $('<td>');
					$(fourthTd).html('<button class="btn btn-primary btn-block" onclick="myFormSubmit()">수정하기</button>');
				var fifthTd = $('<td>');
					$(fifthTd).html('<button class="btn btn-primary btn-block" onclick="removeForm(this)">취소</button>');

				$(tr).append(firstTd);
				$(tr).append(secTd);
				$(tr).append(thirdTd);
				$(tr).append(fourthTd);
				$(tr).append(fifthTd);
								
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log(textStatus);
				console.log(errorThrown);
			}
	
		});
	}

		
	  function add(data){
		  	console.log("modify() in!!")
			console.log(data.parentElement.parentElement);
			var target = data.parentElement.parentElement

				var inputRow = $('<tr style="height: 2em" role="row">');
				
					var info = $('<td>');
						$(info).text("수정하기");					
					var teamName = $('<td>');
						$(teamName).append('<input type="text" placeholder="팀 코드 입력">');
					var teamCode = $('<td>');
						$(teamCode).append('<input type="text" placeholder="팀 이름 입력">');
					var submitButton = $('<td>');
						$(submitButton).append('<input type="submit" value="수정">');
					var cancleButton = $('<td>');
						var btn = $('<button onclick="cancleModify(this)">');
							$(btn).text("취소");
						$(cancleButton).append(btn);
				$(inputRow).append(info);
				$(inputRow).append(teamName);
				$(inputRow).append(teamCode);
				$(inputRow).append(submitButton);
				$(inputRow).append(cancleButton);
			$(target).after(inputRow);
		}

		function cancleModify(data){
			console.log(data);
		}
		

	
  </script>
<body>
	<div class="page">
		<!-- navbar-->
		

		<section class="dashboard-counts section-padding">
			<div class="container-fluid">
				<form action="#" method="post">
					<table id="myTable" class="dataTable display">
						<thead>
							<tr>
								
								<th style="width: 3em">번호</th>
								<th style="width: auto">팀 코드</th>
								<th style="width: auto">팀 이름</th>
								<th style="width: auro"></th>
								<th style="width: auro"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${teamList}" var="team" varStatus="status">
								<tr>
									<td>${status.index+1}</td>
									<td>${team.teamCode}</td>
									<td>${team.teamName}</td>
									<td><a onclick="modify(this);"><span>수정</span></a></td>
									<td><span>삭제</span></td>
								</tr>
							</c:forEach>
	
	
						</tbody>
					</table>
				</form>
			</div>
		</section>
	</div>

</body>
</html>