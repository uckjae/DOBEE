<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="/common/tag.jsp" />
	
	<style >
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body{
   font-family: 'Noto Serif KR', serif;
}
	
	</style>
	
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
			$.ajax({
				url:"ajax/admin/sendEmail.do",
				data: {'mail':$('#mail').val(),
						'name' : $('#name').val()
					},
				dataType: "text",
				method: "POST",
				success: function(){
					console.log("ajax sendmail success");
					
				},
				error: function(jqXHR, textStatus, errorThrown){
					console.log(textStatus);
					console.log(errorThrown);
				}
				
				
			});
		}

		function myFormSubmit(){
			sendMail().then(function(){
				console.log("submit()");
				/* document.getElementById('addUserForm').submit(); */
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
	<!-- Side Navbar -->
    <nav class="side-navbar">
    <c:import url="/common/Left_Admin.jsp" />
    </nav>

    <div class="page">
      <!-- navbar-->
      <c:import url="/common/top.jsp"/>
      
      <div id="content-wrapper">
            <!-- !! Content !! -->
            <div class="container-fluid">
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-user-edit"></i>
                 
                        <b>사원등록</b>
               
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <form action="#" id="addUserForm" method="post" enctype="multipart/form-data">
                                        	<div class="form-group">
                                                		<div class="form-row">
                                                   			<div class="col-md-6">
                                                        		<div class="form-label-group">
                                                            		
                                                            		<input type="file" id="multiFile" name="multiFile" class="form-control" accept="image/*" hidden="true">
                                                            		<label for="multiFile"><img id="viewPhoto" name="viewPhoto" src="img/avatar.jpg" alt="프로필사진"  style="width:13em; height:100%;"></label>
                                                        		</div>
                                                    		</div>
                                                    		<div class="col-md-6">
                                                        		<div class="form-label-group">
                                                            		<input type="text" id="name" name="name" class="form-control">
                                                            		<label for="name">사원이름</label>
                                                            		<br>
                                                            		<input type="email" id="mail" name="mail" class="form-control">
                                                            		<label for="mail">사원&nbsp;E-mail</label>
                                                            		<br>
                                                            		<select id="emp" name="emp" class="form-control" required="required" autofocus="autofocus">
                                                            			<option hidden>선택하세요</option>
                                                            			<option value="재직">재직</option>
                                                            			<option value="고용예정">고용예정</option>
                                                            		</select>
                                                            		<label for="emp">고용상태</label>
                                                        		</div>
                                                    		</div>
                                                		</div>
                                            		</div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                            <input type="date" id="regitDate" name="regitDate" class="form-control" required="required" autofocus="autofocus">
                                                            <label for="regitDate">고용일</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                            <select id="serve" name="serve" class="form-control" required="required" autofocus="autofocus">
                                                            	<option hidden>선택하세요</option>
                                                            	<option value="정규직">정규직</option>
                                                            	<option value="인턴">인턴</option>
                                                            </select>
                                                            <label for="serve">고용</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                            <input type="text" id="position" name="position" class="form-control" placeholder="직책" required="required" autofocus="autofocus">
                                                            <label for="position">직책</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                            <input type="text" id="phone" name="phone" class="form-control" placeholder="전화번호" required="required">
                                                            <label for="phone">전화번호</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                            <select id="authCode" name="authCode" class="form-control" placeholder="권한 코드" required="required">
                                                            	<option hidden>선택하세요</option>
                                                            </select>
	                                                        <label for="authCode">권한 선택</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                           	<select id="teamCode" name="teamCode" class="form-control" placeholder="팀이름" required="required">
                                                           		<option hidden>선택하세요</option>
                                                           	</select>
                                                            <label for="teamCode">팀 선택</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-row">
                                           		 <div class="col-md-6">
                                                    <button type="button" class="btn btn-primary btn-block" onclick="myFormSubmit()">등록하기</button>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="button" class="btn btn-danger btn-block" value="Cancel"
                                                        		onClick="location.href='MemberList.do'">
                                                </div>
                                               
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      
    </div>
</body>
</html>