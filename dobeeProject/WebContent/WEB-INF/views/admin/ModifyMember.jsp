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
			
			$("#multiFile").change(function(){
				var reader = new FileReader();

			    reader.onload = function (e) {
			        // get loaded data and render thumbnail.
			        document.getElementById("viewPhoto").src = e.target.result;
			    };

			    // read the image file as a data URL.
			    reader.readAsDataURL(this.files[0]);
			});
			
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

			/*사원 정보 수정*/
			$("#modifyBtn").click(function(){
				
	 			$.ajax({
	 	 			url:"ajax/admin/modifyUser.do",
	 				data: new FormData($('#modifyUserForm')[0]),
	 				dataType: "text",
	 				type:"post",
	 				processData:false,
	 				contentType:false,
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

			/*사원 삭제*/
			$("#deleteBtn").click(function(){
				swal({
					   title: "사원 정보 삭제",
					   text: "사원 정보를 삭제하시겠습니까?",
					   icon: "warning" //"info,success,warning,error" 중 택1
					}).then((YES) => {
					//사원 삭제 ajax
						$.ajax({
			 	 			url:"ajax/admin/deleteUser.do?mail="+mail,
			 				dataType: "text",
			 				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			 				type:"post",
			 				success:function(responsedata){
		    	 				console.log('ajax 통신 성공?');
			 					console.log(responsedata);
			 					if(responsedata == "success"){ //프로젝트 생성 완료
			 	 					console.log('삭제 완료')
			 	 					swal({
			 						   title: "사원 정보 삭제 완료",
			 						   text: "사원 삭제가 완료되었습니다.",
			 						   icon: "success" //"info,success,warning,error" 중 택1
			 						}).then((YES) => {
			 							location.href="adminMain.do";
			 						})
			 	 				}
			 				},
			 				error:function(request,status,error){
								console.log("code : " + request.status +"\n" + "message : " 
										+ request.responseText + "\n" + "error : " + error);
							}
			 			});



						
					})

			});
		});

	</script>

</head>
	<body>
		<section class="body">

			<!-- start: header -->
			<c:import url="/common/TopAdmin.jsp"/>
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<c:import url="/common/SideAdmin.jsp"/>
				<!-- end: sidebar -->
				
			<!-- start : main Content -->
				<section role="main" class="content-body">
					<header class="page-header">
						<h2>사원 관리</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="#">
										<i class="fa fa-briefcase"></i>
									</a>
								</li>
								<li><span>사원</span></li>
								<li><span>사원 관리</span></li>
							</ol>
					
					<i class="fa fa-chevron-left"></i>
						</div>
					</header>
					<!-- 작업 여기부터~!~!~!~~! -->
					<div class="row">
							<div class="col-lg-12">
								<section class="panel">
									<header class="panel-heading">
										<h2 class="panel-title">사원 수정 및 삭제</h2>
									</header>
									<div class="panel-body">
										<form class="form-horizontal form-bordered" id="modifyUserForm" name="modifyUserForm" enctype="multipart/form-data">
											<div class="form-group">
												<label class="col-md-3 control-label" for="multiFile"><img id="viewPhoto" name="viewPhoto" src="upload/${userDetail.myPic}" onError="this.src='img/avatar.jpg'" alt="프로필사진"  style="width:13em; height:100%;"></label>
												<div class="col-md-6">
													<input type="file" id="multiFile" name="file" class="form-control" accept="image/*" form="modifyUserForm">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="name">사원이름</label>
												<div class="col-md-6">
													<input class="form-control" id="formName" name="name" form="modifyUserForm" type="text" value="${userDetail.name}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="mail">사원&nbsp;E-mail</label>
												<div class="col-md-6">
													<input class="form-control" id="formMail" name="mail" type="email" form="modifyUserForm" value="${userDetail.mail}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="emp">고용상태</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="emp" name="emp" required="required" autofocus="autofocus" form="modifyUserForm">
														<option hidden>선택하세요</option>
														<option value="재직" <c:if test="${userDetail.emp == '재직'}">selected</c:if> >재직</option>
														<option value="고용예정" <c:if test="${userDetail.emp == '고용예정'}">selected</c:if> >고용예정</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="regitDate">고용일</label>
												<div class="col-md-6">
													<input class="form-control" id="regitDate" name="regitDate" type="date" form="modifyUserForm" value="<fmt:formatDate value='${userDetail.regitDate}' pattern='yyyy-MM-dd'/>">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="serve">고용</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="serve" name="serve" required="required" autofocus="autofocus" form="modifyUserForm">
														<option hidden>선택하세요</option>
														<option value="정규직" <c:if test="${userDetail.serve == '정규직'}">selected</c:if> >정규직</option>
                                                        <option value="인턴" <c:if test="${userDetail.serve == '인턴'}">selected</c:if> >인턴</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="position">직책</label>
												<div class="col-md-6">
													<input class="form-control" id="position" name="position" type="text" form="modifyUserForm" value="${userDetail.position}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="authCode">권한코드</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="authCode" name="authCode" required="required" autofocus="autofocus" form="modifyUserForm">
														<option hidden>선택하세요</option>
														<c:choose>
															<c:when test="${not empty user.authCode && user.authCode == '2' }">
																<option value="${userDetail.authCode}" selected >사원</option>
															</c:when>
														<c:otherwise>
																<option value="${userDetail.authCode}" selected >팀장</option>
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
														<c:if test="${not empty userDetail.teamCode}">
															<option value="${userDetail.teamCode}" selected >${userDetail.teamName}</option>
														</c:if>
													</select>
												</div>
											</div>
											<div class="form-group">
                                                <label class="col-md-3 control-label" for="phone">전화번호</label>
                                                <div class="col-md-6">
                                                    <input type="text" id="phone" name="phone" class="form-control" form="modifyUserForm" value="${userDetail.phone}">
                                                </div>
                                            </div>
											<div class="col-md-6 control-label">
												<button type="button" class="btn btn-primary" id="modifyBtn">수정</button>
												<button type="button" class="btn btn-primary" id="deleteBtn">삭제</button>
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