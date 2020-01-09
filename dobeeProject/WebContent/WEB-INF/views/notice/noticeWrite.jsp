<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
<title>notice Board</title>
<style type="text/css">

</style>
<script type="text/javascript">
let charLimit = 4000;	
        $(function () {
            $('#summernote').summernote({
            }); 
            
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">


	
    <div class="content">
        <div class="comment-form-wrap pt-xl-2">
            <h1 class="text-center mb-3 bread">
            	
            </h1>
            <form id="frm" class="p-5 bg-light" method="post"
               <c:choose>
                   <c:when test="${isEdit}">action="NoticeBoardWriteOk.do?cmd=edit"</c:when>
                   <c:otherwise>action="NoticeBoardWriteOk.do?cmd=write"</c:otherwise>
               </c:choose>>
                
                <input type="text" class="form-control mb-3" id="title" name="title" placeholder="글 제목" value="${noticeWrite.title}">
                <input type="hidden" id="bIdx" name="bIdx" value="${noticeWrite.bIdx}">
                <textarea rows="10" cols="60" id="summernote" name="summernote">${noticeWrite.content}</textarea>
				<div class="mt-3 text-right">
					<label > 
						<input type="checkbox" id="isTop" name="isTop" value="1"  
						   <c:if test="${noticeWrite.isTop() }"> checked </c:if>
						> 공지 설정
					</label>
				</div>
				
				<div class="text-right" id="lengthBox"> 
					<span id="total-characters"></span>/<span id="max"></span>
				</div>


            </form>
        </div>
    </div>
</body>
</html>