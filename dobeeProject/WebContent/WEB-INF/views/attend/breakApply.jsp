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

<!-- Full Calendar Octupus -->
<link rel="stylesheet" href="assets/vendor/fullcalendar/fullcalendar.css" />
<link rel="stylesheet" href="assets/vendor/fullcalendar/fullcalendar.print.css" media="print" />

<!-- Full Calendar Original -->
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/locales/ko.js"></script>
<!-- sweet alert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>


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
								
									<form id="breakApplyForm" action="#" method="post">
										
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
										연차 사용 일수
										<br>
										<input type="number" id="useBreak" name="useBreak">
										<br>
										<br>
										결재자 
										<br>
										<select name="approval" id="approvalList" style="width: 60%;">
											<option hidden=""> 결재자 선택 </option>
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
										<input id="breakApplyBtn" type="button" value="확인"> &nbsp;&nbsp;
										<input type="reset" value="Reset">

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

		        /*부재 일정 신청 비동기 처리 --01.26 알파카 */
		        $("#breakApplyBtn").on('click', function() {
			        var formData = $("#breakApplyForm").serialize();
			        console.log('폼??'+formData);
		        	$.ajax({
						url : "ajax/apply/breakApply.do",
						data : formData,
						dataType : "text",
						contentType :  "application/x-www-form-urlencoded; charset=UTF-8",
		 				type:"post",
						success : function(responseData) {
							if(responseData == "success"){
								swal({
									title: "부재 일정 신청",
									text: "부재 일정이 신청되었습니다.",
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
						error : function(error) {
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
			    });
	
			}

			var eventList = [];

			$.ajax ({
				url : "AbsAll.do",
				dataType : "json",
				success : function(data) {
					var events = [];
					events = data.AbsAll;
					
					$.each(events, (index, element) => {
						
						console.log(element);
						
						if (element.isAuth ==='승인' && element.apyCode == 1 ) {
							eventList.push({
								title : "연차",
								start : element.startAt,
								end : element.endAt,
								color : "#f28c1f"
							})
						} else if (element.isAuth ==='미승인' && element.apyCode == 1 ) {
							eventList.push({
								title : "연차 미승인",
								start : element.startAt,
								end : element.endAt,
								color : "#f54242"
							})
						} else if (element.isAuth == '승인' && element.apyCode == 2 ) {
							eventList.push({
								title : "반일 연차",
								start : element.startAt,
								end : element.endAt,
								color : "#f28c1f"
							})
						} else if (element.isAuth ==='미승인' && element.apyCode == 2 ) {
							eventList.push({
								title : "반일 연차 미승인",
								start : element.startAt,
								end : element.endAt,
								color : "#f54242"
							})					
						} else if (element.isAuth == '출장' && element.apyCode == 3 ) {
							eventList.push({
								title : "출장",
								start : element.startAt,
								end : element.endAt,
								color : "#f28c1f"
							})
						} else if (element.isAuth ==='출장' && element.apyCode == 3 ) {
							eventList.push({
								title : "출장 미승인",
								start : element.startAt,
								end : element.endAt,
								color : "#f54242"
							})
						} else if (element.isAuth == '외근' && element.apyCode == 4 ) {
							eventList.push({
								title : "외근",
								start : element.startAt,
								end : element.endAt,
								color : "#f28c1f"
							})
						} else if (element.isAuth ==='외근' && element.apyCode == 4 ) {
							eventList.push({
								title : "외근 미승인",
								start : element.startAt,
								end : element.endAt,
								color : "#f54242"
							})
						} else if (element.isAuth == '경조 휴가' && element.apyCode == 5 ) {
							eventList.push({
								title : "경조 휴가",
								start : element.startAt,
								end : element.endAt,
								color : "#3b6b7d"
							})
						} else if (element.isAuth ==='경조 휴가' && element.apyCode == 5 ) {
							eventList.push({
								title : "경조 휴가 미승인",
								start : element.startAt,
								end : element.endAt,
								color : "#f54242"
							})
						}	
					});
				}
			});
			
			console.log('eventList: ', eventList);

			/* 
			 document.addEventListener('DOMContentLoaded', function(isLoading, view) {
			    var calendarEl = document.getElementById('calendar');

			    $('#calendar').fullCalendar({
				  height : 100,
			      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
			      header: {
			        left: 'prev,next today',
			        center: 'title',
			        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			      },
			      navLinks: true, // can click day/week names to navigate views
			      businessHours: {
				      startTime : '09:00',
				      endTime : '18:00'
				  },
			      editable: false,
			      events: function(start, end, callback) {
			    	  $.ajax ({
							url : "AbsAll.do",
							dataType : "json",
							success : function(data) {
								var events = {};
								events = data.AbsAll;
								
								$.each(events, (index, element) => {
									
									console.log(element);
									
									if (element.isAuth ==='승인' && element.apyCode == 1 ) {
										eventList.push({
											title : "연차",
											start : element.startAt,
											end : element.endAt,
											color : "#f28c1f"
										})
									} else if (element.isAuth ==='미승인' && element.apyCode == 1 ) {
										eventList.push({
											title : "연차 미승인",
											start : element.startAt,
											end : element.endAt,
											color : "#f54242"
										})
									} else if (element.isAuth == '승인' && element.apyCode == 2 ) {
										eventList.push({
											title : "반일 연차",
											start : element.startAt,
											end : element.endAt,
											color : "#f28c1f"
										})
									} else if (element.isAuth ==='미승인' && element.apyCode == 2 ) {
										eventList.push({
											title : "반일 연차 미승인",
											start : element.startAt,
											end : element.endAt,
											color : "#f54242"
										})					
									} else if (element.isAuth == '출장' && element.apyCode == 3 ) {
										eventList.push({
											title : "출장",
											start : element.startAt,
											end : element.endAt,
											color : "#f28c1f"
										})
									} else if (element.isAuth ==='출장' && element.apyCode == 3 ) {
										eventList.push({
											title : "출장 미승인",
											start : element.startAt,
											end : element.endAt,
											color : "#f54242"
										})
									} else if (element.isAuth == '외근' && element.apyCode == 4 ) {
										eventList.push({
											title : "외근",
											start : element.startAt,
											end : element.endAt,
											color : "#f28c1f"
										})
									} else if (element.isAuth ==='외근' && element.apyCode == 4 ) {
										eventList.push({
											title : "외근 미승인",
											start : element.startAt,
											end : element.endAt,
											color : "#f54242"
										})
									} else if (element.isAuth == '경조 휴가' && element.apyCode == 5 ) {
										eventList.push({
											title : "경조 휴가",
											start : element.startAt,
											end : element.endAt,
											color : "#3b6b7d"
										})
									} else if (element.isAuth ==='경조 휴가' && element.apyCode == 5 ) {
										eventList.push({
											title : "경조 휴가 미승인",
											start : element.startAt,
											end : element.endAt,
											color : "#f54242"
										})
									}	
								});
							}
						});

				  }
			    });

			    calendar.render();
			  });
				 */		
	  	</script>
		
		
		
	</body>
</html>