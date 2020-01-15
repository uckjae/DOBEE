<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>

<c:import url="/common/tag.jsp" />


<script>
//날짜형태 yyyy-mm-dd 형태로 바꾸는 임의 함수
Date.prototype.format = function (f) {

    if (!this.valueOf()) return " ";

    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    var d = this;

    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {

        switch ($1) {

            case "yyyy": return d.getFullYear(); // 년 (4자리)

            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)

            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)

            case "dd": return d.getDate().zf(2); // 일 (2자리)

            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)

            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)

            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)

            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)

            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)

            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)

            case "mm": return d.getMinutes().zf(2); // 분 (2자리)

            case "ss": return d.getSeconds().zf(2); // 초 (2자리)

            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분

            default: return $1;

        }

    });

};
String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
Number.prototype.zf = function (len) { return this.toString().zf(len); };


//문자열에서 숫자만 가져오기
function fn(str){
    var res;
    res = str.replace(/[^0-9]/g,"");
	res = res.substring(0,8);
	
    return res;
}


//문자열 날짜형태로 바꾸기 함수
function calculus(str){    
    var end_ymd = str;    
    var yyyy = end_ymd.substr(0,4);
    var mm = end_ymd.substr(4,2);
    var dd = end_ymd.substr(6,2);  
    var com_ymd = new Date(yyyy,mm-1,dd)
    var inputdate = com_ymd.format('yyyy-MM-dd');  //임의 함수 써서 포맷팅함
    
    return inputdate;
}



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
								
								var temp = fn(result.key4);
								var usedate = calculus(temp);
								$("#Input2").attr("value", usedate);
								$("#Input3").attr("value", result.key1);
								var usecost = fn(result.key18);
								$("#Input4").attr("value", usecost);
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
								$("#Select1").append("<option>" + result[i].cardNum +  "</option>");	
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
											$("#Select2").append("<option>" + result[i].costCode +  "</option>");	
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

//하...내가 이 함수까지 만들어야 하나 input 태그안에 있는 모든 데이터값 출력해보기 
function showInput(){
	var select1 = 22;
	var select2 = 44;
	
	select1 = $("#Select1 option:selected").text();
	select2 = $("#Select2 option:selected").text();
	var input1 = $('#Input1').val();
	var input2 = $('#Input2').val();
	var input3 = $('#Input3').val();
	var input4 = $('#Input4').val();
	var input5 = $('#Input5').val();

	console.log("select1: " + select1);
	console.log("select2: " + select2);
	console.log("input1: " + input1);
	console.log("input2: " + input2);
	console.log("input3: " + input3);
	console.log("input4: " + input4);
	console.log("input5: " + input5);

	return false;
	
	
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

<style>
	img{
		padding:15px !important;
	}


@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');
body{
   font-family: 'Noto Serif KR', serif;
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
      			 
	      	<form id="costlistInfo" action="addFinalReceipt.do">
	      		<div class="form-group">
				    <label for="exampleFormControlInput1">신청자 이메일</label>
				    <input type="text" class="form-control" id="Input1" name='mail' readonly="readonly">
				  </div>
	      		<div class="form-group">
				    <label for="exampleFormControlSelect1">법인카드 선택</label>
				    <select class="form-control" name='cardNum' id="Select1">
				    </select>
	  			  </div>
	  			  <div class="form-group">
				    <label for="exampleFormControlSelect2">비용항목 선택</label>
				    <select class="form-control" name='costCode' id="Select2">
				    </select>
	  			  </div>
				    <div class="form-group">
				    <label for="exampleFormControlInput1">사용일</label>
				    <input type="date" class="form-control" id="Input2" name='useDate' placeholder="ex)2020-02-02">
				  </div>
				    <div class="form-group">
				    <label for="exampleFormControlInput1">사용처</label>
				    <input type="text" class="form-control" id="Input3" name='useAt' placeholder="ex)E-MART, 마루가메 제면 (정확한 상호명 입력)">
				  </div>
				    <div class="form-group">
				    <label for="exampleFormControlInput1">사용금액</label>
				    <input type="text" class="form-control" id="Input4" name='cost' placeholder="ex)2000 (숫자만 입력)">
				  </div>
				    <div class="form-group">
				    <label for="exampleFormControlInput1">상세내용</label>
				    <input type="text" class="form-control" id="Input5" name='detail' placeholder="ex) 이마트에서 필요한 간식이랑 사무용품들 구매하였습니다.">
				  </div>
				  <button type="button" onclick="showInput()"> 자 콘솔창을 보자 </button>
			  	 <button type='submit' class="btn btn-primary" style="width:auto; float:right;">수정완료 및 등록</button>
		 </form>
      			 
      			<!--  onclick="location.href='addFinalReceipt.do'"  -->
      			 
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