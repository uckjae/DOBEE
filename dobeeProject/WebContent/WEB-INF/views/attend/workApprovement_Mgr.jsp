<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
  <head>
    <c:import url="/common/tag.jsp"/>
    
    <style >
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body{
   font-family: 'Noto Serif KR', serif;
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
      <c:import url="/common/top.jsp"/>
     
	<!-- Section -->
	<section class="mt-30px mb-30px">
	
		<h1>근무관리 work schedule</h1>
		<hr>
		<br>
		<h3>신청자</h3>
	
		<input type="checkbox" name="auth" id="auth"> 승인 
		<input type="checkbox" name="deny" id="deny"> 반려 
		<input type="checkbox" name="notv" id="notv"> 미확인
	
		<div class="col-md-12">
		
			<div class="col-md-2" style="background-color: lightgray">
				이게
			</div>
			
			<div class="col-md-7">
				<H1>HI THERE!!</H1>
	
				<table id="workTable" style="width :100%">
					<colgroup>
						<col>
						<col style="width: 8%">
						<col style="width: 15%">
						<col style="width: 10%">
						<col style="width: 7">
					</colgroup>
					<thead>
						<tr>
							<td colspan="5"></td>
						</tr>
	
						<tr>
							<td>신청 기간</td>
							<td>이름</td>
							<td>신청일</td>
							<td>상태</td>
							<td>상세보기</td>
						</tr>
					</thead>
		
					<tbody id="tbody">
						<!-- 여기서 뿌려줄겨 -->
						<tr>
							<td class="term">2019.01.01 ~ 2020.01.01</td>
							<td class="name">김일번</td>
							<td class="regDate">2019.01.01.</td>
							<td class="detail">없스빈다</td>
							<td>
								<input type="button" class="detail" id="detail"
								value="상세보기" onClick="location.href='http://www.google.com'">
							</td>
						</tr>
						<tr>
							<td class="term">2019.01.01 ~ 2020.01.01</td>
							<td class="name">김일번</td>
							<td class="regDate">2019.01.01.</td>
							<td class="detail">없스빈다</td>
							<td>
								<input type="button" class="detail" id="detail"
								value="상세보기" onClick="location.href='http://www.google.com'">
							</td>
						</tr>
						<tr>
							<td class="term">2019.01.01 ~ 2020.01.01</td>
							<td class="name">김일번</td>
							<td class="regDate">2019.01.01.</td>
							<td class="detail">없스빈다</td>
							<td>
								<input type="button" class="detail" id="detail"
								value="상세보기" onClick="location.href='http://www.google.com'">
							</td>
						</tr>
					</tbody>
					
					<tfoot>
						<tr>
							<td colspan="5"></td>
						</tr>
					</tfoot>
					
				</table>
			</div>
	
			<div class="col-md-2" style="background-color: lightgray">
				안먹니?
			</div>

		</div>
		
		<div class="pageNum">
			1 2 3 4 5 6 > 이거는 위에거 불러와서 쓰고
		</div>
			
	</section>
		<c:import url="/common/bottom.jsp"/>
    </div>
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
    <script src="./vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="./js/charts-home.js"></script>
    <!-- Main File-->
    <script src="./js/front.js"></script>
    <script src="https://kit.fontawesome.com/5d4e7bbd25.js" crossorigin="anonymous"></script>
    
  </body>
</html>




