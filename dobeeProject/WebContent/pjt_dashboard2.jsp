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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
	<div class="container">
		<div class="row my-3">
			<div class="col">
				<h4>Bootstrap 4 Chart.js - Chart</h4>
			</div>
		</div>
		<div class="row my-2">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<canvas class="myChart"></canvas>
					</div>
					<div class="card-body text-center text-align-center">
						<h3>Multi</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="row my-2">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<canvas class="myChart"></canvas>
					</div>
					<div class="card-body text- text-">
						<h3>Pie</h3>
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
	<script>
		const mydata = [ 10, 20, 30, 40 ];
		const mydataHalf = [ 5, 10, 20, 7 ]; // var ctx = document.getElementById("myChart"); var ctx = document.getElementsByClassName("myChart"); var mixedChart = { type: 'bar', labels: ['1', '2', '3', '4'], datasets : [ { label: 'Bar Dataset', data : mydata, backgroundColor: 'rgba(256, 0, 0, 0.1)' }, { label: 'Line Dataset', data: mydataHalf, backgroundColor: 'transparent', borderColor: 'skyblue', type: 'line' } ] }; var myChart = new Chart(ctx, { type: 'bar', data: mixedChart, options: { legend: { display: true } } }); // var myChart = new Chart(ctx, { // type: 'bar', // data: mixedChart, // options: { // legend: { // display: true // } // } // });
	</script>
</body>
</html>

