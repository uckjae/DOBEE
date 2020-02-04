<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="fixed">
<head>
	<c:import url="/common/HeadTag.jsp"/>
	<!-- Sweet Alert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
					<div class="col-md-8 col-lg-8" data-plugin-portlet id="portlet-1">
							<section class="panel panel-primary" id="panel-1" data-portlet-item>
								<header class="panel-heading portlet-handler">
									<h2 class="panel-title">정보 수정</h2>
								</header>
								<div class="panel-body">
								<form action="mypageModify.do" method="post" class="form-horizontal" name="mypageForm">
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
													<input type="text" class="form-control" id="phone" name="phone" value="${user.phone}"  maxlength="13"> 
												</div>
											</div>
										</fieldset>
										
									</form>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-md-4 col-md-offset-4 text-center">
											<button type="button" id="mypageBtn" class="btn btn-primary" onclick="myPageEdit(this)">수정</button>
											<button type="reset" class="btn btn-default">취소</button>
										</div>
									</div>
								</div>
							</section>
					</div>
				</div>
				<!-- end: page -->
			</section>
		</div>
	</section>

	
	<c:import url="/common/BottomTag.jsp"/>
	<!-- Specific Page Vendor -->
	<script src="assets/vendor/jquery-autosize/jquery.autosize.js"></script>
<script>
	let pw_pattern = /^[a-z0-9_]{6,20}$/;
	let pwCheck;
	let pwDoubleCheck;
	//a~z,0~9까지 입력가능 8자~20자 이내로

	//전화번호 유효성 검사
	let numberReg = /^\d{3}-\d{4}-\d{4}$/;
	let numberCheck;

	function pwdCheck(number){
		var check = pw_pattern.test(number);
		if(check){
        	console.log('비밀번호 형식 맞음')
            pwCheck = true;
        }else{
        	console.log('비밀번호 형식 맞지 않음')
            pwCheck = false;
        }
	}

	function pwdDoubleCheck(number){
		if($("#password").val() != number){
			pwDoubleCheck = false;
        }else{
        	console.log('비밀번호 형식 맞음')
            pwDoubleCheck = true;
        }
	}
	
	
	function inputVailPhone(number){
		if(number.length == 13) {
			var check = numberReg.test(number);  //true or false
			if(check){
				console.log("휴대폰넘버 유효성 통과");
				numberCheck = true;
			}else{
				console.log("휴대폰넘버 유효성 불통");
				numberCheck = false;
			}
		} else {
			numberCheck = false;
		}
	};
	
	/*마이페이지 수정*/
	function myPageEdit() {
		inputVailPhone($("#phone").val());
		pwdCheck($("#password").val());
		pwdDoubleCheck($("#confirmPassword").val());
		
		//전화번호 & 비번 유효성 검사 해야 됨!
		console.log('휴대폰 번호 체크'+numberCheck);
		console.log('비밀번호 체크'+pwCheck);
		console.log('비번 다시 체크'+pwDoubleCheck);
		
		//전화번호 유효성 검사 && 비번 유효성 검사
		if(numberCheck == true && pwCheck == true && pwDoubleCheck == true){
			var mypageForm = $("form[name=mypageForm]").serialize();
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
			
		}

		if(numberCheck == false) {
			swal({
				   title: "휴대폰 번호 형식 오류",
				   text: "휴대폰 번호 형식에 맞지 않습니다. 다시 입력해주세요.",
				   icon: "warning",//"info,success,warning,error" 중 택1
				}).then((YES) => {
					if (YES) {
						$("#phone").focus();
					     }
			});
			return;
		}
		
		if(pwCheck == false) {
			swal({
				   title: "비밀번호 형식 오류",
				   text: "비밀번호가 형식에 맞지 않습니다. 다시 입력해주세요.",
				   icon: "warning",//"info,success,warning,error" 중 택1
				}).then((YES) => {
					if (YES) {
						$("#password").focus();
					     }
			});
			return;
		}
		
		if(pwDoubleCheck == false) {
			swal({
				   title: "비밀번호 입력 오류",
				   text: "비밀번호가 일치하지 않습니다. 다시 입력해주세요.",
				   icon: "warning",//"info,success,warning,error" 중 택1
				}).then((YES) => {
					if (YES) {
						$("#password").focus();
					     }
			});
			return;
		}

	}
</script>
</body>
</html>