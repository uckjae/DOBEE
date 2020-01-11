<%@page import="kr.or.bit.dto.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Home</title>
<script type="text/javascript">
window.onload=function(){
    $("#file_path").change(function(e){
       event.preventDefault();

       var file = e.target.files[0];
       var url = URL.createObjectURL(file);
       $("#preview").attr("src", url);
       
    });
 };
</script>

</head>
<c:import url="/WEB-INF/common/Top.jsp" />

<div class="d-flex align-items-stretch">


	<c:import url="/WEB-INF/common/Left.jsp" />

	<div class="page-holder w-100 d-flex flex-wrap">
		<div class="container-fluid px-xl-5">
			<section class="py-5">
				<div class="row">
					<c:set var="emp" value="${requestScope.emp}"></c:set>
					<div class="col-sm-6" style="margin-left: 25%">
						<h2 style="text-algin: center;">[ ${emp.ename} ]Member Edit</h2>

						<form action="empUpdateOk.do" method="post" enctype="multipart/form-data">
							<table class="table table-boardered">
								<tr>

									<th>사원 이미지 </th>
									<td> 
                           <img id="preview" alt="로컬에 있는 이미지가 보여지는 영역"  src ="
                           <c:choose>
                           		<c:when test ="${emp.file_path != null}">
                           			uploads/${emp.file_path}
                           		</c:when>	
								<c:when test ="${emp.file_path == '/uploads/'}">
									${emp.file_path}
								</c:when>
								<c:otherwise>
									${emp.file_path}
								</c:otherwise>
							</c:choose>"
							style = "width:100px;height:100px">
             					<input type = "file" name = "files" id="files" value="사진선택">
                          
                          </td>


								</tr>

								<tr>
									<th>사원번호</th>
									<td><input type="number" class="form-control" id="empno"
										name="empno" placeholder="사원번호를 입력해주세요" value="${emp.empno}"
										readonly></td>

								</tr>
								<tr>
									<th>사원이름</th>
									<td><input type="text" class="form-control" id="ename"
										name="ename" placeholder="비밀번호를 입력해주세요" value="${emp.ename}">
									</td>
								</tr>

								<tr>
									<th>직종</th>
									<td><select id="job" name="job" class="form-control">
											<!-- if (rs.getString(5).equals("여")){ %>checked}>여자  -->
											<c:choose>
												<c:when test="${emp.job.equals('CLERK')}">
													<c:set var="CLERK" value="selected" />

												</c:when>

												<c:when test="${emp.job.equals('SALESMAN')}">
													<c:set var="SALESMAN" value="selected" />

												</c:when>
												<c:when test="${emp.job.equals('MANAGER')}">
													<c:set var="MANAGER" value="selected" />

												</c:when>
												<c:when test="${emp.job.equals('ANALYST')}">
													<c:set var="ANALYST" value="selected" />

												</c:when>
												<c:when test="${emp.job.equals('PRESIDENT')}">
													<c:set var="PRESIDENT" value="selected" />

												</c:when>
											</c:choose>
											<option value="CLERK" ${CLERK}>CLERK</option>
											<option value="SALESMAN" ${SALESMAN}>SALESMAN</option>
											<option value="MANAGER" ${MANAGER}>MANAGER</option>
											<option value="ANALYST" ${ANALYST}>ANALYST</option>
											<option value="PRESIDENT" ${PRESIDENT}>PRESIDENT</option>
									</select></td>
								</tr>
								<tr>
									<th>사수번호</th>
									<td><input type="text" class="form-control" id="mgr"
										name="mgr" value="${emp.mgr}"></td>
								</tr>

								<tr>
									<th>입사일</th>
									<td><input type="date" class="form-control" id="hiredate"
										name="hiredate" value="${emp.hiredate}"></td>
								</tr>

								<tr>
									<th>연봉</th>
									<td><input type="text" class="form-control" id="sal"
										name="sal" value="${emp.sal}"></td>
								</tr>

								<tr>
									<th>보너스</th>
									<td><input type="text" class="form-control" id="comm"
										name="comm" value="${emp.comm}"></td>
								</tr>

								<tr>
									<th>부서번호</th>
									<td><input type="text" class="form-control" id="deptno"
										name="deptno" value="${emp.deptno}"></td>
								</tr>



								<tr>
									<td colspan="2">
										<!-- 열로 2칸 만들기 --> <input type="submit" class="submit"
										value="회원수정하기"> <input type="button" value="돌아가기"
										onClick="location.href='emplist.do'">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>


<c:import url="/WEB-INF/common/Bottom.jsp" />