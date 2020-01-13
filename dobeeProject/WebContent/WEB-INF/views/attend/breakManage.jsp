<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
  <head>
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
    
    <link rel="stylesheet" href="./css/jgcss.css">


    
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
			    <a class="nav-link" href="breakApply.do">부재일정 신청</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="extendApply.do">연장근무 신청</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active" href="breakManage.do">부재 일정 관리</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="workManage.do">근무 내역 확인</a>
			  </li>
			</ul>
		</div>
		
		<h1>부재 일정 관리</h1>

		<form action="" method="post">
			<table style="width: 100%">
				<tr>
					<td style="width: 9%"><h1>사용 연차</h1></td>
					<td style="width: 12%" id="usedVacation">0</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><h1>남은 연차</h1></td>
					<td id="remainVacation">0</td>
					<td></td>					
					<td style="width: 10%">
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
					<td style="width: 7%">
						<select name="category">
							<option value="">항목별</option>
							<option value="연차">연차</option>
							<option value="외근">외근</option>
							<option value="출장">출장</option>
						</select>
					</td>
					<td style="width: 7%">
						<input type="submit" class="submit" value="검색하기 ">
					</td>
					
				</tr>
			</table>
		</form>
				
		<section>
			<div class="col-md-12">
				
				<%-- 
				<table id="brkTable" class="dataTable display hover">
					<thead>
						<tr>
							<th class="notSeq" style="width: 10%">No</th>
							<th class="title" style="width: 60%">제목</th>
							<th class="regdate" style="width: 20%">작성일</th>
							<th class="count" style="width: 10%">조회수</th>
						</tr>
					</thead>
					<tbody>	
						<c:forEach items="${list}" var="n" >
							<tr>
								<td class="notSeq">${n.notSeq}</td>
								<td class="title">${n.title}</td>
								<td class="regdate">${n.regDate}</td>
								<td class="count">${n.count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				--%>
				
				<table id="breakTable" class="dataTable display hover" style="width :100%">
					<thead id="thead">
						<tr>
							<th width="13%">부재항목</th>
							<th>기간</th>
							<th width="13%">사용 일수</th>
							<th width="20%">승인여부</th>
						</tr>
					</thead>
			
					<tbody id="tbody">
						<!-- 여기서 뿌려줄겨 -->
						<tr>
							<td class="bcategory">연차</td>
							<td class="tterm">2020.01.03. ~ 2020.01.05</td>
							<td class="tused">3</td>
							<td class="notauth"><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">미승인</button></td>
						</tr>
						<tr>
							<td class="bcategory">반차</td>
							<td class="tterm">2020.01.05. ~ 2020.01.05</td>
							<td class="tused">0.5</td>
							<td class="notauth"><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">승인</button></td>
						</tr>
						<tr>
							<td class="bcategory">외근</td>
							<td class="tterm">2020.01.03. ~ 2020.01.05</td>
							<td class="tused">0</td>
							<td class="notauth"><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">반려</button></td>
						</tr>
					</tbody>
					
					<tfoot>	
					</tfoot>
						
				</table>
			</div>
		</section>
	</div>
	
	<section id="modal_breakReason">
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
		           <h3>부재 사유</h3>
			      <h4>사유</h4>
			      <h5>이러이러하옵니다...</h5>
		        </div>
		        <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>		
	</section>

	<c:import url="/common/bottom.jsp"/>   
   
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
    
    <link href='./packages/core/main.css' rel='stylesheet' />
	<link href='./packages/daygrid/main.css' rel='stylesheet' />
	<link href='./packages/list/main.css' rel='stylesheet' />
	<script src='./packages/core/main.js'></script>
	<script src='./packages/interaction/main.js'></script>
	<script src='./packages/daygrid/main.js'></script>
	<script src='./packages/list/main.js'></script>
	<script src='./packages/google-calendar/main.js'></script>
  
    
	<!-- Modal -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
  
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script src="/resources/demos/external/globalize/globalize.js"></script>
	<script src="/resources/demos/external/globalize/globalize.culture.de-DE.js"></script>
	<script src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script>
	
	<!-- 경열이 TABLE -->
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"type="text/javascript"></script>
  
  	<script>
		window.onload = function(){

			$.ajax ({
				url : "getVacationInBM.do",
				dataType : "json",
				success : function (data) {
					$('#usedVacation').text(data.totalVacation[0].totalBreak)
					$('#remainVacation').text(data.totalVacation[0].usedBreak)					
				},
				error : function(error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});

		
			$('#brkTable').DataTable({
				/*language option*/
				"language" : {
					"emptyTable" : "데이터가 없습니다.",
					"lengthMenu" : "페이지당 _MENU_ 개씩 보기",
					"info" : "현재 _START_ - _END_ / _TOTAL_건",
					"infoEmpty" : "데이터 없음",
					"infoFiltered" : "( _MAX_건의 데이터에서 필터링됨 )",
					"search" : "검색: ",
					"zeroRecords" : "일치하는 데이터가 없습니다.",
					"loadingRecords" : "로딩중...",
					"processing" : "잠시만 기다려 주세요",
					"paginate" : {
						"next" : "다음",
						"previous" : "이전"
					}
				},
				"columnDefs" : [{
					className : "dt-center",
					"targets" : [ 1 ],
				}]
			});

			
		}
	</script>
   
    
  </body>
</html>




