<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>

<c:import url="/common/tag.jsp" />
<script>
function uploadFile(){
    var form = $('#FILE_FORM')[0];
    var formData = new FormData(form);
    formData.append("fileObj", $("#FILE_TAG")[0].files[0]);

    $.ajax({
        url: 'fileUploadAjax.do',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                success: function(result){
                    console.log(result);
                    alert("업로드 성공!!");
                    var uploadPath  = result.uploadPath;
                    var saveFileName = result.saveFileName;
                    var allPath = uploadPath + saveFileName;
                    var forder = "/Users/";
					$("#file111").append('<img id="imgtag" width="auto">');
					$("#imgtag").attr("src", forder + saveFileName);
				


                    
                }
        });
}
</script>
<script>
	$(document).ready(function() {
		


		
		$(".custom-file-input").on("change", function() {
			  var fileName = $(this).val().split("\\").pop();
			  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
			});
		
	
			
	});



	
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
     			 <div id="file111"></div>
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
	
		<form id="FILE_FORM" method="post" enctype="multipart/form-data">
            <input type="file" id="FILE_TAG" name="FILE_TAG">
            <a class="ui-shadow ui-btn ui-corner-all" href="javascript:uploadFile();">전송</a>
        </form>


		
		
		
		
		
		
	<!-- 	<form id="plz" action="fileUploadAjax.ajax" method="post" enctype="multipart/form-data">
		  <div class="custom-file">
		 	<input type="file" class="custom-file-input" name="file1" />
		    <input type="file" class="custom-file-input" id="customFile">
		    <label class="custom-file-label" for="customFile">영수증 사진을 등록하세요.</label>
		  </div>
		  <input type="submit" class="btn btn-primary" value="이미지 등록">
		  
		  <div id="haha"></div>
		</form> -->
		
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