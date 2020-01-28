<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<style type="text/css">
body {
    background: #23394A;
    width: 100%;
}
</style>

<script type="text/javascript">
$(function(){

	function findPwMail(callback){
      return new Promise(function(resolve,reject){
          console.log("findPwMail");
          console.log($('#mail').val());
		  console.log($('#name').val());
		  $.ajax({
			  url:"ajax/admin/findPwMail.do",
			  data:{'mail':$('#mail').val(),
                    'name':$('name').val()
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
                  myFormSubmit()
		  
			  })
          });
		}

	function myFormSubmit(){
		findPwMail().then(function(){
			console.log("submit()");
			document.getElementById('addUserForm').submit();
			$('#addUserForm').submit();
			
		})
	}
	
 $('#idModal2').click(function(e){
	 
	 console.log("done???");
	 $('#findPassWord').trigger('reset');

	 if(($.trim($('#mail').val())=='')&&($.trim($('#name').val())=='')){
         alert("내용을 입력하지 않았습니다");
         return false;
         }

	 else if($.trim($('#mail').val())==''){
         alert("메일을 입력하세요");
         $('#mail').focus();
         return false;    
     }
     
     else if($.trim($('#name').val()) == ''){
		alert("이름을 입력하세요");
		$('#name').focus();
		return false;
     }
   });


	$('#idModal2').click('show.bs.modal',function(e){
	 var mail = $('#mail').val();
     var name = $('#name').val();
     
     $.ajax({
         url:'ajax/admin/findPassWord.do',
         data: {"mail":mail, "name":name},
         dataType : "text",
         success:function(data){
			console.log(data);
             var password = data;
             if(password === ""){
            	 $('#findPassWord').val("찾은 비밀번호가 없습니다.");       	 
             }else{
               $('#findPassWord').val(password);
             }
        	 
         },
         error : function(request,status,error){
				console.log("code" + request.status +"\n" +"message : " + request.response + "\n" + "error : " + error);
         }
   
     });
     
 });
     
 });	


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
	  <h2 class="title text-uppercase text-bold m-none"><i class="fa fa-user mr-xs" ></i>비밀번호 찾기</h2>
	</div>
					
	<div class="panel-body">
	  <form action="" method="post">
						
		<div class="form-group mb-lg">
		  <label>메일</label>
		  <div class="input-group input-group-icon">
			 <input name="mail" type="text" class="form-control input-lg" id="mail" form="addUserForm"/>
				<span class="input-group-addon">
				 <span class="icon icon-lg">
				  <i class="fa fa-user"></i>
				 </span>
				</span>
		  </div>
		</div>

		<div class="form-group mb-lg">								
		  <label>이름</label>								
		  <div class="input-group input-group-icon">
			<input name="name" type="text" class="form-control input-lg" id="name" form="addUserForm"/>
			   <span class="input-group-addon">
				<span class="icon icon-lg">
				 <i class="fa fa-phone"></i>
				</span>
			   </span>
		  </div>
		</div>

	   </form>
		<hr>

		<div class="mb-xs text-center">
		  <a class="btn btn-facebook mb-md ml-xs mr-xs" data-toggle="modal" data-target="#modalBootstrap"
		     href="#modalBootstrap" onclick="myFormSubmit()">Find your password</a>
		  <a class="btn btn-twitter mb-md ml-xs mr-xs" href="login.do">Login </a>
		</div>

		<p class="text-center">비밀번호 변경을 하겠습니까?<a href="pages-signup.html">&nbsp;&nbsp;&nbsp;비밀번호 재설정</a>

	  </div>
	  	  
	</div>				
 </div>
 
</section>
<!-- end: page -->



</body>
</html>