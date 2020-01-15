<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<c:import url="/common/tag.jsp" />
<style>
     @import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');
		body {
		  margin: 40px 10px;
		  padding: 0;
		   font-family: 'Noto Serif KR', serif;
		  font-size: 14px;
		}

#loading {
	display: none;
	position: absolute;
	top: 10px;
	right: 10px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
</head>

<body>
	<!-- Side Navbar -->
	<nav class="side-navbar">
		<c:import url="/common/left.jsp" />
	</nav>

	<div class="page">
		<!-- navbar-->
		<c:import url="/common/top.jsp" />

		<div id="navbar">
			<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link" href="breakApply.do">부재일정 신청</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="extendApply.do">연장근무 신청</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="breakManage.do">부재 일정 관리</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active" href="workManage.do">근무 내역 확인</a>
			  </li>
			</ul>
		</div>
		
		<h1>부재 일정 관리</h1>
		
		<!-- Section -->
		<section class="mt-30px mb-30px">

			<div class="container"
				style="width: 100%; height: 70px; background-color: lightgray">
				<form action="" method="post">
					<h3>기간</h3>
					<input type="text" value="옆 아이콘을 눌러 기간을 선택하세요" class="term"
						id="term">
					<button value="날짜선택" id="selTerm"></button>

					&nbsq

					<h3>성함</h3>
					<input type="text" class="inputName" id="inputName"> <input
						type="submit" class="submit" id="submit">
				</form>
			</div>

			<div class="container">
				<div class="col-md-10">
					<table id="absenseTable" style="width: 100%">
						<colgroup>
							<col style="width: 15">
							<col style="width: 15%">
							<col style="width: 30%">
							<col style="width: 15%">
							<col style="width: 15%">
						</colgroup>
						<thead>
							<tr>
								<td colspan="5"></td>
							</tr>

							<tr>
								<td>성함</td>
								<td>기간</td>
								<td>시간</td>
								<td>사유</td>
								<td>승인여부</td>
							</tr>
						</thead>

						<tbody id="tbody">
							<!-- 여기서 뿌려줄겨 -->
							<tr>
								<td class="tname">김일번</td>
								<td class="tterm">2019.01.01 ~ 2020.01.03</td>
								<td class="ttime">8</td>
								<td class="treason">연장근무</td>
								<td class="tauth"><button value="미승인"
										style="background-color: orange">미승인</button></td>
							</tr>
							<tr>
								<td class="tname">김이번</td>
								<td class="tterm">2019.01.05 ~ 2020.01.05</td>
								<td class="ttime">2</td>
								<td class="treason">연장근무</td>
								<td class="tauth"><button value="미승인"
										style="background-color: orange">미승인</button></td>
							</tr>
						</tbody>

						<tfoot>
							<tr>
								<td colspan="5"></td>
							</tr>
						</tfoot>

					</table>
				</div>
			</div>
		</section>

		<section>
			<div class="paging">1 2 3 4 5 >></div>
		</section>

		<c:import url="/common/bottom.jsp" />

		<!-- JavaScript files-->
		<script src="./vendor/jquery/jquery.min.js"></script>
		<script src="./vendor/popper.js/umd/popper.min.js">
					
				</script>
		<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="./js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
		<script src="./vendor/jquery.cookie/jquery.cookie.js">
					
				</script>
		<script src="./vendor/chart.js/Chart.min.js"></script>
		<script src="./vendor/jquery-validation/jquery.validate.min.js"></script>
		<script
			src="./vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
		<script src="./js/charts-home.js"></script>
		<!-- Main File-->
		<script src="./js/front.js"></script>
		<script src="https://kit.fontawesome.com/5d4e7bbd25.js"
			crossorigin="anonymous"></script>
</body>
</html>




