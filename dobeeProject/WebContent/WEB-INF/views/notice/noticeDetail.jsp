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
<link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Detail</title>

<style type="text/css">
.ds {
	width: 100%;
	min-height: 300px;
	border: 1px solid #a9a9a9;
	border-radius: 5px;
	padding: 10px;
	
}
</style>
</head>

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
							<li><span>Notice Detail</span></li>
							<li><span>Title:&nbsp;&nbsp;${notice.title}</span></li>
						</ol>

						<a class="sidebar-right-toggle" data-open="sidebar-right"><i
							class="fa fa-chevron-left"></i></a>
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
								<img src="img/noticeiconmain.png" style="width:50; height:60;">
								&nbsp;&nbsp;공지사항</h2>								
							</header>
							
					<div class="panel-body">		
						<input type="number" hidden="true" value="${notice.notSeq}">
						<p style="float: right">
							작성일:
							<fmt:formatDate value="${notice.regDate}"
								pattern="yyyy-MM-dd HH:mm" />
						</p>
						<input type="text" class="form-control mb-3" id="title"
							name="title" value="${notice.title}" readonly>
						<div style="margin: 15px"></div>
						<div id="content1" row="10" class="ds">${notice.content}</div>
						
						<div class="text-right" id="lengthBox">
							<span id="total-characters"></span> <span id="max"></span>
						</div>
						
						<div class="text-right" style="margin:30px">
							<a class="btn btn-primary mr-3"
								href="noticeModify.do?notSeq=${notice.notSeq}">수정</a> <a
								class="btn btn-primary mr-3"
								href="noticeDel.do?notSeq=${notice.notSeq}">삭제</a> <a
								class="btn btn-primary mr-3" href="noticeList.do">목록</a>
						</div>
						</div>
						</section>
			</section>
		</div>

		<!-- 오른쪽 사이드바!! -->
		<c:import url="/common/RightSide.jsp" />

		<!-- 오른쪽 사이드바 끝!! -->
	</section>
	<c:import url="/common/BottomTag.jsp" />

</body>
</html>