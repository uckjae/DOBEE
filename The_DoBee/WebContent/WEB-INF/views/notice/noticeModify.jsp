<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html >
<head>
<c:import url="/common/tag.jsp"/>
<!-- include libraries(jQuery, bootstrap) -->

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" 
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" 
    crossorigin="anonymous">
</script>

<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>

<!-- include Nobootstrap summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
<script src="./lang/summernote-ko-KR.js"></script>
<title>write</title>

<style >
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body{
   font-family: 'Noto Serif KR', serif;
}
	
	</style>
</head>

<script>
 $(document).ready(function() {
  $('#summernote').summernote({    	
    height: 350,
    lang: 'ko-KR', /*한국어*/ 
    toolbar: [   /*summernote 글옵션 상자*/
        	  ['fontname'],
        	  ['fontsize'],
        	  ['font', ['bold', 'underline','italic','strikethrough','superscript','subscript']],  
        	  ['color', ['forecolor','backcolor']],
        	  ['para', ['ul', 'ol', 'paragraph','hr','height']],
        	  ['table', ['table']],
        	  ['insert', ['link', 'picture', 'video']],
        	  ['view', ['fullscreen', 'codeview', 'help']],
        	 ],
    spellCheck: true,  /*맞춤법 검사 */
    codemirror: { // codemirror options
                 theme: 'monokai',
                 htmlMode: true
        		}    	       	
    });
  
   $.summernote.interface;     
  });
</script>

<body>

<!-- Side Navbar -->
<nav class="side-navbar">
 <c:import url="/common/left.jsp"/>
</nav>
    
<div class="page" >
 <!-- navbar-->
 <c:import url="/common/top.jsp"/>
 
 <div class="content" style="margin-right: 85px; margin-left: 85px">
  <div class="comment-form-wrap pt-xl-2">
   <h1 class="text-center mb-3 bread">게시글 수정</h1>
   
   <form action="noticeModify.do" method="post" enctype="multipart/form-data"> 
   	<input type="number" id="notSeq" name="notSeq" value="${notice.notSeq}">
    <input type="text" class="form-control mb-3" id="title" name="title"
      value="${notice.title}"/>
     
    <textarea id="summernote" class="content" name="content">${notice.content}</textarea>
    
    <div class="text-right" id="lengthBox"> 
	 <span id="total-characters"></span><span id="max"></span>
	</div>

    <div class ="text-center">
     <input type="submit" class="btn btn-primary mr-3" value="수정">
     <a class="btn btn-primary mr-3" href="noticeDetail.do?notSeq=${notice.notSeq}">취소</a>
    </div> 
      
   </form>
   
  </div>
 </div>
 
</div>

<c:import url="/common/bottom.jsp"/>

<!-- JavaScript files-->
<script src="./vendor/popper.js/umd/popper.min.js"></script>
<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="./js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
<script src="./vendor/jquery.cookie/jquery.cookie.js"></script>
<script src="./vendor/jquery-validation/jquery.validate.min.js"></script>
<script src="./vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Main File-->
<script src="./js/front.js"></script>
<script src="https://kit.fontawesome.com/5d4e7bbd25.js" crossorigin="anonymous"></script>
  
</body>
</html>