<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css"/>
<html class="fixed">
<head>
<!-- Basic -->
		


<%-- <c:import url="/common/HeadTag.jsp"/> START--%>

<!-- Mobile Metas -->
<meta name="viewport"
content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<!-- Web Fonts  -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">
<!-- Vendor CSS -->
<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css"/>
<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css"/>
<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css"/>
<!-- Specific Page Vendor CSS -->
<link rel="stylesheet" href="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css"/>
<link rel="stylesheet" href="assets/vendor/morris/morris.css"/>
<!-- Theme CSS -->
<link rel="stylesheet" href="assets/stylesheets/theme.css"/>
<!-- Skin CSS -->
<link rel="stylesheet" href="assets/stylesheets/skins/default.css"/>
<!-- Theme Custom CSS -->
<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">
<!-- Head Libs -->
<script src="assets/vendor/modernizr/modernizr.js"></script>


<%-- <c:import url="/common/HeadTag.jsp"/> END--%>
		
		
		
<meta name="author" content="okler.net">
<!-- Specific Page Vendor CSS -->
<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
<link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />
		


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">



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
        
        $("#datepicker").datepicker({
        	 showOn: "both",
             buttonImage: "img/calender0327.png",
             buttonImageOnly: true,
             buttonText: "Select date",
             



            });  
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
								<li><span>Notice Write</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
    


   
                        <section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
									<a href="#" class="fa fa-times"></a>
								</div>
						        
								<h2 class="panel-title">
								<img src="img/noticeicon.png" style="width:3%; height:3%;">
								&nbsp;&nbsp;공지사항 글쓰기</h2>
								
							</header>
							
					<div class="panel-body">
   
   <form action="noticeWrite.do" method="post" enctype="multipart/form-data">
    <input type="text" class="form-control mb-3" id="title" name="title"
     placeholder="글 제목을 입력하시오" value="">
     <div style="margin: 15px">
       <input type="text" id="datepicker">
     </div>  
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
   </section>
 

 </section>
	  </div>
	
				<!-- 오른쪽 사이드바!! -->
		<c:import url="/common/RightSide.jsp"/> 

<!-- 오른쪽 사이드바 끝!! -->
		</section>

    
  
</body>
</html>