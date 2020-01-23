<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="fixed">
<head>
	<c:import url="/common/HeadTag.jsp"/>
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
			<section role="main" class="content-body">
				<header class="page-header">
					<h2>마이페이지</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li>
								<a href="#">
									<i class="fa fa-home"></i>
								</a>
							</li>
							<li><span>마이페이지</span></li>
						</ol>
				
						<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
					</div>
				</header>

				<!-- start: page -->

				<div class="row">
					<div class="col-md-4 col-lg-3">

						<section class="panel">
							<div class="panel-body">
								<div class="thumb-info mb-md">
									<img src="assets/images/!logged-user.jpg" class="rounded img-responsive" alt="John Doe">
									<div class="thumb-info-title">
										<span class="thumb-info-inner">John Doe</span>
										<span class="thumb-info-type">CEO</span>
									</div>
								</div>

								<div class="widget-toggle-expand mb-md">
									<div class="widget-header">
										<h6>Profile Completion</h6>
										<div class="widget-toggle">+</div>
									</div>
									<div class="widget-content-collapsed">
										<div class="progress progress-xs light">
											<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
												60%
											</div>
										</div>
									</div>
									<div class="widget-content-expanded">
										<ul class="simple-todo-list">
											<li class="completed">Update Profile Picture</li>
											<li class="completed">Change Personal Information</li>
											<li>Update Social Media</li>
											<li>Follow Someone</li>
										</ul>
									</div>
								</div>

								<hr class="dotted short">

								<h6 class="text-muted">About</h6>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis vulputate quam. Interdum et malesuada</p>
								<hr class="dotted short">

								<div class="social-icons-list">
									<a rel="tooltip" data-placement="bottom" target="_blank" href="http://www.facebook.com" data-original-title="Facebook"><i class="fa fa-facebook"></i><span>Facebook</span></a>
									<a rel="tooltip" data-placement="bottom" href="http://www.twitter.com" data-original-title="Twitter"><i class="fa fa-twitter"></i><span>Twitter</span></a>
									<a rel="tooltip" data-placement="bottom" href="http://www.linkedin.com" data-original-title="Linkedin"><i class="fa fa-linkedin"></i><span>Linkedin</span></a>
								</div>

							</div>
						</section>

					</div>
					<div class="col-md-8 col-lg-6">

						<div class="tabs">
							<ul class="nav nav-tabs tabs-primary">
								<li class="active">
									<a href="#overview" data-toggle="tab">Overview</a>
								</li>
								<li>
									<a href="#edit" data-toggle="tab">Edit</a>
								</li>
							</ul>
							<div class="tab-content">
								<div id="overview" class="tab-pane active">
									<h4 class="mb-xlg">Timeline</h4>

									<div class="timeline timeline-simple mt-xlg mb-md">
										<div class="tm-body">
											<div class="tm-title">
												<h3 class="h5 text-uppercase">November 2013</h3>
											</div>
											<ol class="tm-items">
												<li>
													<div class="tm-box">
														<p class="text-muted mb-none">7 months ago.</p>
														<p>
															It's awesome when we find a good solution for our projects, Porto Admin is <span class="text-primary">#awesome</span>
														</p>
													</div>
												</li>
												<li>
													<div class="tm-box">
														<p class="text-muted mb-none">7 months ago.</p>
														<p>
															What is your biggest developer pain point?
														</p>
													</div>
												</li>
											</ol>
										</div>
									</div>
								</div>
								<!-- 정보 수정 -->
								<div id="edit" class="tab-pane">
									<form action="mypageModify.do" method="post" class="form-horizontal" name="mypageForm">
										<h4 class="mb-xlg">정보 수정</h4>
										<fieldset>
											<div class="form-group">
												<label class="col-md-3 control-label" for="name">이름</label>
												<div class="col-md-8">
													<input type="text" class="form-control" id="name" name="name" value="${user.name}" readonly>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="profileLastName">E-mail</label>
												<div class="col-md-8">
													<input type="text" class="form-control" id="mail" name="mail" value="${user.mail}" readonly>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="profileNewPassword">비밀번호</label>
												<div class="col-md-8">
													<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호 입력">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="profileNewPasswordRepeat">비밀번호 재입력</label>
												<div class="col-md-8">
													<input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 재입력">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="profileCompany">입사일</label>
												<div class="col-md-8"> <!-- ${user.regitDate} -->
													<input type="text" class="form-control" id="regitDate" name="regitDate" value="<fmt:formatDate value='${user.regitDate}' pattern='yyyy-MM-dd'/>" >
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="profileCompany">직책</label>
												<div class="col-md-8">
													<input type="text" class="form-control" id="position" name="position" value="${user.position}" readonly>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="profileCompany">소속</label>
												<div class="col-md-8">
													<input type="text" class="form-control" id="teamName" name="teamName" value="${user.teamName}" readonly>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="profileCompany">휴대폰 번호</label>
												<div class="col-md-8">
													<input type="text" class="form-control" id="phone" name="phone" value="${user.phone}"> 
												</div>
											</div>
										</fieldset>
										<div class="panel-footer">
											<div class="row">
												<div class="col-md-4 col-md-offset-4 text-center">
													<button type="button" id="mypageBtn" class="btn btn-primary">수정</button>
													<button type="reset" class="btn btn-default">취소</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-lg-3">

						<h4 class="mb-md">Sale Stats</h4>
						<ul class="simple-card-list mb-xlg">
							<li class="primary">
								<h3>488</h3>
								<p>Nullam quris ris.</p>
							</li>
							<li class="primary">
								<h3>$ 189,000.00</h3>
								<p>Nullam quris ris.</p>
							</li>
							<li class="primary">
								<h3>16</h3>
								<p>Nullam quris ris.</p>
							</li>
						</ul>

						<h4 class="mb-md">Projects</h4>
						<ul class="simple-bullet-list mb-xlg">
							<li class="red">
								<span class="title">Porto Template</span>
								<span class="description truncate">Lorem ipsom dolor sit.</span>
							</li>
							<li class="green">
								<span class="title">Tucson HTML5 Template</span>
								<span class="description truncate">Lorem ipsom dolor sit amet</span>
							</li>
							<li class="blue">
								<span class="title">Porto HTML5 Template</span>
								<span class="description truncate">Lorem ipsom dolor sit.</span>
							</li>
							<li class="orange">
								<span class="title">Tucson Template</span>
								<span class="description truncate">Lorem ipsom dolor sit.</span>
							</li>
						</ul>
					</div>

				</div>
				<!-- end: page -->
			</section>
		</div>
		<!-- 오른쪽 사이드 시작 -->
		<c:import url="/common/RightSide.jsp"/>
		<!-- 오른쪽 사이드 끝 -->		
	</section>

	
	<c:import url="/common/BottomTag.jsp"/>
	<!-- Specific Page Vendor -->
	<script src="assets/vendor/jquery-autosize/jquery.autosize.js"></script>
<script>
	$(function(){
		/*마이페이지 수정*/
		$("#mypageBtn").on('click', function(e){
       			var mypageForm = $("form[name=mypageForm]").serialize() ;
   	 			$.ajax({
   	 	 			url:"ajax/mypage/modify.do",
   	 				data: mypageForm,
   	 				dataType: "text",
   	 				contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
   	 				type:"post",
   	 				success:function(responsedata){
       	 				console.log('ajax 통신 성공?');
   	 					console.log(responsedata);
   	 					if(responsedata == "success"){ //프로젝트 생성 완료
   	 	 					console.log('수정 완료')
   	 	 					swal({
   	 						   title: "정보 수정완료",
   	 						   text: "정보가 수정되었습니다.",
   	 						   icon: "success" //"info,success,warning,error" 중 택1
   	 						}).then((YES) => {
   	 								location.reload(true); 
   	 							})
   	 					
   	 	 					}
   	 				},
   	 				error:function(){
   	 					
   	 				}
   	 			});
    		});
		
		})
</script>
</body>
</html>