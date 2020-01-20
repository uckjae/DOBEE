<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>iofrm</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/fontawesome-all.min.css">
    <link rel="stylesheet" type="text/css" href="css/iofrm-style.css">
    <link rel="stylesheet" type="text/css" href="css/iofrm-theme2.css">
    
    
    <script>
    $(document).on('click','#idModal',function(){



        });


    
    </script>
    
</head>
<body>
    <div class="form-body">
    
        <!--시작  -->
        <div class="website-logo">
            <a href="#">
                <div class="logo">
                    <img class="logo-size" src="img/logo-light.svg" alt="">
                </div>
            </a>
        </div>
        <!--끝 -->
        
        <div class="row">
        
            <div class="img-holder">
                <div class="bg"></div>
                <div class="info-holder">
                </div>
            </div>
            
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <h3>도비에 오신 걸 환영합니다.</h3>
                        <p>Dobby is free</p>
                        <div>
                            <p class="active">ID 찾기</p>
                        </div>
                        
                        <form  action="" method="post">
                            <input class="form-control" type="text" name="name" placeholder="이름을 입력하세요" required>
                            <input class="form-control" type="text" name="phone" placeholder="휴대폰번호를 입력하세요" required>
                            <c:if test="${param.error != null}">
							   <div>
							     	이름,휴대폰 번호를 잘못입력하였습니다.<br>
							     	<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
							      		이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
									</c:if>
							   </div>
							</c:if>
							
                            <div class="form-button">
                            
                             <button type="button" id="idModal" data-toggle="modal"
					           data-target="#idModal" class="btn btn-block btn-primary btn-md pt-sm pb-sm text-md">완료
				             </button>
				             
                                <a href="forget2.html">Forget password?</a>
                                
                            </div>
                           
                        </form>
                         
                       <!--  <div class="other-links">
                            <span>Or login with</span><a href="#">Facebook</a><a href="#">Google</a><a href="#">Linkedin</a>
                        </div> -->
                    </div>
                </div>
            </div>
            
        </div>
        
        <!-- 프로젝트 생성 modal -->
		<div class="modal fade" id="idModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">

			<div class="modal-dialog cascading-modal" role="document">
				<!--Content-->
				<div class="modal-content">
					<!--Header-->
					<div class="modal-header light-blue darken-3 white-text"
						style="text-align: center">
						<h4 id="pjtModalTitle" class="title">찾은 아이디</h4>
						<button type="button" class="close waves-effect waves-light"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>

					<!--Body 시작-->
					<div class="modal-body mb-0">
						<form name="pjtForm" method="post">
							<div class="row">
								<div class="col-sm-9">
									<input type="text" class="form-control" id="pjtName"
										name="pjtName">
								</div>
							</div>

							<br>
							<div class="text-center mt-1-half">
								<!--하단  -->
								<button type="button" id="makePjtBtn"
									class="btn btn-info mb-2 waves-effect">확인</button>
							</div>

						</form>
					</div>
					<!-- body 종료-->

				</div>
				<!--/.Content-->
			</div>
		</div>
        
   
    </div>
    
    

    
    
    
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>