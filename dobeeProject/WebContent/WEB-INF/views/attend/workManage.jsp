<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
  <head>
    <c:import url="/common/tag.jsp"/>
   
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="./css/jgcss.css">
    
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <c:import url="/common/tag.jsp"/>
  </head>
  
   	<script>
		window.onload = function(){
			var app = new Vue ({
				el : '#navbar',
				data : []
			});

			var ctx = document.getElementById('myChart').getContext('2d');
			var myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels: ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN'],
			        datasets: [{
			            label: '# of Votes',
			            data: [12, 19, 3, 5, 2, 3],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)'
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero: true
			                }
			            }]
			        }
			    }
			});
		}
	</script>
 
  <body>

	
    <!-- Side Navbar -->
    <nav class="side-navbar">
    <c:import url="/common/left.jsp" />
    </nav>

    <div class="page">
      <!-- navbar-->
      <c:import url="/common/top.jsp"/>
     
   <div id="navbar">
	  <b-card title="Card Title" no-body>
	    <b-card-header header-tag="nav">
	      <b-nav card-header pills>
	        <b-nav-item>부재일정 신청</b-nav-item>
	        <b-nav-item><a href="extendApply.do">연장근무 신청</a></b-nav-item>
	        <b-nav-item>부재일정 관리</b-nav-item>
	        <b-nav-item active>근무내역 확인</b-nav-item>
	        <b-nav-item>부재 관리</b-nav-item>
	        <b-nav-item>연장근무 관리</b-nav-item>
	      </b-nav>
	    </b-card-header>
	
	    <b-card-body class="text-center">
	      <b-card-text>
	     	<h1 style="text-align: left">근무 내역 확인</h1>
 	
			<div class="formDiv">
				<form action="" method="post">
					<table style="width: 100%">
						<tr>
							<td></td>
							<td style="width: 7%">
								<select name="year">
									<option value="">년도별</option>
									<option value="2019">2019</option>
									<option value="2020">2020</option>
								</select>
							</td>
							<td style="width: 7%">
								<select name="month">
									<option value="">월별</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>		
								</select>
							</td>
							<td style="width: 8%">
								<input type="submit" class="submit" value="검색">
							</td>
						</tr>
					</table>
					버튼에 돋보기 아이콘~ 응~
				</form>
			</div>
	
			
	      </b-card-text>
	    </b-card-body>
	  </b-card>
	</div>
	
	<!-- Section -->
	<section class="mt-30px mb-30px">

		<h1> 차트 </h1>
		<canvas id="myChart" width = "500px" height = "250px" ></canvas>
			
		
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




