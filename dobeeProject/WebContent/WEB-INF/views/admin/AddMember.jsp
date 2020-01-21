<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed">
<head>

<c:import url="/common/HeadTag.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
		$(function(){
			/* 권한 코드 select option 만들기*/
			$.ajax({
				url:"ajax/admin/authorityList.do",
				dataType: "JSON",
				success: function(data){
					$.each(data, function(i, elt) {
						if(elt.authCode !=1){
							var option = $("<option>");
							$(option).val(elt.authCode);
							if(elt.authCode == 2){
								$(option).text("사원");
							}
							else{
								$(option).text("팀장");
							}
							$('#authCode').append(option);
						}
					})
				}
			})
	
			/* 팀 목록 select option 만들기 */
			$.ajax({
				url:"ajax/admin/teamList.do",
				dataType:"JSON",
				success: function(data){
					console.log("teamList Ajax");
					console.log(data);
					$.each(data, function(i, elt) {
						var option = $('<option>');
						$(option).val(elt.teamCode);
						$(option).text(elt.teamName);

						$('#teamCode').append(option);
					})
					
				}	
			})
			
			/* 날짜 기본설정 */
			getDate();

			$('#regitDate').change(function(){
				console.log($('#regitDate').val());
			});
			
		});

		function sendMail (){
			reurn new Promise(function(resolve,reject){
				console.log("sendMail()");
				console.log($('#formMail').val());
				console.log($('#formName').val());
				$.ajax({
					url:"ajax/admin/sendEmail.do",
					data: {'mail':$('#formMail').val(),
							'name' : $('#formName').val()
						},
					dataType: "text",
					method: "GET",
					success: function(response){
						resolve(response);
						
					},
					error: function(jqXHR, textStatus, errorThrown){
						console.log(textStatus);
						console.log(errorThrown);
					}
					
					
				});
			});
			
		}

		function myFormSubmit(){
			sendMail().then(function(){
				console.log("submit()");
				document.getElementById('addUserForm').submit();
				$('#addUserForm').submit();
				
			})
		}

		/* 날짜 기본설정 */
		function getDate(){
		    var today = new Date();

			document.getElementById("regitDate").value = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);


		}
	</script>

</head>
	<body>
		<section class="body">

			<!-- start: header -->
			<c:import url="/common/Top.jsp"/>
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<c:import url="/common/SideAdmin.jsp"/>
				<!-- end: sidebar -->
				
			<!-- start : main Content -->
				<section role="main" class="content-body">
					<header class="page-header">
						<h2>Blank Page</h2>
					
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
					<!-- 작업 여기부터~!~!~!~~! -->
					<div class="row">
							<div class="col-lg-12">
								<section class="panel">
									<header class="panel-heading">
																
										<h2 class="panel-title">사원 등록</h2>
									</header>
									<div class="panel-body">
										<form class="form-horizontal form-bordered" action="#" id="addUserForm" method="post" enctype="multipart/form-data">
											<div class="form-group">
												<label class="col-md-3 control-label" for="multiFile"><img id="viewPhoto" name="viewPhoto" src="img/avatar.jpg" alt="프로필사진"  style="width:13em; height:100%;"></label>
												<div class="col-md-6">
													<input type="file" id="multiFile" name="multiFile"  class="form-control" accept="image/*" hidden="true">
												</div>
											</div>
						
											<div class="form-group">
												<label class="col-md-3 control-label" for="name">사원이름</label>
												<div class="col-md-6">
													<input class="form-control" id="formName" name="name" form="addUserForm" type="text">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="mail">사원&nbsp;E-mail</label>
												<div class="col-md-6">
													<input class="form-control" id="formMail" name="mail" type="email" form="addUserForm">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="emp">고용상태</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="emp" name="emp" required="required" autofocus="autofocus" form="addUserForm">
														<option hidden>선택하세요</option>
														<option value="재직">재직</option>
                                                        <option value="고용예정">고용예정</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="regitDate">고용일</label>
												<div class="col-md-6">
													<input class="form-control" id="regitDate" name="regitDate" type="date" form="addUserForm">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="serve">고용</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="serve" name="serve" required="required" autofocus="autofocus">
														<option hidden>선택하세요</option>
														<option value="정규직">정규직</option>
                                                        <option value="인턴">인턴</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="position">직책</label>
												<div class="col-md-6">
													<input class="form-control" id="position" name="position" type="text" form="addUserForm">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="authCode">권한코드</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="authCode" name="authCode" required="required" autofocus="autofocus" form="addUserForm">
														<option hidden>선택하세요</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="teamCode">팀 선택</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="teamCode" name="teamCode" required="required" autofocus="autofocus" form="addUserForm">
														<option hidden>선택하세요</option>
													</select>
												</div>
											</div>
											<div class="form-group">
                                                <label class="col-md-3 control-label" for="phone">전화번호</label>
                                                <div class="col-md-6">
                                                    <input type="text" id="phone" name="phone" class="form-control" form="addUserForm">
                                                </div>
                                            </div>
											<div class="col-md-6 control-label">
												<a class="btn btn-primary" onclick="myFormSubmit()">등록</a>
												<button type="reset" class="btn btn-default" onClick="location.href='MemberList.do'">취소</button>
											</div>
										
										</form>
									</div>
								</section>
							</div>
						</div>
					<!-- start: page -->
					<!-- end: page -->
				</section>
			</div>




			<!-- 오른쪽 사이드바!! -->
		<c:import url="/common/RightSide.jsp"/>
	
			
			<!-- 오른쪽 사이드바 끝!! -->
		</section>

		<c:import url="/common/BottomTag.jsp"/>
	</body>
</html>