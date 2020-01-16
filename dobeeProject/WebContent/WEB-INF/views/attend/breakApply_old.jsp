<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<c:import url="/common/tag.jsp" />
   <style>
     @import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');
		body {
			margin: 40px 10px;
			padding: 0;
		  margin: 40px 10px;
		  padding: 0;
		   font-family: 'Noto Serif KR', serif;
			font-size: 14px;
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
		<c:import url="/common/top.jsp" />
		
		<div id="navbar">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					href="breakApply.do">부재일정 신청</a></li>
				<li class="nav-item"><a class="nav-link" href="extendApply.do">연장근무
						신청</a></li>
				<li class="nav-item"><a class="nav-link" href="breakManage.do">부재
						일정 관리</a></li>
				<li class="nav-item"><a class="nav-link" href="workManage.do">근무
						내역 확인</a></li>
			</ul>
		</div>
		
		<br>
		<h1>부재 신청</h1>
		<br>
		
		
		<form action="breakApply.do" method="post">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-5">
					<div class="calendarArea" style="width: 100%">
						<div id="loading">loading...</div>
						<div id="calendar"></div>
					</div>
				</div>
				<div class="col-md-5">


					- 시작시간 :
					<input type='text' class="form-control" id='datetimepickerStart' name="startAt"/>
					<!-- <input type="text" name="startAt" value="20200202"><br> -->
					- 종료시간 :
					<input type='text' class="form-control" id='datetimepickerEnd' name="endAt"/>
					<!-- <input type="text" name="endAt" value="20200203"><br> -->

					<input type="hidden" name="drafter" value="${sessionScope.user.mail }"><br>
					- 결재자 :	
					<br>
					<select name="approval" id="approvalList" style="width: 60%;">
						<option hidden="">== 결재자 선택 ==</option>
						<!-- Ajax -->
					</select><br>
					- 부재항목코드 :
					<br>
					<select name="apyCode" id="apycodelist" style="width: 60%;">
						<option hidden="">== 항목 선택 ==</option>
						<!-- Ajax -->
					</select><br>
					
					- 사유 : <br>
					<textarea name="reason" placeholder="연장근무 사유를 입력해주세요." style="width:100%; height: 100px;"></textarea>
					<br>
					<br>
					<input type="submit" value="확인 값 넘김"> &nbsp;&nbsp;
					<input type="reset" value="리셋하시오~">
				</div>
				<div class="col-md-1"></div>

				
			</div>
		</form>


	</div>

	<c:import url="/common/bottom.jsp" />


	<!-- JavaScript files-->
	<script src="./vendor/jquery/jquery.min.js"></script>
	<script src="./vendor/popper.js/umd/popper.min.js"></script>
	<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="./js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
	<script src="./vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="./vendor/chart.js/Chart.min.js"></script>
	<script src="./vendor/jquery-validation/jquery.validate.min.js"></script>
	<script src="./js/charts-home.js"></script>

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

	<!-- date range picker -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	
	<!-- datetime picker -->
	<script src="./js/bootstrap-datetimepicker.min.js"></script>
	<link rel="stylesheet" href="./css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	
	<!-- Main File-->
	<script src="./js/front.js"></script>
	<script src="https://kit.fontawesome.com/5d4e7bbd25.js" crossorigin="anonymous"></script>
	
	<!-- JavaScript files-->
	<script src="./vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<!-- Main File-->
	<link href='./packages/core/main.css' rel='stylesheet' />
	<link href='./packages/daygrid/main.css' rel='stylesheet' />
	<link href='./packages/list/main.css' rel='stylesheet' />
		
	<!-- datetime picker -->
	
  	


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

		}
  	</script>
	
	<script>
		$(function() {
			
	        $('#datetimepickerStart').datetimepicker({
	            format : 'YYYY-MM-DD HH:mm' 
	        });
	
	        $('#datetimepickerEnd').datetimepicker({
	            format : 'YYYY-MM-DD HH:mm' 
	        });
			
		});
		

		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');

			var calendar = new FullCalendar.Calendar(calendarEl, {
				plugins : [ 'interaction', 'dayGrid', 'timeGrid', 'list'],
				header : {
					left : 'prev, next, today',
					center : 'title',
					right : 'dayGridMonth, dayGridWeek, listMonth'
				},

				navLinks : true, // can click day/week names to navigate views
				editable : false,
				eventLimit : false, // allow "more" link when too many events
				businessHours : true,
				events : [ {
					title : 'All Day Event',
					start : '2019-08-01'
				}, {
					title : 'Long Event',
					start : '2019-08-07',
					end : '2019-08-10'
				}, {
					groupId : 999,
					title : 'Repeating Event',
					start : '2019-08-09T16:00:00'
				}, {
					groupId : 999,
					title : 'Repeating Event',
					start : '2019-08-16T16:00:00'
				}, {
					title : 'Conference',
					start : '2019-08-11',
					end : '2019-08-13'
				}, {
					title : 'Meeting',
					start : '2019-08-12T10:30:00',
					end : '2019-08-12T12:30:00'
				}, {
					title : 'Lunch',
					start : '2019-08-12T12:00:00'
				}, {
					title : 'Meeting',
					start : '2019-08-12T14:30:00'
				}, {
					title : 'Happy Hour',
					start : '2019-08-12T17:30:00'
				}, {
					title : 'Dinner',
					start : '2019-08-12T20:00:00'
				}, {
					title : 'Birthday Party',
					start : '2019-08-13T07:00:00'
				}, {
					title : 'Click for Google',
					url : 'http://google.com/',
					start : '2019-08-28'
				} ]
			});

			calendar.render();
		});
	</script>

</body>
</html>

