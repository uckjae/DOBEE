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
	<!-- subnav -->
		<div class="col-sm-12" style="height: 50px">
			<div class="col-sm-2"></div>
			<div class="col-sm-2"><a href="#">부재일정 신청</a></div>
			<div class="col-sm-2"><a href="#">연장근무 신청</a></div>
			<div class="col-sm-2"><a href="#">부재일정 관리</a></div>
			<div class="col-sm-2"><a href="#">근무내역 확인</a></div>
			<div class="col-sm-2"></div>
		</div>
     
	<!-- Section -->
	<section class="mt-30px mb-30px">
	
		<h1>부재신청</h1>
		<hr>
		<br>
		
		<h3>사용 연차</h3> $ { usedVacation } 일
		<h3>남은 연차</h3> $ { remainingVacation } 일
		
		
		왜 안나옴?
		<div class="calendarArea" style="width:100%">
			<div id="loading">loading...</div>
			<div id="calendar"></div>
		</div>
		
		<from action="" method="post">
			<select name="year">
				<option value="">년도별</option>
				<option value="2019">2019</option>
				<option value="2020">2020</option>
				
			</select>
			
			<select name="month">
				<option value="">월별</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>		
			</select>
			
			<select name="category">
				<option value="">항목별</option>
				<option value="연차">연차</option>
				<option value="반일연차">반일연차</option>
				<option value="외근">외근</option>
				<option value="출장">출장</option>
				<option value="경조휴가">경조휴가</option>
			</select>
			
			<input type="submit" class="submit">
		</from>
		
		<div class="col-md-10">
			<table id="breakTable" style="width :100%">
						<colgroup>
							<col style="width: 20">
							<col style="width: 40%">
							<col style="width: 20%">
							<col style="width: 20%">
						</colgroup>
						<thead>
							<tr>
								<td colspan="4"></td>
							</tr>
		
							<tr>
								<td>부재 항목</td>
								<td>기간</td>
								<td>일수</td>
								<td>승인 여부</td>
							</tr>
						</thead>
			
						<tbody id="tbody">
							<!-- 여기서 뿌려줄겨 -->
							<tr>
								<td class="tcategory">연차 - 모달~</td>
								<td class="tterm">2019.01.01 ~ 2020.01.03</td>
								<td class="tcount">3</td>
								<td class="tauth">승인</td>
							</tr>
							<tr>
								<td class="tcategory">연차 - 모달~</td>
								<td class="tterm">2019.01.01 ~ 2020.01.03</td>
								<td class="tcount">3</td>
								<td class="tauth">승인</td>
							</tr>
						</tbody>
						
						<tfoot>
							<tr>
								<td colspan="4"></td>
							</tr>
						</tfoot>
						
					</table>
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




