<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
</script>




<title>jquery-ajax-form-submit/</title>
<!-- jQuery import -->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- jQuery Form Plugin import -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.form.min.js"></script>
</head>
<body>

<h3>jQuery ajax fileupload (ajax 파일업로드)</h3>
<form name="multiform" id="multiform" action="<%=request.getContextPath() %>/fileUpload1"
                                      method="POST" enctype="multipart/form-data">
	
	title: <input type="text" name="title"  value=""/> <br/>
	description :<input type="text" name="description"  value="" /> <br/>
	
	<!-- 다중 파일업로드  -->
	file : <input type="file" class="afile3"  name="file" /> <br/>
	
	<input type="submit" id="btnSubmit" value="전송"/><br/>
</form>	

<div id="result"></div>


<script>

/*jQuery form 플러그인을 사용하여 폼데이터를 ajax로 전송*/

var downGroupCnt =0; //다운로드그룹 개수카운트

$(function(){
    
	//폼전송 : 해당폼의 submit 이벤트가 발생했을경우 실행  
    $('#multiform').ajaxForm({
       cache: false,
       dataType:"json",
       //보내기전 validation check가 필요할경우
       beforeSubmit: function (data, frm, opt) {
	       //console.log(data);
           alert("전송전!!");
           return true;
       },
       //submit이후의 처리
       success: function(data, statusText){
    	   
    	   alert("전송성공!!");
           console.log(data); //응답받은 데이터 콘솔로 출력         
           
           output(data); //받은 정보를 화면 출력하는 함수 호출
       },
       //ajax error
       error: function(e){
           alert("에러발생!!");
           console.log(e);
       }                               
	});
});

//전달받은 정보를 가지고 화면에 보기 좋게 출력
function output(data) {
	//업로드한 파일을 다운로드할수있도록 화면 구성
	$("#result").append("<h3>("+(++downGroupCnt)+") 다운로드</h3>");
    $("#result").append("제목:"+data.title+"<br/>");
    $("#result").append("설명:"+data.description+"<br/>");
  

 	if(data.fileName){
        //var link = "FileDownload?f="+data.fileName+"&of="+data.fileName;        
        $("#result").append("파일 :<a href='"+ data.downlink +"' download>"+data.fileName+"</a>");
        $("#result").append("<br/>");
    }
    
    //$('#multiform')[0].reset();  //폼 초기화(리셋);
    //$('#multiform').resetForm();   //위코드와 동일 (jQuery.Form 플러그인 메서드)
    $('#multiform').clearForm(); //(jQuery.Form 플러그인 메서드)
     
    //IE에서 폼 리셋후 input[type=file] 초기화 안되는 문제. 
    //(파일이름은 지워지지만 files 프로퍼티에는 파일정보 남아있음.)
    //참고 : http://javaking75.blog.me/220073388169
    /* if(/(MSIE|Trident)/.test(navigator.userAgent)) {
    	//ie 일때 input[type=file] init.
    	$("#multiform input[type=file]").each(function(index){
    		$(this).replaceWith($(this).clone(true));
    	});
    } */
}
</script>

</body>
</html>
