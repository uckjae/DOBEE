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
  </head>
 
  <body>
    <!-- Side Navbar -->
    <nav class="side-navbar">
    <c:import url="/common/left.jsp" />
    </nav>

    <div class="page">
      <!-- navbar-->
      <c:import url="/common/top.jsp"/>
	

	<script>
		window.onload = function(){
			var app = new Vue ({
				el : '#navbar',
				data : []
			});

			var app = new Vue({
				el : '#dropdown',
				data : {
					val : ''
				}
			})			

			$( "#datepicker" ).datepicker();
			
			$('#spinner').spinner();
				$('#spinner').slider({
					range : true,
					values : [0, 23]
				});

			$('#spinner2').spinner();
				$('#spinner2').slider({
					range : true,
					values : [0,59]
				});
		}
		
  	</script>
     
    <div id="navbar">
	  <b-card title="Card Title" no-body>
	    <b-card-header header-tag="nav">
	      <b-nav card-header pills>
	        <b-nav-item active>부재일정 신청</b-nav-item>
	        <b-nav-item><a href="extendApply.do">연장근무 신청</a></b-nav-item>
	        <b-nav-item><a href="breakManage.do">부재 일정 관리</a></b-nav-item>
	        <b-nav-item disabled><a href="workManage.do">근무 내역 확인</a></b-nav-item>
	        <b-nav-item disabled>부재 관리</b-nav-item>
	        <b-nav-item disabled>연장근무 관리</b-nav-item>
	      </b-nav>
	    </b-card-header>
	
	    <b-card-body class="text-center">
	      <b-card-text>
	     	<h1 style="text-align: left">부재 신청</h1>
	     	<br>
	     	<div class="col-sm-3" style="background-color: yellow"></div>
	     	
	     	<div class="col-sm-6" id="jgContainer">
				<div class="formDiv">
					<form action="" method="post">					 
						<!-- 
						<label for="from">From</label>
						<input type="text" id="from" name="from">
						<label for="to">to</label>
						<input type="text" id="to" name="to">
						 -->
						
						 
						<div id="datepicker"></div>
						
						시간
						<input id="spinner" type="text"/>
						분
						<input id="spinner2" type="text"/>
						<br>
						부재항목			
						<select id="category">
							<option value="">항목별</option>
							<option value="연차">연차</option>
							<option value="반일연차">반일연차</option>
							<option value="외근">외근</option>
							<option value="출장">출장</option>
							<option value="경조휴가">경조휴가</option>
						</select>
						<br>
						결재자
						<select id="approval">
							<option value = "">결재자 선택</option>
							<option value  = "김일번">김일번</option>
							<option value = " 김이번">김이번</option>
						</select>
						<br>
						사유
						<textarea rows="5" cols="500" placeholder="1000 btye 이내 내용을 입력하십시오."></textarea>
						
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
	<section class="mt-30px mb-30px">
	
		왜 안나옴?
		<div class="calendarArea" style="width:100%">
			<div id="loading">loading...</div>
			<div id="calendar"></div>
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
  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="/resources/demos/external/globalize/globalize.js"></script>
  <script src="/resources/demos/external/globalize/globalize.culture.de-DE.js"></script>
  <script src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script>
  
	<script>
	$( function() {
		
	})
	  
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




