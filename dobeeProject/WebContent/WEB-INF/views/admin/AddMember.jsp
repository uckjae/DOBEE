<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed">
<head>
<c:import url="/common/HeadTag.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
		// email 유효성 검사 함수
		// 이메일 최종 유효성 결과값 전역 변수
		var finalCheckEmail = true;
		function vailEmail(sendData){
			console.log("욱재야 이거 보이냐 11111 ");
			jsonData = {
				"mail":sendData
					};
			
			$.ajax({
				url:"ajax/admin/checkEmail.do",
				type:"POST",
				data:jsonData,
				success:function(data){
					console.log("욱재야 이거 보이냐 222222(아작스 성공 ) ");
						//데이타 받을 후 email 중복되었는지 글씨로 표시해줌
						//보낸 데이터의 길이가 0 보다 크면 중복임
						if(data.length > 0){
								$('#emailVail').empty();
								$('#emailVail').append("해당 이메일은 이미 사원으로 등록되어있습니다.");
								 // 이메일 최종 유효성 결과값 전역 변수
								finalCheckEmail = false; 
								console.log(data.length);
							}else{  // 여기로 오면 일단 중복은 아님
								let result = false;
								let email = $("#formMail").val();
								result = inputVailEmail(email); // 이 함수가 유효성 검사하는 함수
								console.log("else문 " + data.length);
								if(result){// 유효성 검사도 통과하면 등록가능 표시
									$('#emailVail').empty();
									$('#emailVail').append("해당 이메일은 등록 가능합니다.");
									finalCheckEmail = true;
								}else{  //중복은 아니나 유효성 통과 못하면 뜨는 메시지
									$('#emailVail').empty();
									$('#emailVail').append("이메일을 'abc@gmail.com' 형태로 입력해주세요.");
									finalCheckEmail = false;
								}
							}
					},
				complete:function(){

						
					},

				error:function(){
						console.log("이메일 중복 확인 아작스 실패");

					}
			});
		};
		

		// 유효성 검사
		var numberReg = /^\d{3}-\d{4}-\d{4}$/;
		var numberCheck;
		
		// 이메일 검사( 맨 밑에 있는 스크립트랑 연동됨)
		var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		var emailCheck;

		var fourCheck;
		// 고용상태 / 고용 / 권한코드 / 팀 선택 빈 칸이나 "선택하세요" 상태로 등록되지 않게 하기
		function emptySelectCheck(){
			if($("#emp").val() =='' || $("#serve").val() ==''|| $("#authCode").val() =='' || $("#teamCode").val() ==''){
				 fourCheck = false;
				}else{
				 fourCheck = true;
				}
		};

		//이름 빈칸 검사
		var nameCheck;
		//이름 검사 함수
		function emptyNameCheck(){
				if($("#formName").val() != ''){
						nameCheck = true;
					}else{
						nameCheck = false;
					}
			};
			
		
		function inputVailPhone(number){
				if(number.length == 13) {
	    			var check = numberReg.test(number);  //true or false
					if(check){
						console.log("휴대폰넘버 유효성 통과");
						numberCheck = true;
					}else{
						console.log("휴대폰넘버 유효성 불통");
						swal({
							   title: "휴대폰 번호 형식 오류",
							   text: "휴대폰 번호 형식에 맞지 않습니다. 다시 입력해주세요.",
							   icon: "warning",//"info,success,warning,error" 중 택1
							}).then((YES) => {
								if (YES) {
									$("#phone").focus();
								     }
						});
						numberCheck = false;

						
					}
	    		}
			};
			
			function inputVailEmail(email){
		    			var check = emailReg.test(email);  //true or false
						if(check){
							console.log("메일 유효성 통과");
							emailCheck = true;
						}else{
							console.log("메일 유효성 불통");
							emailCheck = false;
						}
						return emailCheck;
				};

			
		$(function(){
			/* 권한 코드 select option 만들기*/
			$.ajax({
				url:"ajax/admin/authorityList.do",
				dataType: "JSON",
				success: function(data){
					console.log("권한코드불러오는 ajax");
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
		let count = 0 ;
		function sendMail (callback){
			
				return new Promise(function(resolve,reject){
					console.log("sendMail()");
					console.log($('#formMail').val());
					console.log($('#formName').val());
					$.ajax({
						url:"ajax/admin/sendEmail.do",
						data: {'mail':$('#formMail').val(),
								'name' : $('#formName').val()
							},
						dataType: "text",
						method: "POST",
						success: function(response){
							console.log("메일 발송 완료");
							console.log(count++);
							resolve(response)
						},
					beforeSend: function () {
			              var width = 0;
			              var height = 0;
			              var left = 0;
			              var top = 0;

			              width = 500;
			              height = 500;


			              top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
			              left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();

			 

			              if($("#div_ajax_load_image").length != 0) {
			                     $("#div_ajax_load_image").css({
			                            "top": top+"px",
			                            "left": left+"px"
			                     });
			                     $("#div_ajax_load_image").show();
			              }
			              else {
			                     $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="img/loading.gif" style="width:500px; height:500px;"></div>');
			              }

			       }
			       , complete: function () {
			                     $("#div_ajax_load_image").hide();
			       },


						error: function(jqXHR, textStatus, errorThrown){
							console.log(textStatus);
							console.log(errorThrown);
						}
					});
				}); // 아작스 구문 종료
		};

		function myFormSubmit(){
			emptySelectCheck(); // 셀렉트 유효성 검사 하고
			emptyNameCheck();	// 이름 칸 빈칸인지 확인하고


			//이름 검사
			if(nameCheck == true){
				console.log("이름 유효성 통과");
				}else{
					console.log("이름 유효성 불통과");
					swal({
						   title: "이름 형식 오류",
						   text: "이름을 입력해주세요.",
						   icon: "warning",//"info,success,warning,error" 중 택1
						}).then((YES) => {
							if (YES) {
								$("#formName").focus();
							     }
					});
					return;
				}
		 	
		
			//셀렉트 태그들 유효성 검사
			if(fourCheck == true){
					console.log("셀렉트 유호성 통과");
				}else{
					console.log("셀렉트 유효성에서 불통과");
					swal({
						   title: "공백 오류",
						   text: "다시 입력해주세요.",
						   icon: "warning",//"info,success,warning,error" 중 택1
						}).then((YES) => {
							if (YES) {
								$("#formMail").focus();
							     }
					});
					return;
				}

			if($("#formMail").val() == null || $("#formMail").val() == ""){
				console.log('이메일 입력 안됨');
				swal({
					   title: "메일 형식 오류",
					   text: "이메일을 입력해주세요.",
					   icon: "warning",//"info,success,warning,error" 중 택1
					}).then((YES) => {
						if (YES) {
							$("#formMail").focus();
						     }
				});
				return;
			}
			//메일 유효성 검사
			if(finalCheckEmail==true){
					console.log("메일 유효성 통과");
				}else{
					console.log("메일 유효성 불통");
					swal({
						   title: "메일 형식 형식 오류",
						   text: "이메일이 형식에 맞지 않습니다. 다시 입력해주세요.",
						   icon: "warning",//"info,success,warning,error" 중 택1
						}).then((YES) => {
							if (YES) {
								$("#formMail").focus();
							     }
					});
					return;
				}
			//전화번호 유효성 검사
			if(numberCheck == true){
				console.log("전화번호 통과");
			}else{
				console.log("전화번호 불통 ");
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
			// 이제 메일 보낸다 			
			sendMail().then(function(){
				console.log("submit()");
				document.getElementById('addUserForm').submit();
				//$('#addUserForm').submit();
			});
		};

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
			<c:import url="/common/TopAdmin.jsp"/>
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<c:import url="/common/SideAdmin.jsp"/>
				<!-- end: sidebar -->
				
			<!-- start : main Content -->
				<section role="main" class="content-body">
					<header class="page-header">
						<h2>사원</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="#">
										<i class="fa fa-briefcase"></i>
									</a>
								</li>
								<li><span>사원</span></li>
								<li><span>사원등록</span></li>
							</ol>
					
						<i class="fa fa-chevron-left"></i>
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
													<input type="file" id="multiFile" name="file"  form="addUserForm" class="form-control" accept="image/*" hidden="true">
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
													<input class="form-control" id="formMail" name="mail" onKeyup="vailEmail($(this).val());" type="email" autocomplete=”off” form="addUserForm" >
													<span id="emailVail" style="color:red"></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="emp">고용상태</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="emp" name="emp"  autofocus="autofocus" form="addUserForm" required="true">
														<option hidden value=''>선택하세요</option>
														<option value="재직">재직</option>
                                                        <option value="고용예정">고용예정</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="regitDate">고용일</label>
												<div class="col-md-6">
													<input class="form-control" id="regitDate" name="regitDate" type="date" max="2100-12-31" form="addUserForm">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="serve">고용</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="serve" name="serve" required="required" autofocus="autofocus">
														<option hidden value=''>선택하세요</option>
														<option value="정규직">정규직</option>
                                                        <option value="인턴">인턴</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="position">직책</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="position" name="position" required="required" autofocus="autofocus" form="addUserForm">
														<option hidden value=''>선택하세요</option>
														<option value="사원">사원</option>
                                                        <option value="주임">주임</option>
                                                        <option value="대리">대리</option>
                                                        <option value="팀장">팀장</option>
                                                        <option value="사장">사장</option>
													</select>													
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="authCode">권한코드</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="authCode" name="authCode" required="required" autofocus="autofocus" form="addUserForm">
														<option hidden value=''>선택하세요</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="teamCode">팀 선택</label>
												<div class="col-md-6">
													<select class="form-control mb-md" id="teamCode" name="teamCode" required="required" autofocus="autofocus" form="addUserForm">
														<option value='' hidden>선택하세요</option>
													</select>
												</div>
											</div>
											<div class="form-group">
                                                <label class="col-md-3 control-label" for="phone">전화번호</label>
                                                <div class="col-md-6">
                                               		<input type="text" id="phone" name="phone" class="form-control" form="addUserForm" onKeyup="inputVailPhone($(this).val());" placeholder="010-5233-3208"  maxlength="13"/>
                                                    <!-- <input type="text" id="phone" name="phone" class="form-control" form="addUserForm"> -->
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
	<script type="text/javascript">
	$("#multiFile").change(function(){
		var reader = new FileReader();

	    reader.onload = function (e) {
	        // get loaded data and render thumbnail.
	        document.getElementById("viewPhoto").src = e.target.result;
	    };

	    // read the image file as a data URL.
	    reader.readAsDataURL(this.files[0]);
	});


	
	</script>
</html>