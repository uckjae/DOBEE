<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/common/tag.jsp"/>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js">
</script>
<link rel="stylesheet" href="./css/notice.datatables.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Detail</title>

<style type="text/css">
        html,
        body {
            height: 100%;
        }
         .ds{
        	width: 100%;
        	min-height: 280px;
        	border: 1px solid #ced4da;
        	border-radius:5px;
        	padding: 30px;
        }
</style>

</head>
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
     <h1 class="text-center mb-3 bread">게시글 확인</h1>
     <input type="number" hidden="true" value="${notice.notSeq}">
     <p style="float:right">작성일:
     <fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd HH:mm"/>
     </p>
     <input type="text" class="form-control mb-3" id="title" name="title"
           value="${notice.title}" readonly>
     <div id="content1" rows="10" class="ds">${notice.content}</div>
   
     <div class="text-right" id="lengthBox"> 
	  <span id="total-characters"></span>
	  <span id="max"></span>
	 </div>
	
     <div class ="text-center">
     
      <a class="btn btn-primary mr-3" href="noticeModify.do?notSeq=${notice.notSeq}">수정</a>
      <a class="btn btn-primary mr-3" href="noticeDel.do?notSeq=${notice.notSeq}">삭제</a>
      <a class="btn btn-primary mr-3" href="noticeList.do">목록</a>
                                     
     </div>
   
  </div>
 </div>
</div>

<c:import url="/common/bottom.jsp"/>
	
	<!-- JavaScript files-->
    <script src="./vendor/popper.js/umd/popper.min.js"> </script>
    <script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="./js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="./vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="./vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="./vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- Main File-->
    <script src="./js/front.js"></script>
    <script src="https://kit.fontawesome.com/5d4e7bbd25.js" crossorigin="anonymous"></script>

</body>
</html>