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

	<!-- Main File-->
	<script src="./js/front.js"></script>
	<script src="https://kit.fontawesome.com/5d4e7bbd25.js" crossorigin="anonymous"></script>
	<!-- JavaScript files-->
	<script src="./vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Main File-->
	<link href='./packages/core/main.css' rel='stylesheet' />
	<link href='./packages/daygrid/main.css' rel='stylesheet' />
	<link href='./packages/list/main.css' rel='stylesheet' />
		
	<!-- date range picker -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	
	<!-- datetime picker -->
	<link rel="stylesheet" href="./css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
  	
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


					- 시작일 :
					<input type="text" name="startAt" value="20200202"><br>
					- 종료일 :
					<input type="text" name="endAt" value="20200203"><br>

					<input type="hidden" name="drafter" value="${sessionScope.user.mail }"><br>
					- 결재자 :
					<select name="approval" id="approvalList">
						<option hidden="">== 결재자 선택 ==</option>
						<!-- Ajax -->
					</select><br>
					- 부재항목코드 :
					<select name="apyCode" id="apycodelist" style="width: 60%; align-items: right">
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

		<input type='text' class="form-control" id='datetimepicker1' />

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
		
		$('input[name="datetimes"]').daterangepicker({
		    timePicker: true,
		    startDate: moment().startOf('hour'),
		    endDate: moment().startOf('hour').add(32, 'hour'),
		    locale: {
		      format: 'M/DD hh:mm A'
	    	}
		});

		$('input[name="daterange"]').daterangepicker({
				opens: 'left'
			}, function(start, end, label) {
				console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
		});
		
        $('#datetimepicker1').datetimepicker();
		
	});
		
		document.addEventListener('DOMContentLoaded', function() {
		  var calendarEl = document.getElementById('calendar');
		
		  var calendar = new FullCalendar.Calendar(calendarEl, {
		
		    plugins: [ 'interaction', 'dayGrid', 'list', 'googleCalendar' ],
		
		    header: {
		      left: 'prev,next today',
		      center: 'title',
		      right: 'dayGridMonth,listYear'
		    },
		
		    displayEventTime: false, // don't show the time column in list view
		
		    // THIS KEY WON'T WORK IN PRODUCTION!!!
		    // To make your own Google API key, follow the directions here:
		    // http://fullcalendar.io/docs/google_calendar/
		    googleCalendarApiKey: 'AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE',
		
		    // US Holidays
		    events: 'en.usa#holiday@group.v.calendar.google.com',
		
		    eventClick: function(arg) {
		      // opens events in a popup window
		      window.open(arg.event.url, 'google-calendar-event', 'width=700,height=600');
		
		      arg.jsEvent.preventDefault() // don't navigate in main tab
		    },
		
		    loading: function(bool) {
		      document.getElementById('loading').style.display =
		        bool ? 'block' : 'none';
		    }
		
		  });
		
		  calendar.render();
		});
	
	</script>

</body>
</html>

