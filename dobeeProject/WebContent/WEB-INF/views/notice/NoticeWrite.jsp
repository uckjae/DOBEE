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
	
	<!--폰트  -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700&display=swap" rel="stylesheet">
	
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
    
	
	
	<!-- 파일 업로드 -->
	<link rel="stylesheet" href="assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.css" />
	<script src="assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<!-- Sweet Alert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<style>
	.swal-button {
    	background: #34495E;
	}
	.swal-footer {
  		text-align: center;
	}
	.swal-icon--warning {
		border-color: #f27474;
	}
	
	</style>
</head>

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
			<section role="main" class="content-body" style="font-family: 'Nanum Gothic', sans-serif;">
				<header class="page-header">
					<h2>공지사항</h2>
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<span><img src="img/noticeiconsub.png" style="width:32; height:35;"></span>
								</li>
								<li><span>공지사항</span></li>
								<li><span>글쓰기</span></li>
								<li style="padding-right:30px;"><a href="#" style="cursor:default;"> <i class="fa fa-chevron-left"></i></a></li>
							</ol>
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
						
						   <form action="noticeWrite.do" method="post" enctype="multipart/form-data" id="noticeWriteForm">
						      <!--공지사항 제목  -->
							   <div class="form-group">						   	
							    	<input type="text" class="form-control mb-3" id="title" name="title" placeholder="글제목을 입력하세요" value="">
							    </div>
						     <div style="margin:10px"></div>
						     <!--공지사항 일정시작,종료  -->
							   <div class="form-group">				     	
									<input type="text" class="form-control md-3" id="nsContent" name="nsContent" placeholder="일정 내용을 입력하세요" value="">
							   </div>
							  <div class="form-group">
								    <div class="input-daterange input-group" data-plugin-datepicker>
										<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
										<input type="text" class="form-control" name="startTime" id="startTime" placeholder="시작일" >
										<span class="input-group-addon">to</span>
										<input type="text" class="form-control" name="endTime" id="endTime" placeholder="종료일">
									 </div> 
							   </div>
							 <!-- 파일 업로드  -->
							 <div class="form-group" style="margin-bottom:3px;">				 	 
							 </div>
							 <div class="form-group">
								 <div class="fileupload fileupload-new" data-provides="fileupload">
								 	<div class="input-append">
								 		<div class="uneditable-input">
								 			<i class="fa fa-file fileupload-exists"></i><span class="fileupload-preview"></span>
										</div>
										<span class="btn btn-default btn-file">
											<span class="fileupload-exists">변경</span>
											<span class="fileupload-new">파일 선택</span>
											<input type="file" name="file"  />
										</span>
										<a href="#" class="btn btn-default fileupload-exists" data-dismiss="fileupload">삭제</a>
									</div>
								</div>
							</div>
							<!--공지사항 일정내용  -->
						     <div style="margin:10px"></div>
						     <!--공지사항 내용  -->
						    <textarea id="summernote" name="content"></textarea>    
						    <div class="text-right" id="lengthBox"> 
							  <span id="total-characters"></span><span id="max"></span>
							</div>
							<!--공지사항 작성,취소 버튼 -->
						    <div class ="text-center" style="margin-top:18px;">
						     <input type="button" id="submitBtn" class="btn btn-primary mr-3" value="작성">
						     <a class="btn btn-primary mr-3" href="noticeList.do">취소</a>
						    </div>   
						   </form>   
						 </div>
   				</section>
 			</section>
	  	</div>
	</section>

   
</body>
<!-- include Nobootstrap summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
<script type="text/javascript">
$('#summernote').summernote({     	
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
$("#submitBtn").on('click', function(e){
	if($("#title").val() == "" || $("#summernote").val() == ""){ //글 제목 & 내용 쓰지 않은 경우
		swal({
			title: "공지사항 글",
			text: "제목 또는 내용을 입력해주세요", 
			icon: "warning", //"info,success,warning,error" 중 택1
			button: true
				}).then((YES) => {
						$("#title").focus();
						});
		return;
    }   
   if ($("#nsContent").val()!==""){ //공지사항 일정을 썼는데 캘린더 날짜 선택 안한경우
		if($("#startTime").val()=="" || $("#endTime").val()=="" ){
	        swal({
			title: "공지사항 일정",
			text: "일정을 입력해주세요", 
			icon: "warning", //"info,success,warning,error" 중 택1
			button: true
					}).then((YES) => {
							$("#startTime").focus();
							})
			return;
		}
   	} else{ //공지사항 일정 쓰지 않았는데 캘린더에서 날짜 선택한 경우
		if($("#startTime").val()!=="" || $("#endTime").val()!=="" ){
			swal({
				title: "공지사항 일정",
				text: "일정 내용을 입력해주세요", 
				icon: "warning", //"info,success,warning,error" 중 택1
				button: true
				}).then((YES) => {
					$("#nsContent").focus();
						});
			return;
		}
    }
   	$("#noticeWriteForm").submit();
});
</script>
</html>