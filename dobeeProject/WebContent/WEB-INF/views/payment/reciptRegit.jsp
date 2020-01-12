<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<c:import url="/common/tag.jsp" />
<script>
	$(document).ready(function() {
		$("input[type=submit]").bind("click", function() {
			$("form").ajaxSubmit({
//				dataType : "json",
				success : function(data) {
					//alert(data.result);
					console.log(data);
					var uploadPath =  data[0];
					var fileName = data[1];
					
					$("#fileupload").html("<img src=" + data.uploadPath + ">");
				},
				error : function(error) {
					alert("요청 처리 중 오류가 발생하였습니다.");
				}
			});
			return false;
		});
	});



/* window.onload=function(){
	// Add the following code if you want the name of the file appear on select
	$(".custom-file-input").on("change", function() {
	  var fileName = $(this).val().split("\\").pop();
	  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	});
}	 */
</script>





</head>





<body>
	<!-- Side Navbar -->
	<nav class="side-navbar">
		<c:import url="/common/left.jsp" />
	</nav>

	<div class="page">
		<c:import url="/common/top.jsp" />




<!--  내부 상단nav바  -->

	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active" href="#">비용 신청</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">비용 현황</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">법인 카드 목록</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link disabled" href="#">Disabled</a>
	  </li>
	</ul>
	
	
	
	
	
	       
	       
	 <!--  우측에 영수증파일 업로드 되고, -->      
	 <div class="container">
  		<div class="row">
    		<div class="col-md-6 imgshow">
     			 One of three columns
     			 <div id="fileUpload"></div>
     			 <br>
     			 <br>
     			 <br>
     			 <br>
     			 <br>
    		</div>
   			<div class="col-md-6 textshow">
      			 One of two columns
      			 <!-- 좌측에 영수증사진에 대한 텍스트  --> 
      			 <!--  여기에는 사용자가 텍스트 수정해야할 부분은 수정하게 해줘야함 -->
      			 
      			 <br>
      			 <br>
      			 <br>
      			 <br>
      			 <br>
      			 
      			 
      			 
    		</div>
  		</div>
	</div>
	    								      
	       			
	     			
	       			
	       			
	       			
	       			
	       			
	  
	       			
		<!-- 파일 업로드  부분 -->
		<form action="fileUploadAjax.do" method="post" enctype="multipart/form-data">
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" id="customFile">
		    <label class="custom-file-label" for="customFile">Choose file</label>
		  </div>
		  <input type="submit" class="btn btn-primary" >
		</form>
		
		<!-- 파일 업로드 부분 끝 -->
	        
	        
	        
	        
	        
	        
	        



			














		<c:import url="/common/bottom.jsp" />
	</div>










	<!-- JavaScript files-->
	<script src="./vendor/jquery/jquery.min.js"></script>
	<script src="./vendor/popper.js/umd/popper.min.js"></script>
	<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="./js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
	<script src="./vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="./vendor/chart.js/Chart.min.js"></script>
	<script src="./vendor/jquery-validation/jquery.validate.min.js"></script>
	<script src="./vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="./js/charts-home.js"></script>
	 <!-- Main File -->
	<script src="./js/front.js"></script>
	<script src="https://kit.fontawesome.com/5d4e7bbd25.js" crossorigin="anonymous"></script>
</body>


</html>