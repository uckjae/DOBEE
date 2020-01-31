<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html class="fixed">
<head>

<c:import url="/common/HeadTag.jsp"/>
<c:import url="/common/BottomTag.jsp"/>

<!-- Specific Page Vendor CSS -->
<link rel="stylesheet" href="assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
<link rel="stylesheet" href="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.css" />
<link rel="stylesheet" href="assets/vendor/bootstrap-colorpicker/css/bootstrap-colorpicker.css" />
<link rel="stylesheet" href="assets/vendor/bootstrap-timepicker/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="assets/vendor/dropzone/css/basic.css" />
<link rel="stylesheet" href="assets/vendor/dropzone/css/dropzone.css" />
<link rel="stylesheet" href="assets/vendor/bootstrap-markdown/css/bootstrap-markdown.min.css" />
<link rel="stylesheet" href="assets/vendor/summernote/summernote.css" />
<link rel="stylesheet" href="assets/vendor/summernote/summernote-bs3.css" />	
<!-- Specific Page Vendor -->
<script src="assets/vendor/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
<script src="assets/vendor/select2/select2.js"></script>
<script src="assets/vendor/jquery-maskedinput/jquery.maskedinput.js"></script>
<script src="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
<script src="assets/vendor/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script src="assets/vendor/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
<script src="assets/vendor/fuelux/js/spinner.js"></script>
<script src="assets/vendor/dropzone/dropzone.js"></script>
<script src="assets/vendor/bootstrap-markdown/js/markdown.js"></script>
<script src="assets/vendor/bootstrap-markdown/js/to-markdown.js"></script>
<script src="assets/vendor/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="assets/vendor/summernote/summernote.js"></script>
<script src="assets/vendor/bootstrap-maxlength/bootstrap-maxlength.js"></script>
<script src="assets/vendor/ios7-switch/ios7-switch.js"></script>
<!-- Examples -->
<script src="assets/javascripts/forms/examples.advanced.form.js" /></script>
<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style type="text/css">
body {
    background: #23394A;
    width: 100%;
}
</style>

<script type="text/javascript">


	function findMail(callback){
      return new Promise(function(resolve,reject){
          console.log("findMail()");
          console.log($('#mail').val());
          
		  $.ajax({
			  url:"ajax/admin/findEmail.do",
			  data:{'mail':$('#mail').val()
				  },
				  
              dataType:"text", 
              method:"POST",
              
              success: function(response){
                  console.log("메일보내짐");
                  resolve(response)
                  
                  },
              error: function(jqXHR, textStatus, errorThrown){
				   console.log(textStatus);
				   console.log(errorThrown);
					}
			  });
          });
		}

	function myFormSubmit(){
		findMail().then(function(){
			console.log("submit()");
			document.getElementById('findPWD').submit();
			$('#findPWD').submit();	
			
		});
	}

     
 	


</script>



</head>
<body>

<!-- start: page -->
<section class="body-sign">
 <div class="center-sign">
			
			
   <a class="logo pull-left">
	 <img src="img/beemain2.png" height="54"/>
   </a>


   <div class="panel panel-sign">
				
	<div class="panel-title-sign mt-xl text-right">
	  <h2 class="title text-uppercase text-bold m-none"><i class="fa fa-lock mr-xs" ></i>비밀번호 찾기</h2>
	</div>
					
	<div class="panel-body">
	  <form action="" method="post" id="findPWD" enctype="multipart/form-data">
						
		<div class="form-group mb-lg">
		  <label>인증번호를 입력하세요</label>
		  <div class="input-group input-group-icon">
			 <input class="form-control input-lg" id="mail" name="mail" type="email" form="findPWD"/>
				<span class="input-group-addon">
				 <span class="icon icon-lg">
				  <i class="fa fa-check-circle"></i>
				 </span>
				</span>
		  </div>
		</div>
		 
		<hr>
		<div class="mb-xs text-center">
		  <a class="btn btn-facebook mb-md ml-xs mr-xs" onclick="myFormSubmit()">확인</a>
		  
		</div>
		</form>

	  </div>
	  	  
	</div>				
 </div>
 
</section>
<!-- end: page -->



</body>
</html>