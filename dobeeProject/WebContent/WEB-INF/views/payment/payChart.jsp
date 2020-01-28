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

//연도 셀렉트 체인지 함수
function chageYYYYSelect(){

	
	//아작스로 받아온 데이터 전역변수에 담기위해 전역변수 선언
	let completeData = [];
	let yyyy = $('#yyyy option:selected').val();
	let month = $('#month option:selected').val();	
	var usedate = [];
	var usedate_yyyy =[];
	var usedate_month = [];
	if (month == '연도만'){
		// 년도만 가지고 오는 아작스 쿼리문
		let useDateData = {
				"usedate":yyyy
				};
		$.ajax({
			type:'POST',
			url: 'changeYYYYSelect.do',
			data: useDateData,
			success:function(data){
					completeData = data;
				},
			complete:function(){
				for(let i = 0 ; i < completeData.length; i++){
					let temp = new Date(completeData[i].usedate).format("yyyy-MM-dd");
					usedate.push(temp);
					temp = new Date(completeData[i].usedate).format("yyyy");
					usedate_yyyy.push(temp);
					temp = new Date(completeData[i].usedate).format("MM");
					usedate_month.push(temp);
				}
					// 여기서 부터 차트 그리기
					var xData = [];	
					for(let i = 0 ; i<completeData.length; i++){
						xData.push(completeData[i].entry);
					}	
					var yData = [];		
					for(let i = 0 ; i<completeData.length; i++){
						yData.push(completeData[i].cost);
					}
					var chartData =  {
							xData,
							yData
						}

					console.log("연도만 아작스 : 차트 데이터");
					console.log(xData);
					console.log(yData);
					console.log(chartData);

					//기존에 있던 차트 지우고 다시 새로 만들어서 뿌림
				 	$('#myChart').remove();
				 	var newchart = "<canvas id='myChart' width='auto' height='auto'></canvas>";
				 	$('#chartDiv').append(newchart);



					
					var ctx = document.getElementById("myChart").getContext('2d');
					var data = {
						labels: xData,
					    datasets: [{
					        barPercentage: 0.5,
					        barThickness: 6,
					        maxBarThickness: 8,
					        minBarLength: 2,
					        data: yData
					    }]
					};
					var options =  {
					        scales: {
					            yAxes: [{
		 			                ticks: {
					                    beginAtZero: true
					                }
					            }],
					            xAxes:[{
									
						            
						        }],
					        },
					    };
					// 전에 있던 차트 지우고 다시 만들어야함
				
				 	
				    var myChart = new Chart(ctx, {
						    type: 'bar',
						    data: data,
						    options: options
					});
					
						
					
					//차트 끝
			},
			error:function(){
					console.log("아작스 실패");

				}
			});
	}else{
		// 년도와 월도 같이 가져오는 아작스 쿼리문
		// 연도데이터와 월 데이터를 같이 받기 
		let xData1 = [];
		let yData1 = [];
		useDateData = {
				"yyyy":yyyy,
				"month":month
				 };
		$.ajax({
			type:'POST',
			url: 'changeYYYYAndMonth.do',
			data: useDateData,
			success:function(data){
					completeData = data;
					console.log("여기는 연도 + 월 나오는 차트");
					console.log(data);
				},
			complete:function(){
				for(let i = 0 ; i < completeData.length; i++){
					let temp = new Date(completeData[i].usedate).format("yyyy-MM-dd");
					usedate.push(temp);
					temp = new Date(completeData[i].usedate).format("yyyy");
					usedate_yyyy.push(temp);
					temp = new Date(completeData[i].usedate).format("MM");
					usedate_month.push(temp);
				}
						
				// 여기서 부터 차트 그리기
				for(let i = 0 ; i<completeData.length; i++){
					xData1.push(completeData[i].entry);
				}	
				for(let i = 0 ; i<completeData.length; i++){
					yData1.push(completeData[i].cost);
				}
				var chartData1 = {
						xData1,
						yData1
				}

				console.log("연도 + 월 같이나오는 아작스 : 차트 데이터");
				console.log(xData1);
				console.log(yData1);
				console.log(chartData1);	

				//기존에 있던 차트 지우고 다시 새로 만들어서 뿌림
			 	$('#myChart').remove();
			 	var newchart = "<canvas id='myChart' width='auto' height='auto'></canvas>";
			 	$('#chartDiv').append(newchart);


				
				var ctx = document.getElementById("myChart").getContext('2d');
				var data = {
					labels: xData1,
				    datasets: [{
				    	label:
				    		['연도-월별 항복별 비용'],
					    
				        barPercentage: 0.5,
				        barThickness: 6,
				        maxBarThickness: 8,
				        minBarLength: 2,
				        data: yData1
				    }]
				};
				var options =  {
			        scales: {
			            yAxes: [{
 			                ticks: {
			                    beginAtZero: true
			                }
			            }],
			            xAxes:[{
				        }],
			        },
			    };
			    
				
					
				var myChart = new Chart(ctx, {
				    type: 'bar',
				    data: data,
				    options: options
				});
				
				// 차트 끝
			},
	
			error:function(){
					console.log("아작스 실패");
				}
			});
	}//else 문 종료
}// chageYYYYSelect()함수 종료 

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
						<select name="yyyy" id="yyyy" onchange="chageYYYYSelect()">
						</select>
						<select name="month" id="month" onchange="chageYYYYSelect()">
							<option value="연도만" selected>연도만</option>
							<option value="01"> 1월 </option>
							<option value="02"> 2월 </option>
							<option value="03"> 3월 </option>
							<option value="04"> 4월 </option>
							<option value="05"> 5월 </option>
							<option value="06"> 6월 </option>
							<option value="07"> 7월 </option>
							<option value="08"> 8월 </option>
							<option value="09"> 9월 </option>
							<option value="10"> 10월 </option>
							<option value="11"> 11월 </option>
							<option value="12"> 12월 </option>
						</select>
					</div>
					
					<div id=chartDiv>
					<canvas id="myChart" width="auto" height="auto"></canvas>
					</div>
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
		// 날짜 연도 정렬하는 함수 
		var bubble_yyyy= function(array) {
			  var length = array.length;
			  var i, j, temp;
				  for (i = 0; i < length - 1; i++) { // 순차적으로 비교하기 위한 반복문
				    for (j = 0; j < length - 1 - i; j++) { // 끝까지 돌았을 때 다시 처음부터 비교하기 위한 반복문
				      if (array[j] < array[j + 1]) { // 두 수를 비교하여 앞 수가 뒷 수보다 크면
				        temp = array[j]; // 두 수를 서로 바꿔준다
				        array[j] = array[j + 1];
				        array[j + 1] = temp;
				      }
				    }
				  }
			  return array;
		};


		
		// 정렬된 날짜 연도 배열을 다시 중복 제거하는 함수
		function delDuple(array){
			var delComplete = [];
			var temp
			for(let i = 0 ; i < array.length;  i++){
				temp = array[i];
				// 하나씩 담아서 다음에 또 들어온 원소가 같다면 새로운 배열에 담지 않는다.
					if(delComplete.indexOf(temp) == -1){delComplete.push(temp);}
			}
			return delComplete;
		}
		
		
		
		// 날짜 받아와서 포맷팅한다음에 저장하는 배열 
		let usedate1 = [];
		let usedate_yyyy1 =[];
		let usedate_month1 = [];
		let completeData1;
			$.ajax({
				url:"comeHereYYYY.do",
				type:'POST',
				success:function(data){
					//여기에서는 for문이 느려서 소용이 없다 밑에 complete 에 데이타를 전달하기 위해 전역변수에다 받은데이터 넣고					
					completeData1 = data;
					},
				complete:function(){
						
					for(let i = 0 ; i < completeData1.length; i++){
						let temp = new Date(completeData1[i].usedate).format("yyyy-MM-dd");
						usedate1.push(temp);
						temp = new Date(completeData1[i].usedate).format("yyyy");
						usedate_yyyy1.push(temp);
						temp = new Date(completeData1[i].usedate).format("MM");
						usedate_month1.push(temp);
					}
						// 배열 중에서 가장 큰 숫자부터 정렬하기 
						var sort_usedate_yyyy =bubble_yyyy(usedate_yyyy1);
						var resultUseDate = delDuple(sort_usedate_yyyy);
						// 받아온 데이터 연도 셀렉트 태그에 붙여넣기
						for(let i = 0; i < resultUseDate.length; i++){
							$('#yyyy').append("<option value=" + resultUseDate[i] +">" + resultUseDate[i]  + "</option>");
						}

						// 받아온 데이터에서 가장 최신의 연도
						var defaultYYYY = resultUseDate[0];
					    let sendData = {
								'usedate':defaultYYYY
						}
						let tempData =[];
						// 기본값 연도에 해당하는 차트 데이터 불러오기 아작스 시작
						$.ajax({
							url:'changeYYYYSelect.do',
							data:sendData,
							type:'POST',
							success:function(data){
									tempData = data;
									console.log("여기는 기본연도만 나오는 아작스");
								},
							complete:function(){
								//첫 기본 차트 화면 뿌리기 시작 
								// 여기서 부터 차트 그리기
								var xData = [];	
								for(let i = 0 ; i<tempData.length; i++){
									xData.push(tempData[i].entry);
								}	
								console.log("여기 확인해보세여 x " + xData);
								var yData = [];		
								for(let i = 0 ; i<tempData.length; i++){
									yData.push(tempData[i].cost);
								}
								console.log(yData);
								var ctx = document.getElementById("myChart").getContext('2d');
								var data = {
									labels:xData,
								    datasets: [{
								        barPercentage: 0.5,
								        barThickness: 6,
								        maxBarThickness: 8,
								        minBarLength: 2,
								        data: yData,
								    }]
								};
								var options =  {
								        scales: {
								            yAxes: [{
					 			                ticks: {
								                    beginAtZero: true
								                }
								            }],
								            xAxes:[{
												
									            
									        }],
								        },
								    };
							    
								var myChart = new Chart(ctx, {
								    type: 'bar',
								    data: data,
								    options: options,
								});
								//차트 끝


								},// 두번째 아작스 컴플릿트 끝
							error:function(){
									console.log("디폴트 연도 아작스에서 에러");
								}	
							}); // 두 번째 아작스 끝
						
					}, // 첫 번째 아작스 complete 끝
				error:function(){
						console.log("연도 불러오는데서 이미 에러가 났네요");
					},
				});// 아작스 끝 

		



				
		</script>
	</body>
</html>