<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body 
{
	
	margin : 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items : center;
	min-height : 100vh;
	background : #fff;

}

.container
{
	position : relative;
	width:90%;
	display : grid;
	grid-template-columns : repeat(auto-fill, minmax(260px), 1fr));
	grid-template-rows : auto;
	grid-gap : 0 40px;
	
}
.container .box 
{
	position : relative;
	height : 400px;
	background :  #807c7e;
	display: flex;
	justify-content: center;
	align-items : center;
	/* border: 1px solid #000; */
}

.container .box:before
{
	content : '';
	position : absolute;
	top : -2px;
	left : -2px;
	right : -2px;
	bottom : -2px;
	background: #fff;
	transform : skew(2deg, 2deg);
	z-index : -1;
}

.container .box:nth-child(1):before
{
	background: linear-gradient(600deg, #807c7e, #f4f6f5);

}
.container .box:after
{
	content : '';
	position : absolute;
	top : 0;
	left : 0;
	width : 50%;
	height : 100%;
	background: rgba(255,255,255,0.05);
	pointer-events : none;
}


.content 
{
	position : relative;
	padding : 20px;

}

.box .content h2 
{
	position : absolute;
	top : -60px;
	right : 20px;
	margin: 0;
	padding: 0;
	font-size: 10em;
	color : rgba(93,93,93,2);
	transition : 0.5s;
	
}

.box:hover .content h2
{
	top : -140px;

}

.box .content h3 
{
	margin : 0 0 10px;
	padding : 0;
	font-size: 24px;
	font-weight : 500;
	color: #fff;
}

.box .content p 
{
	margin : 0;
	padding : 0;
	font-size: 16px;
	color: #fff;
}

.box .content a
{
	position : relative;
	margin : 20px 0 0;
	padding : 10px 20px;
	text-decoration : none;
	border: 1px solid #fff;
	display : inline-block;
	color : #fff;
	transition : 0.5s;
	transform : translateY(-40px);
	opacity: 0;
	visibility: hidden;
}

.box:hover .content a
{

	transform : translateY(0);
	opacity: 1;
	visibility: visible;
}
.box .content a:hover
{
	color : #000;
	background: #fff;
}

</style>
</head>

<body>
	<div class="container">
		<div class="box">
			 <div class="content">
			 	<h2>01</h2>
			 	<h3>Service One</h3>
			 	<p></p>
			 	<a href="#">Read More</a>
			 </div>
		 </div>
	</div>
	<div class="container">
		 <div class="box">
			 <div class="content">
			 	<h2>02</h2>
			 	<h3>Service Two</h3>
			 	<p></p>
			 	<a href="#">Read More</a>
			 </div>
		 </div>
	</div>
	<div class="container">
		 <div class="box">
			 <div class="content">
			 	<h2>03</h2>
			 	<h3>Service Three</h3>
			 	<p></p>
			 	<a href="#">Read More</a>
			 </div>
		 </div>
	</div>
	<div class="container">
		 <div class="box">
			 <div class="content">
			 	<h2>04</h2>
			 	<h3>Service Four</h3>
			 	<p></p>
			 	<a href="#">Read More</a>
			 </div>
		 </div>
	</div>
		
</body>

</html>