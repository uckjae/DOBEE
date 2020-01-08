<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
  <head>
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="./css/jgcss.css">
    <c:import url="/common/tag.jsp"/>
    <style>
		body {
		  margin: 40px 10px;
		  padding: 0;
		  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
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
      <c:import url="/common/top.jsp"/>

	<script>
		window.onload = function(){
			var app = new Vue ({
				el : '#navbar',
				data : []
			})
		}		
  	</script>
  	


	<div id="navbar">
	  <b-card title="Card Title" no-body>
	    <b-card-header header-tag="nav">
	      <b-nav card-header pills>
	        <b-nav-item active>부재일정 신청</b-nav-item>
	        <b-nav-item>연장근무 신청</b-nav-item>
	        <b-nav-item>부재일정 관리</b-nav-item>
	        <b-nav-item disabled>근무내역 확인</b-nav-item>
	        <b-nav-item disabled>부재 관리</b-nav-item>
	        <b-nav-item disabled>연장근무 관리</b-nav-item>
	      </b-nav>
	    </b-card-header>
	
	    <b-card-body class="text-center">
	      <b-card-text>
	     	<h1 style="text-align: left">부재일정 신청</h1>
	     	<div class="container" style="width:100%; height:70px; background-color: lightgray ">
				<div class="formDiv">
					<form action="" method="post">
						<input type="text" value="옆 아이콘을 눌러 기간을 선택하세요" class="inputTerm" id="inputTerm">
						<button value="날짜선택" id="selTerm">캘린더ICON</button>
						
						<select name="category">
							<option value="">항목별</option>
							<option value="연차">연차</option>
							<option value="반일연차">반일연차</option>
							<option value="외근">외근</option>
							<option value="출장">출장</option>
							<option value="경조휴가">경조휴가</option>
						</select>
						
						<input type="submit" class="submit" id="submit" value="돋보기ICON">
					</form>
				</div>
			</div>
			
			<div class="col-md-12">
			<table id="absenseTable" style="width :100%">
						<colgroup>
							<col style="width: 15">
							<col style="width: 15%">
							<col style="width: 30%">
							<col style="width: 15%">
							<col style="width: 15%">
						</colgroup>
						<thead id="absHead">
							<tr>
								<td colspan="5"></td>
							</tr>

							<tr>
								<th>성함</th>
								<th>부재항목</th>
								<th>기간</th>
								<th>일수</th>
								<th>승인여부</th>
							</tr>
						</thead>

						<tbody id="tbody">
							<!-- 여기서 뿌려줄겨 -->
							<tr>
								<td class="tname">김일번</td>
								<td class="tcategory">연차-MODAL</td>
								<td class="tterm">2019.01.01 ~ 2020.01.03</td>
								<td class="tcount">3</td>
								<td class="tauth"><button id="tauth" value="미승인" style="background-color:orange">미승인</button></td>
							</tr>
							<tr>
								<td class="tname">김이번</td>
								<td class="tcategory">반일연차-MODAL</td>
								<td class="tterm">2019.01.03 ~ 2020.01.03</td>
								<td class="tcount">0.5</td>
								<td class="tauth"><button value="승인" style="background-color:blue">승인</button></td>
							</tr>
						</tbody>
						
						<tfoot>
							<tr>
								<td colspan="5"></td>
							</tr>
						</tfoot>
						
					</table>
				</div>
	     	
	      </b-card-text>
	
	      <b-button variant="primary">Go somewhere</b-button>
	    </b-card-body>
	  </b-card>
	</div>
	
     
	<!-- Section -->
	<section class="mt-30px mb-30px">
		
	
	</section>
		
		
	<section>
		<!-- <div>
		  <b-dropdown id="dropdown-1" text="Dropdown Button" class="m-md-2">
		    <b-dropdown-item>First Action</b-dropdown-item>
		    <b-dropdown-item>Second Action</b-dropdown-item>
		    <b-dropdown-item>Third Action</b-dropdown-item>
		    <b-dropdown-divider></b-dropdown-divider>
		    <b-dropdown-item active>Active action</b-dropdown-item>
		    <b-dropdown-item disabled>Disabled action</b-dropdown-item>
		  </b-dropdown>
		</div>
		
		<script>
			var app = new Vue({
				el : '#dropdown-1',
				data : {
					val : ''
				}
			})
		</script>
		 -->
	</section>

	<c:import url="/common/bottom.jsp"/>   
   
    <!-- JavaScript files-->
    <script src="./vendor/jquery/jquery.min.js"></script>
    <script src="./vendor/popper.js/umd/popper.min.js"></script>

    <script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="./js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="./vendor/jquery.cookie/jquery.cookie.js"></script>
    <script src="./vendor/chart.js/Chart.min.js"></script>
    <script src="./vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="./vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="./js/charts-home.js"></script>
    <!-- Main File-->
    <script src="./js/front.js"></script>
    <script src="https://kit.fontawesome.com/5d4e7bbd25.js" crossorigin="anonymous"></script>
    
  </body>
</html>




