<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed">
<head>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<c:import url="/common/HeadTag.jsp"/>

<script>
/* 날짜 포맷 함수 */
Date.prototype.format = function(f) {
	if (!this.valueOf()) return " ";

	var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	var d = this;
	
	return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
		switch ($1) {
			case "yyyy": return d.getFullYear();
			case "yy": return (d.getFullYear() % 1000).zf(2);
			case "MM": return (d.getMonth() + 1).zf(2);
			case "dd": return d.getDate().zf(2);
			case "E": return weekName[d.getDay()];
			case "HH": return d.getHours().zf(2);
			case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
			case "mm": return d.getMinutes().zf(2);
			case "ss": return d.getSeconds().zf(2);
			case "a/p": return d.getHours() < 12 ? "오전" : "오후";
			default: return $1;
		}
	});
};

String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};


</script>
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
						<h2>비용 차트</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>비용</span></li>
								<li><span>비용 차트</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
					<!-- 작업 여기부터~!~!~!~~! -->
					
					
					<div style="float:right;">
						<select name="yyyy" id="yyyy">
						</select>
						
						
						
						<select name="month" id="month">
						</select>
					</div>
					
					<canvas id="myChart" width="auto" height="auto"></canvas>
					
					
					<!-- start: page -->
					<!-- end: page -->
				</section>
			</div>




			<!-- 오른쪽 사이드바!! -->
		<c:import url="/common/RightSide.jsp"/>
	
			
			<!-- 오른쪽 사이드바 끝!! -->
		</section>

		<c:import url="/common/BottomTag.jsp"/>
		<script>
		// 날짜 받아와서 포맷팅한다음에 저장하는 배열 
		var usedate = [];
		var usedate_yyyy =[];
		var usedate_month = [];
		var completeData;
			$.ajax({
				url:"comeHereYYYY.do",
				type:'POST',
				success:function(data){
					//여기에서는 for문이 느려서 소용이 없다 밑에 complete 에 데이타를 전달하기 위해 전역변수에다 받은데이터 넣고					
					completeData = data;
					},
				complete:function(){
					for(let i = 0 ; i < completeData.length; i++){
						console.log("여기왜 안타냐");
						let temp = new Date(completeData[i].usedate).format("yyyy-MM-dd");
						usedate.push(temp);
						temp = new Date(completeData[i].usedate).format("yyyy");
						usedate_yyyy.push(temp);
						temp = new Date(completeData[i].usedate).format("MM");
						usedate_month.push(temp);
					}
					//여기서 부터 받은 데이타 셀렉트 태그옵션에 넣자 
					//연도 부터 넣자
					for(let i = 0; i < usedate_yyyy.length; i++){
						$('#yyyy').append("<option value=" + usedate_yyyy[i] +">" + usedate_yyyy[i]  + "</option>");
					}
					
					//월을 넣자
					for(let i = 0; i < usedate_month.length; i++){
						$('#month').append("<option value=" + usedate_month[i] +">" + usedate_month[i]  + "</option>");
					}
					
					
					// 연도와 월별 우선 불러온 다음에 그에해당하는 값을 다시 받아서 그에 대한 데이터만 불러오는 아작스
					var chartData = null;
					$.ajax({
						url:"paymentAjaxChart.do",
						type:"POST",
						beforeSend:function(){
								
							},
						complete:function(){
							// 차트 그리기
							// 항목별로 뽑아서 entry가져와야함
							// chartData 로data 가져왔고, 이제 chartData 에서가공을 한 뒤
							/*
								x 축에는 entry를 뿌리고 
								y 축에는 cost를 뿌리고 
								연도별로 정리해서, 
								먼저 useDate 를 가져와서 useDate 별로 
							
							*/
							var ctx = document.getElementById("myChart").getContext('2d');
							var data = {
							    datasets: [{
							        barPercentage: 0.5,
							        barThickness: 6,
							        maxBarThickness: 8,
							        minBarLength: 2,
							        data: chartData,
							    }]
							};
								var options =[];
								var myBarChart = new Chart(ctx, {
								    type: 'bar',
								    data: data,
								    options: options
								});
							},
						success:function(data){
							console.log("아작스 성공");
							chartData = data;
							},
						error:function(){
							console.log("차트 데이터 불러오는 데서 에러가 났습니다.");
							},
					});// 두 번째 아작스 끝
					}, // 첫 번째 아작스 complete 끝
				error:function(){
						console.log("연도 불러오는데서 이미 에러가 났네요");
					},
				});
		</script>
	</body>
</html>