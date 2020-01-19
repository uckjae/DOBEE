<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html class="fixed">
<head>
<!-- Basic -->
<c:import url="/common/HeadTag.jsp" />
<meta name="author" content="okler.net">
<!-- Specific Page Vendor CSS -->
<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
<link rel="stylesheet"
	href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous">
</script>

<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link rel="stylesheet" type="text/css"
	href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
<link rel="stylesheet" type="text/css"
	href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>

<!-- include Nobootstrap summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
<title>write</title>

</head>

<script>
 $(document).ready(function() {
  $('#summernote').summernote({    	
    height: 350,
    //lang: 'ko-KR', /*한국어*/ 
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

	<section class="body">



		<!-- start: header -->
		<c:import url="/common/Top.jsp" />
		<!-- end: header -->

		<div class="inner-wrapper">
			<!-- start: sidebar -->
			<c:import url="/common/Side.jsp" />
			<!-- end: sidebar -->

			<!-- start : main Content -->
			<section role="main" class="content-body">
				<header class="page-header">
					<h2>공지사항</h2>

					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li>
							  <span><img src="img/noticeiconsub.png" style="width:32; height:35;"></span>
							</li>
							<li><span>Pages</span></li>
							<li><span>Notice Modify</span></li>
							<li><span>Title:&nbsp;&nbsp;${notice.title}</span></li>
						</ol>

						<a class="sidebar-right-toggle" data-open="sidebar-right"><i
							class="fa fa-chevron-left"></i></a>
					</div>
				</header>





				<section class="panel">
					<header class="panel-heading">
						<div class="panel-actions">
							<a href="#" class="fa fa-caret-down"></a> <a href="#"
								class="fa fa-times"></a>
						</div>

						<h2 class="panel-title">
							<img src="img/noticeiconmain.png" style="width:50; height:60;">
							&nbsp;&nbsp;공지사항 수정
						</h2>

					</header>

					<div class="panel-body">
						<form action="noticeModify.do" method="post"
							enctype="multipart/form-data">
							<input type="hidden" id="notSeq" name="notSeq"
								value="${notice.notSeq}" readonly> <input type="text"
								class="form-control mb-3" id="title" name="title"
								value="${notice.title}" />
								<div style="margin: 15px"></div>
							<textarea id="summernote" class="content" name="content">${notice.content}</textarea>
							<div class="text-right" id="lengthBox">
								<span id="total-characters"></span><span id="max"></span>
							</div>
							<div class="text-center">
								<input type="submit" class="btn btn-primary mr-3" value="수정">
								<a class="btn btn-primary mr-3"
									href="noticeDetail.do?notSeq=${notice.notSeq}">취소</a>
							</div>
						</form>
					</div>
				</section>

			</section>
		</div>


		<!-- 오른쪽 사이드바!! -->
		<c:import url="/common/RightSide.jsp" />

		<!-- 오른쪽 사이드바 끝!! -->
	</section>



</body>
</html>