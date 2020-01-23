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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
		$(function(){
			var mail = $("#formMail").val();
			console.log('메일은?'+mail);
			/* 권한 코드 select option 만들기*/
			$.ajax({
				url:"ajax/admin/authorityList.do",
				dataType: "JSON",
				success: function(data){
					var authSelected = $("#authCode option:selected").val(); //selected 된 것의 option 값 가져오기
					$("#authCode").empty();
					$.each(data, function(i, elt) {
						if(elt.authCode !=1 && authSelected !== elt.authCode){ // 권한 코드가 관리자가 아님 & 권한 코드 중 selected 된 것과 같지 않을 때만 append함
							var option = $('<option>');
							$(option).val(elt.authCode); 
							if(elt.authCode == 2){
								$(option).text("사원");
							}
							else{
								$(option).text("팀장");
							}
							$('#authCode').append(option);
						}
					});

				}
			})
	
			/* 팀 목록 select option 만들기 */
			$.ajax({
				url:"ajax/admin/teamList.do",
				dataType:"JSON",
				success: function(data){
					$.each(data, function(i, elt) {
						var option = $('<option>');
						var teamSelected = $("#teamCode option:selected").text(); //selected 된 것의 option 값 가져오기
						if(teamSelected !== elt.teamName) { //팀 목록 중 selected 된 것과 같지 않을 때만 append함
							$(option).val(elt.teamCode);
							$(option).text(elt.teamName);
							$('#teamCode').append(option);
						}
					})
					
				}	
			});

			/* 이미지 blob 가져오기 */
			/* $.ajax({
				url:"ajax/admin/getMyPic.do",
				dataType:"json",
				success: function(data){
					console.log('ajax 타니?');
					console.log('이미지?'+data);
					
				},
				error:function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
			}); */

			/*사원 정보 수정*/
			$("#modifyBtn").click(function(){
				var modifyUserForm = $("form[name=modifyUserForm]").serialize();
				console.log('폼 데이터?'+modifyUserForm);
	 			$.ajax({
	 	 			url:"ajax/admin/modifyUser.do",
	 				data: modifyUserForm ,
	 				dataType: "text",
	 				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	 				type:"post",
	 				success:function(responsedata){
    	 				console.log('ajax 통신 성공?');
	 					console.log(responsedata);
	 					if(responsedata == "success"){ //프로젝트 생성 완료
	 	 					console.log('수정 완료')
	 	 					swal({
	 						   title: "사원 정보 수정 완료",
	 						   text: "사원 정보가 수정되었습니다.",
	 						   icon: "success" //"info,success,warning,error" 중 택1
	 						}).then((YES) => {
	 							location.reload(true); 
	 						})
	 	 				}
	 				},
	 				error:function(request,status,error){
						console.log("code : " + request.status +"\n" + "message : " 
								+ request.responseText + "\n" + "error : " + error);
					}
	 			});
				
			});
		});

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
										<h2 class="panel-title">사원 수정</h2>
									</header>
									<div class="panel-body">
										<form class="form-horizontal form-bordered" id="modifyUserForm" name="modifyUserForm" enctype="multipart/form-data">
											<div class="form-group">
												<label class="col-md-3 control-label" for="multiFile"><img id="viewPhoto" name="viewPhoto" src="img/avatar.jpg" alt="프로필사진"  style="width:13em; height:100%;"></label>
												<div class="col-md-6">
													<input type="file" id="multiFile" name="multiFile"  class="form-control" accept="image/*" hidden="true">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="name">사원이름</label>
												<div class="col-md-6">
													<input class="form-control" id="formName" name="name" form="modifyUserForm" type="text" value="${user.name}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="mail">사원&nbsp;E-mail</label>
												<div class="col-md-6">
													<input class="form-control" id="formMail" name="mail" type="email" form="modifyUserForm" value="${user.mail}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="emp">고용상태</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="emp" name="emp" required="required" autofocus="autofocus" form="modifyUserForm">
														<option hidden>선택하세요</option>
														<option value="재직" <c:if test="${user.emp == '재직'}">selected</c:if> >재직</option>
														<option value="고용예정" <c:if test="${user.emp == '고용예정'}">selected</c:if> >고용예정</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="regitDate">고용일</label>
												<div class="col-md-6">
													<input class="form-control" id="regitDate" name="regitDate" type="date" form="modifyUserForm" value="<fmt:formatDate value='${user.regitDate}' pattern='yyyy-MM-dd'/>">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="serve">고용</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="serve" name="serve" required="required" autofocus="autofocus" form="modifyUserForm">
														<option hidden>선택하세요</option>
														<option value="정규직" <c:if test="${user.serve == '정규직'}">selected</c:if> >정규직</option>
                                                        <option value="인턴" <c:if test="${user.serve == '인턴'}">selected</c:if> >인턴</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="position">직책</label>
												<div class="col-md-6">
													<input class="form-control" id="position" name="position" type="text" form="modifyUserForm" value="${user.position}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="authCode">권한코드</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="authCode" name="authCode" required="required" autofocus="autofocus" form="modifyUserForm">
														<option hidden>선택하세요</option>
														<c:choose>
															<c:when test="${not empty user.authCode && user.authCode == '2' }">
																<option value="${user.authCode}" selected >사원</option>
															</c:when>
														<c:otherwise>
																<option value="${user.authCode}" selected >팀장</option>
														</c:otherwise>
														</c:choose>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="teamCode">팀 선택</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="teamCode" name="teamCode" required="required" autofocus="autofocus" form="modifyUserForm">
														<option hidden>선택하세요</option>
														<c:if test="${not empty user.teamCode}">
															<option value="${user.teamCode}" selected >${user.teamName}</option>
														</c:if>
													</select>
												</div>
											</div>
											<div class="form-group">
                                                <label class="col-md-3 control-label" for="phone">전화번호</label>
                                                <div class="col-md-6">
                                                    <input type="text" id="phone" name="phone" class="form-control" form="modifyUserForm" value="${user.phone}">
                                                </div>
                                            </div>
											<div class="col-md-6 control-label">
												<button type="button" class="btn btn-primary" id="modifyBtn">등록</button>
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