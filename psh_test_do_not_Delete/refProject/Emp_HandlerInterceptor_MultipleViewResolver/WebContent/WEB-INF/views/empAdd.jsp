<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>empAdd</title>
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
						<h2 style="text-algin: center;">Member ADD</h2>
						<form action="empInsert.do" method="post">
							<table class="table table-boardered">
								<tr>
									<th>사원번호</th>
									<td><input type="number" class="form-control" id="empno"
										name="empno" placeholder="사원번호를 입력해주세요(숫자만 사용가능)"> <span
										style="color: red" id=idck></span></td>

								</tr>
								<tr>
									<th>사원이름</th>
									<td><input type="text" class="form-control" id="ename"
										name="ename" placeholder="사원이름을 입력해주세요"></td>
								</tr>

								<tr>
									<th>직종</th>
									<td><select id="job" name="job" class="form-control">
											<!-- if (rs.getString(5).equals("여")){ %>checked}>여자  -->
											<option value="CLERK">CLERK</option>
											<option value="SALESMAN">SALESMAN</option>
											<option value="MANAGER">MANAGER</option>
											<option value="ANALYST">ANALYST</option>
											<option value="PRESIDENT">PRESIDENT</option>
									</select></td>
								</tr>
								<tr>
									<th>사수번호</th>
									<td><input type="text" class="form-control" id="mgr"
										name="mgr"></td>
								</tr>

								<tr>
									<th>입사일</th>
									<td><input type="date" class="form-control" id="hiredate"
										name="hiredate"></td>
								</tr>

								<tr>
									<th>연봉</th>
									<td><input type="text" class="form-control" id="sal"
										name="sal"></td>
								</tr>

								<tr>
									<th>보너스</th>
									<td><input type="text" class="form-control" id="comm"
										name="comm"></td>
								</tr>

								<tr>
									<th>부서번호</th>
									<td>
									<select type="text" id="deptno" name="deptno" class="form-control">
											
											<option value="10">10</option>
											<option value="20">20</option>
											<option value="30">30</option>
											
									</select>
									
								</tr>



								<tr>
									<td colspan="2">
										<!-- 열로 2칸 만들기 --> <input type="submit" class="submit"
										value="사원 등록"> <input type="button" value="돌아가기"
										onClick="location.href='empList.do'">
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