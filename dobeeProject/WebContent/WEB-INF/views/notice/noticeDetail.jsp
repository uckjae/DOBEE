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

	<!-- include Nobootstrap summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
	
	<!-- 파일 업로드 -->
	<link rel="stylesheet" href="assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.css" />
	<script src="assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<!-- Sweet Alert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<style type="text/css">
	.ds {
		width: 100%;
		min-height: 300px;
		border: 1px solid #a9a9a9;
		border-radius: 5px;
		padding: 10px;
		
	}
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
<script>
function noticeDel () {

	swal({
		title: "글 삭제",
		text: "글을 삭제하시겠습니까?", 
		icon: "warning", //"info,success,warning,error" 중 택1
		showConfirmButton: true
		//icon: "warning" //"info,success,warning,error" 중 택1
			}).then((YES) => {
				var notSeq = $("#notSeq").val();
				console.log('값 가져와?'+notSeq);
				$.ajax({
	 	 			url:"noticeDel.do?notSeq="+notSeq,
	 				dataType: "text",
	 				contentType :  "application/x-www-form-urlencoded; charset=UTF-8",
	 				type:"post",
	 				success:function(responsedata){
	 					console.log(responsedata);
	 					if(responsedata == "success"){ //삭제 완료
	 	 					console.log('삭제 완료')
	 	 					swal({
	 						   title: "삭제 완료",
	 						   text: "글이 삭제되었습니다.",
	 						   icon: "success", //"info,success,warning,error" 중 택1
	 						  showConfirmButton: true
	 						}).then((YES) => {
	 								location.href="noticeList.do"; 
	 							})
	 	 					}
	 				},
	 				error:function(){
	 					
	 				}
	 			});
			});
	
	}

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
							<li><span>공지사항</span></li>
							<li><span>&nbsp;&nbsp;${notice.title}</span></li>
						</ol>
						<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
					</div>
				</header>

				<!-- navbar-->
				<section class="panel">
					<header class="panel-heading">
						<div class="panel-actions">
							<a href="#" class="fa fa-caret-down"></a>
							<a href="#" class="fa fa-times"></a>
						</div>
							<h2 class="panel-title">
							<img src="img/noticeiconmain.png" style="width:50; height:60;">&nbsp;&nbsp;공지사항</h2>								
					</header>
					
					<div class="panel-body">
						<div class="form-group" style="margin-bottom: 0px;">
							<p style="float: right">작성일&nbsp;:&nbsp;<fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd HH:mm" />
							</p>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">제목</label>
							<input type="text" class="form-control mb-3" id="title" name="title" value="${notice.title}" readonly>
							<input type="hidden" id="notSeq" value="${notice.notSeq}">
						</div>
						<div style="margin: 15px"></div>						
						<!-- 공지사항 일정 -->
						<c:choose>
							<c:when test="${ not empty ns}">
								<div class="form-group">
									<label class="col-md-3 control-label">공지사항 일정</label>
									<input type="text" class="form-control md-3" id="nsContent" name="nsContent" value="${ns.nsContent }"readonly>
								</div>
								<div class="form-group">
									<div class="input-daterange input-group" data-plugin-datepicker>
										<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
										<input type="text" class="form-control" name="startTime" id="startTime" placeholder="시작일" value="<fmt:formatDate value='${sc.startTime}' pattern='yyyy-MM-dd'/>" readonly>
										<span class="input-group-addon">to</span>
										<input type="text" class="form-control" name="endTime" id="endTime" placeholder="종료일" value="<fmt:formatDate value='${sc.endTime}' pattern='yyyy-MM-dd'/>" readonly>
									</div> 
								</div>
							</c:when>
							<c:otherwise>
								<div class="form-group">
									<label class="col-md-3 control-label">공지사항 일정</label>
									<input type="text" class="form-control md-3" id="nsContent" name="nsContent" value=""readonly>
								</div>
								<div class="form-group">
									<div class="input-daterange input-group" data-plugin-datepicker>
										<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
										<input type="text" class="form-control" name="startTime" id="startTime" placeholder="시작일" value="" readonly>
										<span class="input-group-addon">to</span>
										<input type="text" class="form-control" name="endTime" id="endTime" placeholder="종료일" value="" readonly>
									</div> 
								</div>
							</c:otherwise>
						</c:choose>
						<!-- 파일 업로드  -->
						<c:choose>
							<c:when test="${ not empty nf}">
								<div class="form-group" style="margin-bottom:3px;"> 
								 	 <label class="col-md-3 control-label">파일</label>
								 	 <a href="noticeDownload.do?p=upload&f=${nf.orgName}">${nf.orgName}</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="form-group" style="margin-bottom:3px;"> 
							 	 <label class="col-md-3 control-label">파일</label>
							</div>
							</c:otherwise>
						</c:choose>
						
						<div id="content1" row="10" class="ds">${notice.content}</div>
						<div class="text-right" id="lengthBox">
							<span id="total-characters"></span> <span id="max"></span>
						</div>
						<div class="text-right" style="margin:30px">
							<!-- 관리자만 버튼 추가해주기 -->
							<c:if test="${ user.authCode == '3'}">
								<a class="btn btn-primary mr-3" href="noticeModify.do?notSeq=${notice.notSeq}">수정</a>
								<span class="btn btn-primary mr-3" style="cursor:pointer" onclick="noticeDel();">삭제</span>
							</c:if>
							<a class="btn btn-primary mr-3" href="noticeList.do">목록</a>
						</div>
						</div>
						</section>
			</section>
		</div>
	</section>
	<c:import url="/common/BottomTag.jsp" />

</body>
</html>