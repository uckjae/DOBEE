<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed">
<head>

<!-- Head Tag Script -->
<c:import url="/common/HeadTag.jsp"/>

<!-- Date-time picker -->
<!-- <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css"> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.0.0/flatly/bootstrap.min.css"> -->
<link rel="stylesheet" href="plugins/datetime-picker/css/bootstrap-datetimepicker.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->

<!-- Full Calendar -->
<link rel="stylesheet" href="assets/vendor/fullcalendar/fullcalendar.css" />
<link rel="stylesheet" href="assets/vendor/fullcalendar/fullcalendar.print.css" media="print" />

<!--
<link href='assets/vendor/fullcalendar-ori/packages/core/main.css' rel='stylesheet' />
<link href='assets/vendor/fullcalendar-ori/packages/bootstrap/main.css' rel='stylesheet' />
<link href='assets/vendor/fullcalendar-ori/packages/timegrid/main.css' rel='stylesheet' />
<link href='assets/vendor/fullcalendar-ori/packages/daygrid/main.css' rel='stylesheet' />
<link href='assets/vendor/fullcalendar-ori/packages/list/main.css' rel='stylesheet' />

<script src='assets/vendor/fullcalendar-ori/packages/core/main.js'></script>
<script src='assets/vendor/fullcalendar-ori/packages/interaction/main.js'></script>
<script src='assets/vendor/fullcalendar-ori/packages/bootstrap/main.js'></script>
<script src='assets/vendor/fullcalendar-ori/packages/daygrid/main.js'></script>
<script src='assets/vendor/fullcalendar-ori/packages/timegrid/main.js'></script>
<script src='assets/vendor/fullcalendar-ori/packages/list/main.js'></script>
-->

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
						<h2>부재 일정 신청 수정</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-briefcase" aria-hidden="true"></i>
									</a>
								</li>
								<li><span>근무</span></li>
								<li><span>근무 내역 관리</span></li>
								<li><span>신청 / 수정</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
					<!-- 작업 여기부터~!~!~!~~! -->
					
					<section class="panel">
						<div class="row">
						
							<div class="col-md-7">
								<section class="panel">
									<header class="panel-heading">		
										<h2 class="panel-title">Calendar</h2>
									</header>
									<div class="panel-body">
										<div class="calendarArea" style="width:100%">
											<div id="calendar"></div>
										</div>
									</div>
								</section>
							</div>
							
							<div class="col-md-5 panel-body">
								<div class="col-md-12">
									<form action="postEditExtApply.do?aplSeq=${ELforEdit.aplSeq }" method="post">
										<br>
										<br>
										<label class="control-label" for="textareaDefault">시작 시간</label>
										<input type='text' class="form-control" id='datetimepickerStart' name="startAt" value="${ELforEdit.startAt}"/>
										<br>
										<label class="control-label" for="textareaDefault">종료 시간</label>
										<input type='text' class="form-control" id='datetimepickerEnd' name="endAt" value="${ELforEdit.endAt}"/>
										<br>
										<div class="form-group">
											<label class="control-label" for="textareaDefault">사유</label>
											<textarea name="reason" class="form-control" rows="3" data-plugin-textarea-autosize="" data-plugin-maxlength maxlength="3000" style="height: 200px" placeholder="사유를 입력해주세요.">${ELforEdit.reason}</textarea>
											<p>
												<code>max-length</code> set to 3000 byte.
											</p>
										</div>
										<br>
										<label class="control-label" for="textareaDefault">결재자</label>
										<br>
										<select name="approval" id="approvalList" style="width: 100%;">
											<option hidden=""> 결재자 선택  </option>
											<!-- Ajax -->
										</select>
										<br>
										<br>
										<br>
										
										<input type="submit" value="수정" class="btn btn-primary" > &nbsp;&nbsp;
										<input type="reset" value="Reset" class="btn btn-default" > &nbsp;&nbsp;
										<input type="button" value="삭제" class="btn btn-default" onclick="location.href='deleteExtApply.do?aplSeq=${ELforEdit.aplSeq}'">
									</form>
										
								</div>
							</div>
						</div>
					</section>
					
					<div id='calendar'></div>
					
					
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
		<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
		<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> -->
		<!-- Moment.js 2.24.0 min - cloudflare -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
		
	<script src="plugins/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>
	
	<!-- Full Calendar -->
	<script src="assets/vendor/fullcalendar/lib/moment.min.js"></script>
	<script src="assets/vendor/fullcalendar/fullcalendar.js"></script>
	 
	<!-- Full Ext Examples -->
	<script src="assets/javascripts/pages/ext.calendar.js"></script>
	
	<!-- specific vendor page -->
	<script src="assets/vendor/select2/select2.js"></script>
	<script src="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
	<script src="assets/vendor/codemirror/addon/selection/active-line.js"></script>
	<script src="assets/vendor/bootstrap-maxlength/bootstrap-maxlength.js"></script>
	<script src="assets/vendor/jquery-autosize/jquery.autosize.js"></script>
	
	
	
		<script>
			window.onload = function(){
	
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