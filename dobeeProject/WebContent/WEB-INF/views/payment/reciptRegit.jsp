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
    var allPath;
    var uploadPath;
    var saveFileName;
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
                    uploadPath  = result.uploadPath;
                    saveFileName = result.saveFileName;
                    allPath = uploadPath + saveFileName;
                    var forder = "/Users/";
                    var finalPath = forder + saveFileName;
					$("#uploadImg").html('<img id="imgtag" width="100%">');
					$("#imgtag").attr("src", finalPath);
					console.log("이게 이미지 경로 : " + allPath);
					
					


                    
                },
                complete: function(){
                    
                	console.log("이게 이미지 경로 왜 이상하게 변형되지? : " + allPath);
					console.log("아작스데이터 받아온 뒤 실행 함수 ");
					console.log("구글 API 시작합니다");
					$.ajax({
						url:'goGoogleAjax.do',
						data: {
							"uploadPath" : uploadPath,
						    "saveFileName" : saveFileName
							},
						type: 'POST',
						dataType:'json',
						success: function(result){
								console.log("구글 아작스 성공!");
								console.log(result);
								$("#Input2").attr("value", result.key4);
								$("#Input3").attr("value", result.key1);
								$("#Input4").attr("value", result.key18);
							},
						error:function(){
								console.log("구글 아작스 요청시 에러");
							},
					
									
						})// 2번째 아작스끝
                },
        });
}; //uploadFile() 함수 끝 
// 법인카드 목록 불러오기 아작스
window.onload=function(){
	$.ajax({
		url:'nowEmpEmail.do',
		type:'POST',
		success:function(result){
				$("#Input1").attr("value", result);
			},
		complete:function(){
				$.ajax({
					url:'cardListtoReceipt.do',
					type:'POST',
					success:function(result){
							for(let i = 0 ; i<result.length; i++){
								$("#Select1").append("<option value='1'>" + result[i].cardNum +  "</option>");	
							}
						},
					error:function(){
							console.log("법인카드 목록 불러오기 아작스 에러남");
						},
					complete:function(){
							$.ajax({
								url:'debitCodeList.do',
								type:'POST',
								success:function(result){
										console.log("비용항목 아작스 성공")
										console.log(result);
										for(let i = 0 ; i<result.length; i++){
											$("#Select2").append("<option value='1'>" + result[i].entry +  "</option>");	
										}
									},
								error:function(){
										console.log("비용항목 아작스에서 에러남")
									},
								
								})
						
						},
					
				})//아작스 끝
			}
		})
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

<style type="text/css">
	img{
		padding:15px !important;
	}


</style>
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

	</ul>
	
	
	
	       
	       
	 <!--  우측에 영수증파일 업로드 되고, -->      
	 <div class="container">
  		<div class="row">
    		<div class="col-md-6 imgshow">
     			 <div id="uploadImg">
     			 	<img src="/Users/noimg.jpg" width="100%"> <!-- 이미지 없을 때 기본으로 보이는 이미지 -->
     			 </div>
     			    			
				<!-- 파일 업로드  부분 -->
				<form id="FILE_FORM" class="md-form" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
				  <div class="custom-file" style="width:85%; float:left;" >
				    <input type="file" class="custom-file-input" id="FILE_TAG" name="FILE_TAG" >
				    <label class="custom-file-label" for="customFile" >영수증 사진 등록</label>
				  </div>
				  <a class="btn btn-primary" href="javascript:uploadFile();" style="width:auto; float:right;">업로드</a>
		        </form> 
		        
    		</div>
    		
    		
    		
    		
   			<div class="col-md-6 textshow">
      			 <!-- 좌측에 영수증사진에 대한 텍스트  --> 
      			 <!--  여기에는 사용자가 텍스트 수정해야할 부분은 수정하게 해줘야함 -->
      			 
	      	<form id="costlistInfo">
	      		<div class="form-group">
				    <label for="exampleFormControlInput1">신청자 이메일</label>
				    <input type="text" class="form-control" id="Input1" readonly="readonly">
				  </div>
	      		<div class="form-group">
				    <label for="exampleFormControlSelect1">법인카드 선택</label>
				    <select class="form-control" id="Select1">
				    </select>
	  			  </div>
	  			  <div class="form-group">
				    <label for="exampleFormControlSelect2">비용항목 선택</label>
				    <select class="form-control" id="Select2">
				    </select>
	  			  </div>
				    <div class="form-group">
				    <label for="exampleFormControlInput1">사용일</label>
				    <input type="text" class="form-control" id="Input2" placeholder="ex)2020-02-02">
				  </div>
				    <div class="form-group">
				    <label for="exampleFormControlInput1">사용처</label>
				    <input type="text" class="form-control" id="Input3" placeholder="ex)E-MART, 마루가메 제면 (정확한 상호명 입력)">
				  </div>
				    <div class="form-group">
				    <label for="exampleFormControlInput1">사용금액</label>
				    <input type="text" class="form-control" id="Input4" placeholder="ex)2000 (숫자만 입력)">
				  </div>
				    <div class="form-group">
				    <label for="exampleFormControlInput1">상세내용</label>
				    <input type="text" class="form-control" id="Input5" placeholder="ex) 이마트에서 필요한 간식이랑 사무용품들 구매하였습니다.">
				  </div>
			  	 <a class="btn btn-primary" href="javascript:uploadFile();" style="width:auto; float:right;">수정완료 및 등록</a>
		 </form>
      			 
      			 
      			 
    		</div>
  		</div>
	</div>
	    								      
	       			
	     			
	       			
	       			
	       			
	       			
	       			
	  
	    


		
		
		
		
		
		
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