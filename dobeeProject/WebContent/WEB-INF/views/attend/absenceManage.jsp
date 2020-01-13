<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
  <head>
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="./css/jgcss.css">
    
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
   
 		<div id="navbar">
			<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link active" href="#">부재일정 신청</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="extendApply.do">연장근무 신청</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="breakManage.do">부재 일정 관리</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="workManage.do">근무 내역 확인</a>
			  </li>
			</ul>
		</div>
		
		<p>여기서부터 진행</p>
	<div id="navbar">
	  <b-card title="Card Title" no-body>
	    <b-card-header header-tag="nav">
	      <b-nav card-header pills>
	        <b-nav-item active>부재일정 신청</b-nav-item>
	        <b-nav-item><a href="extendApply.do">연장근무 신청</a></b-nav-item>
	        <b-nav-item>부재일정 관리</b-nav-item>
	        <b-nav-item disabled>근무내역 확인</b-nav-item>
	        <b-nav-item disabled>부재 관리</b-nav-item>
	        <b-nav-item disabled>연장근무 관리</b-nav-item>
	      </b-nav>
	    </b-card-header>
	
	    <b-card-body class="text-center">
	      <b-card-text>
	     	<h1 style="text-align: left">부재일정 신청</h1>
	     	<br>
	     	<div class="col-sm-3" style="background-color: yellow"></div>
	     	
	     	<div class="col-sm-6" id="jgContainer">
				<div class="formDiv">
					<form action="" method="post">					 
						<!-- 
						<label for="from">From</label>
						<input type="text" id="from" name="from">
						<label for="to">to</label>
						<input type="text" id="to" name="to">
						 -->
						
						<input type="text" value="옆 아이콘을 눌러 기간을 선택하세요" class="inputTerm" id="inputTerm">
						<button value="날짜선택" id="selTerm">캘린더ICON</button>
												
						<select id="category">
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

	      </b-card-text>
	
	    </b-card-body>
	  </b-card>
	</div>
	
	<section>
		<div class="col-md-12">
		
			<table id="absenseTable" class="dataTable display hover" style="width :100%">
				<colgroup>
					<col style="width: 5%">
					<col style="width: 15%">
					<col style="width: 10%">
					<col style="width: 30%">
					<col style="width: 15%">
					<col style="width: 15%">
				</colgroup>
				<thead id="absHead">
					<tr>
						<th>번호</th>
						<th>성함</th>
						<th>부재항목</th>
						<th>기간</th>
						<th>사용 일수</th>
						<th>승인여부</th>
					</tr>
				</thead>
		
				<tbody id="tbody">
					<!-- 여기서 뿌려줄겨 -->
					<tr>
						<td class="num">1</td>
						<td class="tname">김일번</td>
						<td class="tcategory"> <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">연차</button> </td>
						<td class="tterm">2019.01.01 ~ 2020.01.03</td>
						<td class="tcount">3</td>
						<td class="notauth">미승인</td>
					</tr>
					<tr>
						<td class="num">2</td>
						<td class="tname">김이번</td>
						<td class="tcategory"> <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">반차</button></td>
						<td class="tterm">2019.01.03 ~ 2020.01.03</td>
						<td class="tcount">0.5</td>
						<td class="tauth">승인</td>
					</tr>
					<tr>
						<td class="num">3</td>
						<td class="tname">김삼번</td>
						<td class="tcategory"> <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">외근</button></td>
						<td class="tterm">2019.01.03 ~ 2020.01.03</td>
						<td class="tcount">0</td>
						<td class="tdeny">반려</td>
					</tr>
				</tbody>
				
				<tfoot>	
				</tfoot>
					
			</table>
		</div>
	</section>
	
     
	<!-- Section -->
	<section class="mt-30px mb-30px">
		
	
	</section>
		
		
	<section id="modal_breakreason">
		<div class="container">
		  <!-- Modal -->
		  <div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog modal-lg">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">상세 사유</h4>
		        </div>
		        <div class="modal-body">
		           <h3>부재항목</h3>
			      <h4>사유</h4>
			      <h5>이러이러하옵니다...</h5>
		        </div>
		        <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">Deny</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>		
	</section>
	
	
	</div>

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




