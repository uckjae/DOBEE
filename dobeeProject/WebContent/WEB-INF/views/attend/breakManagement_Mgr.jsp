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
    
    <link href='./packages/core/main.css' rel='stylesheet' />
	<link href='./packages/daygrid/main.css' rel='stylesheet' />
	<link href='./packages/list/main.css' rel='stylesheet' />
	
	<!-- Modal -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">

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
			    <a class="nav-link" href="breakManage.do">부재 일정 관리</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="workManage.do">근무 내역 확인</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active" href="absManage.do">부재관리_매니저</a>
			  </li>
			</ul>
		</div>
		
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<br>
				<h1>부재 신청 관리</h1>
				<br>
		
				<div class="formDiv">
					<form action="" method="post">					 
						
						<input type="text" value="옆 아이콘을 눌러 기간을 선택하세요" class="inputTerm" id="inputTerm">
						<button value="날짜선택" id="selTerm">캘린더ICON</button>
												
						<select id="selectEntry">
							<option value="">항목별</option>
							<!-- Ajax -->
						</select>
						
						<input type="submit" class="submit" id="submit" value="돋보기ICON">
					</form>
				</div>
				
				<!-- 이거는 다른거고 -->
				<section>
					<table id="brkTable" class="dataTable hover order-column row-border" style="width :100%; margin-top:100px;">
						<thead id="thead">
							<tr>
								<th width="8%">신청 번호</th>
								<th width="17%">신청 일자</th>
								<th width="12%">부재 항목</th>
								<th width="12%">승인 여부</th>
								<th>기간</th>
								<th width="15%">연차 사용 일수</th>
							</tr>
						</thead>
						
						<tbody id="tbody">
							<c:forEach items="${brkListMgr}" var="bl">
								<tr>
									<td class="bseq">		${bl.aplSeq }</td>
									<td class="bReqDate">	${bl.reqDate}</td>
									<td class="bEntry">		${bl.entry }</td>
									<td class="bIsAuth">
										<button type="button" class="btn btn-info btn-sm ${bl.isAuth }" data-toggle="modal" data-target="#myModal" data-seq="${bl.aplSeq}" data-reason="${bl.reason }" data-rejreason="${bl.rejReason }">${bl.isAuth }
										</button></td>
									<td class="bTerm">		${bl.startAt } - ${bl.endAt }</td>
									<td class="bUsed">		${bl.usingBreak }</td>
								</tr>
							</c:forEach>
						</tbody>
					
						<tfoot>	
						</tfoot>		
					</table>
					
				</section>	
			</div>
			<div class="col-md-1"></div>
		</div>
		
	</div>
	

	<!-- Modal -->
	<section id="modal_breakreason">
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h2>부재 신청 사유</h2>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					
					<form action="absManage.do" method="POST">
						<div class="modal-body">
							<div class="row">
								<div class="col-md-1"></div>
								<div class="col-md-10" style="background-color:lightgray;">
									<input type="hidden" value="" id="inputAplSeq"> $ { b l.aplSeq } 넣을겨
									<br>
									<div id="divReason">
										<h3>부재 신청 사유</h3>
										<p>$ { b l.reason } 넣을겨</p><br>
										<input type="text" id="inputReason" placeholder="아 좀..">
									</div>
									<br>
									<select id="entrySelectorInModal" name="isAuth">
										<option value="">항목 선택</option>
										<option value="승인">승인</option>
										<option value="반려">반려</option>
										<option value="미승인">보류</option>
									</select>
									<div id="divRejReason">
										<h3>부재 신청 거절 사유 입력</h3>
										<h5>$ { b l.rejReason } 넣을겨</h5>
										<input type="text" name="rejReason" placeholder="반려 할 경우 사유를 입력하십시오" style="width:90%;">
									</div>
								</div>
								<div class="col-md-1"></div>
							</div>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
						
					</form>
				</div>
			</div>
		</div>
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
    
	<script src='./packages/core/main.js'></script>
	<script src='./packages/interaction/main.js'></script>
	<script src='./packages/daygrid/main.js'></script>
	<script src='./packages/list/main.js'></script>
	<script src='./packages/google-calendar/main.js'></script>
  
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script src="/resources/demos/external/globalize/globalize.js"></script>
	<script src="/resources/demos/external/globalize/globalize.culture.de-DE.js"></script>
	<script src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script>
	
	<!-- 경열이 TABLE -->
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"type="text/javascript"></script>
  
  	<script>
		window.onload = function(){

			// 부재항목 Option Ajax Loading ********************
			$.ajax({
				url : "breakEntryListMgr.do",
				dataType : "json",
				success : function(data) {
					var eArray = [];
					console.log("뭐임", data);
					eArray = data.breakEntryListMgr;
					for (var i=0; i<eArray.length; i++) {
						$('#selectEntry').append("<option value=" + eArray[i].apyCode + ">" + eArray[i].entry + "</option>");
					}
				}
			});
			
			// 승인여부 Option Ajax Loading
			$.ajax({
				url : "breakIsAuthList.do",
				dataType : "json",
				success : function(data) {
					var aArray = [];
					aArray = data.breakIsAuthList;
					for (var i=0; i<aArray.length; i++) {
						var option = document.createElement("option");
						$(option).text(aArray[i]);
						$('#selectIsAuth').append(option);
					}
				}
			});

			
			var reason = "";
			var rejReason = "";
			var aplSeq = "";
			
			$('.btn-sm').click(function() {
				$('#tbody').empty();
				reason = $(event.relatedTarget).data('reason');
				rejReason = $(event.relatedTarget).data('rejReason');
				$(".modal-body #inputAplSeq").val(aplSeq);
				
				
			})
			
			// 부재항목 Option 변경시 List Ajax 처리
			$('#selectEntry').change(function() {

				$.ajax ({
					url : "getBreakListByEntry.do",
					dataType : "json",
					success : function (data) {
						$('#tbody').empty();
						/*
						var beArray = [];
						beArray = data.byEntry;
						for (var i=0; i<beArray.length; i++) {	
							$('#tbody').append(
								'<tr> <td class="bcategory">' + beArray[i].entry +'</td>' +
									'<td class="tterm">' +	beArray[i].startAt +' - '+ beArray[i].endAt + '</td>' +
									'<td class="tused">' +	beArray[i].usingBreak + '</td>' +
									'<td class="tregdate">' +	beArray[i].reqDate + '</td>'+
									'<td class="notauth"><button type="button" class="btn btn-info btn-sm '+beArray[i].isAuth+'" data-toggle="modal" data-target="#myModal'+beArray[i].aplSeq+'">'+ beArray[i].isAuth +'</button></td>'+
								'</tr>'
								+
								'<div class="modal fade" id="myModal'+beArray[i].aplSeq+'" role="dialog">'+
									'<div class="modal-dialog modal-lg"> <div class="modal-content"> <div class="modal-header">'+
									'<button type="button" class="close" data-dismiss="modal">&times;</button>'+
									'<h4 class="modal-title">상세 사유</h4> </div> <div class="modal-body"> <h3>부재 사유</h3> <h4>사유</h4>'+
									'<h5>'+beArray[i].reason+'</h5> </div> <div class="modal-footer">'+
								'<button type="button" class="btn btn-default" data-dismiss="modal">OK</button> </div> </div> </div> </div>'		
							);
						}
						*/
					},
					error : function(error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});

			// 승인여부 Option 변경시 List Ajax 처리
			$('#selectIsAuth').change(function() {

				$.ajax ({
					url : "getBreakListByIsAuth.do",
					dataType : "json",
					success : function (data) {
						$('#tbody').empty();
						var biaArray = [];
						biaArray = data.byIsAuth;
						for (var i=0; i<biaArray.length; i++) {	
							$('#tbody').append(
								'<tr> <td class="bcategory">' + biaArray[i].entry +'</td>' +
									'<td class="tterm">' +	biaArray[i].startAt +' - '+ biaArray[i].endAt + '</td>' +
									'<td class="tused">' +	biaArray[i].usingBreak + '</td>' +
									'<td class="tregdate">' +	biaArray[i].reqDate + '</td>'+
									'<td class="notauth"><button type="button" class="btn btn-info btn-sm '+biaArray[i].isAuth+'" data-toggle="modal" data-target="#myModal'+biaArray[i].aplSeq+'">'+ biaArray[i].isAuth +'</button></td>'+
								'</tr>'
								+
								'<div class="modal fade" id="myModal'+biaArray[i].aplSeq+'" role="dialog">'+
									'<div class="modal-dialog modal-lg"> <div class="modal-content"> <div class="modal-header">'+
									'<button type="button" class="close" data-dismiss="modal">&times;</button>'+
									'<h4 class="modal-title">상세 사유</h4> </div> <div class="modal-body"> <h3>부재 사유</h3> <h4>사유</h4>'+
									'<h5>'+biaArray[i].reason+'</h5> </div> <div class="modal-footer">'+
								'<button type="button" class="btn btn-default" data-dismiss="modal">OK</button> </div> </div> </div> </div>'		
							);
						}
					},
					error : function(error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
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