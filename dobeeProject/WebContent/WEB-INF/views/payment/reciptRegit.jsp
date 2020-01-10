<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<c:import url="/common/tag.jsp" />

<script>
	window.onload = function() {
		 var app = new Vue({
	            el: "#nav",
	            data: {
	       
	            }
	        })
	}	
</script>

</head>





<body>
	<!-- Side Navbar -->
	<nav class="side-navbar">
		<c:import url="/common/left.jsp" />
	</nav>

	<div class="page">
		<c:import url="/common/top.jsp" />


	<div id='nav'>
	  <b-card title="Card Title" no-body>
	    <b-card-header header-tag="nav">
	      <b-nav card-header pills>
	        <b-nav-item active> 영수증 등록 </b-nav-item>
	        <b-nav-item> 법인카드 확인 </b-nav-item>
	        <b-nav-item> 비용현황 </b-nav-item>
	      </b-nav>
	    </b-card-header>
	
	    <b-card-body class="text-center">
	      <b-card-text>
	       
	       
	    <!--  우측에 영수증파일 업로드 되고, -->      <!-- 좌측에 영수증사진에 대한 텍스트  --> 
	       								       <!--  여기에는 사용자가 텍스트 수정해야할 부분은 수정하게 해줘야함 -->
	       			
		<!-- 파일 업로드  부분 -->
				<div class="input-group">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="custom-file-input" id="inputGroupFile01"
				      aria-describedby="inputGroupFileAddon01">
				    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
				  </div>
				</div>
		<!-- 파일 업로드 부분 끝 -->
	        
	        
	        
	        
	        
	        
	        
	      </b-card-text>
	
	      <b-button variant="primary"> 영수증 등록 </b-button>
	    </b-card-body>
	  </b-card>
	</div>
			



			














		<c:import url="/common/bottom.jsp" />
	</div>










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
	<script
		src="./vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="./js/charts-home.js"></script>
	<!— Main File—>
	<script src="./js/front.js"></script>
	<script src="https://kit.fontawesome.com/5d4e7bbd25.js"
		crossorigin="anonymous"></script>
</body>


</html>