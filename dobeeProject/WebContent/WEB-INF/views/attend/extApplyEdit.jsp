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


<!-- Full Calendar -->
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

<!-- select2 -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>


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
						<h2>연장 근무 신청 수정</h2>
					
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
									<form id="extEditApplyForm" href="#">
									<%-- <form action="postEditExtApply.do?aplSeq=${ELforEdit.aplSeq }" method="post"> --%>
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
										<input id="extEditApplyBtn" type="button" value="수정" class="btn btn-primary" style="width:auto;"> &nbsp;&nbsp;
										<!-- <input type="submit" value="수정" class="btn btn-primary" > &nbsp;&nbsp; -->
										<input type="reset" value="초기화" class="btn btn-default" > &nbsp;&nbsp;
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


		</section>

		<c:import url="/common/BottomTag.jsp"/>
		
		
<!-- SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT//SCRIPT// -->
	
	<!-- Date-Time Picker -->
		<!-- Moment.js 2.24.0 min - cloudflare -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
		
	<script src="plugins/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>
	
	<!-- specific vendor page -->
	<script src="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
	<script src="assets/vendor/bootstrap-maxlength/bootstrap-maxlength.js"></script>
	<script src="assets/vendor/jquery-autosize/jquery.autosize.js"></script>
	
	
	<script>
		window.onload = function(){

			/*결재자 select2 적용*/
			$.ajax({
				url : "getApprovalList.do",
				dataType : "json",
				success : function(data) {
					var dArray = [];
					dArray = data.renewedList;
					for (var i =0; i<dArray.length; i++) {
						var option = $('<option>');
 	 					$(option).val(dArray[i].mail);
 	 					$(option).text(dArray[i].name+"("+dArray[i].mail+")");
	 	 				$('#approvalList').append(option);
					}
					$("#approvalList").select2();
				},
				error : function(request, status, error) {
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
			
		 	$('#datetimepickerStart').datetimepicker({
	            format : 'YYYY-MM-DD HH:mm' 
	        });
	
	        $('#datetimepickerEnd').datetimepicker({
	            format : 'YYYY-MM-DD HH:mm' 
	        });


			let dateTimeRegex = /^(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2})$/;
		 	
	        /*연장근무 신청 수정 비동기 처리 --02.05 게다죽 */
	        $("#extEditApplyBtn").on('click', function() {

	        	// 시작/종료 일정 미입력 확인
				if($('#datetimepickerStart').val() == "" || $('#datetimepickerEnd').val() == "" ) {
					swal({
						title : "시작 / 종료 날짜",
						text : "시작 / 종료 시간을 입력해주세요.",
						icon : "warning",
						button : "true"
					}).then((YES) => {
						$('#datetimepickerStart').focus()
					})

					return;
				// 시작 / 종료 일정 정규표현식 일치 여부 확인
				} else if (dateTimeRegex.test($('#datetimepickerStart').val() || dateTimeRegex.test($('#datetimepickerEnd').val()) ) == "") {
					
					swal({
						title : "시작 / 종료 날짜",
						text : "날짜 형식에 맞지 않습니다.",
						icon : "warning",
						button : "true"
					}).then((YES) => {
						$('#datetimepickerStart').focus()
					})

					return;
				// 시작 / 종료 일자 선택 오류 확인
				} else if($('#datetimepickerStart').val() > $('#datetimepickerEnd').val()) {
					swal({
						title : "날짜 선택 오류",
						text : "종료 시간을 다시 선택해주세요.",
						icon : "warning",
						button : "true"
					}).then((YES) => {
						$('#datetimepickerEnd').focus()
					})

					return;
				// 연장 근무 사유 입력 확인
				} else if ($('#extReason').val() == "") {
					swal({
						title : "연장 근무 사유",
						text : "연장 근무 사유를 입력해주세요.",
						icon : "warning",
						button : "true"
					}).then((YES) => {
						$('#extReason').focus()
					})

					return;
				// 결재자 선택 확인
				} else if ($('#approval option:selected').val() == "") {
					swal({
						title : "결재자",
						text : "결재자를 선택해주세요.",
						icon : "warning",
						button : "true"
					}).then((YES) => {
						$('#approval').focus()
					})

					return;
				}
		        
		        var formData = $("#extEditApplyForm").serialize();
		        
		        console.log('폼??'+formData);
	        	$.ajax({
					url : "ajax/apply/extEditApply.do?aplSeq="+${ELforEdit.aplSeq },
					data : formData,
					dataType : "text",
					contentType :  "application/x-www-form-urlencoded; charset=UTF-8",
	 				type:"post",
					success : function(responseData) {
						send("extEditApply");
						if(responseData == "success"){
							swal({
								title: "연장 근무 신청 수정",
								text: "연장 근무 신청이 수정되었습니다.",
								icon: "success", //"info,success,warning,error" 중 택1
								button : {
									confirm: {
									    text: "확인",
									    value: true,
									    visible: true,
									    className: "",
									    closeModal: true
									  }
									}
							}).then((YES) => {
								if(YES){
	 								location.reload(true); 
									} 
						})
					}
					},
					error : function(request, status, error) {
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
		    });
	        

	        var eventList = [];
		       
	    	$.ajax ({
	    		url : "ExtAll.do",
				dataType : "json",
				success : function(data) {
					var events = [];
					events = data.ExtAll;

	    			$.each(events, (index, element) => {
	    				if (element.isAuth === '승인') {
	    					eventList.push({
	    						title: "연장근무", 
	    						start: element.startAt, 
	    						end: element.endAt,
	    						color: "#f28c1f"
	    					})		
	    				} else if (element.isAuth === '미승인') {
	    					eventList.push({
	    						title: "미승인", 
	    						start: element.startAt, 
	    						end: element.endAt,
	    						color: "#c842f5"
	    					})		
	    				} /*else if (element.isAuth === '반려') {
	    					eventList.push({
	    						title: "반려", 
	    						start: element.startAt, 
	    						end: element.endAt,
	    						color: "#fc4103"
	    					})		
	    				}*/
	    			});
	    		},
	    		complete : function () {
	    			var calendarEl = document.getElementById('calendar');

	    		    var calendar = new FullCalendar.Calendar(calendarEl, {
	    		      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
	    		      header: {
	    		    	left : 'prev,today,next',
	    				center : 'title',
	    				right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
	    		      },
	    		      navLinks: true, // can click day/week names to navigate views
	    		      businessHours: {
	    			      startTime : '09:00',
	    			      endTime : '18:00'
	    			  },
	    			  eventLimit : true,
	    		      editable: false,
	    		      events: eventList
	    		    });
	    		    calendar.render();
	    		}
	    	});
		}

/* 알람 */
		
		function send(data) {
			let mail = $('#approvalList').val();
			var jsonData = new Object();
			jsonData.cmd = data;
			jsonData.mail = mail;
			jsonData.applier = '${sessionScope.user.name}';

			var parsedData = JSON.stringify(jsonData);
			
			wsocket.send(parsedData);
		}
		/* /알람  */

	</script>
		
	</body>
</html>