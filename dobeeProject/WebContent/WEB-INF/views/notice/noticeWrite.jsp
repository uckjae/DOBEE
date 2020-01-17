<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html class="fixed">
<head>
<!-- Basic -->
		<c:import url="/common/HeadTag.jsp"/>
        <meta name="author" content="okler.net">
		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
		<link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />
		
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" 
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" 
    crossorigin="anonymous">
</script>



<!-- include Nobootstrap summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
<title>write</title>


</head>

<script>
    $(document).ready(function() {
        $('#summernote1').summernote({
        	
        	height: 350,
        	placeholder: "글을 입력하세요.",
        	lang: 'ko-KR', /*한국어*/ 
        	toolbar: [   /*summernote 글옵션 상자*/
        		  ['fontname'],
        		  ['fontsize'],
        		  ['font', ['bold', 'underline','italic','strikethrough','superscript','subscript']],  
        		  ['color', ['forecolor','backcolor']],
        		  ['para', ['ul', 'ol', 'paragraph','hr','height']],
        		  ['table', ['table']],
        		  ['insert', ['link', 'picture', 'video','file']],
        		  ['view', ['fullscreen', 'codeview', 'help']],
        		],
        	spellCheck: true,  /*맞춤법 검사 */
        	codemirror: { // codemirror options
        		    theme: 'monokai',
        		    htmlMode: true
        		  },
        	 callbacks: {
        		    onFileUpload: function(file){
        		    	myOwnCallBack(file[0]);
        		        },
        		    },    	       	
            });
        $.summernote.interface;     
    });
</script>




<body>

<section class="body">
      
      
      
      <!-- start: header -->
	  <c:import url="/common/Top.jsp"/>
	  <!-- end: header -->
      
      <div class="inner-wrapper">
		<!-- start: sidebar -->
		<c:import url="/common/Side.jsp"/>
		<!-- end: sidebar -->
				
		<!-- start : main Content -->
				<section role="main" class="content-body">
					<header class="page-header">
						<h2>공지사항</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>Pages</span></li>
								<li><span>Blank Page</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
    

 <div class="content" style="margin-right: 85px; margin-left: 85px">
  <div class="comment-form-wrap pt-xl-2">
   <h1 class="text-center mb-3 bread">게시글 작성</h1>
   <form action="noticeWrite.do" method="post" enctype="multipart/form-data">   
    <input type="text" class="form-control mb-3" id="title" name="title"
     placeholder="글 제목을 입력하시오" value="">     
    <textarea id="summernote1" name="content"></textarea>    
    <div class="text-right" id="lengthBox"> 
	  <span id="total-characters"></span><span id="max"></span>
	</div>	
    <div class ="text-center">
     <input type="submit" class="btn btn-primary mr-3" value="작성">
     <a class="btn btn-primary mr-3" href="noticeList.do">취소</a>
    </div>   
   </form>   
  </div>
 </div>

 </section>
	  </div>
	
				<!-- 오른쪽 사이드바!! -->
		<c:import url="/common/RightSide.jsp"/> 

<!-- 오른쪽 사이드바 끝!! -->
		</section>

    
  
</body>
</html>