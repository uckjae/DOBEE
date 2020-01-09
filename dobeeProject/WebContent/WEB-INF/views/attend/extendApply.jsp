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
    
    
    <!-- JavaScript files-->
    <script src="./vendor/jquery/jquery.min.js"></script>
    <script src="./vendor/popper.js/umd/popper.min.js"> </script>
    <script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="./js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="./vendor/jquery.cookie/jquery.cookie.js"> </script>
    
    <script src="./vendor/chart.js/Chart.min.js"></script>
    <script src="./vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="./vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="./js/charts-home.js"></script>
    <!-- Main File-->
    <script src="./js/front.js"></script>
    <script src="https://kit.fontawesome.com/5d4e7bbd25.js" crossorigin="anonymous"></script>
    
    <!-- Google Calendar -->
    <link href='./packages/core/main.css' rel='stylesheet' />
	<link href='./packages/daygrid/main.css' rel='stylesheet' />
	<link href='./packages/list/main.css' rel='stylesheet' />
	<script src='./packages/core/main.js'></script>
	<script src='./packages/interaction/main.js'></script>
	<script src='./packages/daygrid/main.js'></script>
	<script src='./packages/list/main.js'></script>
	<script src='./packages/google-calendar/main.js'></script>
  
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/demos/external/globalize/globalize.js"></script>
	<script src="/resources/demos/external/globalize/globalize.culture.de-DE.js"></script>
	<script src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script>
	
	<!-- JQUERY datetime picker -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

  </head>
 
  <body>
  
  	<script>
		window.onload = function(){
			var app = new Vue ({
				el : '#navbar',
				data : []
			});
		}
  	</script>
  	
    <!-- Side Navbar -->
    <nav class="side-navbar">
    <c:import url="/common/left.jsp" />
    </nav>

    <div class="page">
      <!-- navbar-->
      <c:import url="/common/top.jsp"/>
	<div id="navbar">
	  <b-card title="Card Title" no-body>
	    <b-card-header header-tag="nav">
	      <b-nav card-header pills>
	        <b-nav-item >부재일정 신청</b-nav-item>
	        <b-nav-item active>연장근무 신청</b-nav-item>
	        <b-nav-item><a href="breakManage.do">부재 일정 관리</a></b-nav-item>
	        <b-nav-item ><a href="workManage.do">근무 내역 확인</a></b-nav-item>
	        <b-nav-item >부재 관리</b-nav-item>
	        <b-nav-item >연장근무 관리</b-nav-item>
	      </b-nav>
	    </b-card-header>
	
	    <b-card-body class="text-center">
	      <b-card-text>
	     	<h1 style="text-align: left">연장근무 신청</h1>
	     	<br>
	     	<div class="col-sm-2" style="background-color: yellow; width:20%"></div>
	     	
	     	<div class="col-sm-6" id="jgContainer">
				<div class="formDiv">
					
					<form action="" method="post">					 
						<table style="width: 100%; height: 500px;" style="margin:10px; align-self: center;" >
							<tr>
								<td rowspan="4" width="50%"> <div class="calendarArea" style="width:100%">
									<div id="loading">loading...</div>
									<div id="calendar"></div>
									</div>
								</td>
								<td>이거 그냥 데이터 피커로 바꿔야함... 아니면 뿌려주던가</td>
								<td></td>
							</tr>
								
							<tr>
								<td>기간 선택</td>
								<td><input type="text" name="datetimes" style="width:250px"/></td>
							</tr>
							
							<tr>
								<td>시작 시간</td>
								<td><input type="text" name="startTime" id="startTime"/></td>
							</tr>
							
							<tr>
								<td>종료 시간</td>
								<td><input type="text" name="endTime" id="endTime"/></td>
							</tr>
											
							
						
							<tr>
								<td colspan="3">사유</td>
							</tr>
							<tr>
								<td colspan="3">
<!-- 									<input type=text style="width:100%; height:100%"placeholder="1000 btye 이내 내용을 입력하십시오." id="inputReason" >
 -->
									<textarea style="width: 100%; height: 100%" placeholder="1000 btye 이내 내용을 입력하십시오." id="inputReason2"></textarea>
								</td>
							</tr>
						</table>
						
						<br>
						
						<input type="submit" value="확인">
						<input type="reset" value="초기화">
						
					</form>
				</div>
			</div>

	      </b-card-text>
	    </b-card-body>
	  </b-card>
	</div>

	<!-- Section -->
	
	<c:import url="/common/bottom.jsp"/>   

    <!-- Main File-->
    <script src="./js/front.js"></script>
    <script src="https://kit.fontawesome.com/5d4e7bbd25.js" crossorigin="anonymous"></script>

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





<!-- 
<section class="mt-30px mb-30px">
	<h1>연장근무 신청</h1>
	
	<hr>
	
	<form action="" method="post">
		기간
		<input type="text" placeholder="옆 버튼을 눌러기간을 설정하세요!" class="inputTerm" id="inputTerm">
		<input type="button" class="calBtn" id="calBtn">
		왜 안나옴?
		<div class="calendarArea" style="width:100%">
			<div id="loading">loading...</div>
			<div id="calendar"></div>
		</div>
		
		<div class="col-md-12">
			시간
			<input id="spinner" type="text"/>
			분
			<input id="spinner2" type="text"/>
			<br>
			
			사유<br>
			<textarea name="reason" id="reason" style="width:100%; height:60px;" placeholder="1000 byte 이내 내용을 입력하세요." ></textarea>
			
			<input type="submit" class="submit" name="submit" VALUE="확인">
			<input type="reset" value="reset" value="초기화">			
			
		</div>
	</form>
	</div>
	
</section>
 -->



