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
<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

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
        
       /*  $("#datepicker").datepicker({
             dateFormat: 'yymmdd',
             prevText: '이전 달',
             nextText: '다음 달',
             monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
             monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
             dayNames: ['일', '월', '화', '수', '목', '금', '토'],
             dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
             showMonthAfterYear: true,
             yearSuffix: '년'

            });
        
        $("#datepicker2").datepicker({
            dateFormat: 'yymmdd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'

           });   */
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
								<img src="img/noticeiconmain.png" style="width:50; height:60;">
								&nbsp;&nbsp;공지사항 글쓰기</h2>
								
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

    
<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

</body>
</html>