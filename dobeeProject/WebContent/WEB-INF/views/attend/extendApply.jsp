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

<!-- specific page vendor css form script -->
<link rel="stylesheet" href="assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
<link rel="stylesheet" href="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.css" />
<link rel="stylesheet" href="assets/vendor/dropzone/css/basic.css" />
<link rel="stylesheet" href="assets/vendor/dropzone/css/dropzone.css" />
<link rel="stylesheet" href="assets/vendor/bootstrap-markdown/css/bootstrap-markdown.min.css" />
<link rel="stylesheet" href="assets/vendor/codemirror/theme/monokai.css" />

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
						<h2>연장근무 신청</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-briefcase" aria-hidden="true"></i>
									</a>
								</li>
								<li><span>근무</span></li>
								<li><span>연장 근무 신청</span></li>
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
									<form id="extendApplyForm" action="#">
										<br>
										<br>
										<label class="control-label" for="textareaDefault">시작 시간</label>
										<input type='text' class="form-control" id='datetimepickerStart' name="startAt"/>
										<br>
										<label class="control-label" for="textareaDefault">종료 시간</label>
										<input type='text' class="form-control" id='datetimepickerEnd' name="endAt"/>
										<br>
										<br>
										<div class="form-group">
											<label class="control-label" for="textareaDefault">사유</label>
											<textarea name="reason" class="form-control" rows="3" data-plugin-textarea-autosize="" data-plugin-maxlength maxlength="3000" style="height: 200px" placeholder="사유를 입력해주세요."></textarea>
											<p>
												<code>max-length</code> set to 3000 byte.
											</p>
										</div>
										<br>
										<br>
										<label class="control-label" for="textareaDefault">결재자</label>
										<select id="approval" name="approval" style="width:100%;">
											<option hidden = ""> 결재자 선택 </option>
										</select>
										<br>
										<br>
										<input id="extendApplyBtn" type="button" value="확인" class="btn btn-primary" style="width:auto;"> &nbsp;&nbsp;
										<input type="reset" value="Reset" class="btn btn-default" style="width:auto;">
										
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
		<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
		<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> -->
		<!-- Moment.js 2.24.0 min - cloudflare -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
		
	<script src="plugins/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>
	
	<!-- Full Calendar -->
	<script src="assets/vendor/fullcalendar/lib/moment.min.js"></script>
	<script src="assets/vendor/fullcalendar/fullcalendar.js"></script>
	
	<!-- Examples -->
	<script src="assets/javascripts/pages/ext.calendar.js"></script>
		
	<!-- specific vendor page -->
	<script src="assets/vendor/select2/select2.js"></script>
	<script src="assets/vendor/jquery-maskedinput/jquery.maskedinput.js"></script>
	<script src="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
	<script src="assets/vendor/codemirror/addon/selection/active-line.js"></script>
	<script src="assets/vendor/bootstrap-maxlength/bootstrap-maxlength.js"></script>
	<script src="assets/vendor/jquery-autosize/jquery.autosize.js"></script>
		<script>
			window.onload = function(){
				connect();//웹소켓 연결
				$.ajax({
					url : "getApprovalList.do",
					dataType : "json",
					success : function(data) {			
						var dArray = [];
						dArray = data.renewedList;
						for (var i =0; i<dArray.length; i++) {
							var option = document.createElement("option")
							$('#approval').append("<option value="+ dArray[i].mail +">"+ dArray[i].name + ' ('+dArray[i].mail+')' + "</option>")
						}
					},
					error : function(error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			 	
				$('#datetimepickerEnd').datetimepicker({
		            format : 'YYYY-MM-DD HH:mm' ,
		            inline : true,
		            sideBySide : true
		        });
		        
			 	$('#datetimepickerStart').datetimepicker({
		            format : 'YYYY-MM-DD HH:mm',
		            inline : true,
		            sideBySide : true
		        });


		        /*부재 일정 신청 비동기 처리 --01.26 알파카 */
		        $("#extendApplyBtn").on('click', function() {
			        var formData = $("#extendApplyForm").serialize();
			        console.log('폼??'+formData);
		        	$.ajax({
						url : "ajax/apply/extendApply.do",
						data : formData,
						dataType : "text",
						contentType :  "application/x-www-form-urlencoded; charset=UTF-8",
		 				type:"post",
						success : function(responseData) {
							send("extendApply");
							if(responseData == "success"){
								swal({
									title: "연장 근무 신청",
									text: "연장 근무가 신청되었습니다.",
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

			/* 알람 */
			function getContextPath() {//contextPath 구하는 함수
			  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
			  return location.href.substring(6, location.href.indexOf('/', hostIndex + 1) );
			};
			
			

			function connect(){
				var contextPath = getContextPath();
				wsocket = new WebSocket("ws:"+contextPath+"/alram.do");
				wsocket.onopen = onOpen;
				wsocket.onmessage = onMessage;
				wsocket.onclose = onClose;
			}

			
			
			function send(data) {
				let mail = $('#approval').val();
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