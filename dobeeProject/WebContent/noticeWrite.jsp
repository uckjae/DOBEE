<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html class="fixed">
<head>
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
	<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
	<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

	<!-- Specific Page Vendor CSS -->
	<link rel="stylesheet" href="assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
	<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
	<link rel="stylesheet" href="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css" />
	<link rel="stylesheet" href="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.css" />
	<link rel="stylesheet" href="assets/vendor/bootstrap-colorpicker/css/bootstrap-colorpicker.css" />
	<link rel="stylesheet" href="assets/vendor/bootstrap-timepicker/css/bootstrap-timepicker.css" />
	<link rel="stylesheet" href="assets/vendor/dropzone/css/basic.css" />
	<link rel="stylesheet" href="assets/vendor/dropzone/css/dropzone.css" />
	<link rel="stylesheet" href="assets/vendor/bootstrap-markdown/css/bootstrap-markdown.min.css" />
	<link rel="stylesheet" href="assets/vendor/summernote/summernote.css" />
	<link rel="stylesheet" href="assets/vendor/summernote/summernote-bs3.css" />

	<!-- Theme CSS -->	
	<link rel="stylesheet" href="assets/stylesheets/theme.css" />

	<!-- Skin CSS -->
	<link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

	<!-- Theme Custom CSS -->
	<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

	<!-- Head Libs -->
	<script src="assets/vendor/modernizr/modernizr.js"></script>
	
	
	<!-- Vendor -->
	<script src="assets/vendor/jquery/jquery.js"></script>
	<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
	<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
	<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
	<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
	<!-- Specific Page Vendor -->
	<script src="assets/vendor/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
	<script src="assets/vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.js"></script>
	<script src="assets/vendor/select2/select2.js"></script>
	<script src="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.js"></script>
	<script src="assets/vendor/jquery-maskedinput/jquery.maskedinput.js"></script>
	<script src="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
	<script src="assets/vendor/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script src="assets/vendor/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script src="assets/vendor/fuelux/js/spinner.js"></script>
	<script src="assets/vendor/dropzone/dropzone.js"></script>
	<script src="assets/vendor/bootstrap-markdown/js/markdown.js"></script>
	<script src="assets/vendor/bootstrap-markdown/js/to-markdown.js"></script>
	<script src="assets/vendor/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script src="assets/vendor/bootstrap-maxlength/bootstrap-maxlength.js"></script>		
	<script src="assets/vendor/ios7-switch/ios7-switch.js"></script>
		
	<!-- Theme Base, Components and Settings -->
	<script src="assets/javascripts/theme.js"></script>
	
	<!-- Theme Custom -->
	<script src="assets/javascripts/theme.custom.js"></script>
		
	<!-- Theme Initialization Files -->
	<script src="assets/javascripts/theme.init.js"></script>

	<!-- Examples -->
	<script src="assets/javascripts/forms/examples.advanced.form.js" /></script>

	<!-- include Nobootstrap summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
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
									<span><img src="img/noticeiconsub.png" style="width:32; height:35;"></span>
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
						    <!--page title(공지사항 글쓰기)-->
							<h2 class="panel-title">
								<img src="img/noticeiconmain.png" style="width:50; height:60;">&nbsp;&nbsp;공지사항 글쓰기</h2>
						</header>
						<div class="panel-body">
						   <!--공지사항 제목  -->
						   <form action="noticeWrite.do" method="post" enctype="multipart/form-data">
						    <div class="form-group">
						    	<input type="text" class="form-control mb-3" id="title" name="title" placeholder="글제목" value="">
						    </div>
						     <div style="margin:10px"></div>
						     <!--공지사항 일정시작,종료  -->
						     <div class="row">
							     <div class="col-md-6">
							     	<div class="form-group">
										<input type="text" class="form-control md-3" id="nscontent" name="nsContent" placeholder="공자사항 일정 내용" value="">
							     	</div>
							     </div>
							     <div class="col-md-6">
							     	<div class="form-group">
							     		<div class="input-daterange input-group" data-plugin-datepicker>
											<span class="input-group-addon">
											  <i class="fa fa-calendar"></i>
											</span>
											<input type="text" class="form-control" name="starttime" id="datepicker" placeholder="시작일">
											<span class="input-group-addon">
											  <i class="fa fa-calendar"></i>
											</span>
											<input type="text" class="form-control" name="endtime" id="datepicker2" placeholder="종료일">
								 		</div> 
							     	</div>
							     </div>
							</div>
							<div class="fileupload fileupload-new">
							    <input type="file" class="form-control" id="title" name="title" placeholder="글제목" value="">
							</div>
							<!--공지사항 일정내용  -->
						     <div style="margin:10px"></div>
						     <!--공지사항 내용  -->
						    <textarea id="summernote1" name="content"></textarea>    
						    <div class="text-right" id="lengthBox"> 
							  <span id="total-characters"></span><span id="max"></span>
							</div>
							<!--공지사항 작성,취소 버튼 -->
						    <div class ="text-center" style="margin-top:18px;">
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