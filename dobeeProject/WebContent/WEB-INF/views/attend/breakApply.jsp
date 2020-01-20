<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed">
<head>

<!-- Head Tag Script -->
<c:import url="/common/HeadTag.jsp"/>

<!-- Date-time picker -->
<link rel="stylesheet" href="plugins/datetime-picker/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Full Calendar -->
<link rel="stylesheet" href="assets/vendor/fullcalendar/fullcalendar.css" />
<link rel="stylesheet" href="assets/vendor/fullcalendar/fullcalendar.print.css" media="print" />

</head>
	<body>
		<section class="body">

			<!-- start: header -->
			<c:import url="/common/Top.jsp"/>
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<c:import url="/common/Side.jsp"/>
				<!-- end: sidebar -->
				
			<!-- start : main Content -->
				<section role="main" class="content-body">
					<header class="page-header">
						<h2>부재 일정 신청</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-briefcase" aria-hidden="true"></i>
									</a>
								</li>
								<li><span>근무</span></li>
								<li><span>부재 일정 신청</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
					<!-- 작업 여기부터~!~!~!~~! -->
					
					
					<section class="panel">
						<div class="panel-body">
							<div class="row">
								<div class="col-md-7">
									<div class="calendarArea" style="width:100%">
										<div id="calendar"></div>
									</div>
								</div>
								<div class="col-md-5">
								
									<form action="breakApply.do" method="post">
										
										<br>
										<br>
										<br>
										<br>
								
										시작시간
										<input type='text' class="form-control" id='datetimepickerStart' name="startAt"/>
										<br>
										종료시간
										<input type='text' class="form-control" id='datetimepickerEnd' name="endAt"/>
										<br>
										<input type="hidden" name="drafter" value="${sessionScope.user.mail }">
										결재자 
										<br>
										<select name="approval" id="approvalList" style="width: 60%;">
											<option hidden=""> 결재자 선택  s</option>
											<!-- Ajax -->
										</select>
										<br>
										<br>
										부재항목코드
										<br>
										<select name="apyCode" id="apycodelist" style="width: 60%;">
											<option hidden=""> 항목 선택 </option>
											<!-- Ajax -->
										</select>
										<br>
										<br>
										
										사유 <br>
										<textarea name="reason" placeholder="연장근무 사유를 입력해주세요." style="width:100%; height: 100px;"></textarea>
										<br>
										<br>
										<input type="submit" value="확인"> &nbsp;&nbsp;
										<input type="reset" value="Reset">

									</form>
									
								</div>
							</div>
						</div>
					</section>
					
					
					<!-- start: page -->
					<!-- end: page -->
				</section>
			</div>

					<!-- start: page -->
					<!-- end: page -->
		</section>


			<!-- 오른쪽 사이드바!! -->
		<c:import url="/common/RightSide.jsp"/>
			
			<!-- 오른쪽 사이드바 끝!! -->
		</section>

		<c:import url="/common/BottomTag.jsp"/>
		
		
<!-- SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT// -->
	
	<!-- Date-Time Picker -->
		<!-- JQuery 3.4.1 min - google -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<!-- Moment.js 2.24.0 min - cloudflare -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script src="plugins/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>
	
	<!-- Full Calendar -->
	<script src="assets/vendor/fullcalendar/lib/moment.min.js"></script>
	<script src="assets/vendor/fullcalendar/fullcalendar.js"></script>
	
	<!-- Examples -->
	<script src="assets/javascripts/pages/abs.calendar.js"></script>
	
	
	
		<script>
			window.onload = function(){
	
				$.ajax({
					url : "getApyCode.do",
					dataType : "json",
					success : function(data) {
						var aArray = [];
						aArray = data.apyCode;
						for (var i=0; i<aArray.length-1; i++) {
							var option = document.createElement("option")
							$('#apycodelist').append("<option value="+aArray[i].apyCode + ">"+ aArray[i].entry + "</option>")
						}					
					},
					error : function(error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
				
				$.ajax({
					url : "getApprovalList.do",
					dataType : "json",
					success : function(data) {			
						var dArray = [];
						dArray = data.renewedList;
						for (var i =0; i<dArray.length; i++) {
							var option = document.createElement("option")
							$('#approvalList').append("<option value="+ dArray[i].mail +">"+ dArray[i].name + ' ('+dArray[i].mail+')' + "</option>")
						}
					},
					error : function(error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
				
			 	
			 	$('#datetimepickerStart').datetimepicker({
		            format : 'YYYY-MM-DD HH:mm' 
		        });
		
		        $('#datetimepickerEnd').datetimepicker({
		            format : 'YYYY-MM-DD HH:mm' 
		        });
	
			}
	  	</script>
		
		
		
	</body>
</html>