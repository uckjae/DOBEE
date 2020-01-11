<%@page import="kr.or.bit.dto.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Home</title>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script type="text/javascript">

	$(function() {
		$('#btnSelEmpno').click(function() {
							$('#tbody').empty();
							$.ajax({
										url : "empSelectEmpno.do",
										data : {
											empno : $('#empno').val()
										},
										dataType : "text",
										success : function(data) {
											console.log(data);
											$('#tbody').html(data);
										},
										error : function(xhr, status, error) {
											console.log("Error occured");
										}

									});
						});
		
 		$('#btnSelDeptno').click(function() {
			$('#tbody').empty();
			$.ajax({
						url : "empSelectDeptno.do",
						data : {
							deptno : $('#deptno').val()
						},
						dataType : "text",
						success : function(data) {
							$('#tbody').html(data);
						},
						error : function(xhr, status, error) {
							console.log("Error occured");
						}

					});
		}); 
	});
</script>

</head>
<c:import url="/WEB-INF/common/Top.jsp" />

<div class="d-flex align-items-stretch">

	<c:import url="/WEB-INF/common/Left.jsp" />

	<div class="container-fluid px-xl-5">
		<section class="py-5">
			<div class="row" style="margin-top: 10%;">

				<div class="container">

					<div class="row">

						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">

							<thead>

								<tr>

									<th style="background-color: #eeeeee; text-align: center;">empno(사원번호)</th>
									<th style="background-color: #eeeeee; text-align: center;">ename(사원이름)</th>
									<th style="background-color: #eeeeee; text-align: center;">job(부서)</th>
									<th style="background-color: #eeeeee; text-align: center;">mgr(사수번호)</th>
									<th style="background-color: #eeeeee; text-align: center;">hiredate(입사일)</th>
									<th style="background-color: #eeeeee; text-align: center;">sal(연봉)</th>
									<th style="background-color: #eeeeee; text-align: center;">comm(보너스)</th>
									<th style="background-color: #eeeeee; text-align: center;">deptno(부서번호)</th>
									<th style="background-color: #eeeeee; text-align: center;">회원수정</th>
									<th style="background-color: #eeeeee; text-align: center;">회원삭제</th>

								</tr>
								<tbody id= "tbody">
 								<c:forEach var="emplist" items="${requestScope.emplist}">
								
									<tr>
										<td width="100px">${emplist.empno}</td>
										<td width="100px">${emplist.ename}</td>
										<td width="100px">${emplist.job}</td>
										<td width="100px">${emplist.mgr}</td>
										<td width="100px">${emplist.hiredate}</td>
										<td width="100px">${emplist.sal}</td>
										<td width="100px">${emplist.comm}</td>
										<td width="100px">${emplist.deptno}</td>
									
										<td width="100px"><a
											href="empUpdate.do?empno=${emplist.empno}">[수정]</a></td>
										<td width="100px"><a
											href="empDelete.do?empno=${emplist.empno}">[삭제]</a></td>

									</tr>
								</c:forEach>
								</tbody>
						</table>
						<hr>
						Empno(사원번호) : 
						<form action="" method="post">						
							<input type="text" class="form-control" id="empno"
								placeholder="Search By Emp Number"
								style="width: 200px; border-color: white; float: left; margin-right: 4px">

							<input type="button" id="btnSelEmpno" class="form-control"
								style="width: 50px; border-color: white;" value="검색">
						</form>
						
						<hr>
						
						Deptno(부서번호) : 
						<form action="" method="post">
							<input type="text" class="form-control" id="deptno"
								placeholder="Search By Dept Number"
								style="width: 200px; border-color: white; float: left; margin-right: 4px">

							<input type="button" id="btnSelDeptno" class="form-control"
								style="width: 50px; border-color: white;" value="검색">
						</form>
						<hr>


					</div>

				</div>

			</div>
		</section>
	</div>
</div>

<c:import url="/WEB-INF/common/Bottom.jsp" />