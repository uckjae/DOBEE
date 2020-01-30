<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<!-- <html lang="en" style="height: 100%"> -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>부트스트랩 차트그리기</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
	<div class="container">
		<div class="row my-3">
			<div class="col-12">
				<h4>Bootstrap 4 Chart.js - Chart</h4>
			</div>
		</div>
		<div class="row my-2">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<canvas id="myChart1"></canvas>
					</div>
					<div class="card-footer text-center text-dark">
						<h3>Pie</h3>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<canvas id="myChart2"></canvas>
					</div>
					<div class="card card-body text-center bg-primary">
						<h3>Doughnut</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 부트스트랩 -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<!-- 차트 -->
	<script> data = { datasets: [{ backgroundColor: ['red','yellow','blue'], data: [10, 20, 30] }], // 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남 labels: ['red','yellow','blue'] }; // 가운데 구멍이 없는 파이형 차트 var ctx1 = document.getElementById("myChart1"); var myPieChart = new Chart(ctx1, { type: 'pie', data: data, options: {} }); // 도넛형 차트 var ctx2 = document.getElementById("myChart2"); var myDoughnutChart = new Chart(ctx2, { type: 'doughnut', data: data, options: {} }); </script>
</body>
</html>

