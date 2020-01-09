<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
  <head>
    <c:import url="/common/tag.jsp"/>
  </head>
 
  <body>
    <!-- Side Navbar -->
    <nav class="side-navbar">
    <c:import url="/common/left.jsp" />
    </nav>

    <div class="page">
      <!-- navbar-->
      <c:import url="/common/top.jsp"/>
     
    <!-- subnav -->
		<div class="col-sm-12" style="height: 50px">
			<div class="col-sm-2"></div>
			<div class="col-sm-2"><a href="#">부재일정 신청</a></div>
			<div class="col-sm-2"><a href="#">연장근무 신청</a></div>
			<div class="col-sm-2"><a href="#">부재일정 관리</a></div>
			<div class="col-sm-2"><a href="#">근무내역 확인</a></div>
			<div class="col-sm-2"></div>
		</div>
	
	<!-- Section -->
	<section class="mt-30px mb-30px">
	
		<h1>근무내역 확인</h1>
		<hr>
		<br>
		
		<form action="" method="post">
			<select name="year">
				<option value="">년도별</option>
				<option value="2019">2019</option>
				<option value="2020">2020</option>
				
			</select>
			
			<select name="month">
				<option value="">월별</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>		
			</select>
			
			<input type="submit" class="submit">
		</form>
		
		<div class="col-md-1">
		</div>
		
		<div class="col-md-10">
			<h1>차트가 여기서 나올거고?</h1>
			
		
				<table id="workManageTable" style="width :100%">
					<colgroup>
						<col>
						<col>
						<col>
					</colgroup>
					<thead>
						<tr>
							<td colspan="3"></td>
						</tr>
	
						<tr>
							<td>야근 일수</td>
							<td>정상 근무 일수</td>
							<td>결근 일수</td>
						</tr>
					</thead>
		
					<tbody id="tbody">
						<!-- 여기서 뿌려줄겨 -->
						<tr>
							<td class="extend">200 ${extend }</td>
							<td class="normal">300 ${normal }</td>
							<td class="abs">65 ${abs }</td>
						</tr>
					</tbody>
					
					<tfoot>
						<tr>
							<td colspan="3"></td>
						</tr>
					</tfoot>
					
				</table>
			</div>
			
			<div class="col-md-1">
			</div>
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




