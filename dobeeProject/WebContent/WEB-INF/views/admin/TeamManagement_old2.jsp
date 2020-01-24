<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<c:import url="/common/HeadTag.jsp"/>
<!-- Specific Page Vendor CSS -->
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
						<h2>팀 관리</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-briefcase"></i>
									</a>
								</li>
								<li><span>사원 관리</span></li>
								<li><span>팀 관리</span></li>
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
				
						<h2 class="panel-title">팀 관리</h2>
					</header>
			<div class="panel-body">
				<form action="#" method="post">
					<table id="myTable" class="table table-bordered table-striped mb-none">
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
					<!-- start: page -->
					<!-- end: page -->
				</section>
			</div>




			<!-- 오른쪽 사이드바!! -->
		<c:import url="/common/RightSide.jsp"/>
	
			
			<!-- 오른쪽 사이드바 끝!! -->
		</section>

		<c:import url="/common/BottomTag.jsp"/>
	</body>
</html>