<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed">
<head>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<c:import url="/common/HeadTag.jsp"/>

<script>
//월 배열 오름차순 정렬하기 함수 
var bubble_month= function(array) {
		  var length = array.length;
		  var i, j, temp;
			  for (i = 0; i < length - 1; i++) { // 순차적으로 비교하기 위한 반복문
			    for (j = 0; j < length - 1 - i; j++) { // 끝까지 돌았을 때 다시 처음부터 비교하기 위한 반복문
			      if (array[j] > array[j + 1]) { // 두 수를 비교하여 앞 수가 뒷 수보다 크면
			        temp = array[j]; // 두 수를 서로 바꿔준다
			        array[j] = array[j + 1];
			        array[j + 1] = temp;
			      }
			    }
			  }
		  return array;
	};

// 월 배열 중복제거하는 함수
function delDupleMonth(array){
	var delComplete = [];
	var temp
	for(let i = 0 ; i < array.length;  i++){
		temp = array[i];
		// 하나씩 담아서 다음에 또 들어온 원소가 같다면 새로운 배열에 담지 않는다.
			if(delComplete.indexOf(temp) == -1){delComplete.push(temp);}
	}
	return delComplete;
}

	
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
	let usedate = [];
	let usedate_yyyy =[];
	let usedate_month = [];
	if (month == '연도만'){
		// 년도만 가지고 오는 아작스 쿼리문
		let useDateData = {
				"usedate":yyyy
				};
		$.ajax({
			type:'POST',
			url: 'ajax/paymentChart/changeYYYYSelect.do',
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
					    	label:
					    		['연도 전체 항목별 비용'],
					    	  	barPercentage: 0.5,
						        barThickness: 50,
						        maxBarThickness: 60,
						        minBarLength: 40,
						        backgroundColor : [
						        	  'rgba(0, 10, 10, 0.5)',
									  'rgba(20, 20, 200, 0.5)',
									  'rgba(203, 210, 34, 0.5)',
									  'rgba(70,  2, 104, 0.5)',
									  'rgba(3, 210, 34, 0.7)',
									  'rgba(7, 90, 4, 0.7)',
									  'rgba(0, 100, 100, 0.7)',
									  'rgba(100, 50, 80, 0.7)'
							        ],
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

					

					//여기서 부터 해당 연도에 따른 월 구해오기
					let monthData = [];
					let realmonthData = [];
					console.log("여기는 연도만 : 월가져오기 아작스");
					console.log(useDateData);
					$.ajax({
						type:'POST',
						url: 'ajax/paymentChart/giveMeMonth.do',	
						data: useDateData,
						success:function(data){
							console.log("월 구해오기 아작스 성공");
							monthData = data;
						},
						complete:function(){
							console.log(monthData);
							//monthData[i].usedate 월만 뽑아내기
							for(let i = 0 ; i<monthData.length; i++){
								let temp = new Date(monthData[i].usedate).format("MM");
								realmonthData.push(temp);	
							}
							// 월 배열 순서대로 오름차순으로 정렬하기
							let temp1 = bubble_month(realmonthData);
							// 다시 정렬된 배열 중복 제거하기
							let finalMonth = delDupleMonth(temp1);
							// 이제 다시 이 월 배열을 월셀렉트 태그에 붙이기
							
							$('#month').empty(); //기존에 붙은 월들 삭제하고 다시 새로운 월들 붙이기
							$('#month').append("<option value=" + '연도만' +">" + '연도만'+ "</option>");
							for(let i = 0; i < finalMonth.length; i++){
								$('#month').append("<option value=" + finalMonth[i] +">" + finalMonth[i] +'월'+ "</option>");
							}
						},
						error:function(){
							console.log("월 구해오기 아작스에서 에러났습니다. ")
						}
					}); //월 구하기 아작스 종료
			}, //컴플릿트 종료
			error:function(){
					console.log("아작스 실패");

				}
			});// 아작스 종료
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
			url: 'ajax/paymentChart/changeYYYYAndMonth.do',
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
				

				console.log("연도 + 월 같이나오는 아작스 : 차트 데이터");
				console.log(xData1);
				console.log(yData1);

				//기존에 있던 차트 지우고 다시 새로 만들어서 뿌림
			 	$('#myChart').remove();
			 	var newchart = "<canvas id='myChart' width='auto' height='auto'></canvas>";
			 	$('#chartDiv').append(newchart);
				
				var ctx = document.getElementById("myChart").getContext('2d');
				var data = {
					labels: xData1,
				    datasets: [{
				    	label:['연도-월 항목별 비용'],
				    	barPercentage: 0.5,
				        barThickness: 50,
				        maxBarThickness: 60,
				        minBarLength: 40,
				        backgroundColor : [
				        	  'rgba(0, 10, 10, 0.5)',
							  'rgba(20, 20, 200, 0.5)',
							  'rgba(203, 210, 34, 0.5)',
							  'rgba(70,  2, 104, 0.5)',
							  'rgba(3, 210, 34, 0.7)',
							  'rgba(7, 90, 4, 0.7)',
							  'rgba(0, 100, 100, 0.7)',
							  'rgba(100, 50, 80, 0.7)'
					        ],
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
				//여기서부터 아작스로 월 데이터 불러오기 시작
				let monthData = [];
				let realmonthData = [];
				let sendData = {
						'usedate':yyyy
				};
				$.ajax({
					type:'POST',
					url: 'ajax/paymentChart/giveMeMonth.do',	
					data: sendData,
					success:function(data){
						monthData = data;
					},
					complete:function(){
						console.log(monthData);
						//monthData[i].usedate 월만 뽑아내기
						for(let i = 0 ; i<monthData.length; i++){
							let temp = new Date(monthData[i].usedate).format("MM");
							realmonthData.push(temp);	
						}
						// 월 배열 순서대로 오름차순으로 정렬하기
						let temp1 = bubble_month(realmonthData);
						// 다시 정렬된 배열 중복 제거하기
						let finalMonth = delDupleMonth(temp1);
						// 이제 다시 이 월 배열을 월셀렉트 태그에 붙이기
						
						$('#month').empty(); //기존에 붙은 월들 삭제하고 다시 새로운 월들 붙이기
						var checkMonth = false;
						console.log(checkMonth);
						// 사용자가 월을 선택하고 다시 연도를 바꿀 때 그월에 대한 데이터가 없는 연도를 선택하게되면 '연도만'으로 자동으로 셀렉트되게해야함 
						for(let i = 0; i < finalMonth.length; i++){
							if(finalMonth[i] == month){
								checkMonth = true;
							}
						}
						if(checkMonth){
							//해당 월이 그 연도에 데이타가 있으면 그냥 붙여주고 
							$('#month').append("<option value=" + '연도만' +">" + '연도만'+ "</option>");
							for(let i = 0; i < finalMonth.length; i++){
								if(finalMonth[i] == month){
										$('#month').append("<option selected value=" + finalMonth[i] +">" + finalMonth[i] +'월'+ "</option>");
									}else{
										$('#month').append("<option value=" + finalMonth[i] +">" + finalMonth[i] +'월'+ "</option>");
									}
							}
						}else{
							// 없다면, 셀렉티드 속성을 붙여서 달아줘야함
							$('#month').append("<option selected value=" + '연도만' +">" + '연도만'+ "</option>");
							chageYYYYSelect(); // 다시 이 함수 콜백 시킴 연도만 있는 건 위에 있으므로
						}	
					},
					error:function(){
						console.log("월 구해오기 아작스에서 에러났습니다. ")
					}
				}); //월 구하기 아작스 종료
				
			}, // 월-연도 컴플릿트 끝 
			error:function(){
					console.log("아작스 실패");
				}
			}); //월-연도 가져오기 아작스 끝
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
								<li style="padding-right:30px;"><a href="#" style="cursor:default;"> <i class="fa fa-chevron-left"></i></a></li>
							</ol>
						</div>
					</header>
					<!-- 작업 여기부터~!~!~!~~! -->
					
					
					<div style="float:right;">
						<select name="yyyy" id="yyyy" onchange="chageYYYYSelect()">
						</select>
						<select name="month" id="month" onchange="chageYYYYSelect()">
						</select>
					</div>
					
					<div id=chartDiv>
					<canvas id="myChart" width="auto" height="auto"></canvas>
					</div>
					<!-- start: page -->
					
					<!-- end: page -->
				</section>
			</div>




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
				url:"ajax/paymentChart/comeHereYYYY.do",
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
							url:'ajax/paymentChart/changeYYYYSelect.do',
							data:sendData,
							type:'POST',
							success:function(data){
									tempData = data;
									console.log("여기는 기본연도만 나오는 아작스");
								},
							complete:function(){
								//첫 기본 차트 화면 뿌리기 시작 
								// 여기서 부터 차트 그리기
								if(tempData.length == 0){
									swal({
										   title: "데이타가 없습니다.",
										   text: "가장 최근 연도의 데이타가 없습니다. 다른 연도를 선택해보세요.",
										   icon: "info" //"info,success,warning,error" 중 택1
										}).then((YES) => {
									});	
								};
								
								var xData = [];	
								for(let i = 0 ; i<tempData.length; i++){
									xData.push(tempData[i].entry);
								}	
								console.log("여기 확인해보세여 x " + xData);
								var yData = [];		
								for(let i = 0 ; i<tempData.length; i++){
									yData.push(tempData[i].cost);
								}

							
								var ctx = document.getElementById("myChart").getContext('2d');
								var data = {
									labels:xData,
								    datasets: [
									{
								    	label:
								    		['연도 전체 항목별 비용'],
								        barPercentage: 0.5,
								        barThickness: 50,
								        maxBarThickness: 60,
								        minBarLength: 40,
								        data: yData,
								        backgroundColor : [
								        	  'rgba(0, 10, 10, 0.5)',
											  'rgba(20, 20, 200, 0.5)',
											  'rgba(203, 210, 34, 0.5)',
											  'rgba(70,  2, 104, 0.5)',
											  'rgba(3, 210, 34, 0.7)',
											  'rgba(7, 90, 4, 0.7)',
											  'rgba(0, 100, 100, 0.7)',
											  'rgba(100, 50, 80, 0.7)'
									        ],
						      	    
								   		 },
								    ]
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

								//초기 디폴트 연도에 해당되는 월 데이터 받아서 셀렉트에 붙이기
								var monthData = [];
								var realmonthData = [];
								$.ajax({
									type:'POST',
									url: 'ajax/paymentChart/giveMeMonth.do',	
									data: sendData,
									success:function(data){
										monthData = data;
									},
									complete:function(){
										for(let i = 0 ; i<monthData.length; i++){
											let temp = new Date(monthData[i].usedate).format("MM");
											realmonthData.push(temp);	
										}
										// 월 배열 순서대로 오름차순으로 정렬하기
										let temp1 = bubble_month(realmonthData);
										// 다시 정렬된 배열 중복 제거하기
										var finalMonth = delDupleMonth(temp1);
										// 이제 다시 이 월 배열을 월셀렉트 태그에 붙이기
										
										$('#month').empty(); //기존에 붙은 월들 삭제하고 다시 새로운 월들 붙이기
										$('#month').append("<option value=" + '연도만' +">" + '연도만'+ "</option>");
										for(let i = 0; i < finalMonth.length; i++){
											$('#month').append("<option value=" + finalMonth[i] +">" + finalMonth[i] +'월'+ "</option>");
										}
									},
									error:function(){
										console.log("월 구해오기 아작스에서 에러났습니다. ")
									}
								});
								//월 셀렉트 끝

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