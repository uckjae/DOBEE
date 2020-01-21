<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>iofrm</title>
<link rel="stylesheet" href="assets/vendor/pnotify/pnotify.custom.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/fontawesome-all.min.css">
<link rel="stylesheet" type="text/css" href="css/iofrm-style.css">
<link rel="stylesheet" type="text/css" href="css/iofrm-theme2.css">
<!--배경사진  -->





<!--     <script>
    $(document).ready(function(){

         var name = $('#name').val();
         var phone = $('#phone').val();

         //이름,폰번호 입력 안할시  # idModal => 아이디 찾기 버튼id값 
         $("#idModal").click(function(){
              if($.trim($('#name').val())==''){
                  alert("이름을 입력하세요");
                  $('#name').focus();
                  return;
             }else if($.trim($('#phone').val()) == ''){
				alert("휴대폰번호를 입력하세요");
				$('#phone').focus();
				return;				
		     }else{
                $.ajax({
                    url:"findId.do",
                    type:"POST",
                    data:"name ": name,
                    	 "phone " : phone
                    success:function(data){
                    	
                        
                        },
                    error:function(){
                        }
                    
                    });
			     }

        });
    });
    </script>
     -->

<script type="text/javascript">
	$(function() {

		$('#idModal2').click('show.bs.modal', function(e) {
			console.log("taskDetail class가 눌렸어");
			var tskSeq = $(this).data('tskseq');

			$('#taskForm').trigger('reset');
			$('#taskDetailForm').trigger('reset');
			$('#checkListForm').trigger('reset');
			/* $('#id').attr('value',value); */

			$.ajax({
				url : "ajax/project/getTask.do",
				data : {
					"tskSeq" : tskSeq
				},
				dataType : "JSON",
				success : function(data) {
					console.log(data);
					var task = data;
					$('#taskDetailTitle').val(task.title);
					$('#taskFormStartAt').val(task.startAt);
					$('#taskFormEndtAt').val(task.endAt);
					$('#taskFormMail').val(task.name);
					$('#listenSlider').val(task.important);
					$('#importantShow').text(task.important);
				}
			});

			$('#taskDetailTitle').val()

			console.log(tskSeq);
		});

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
				<div class="info-holder"></div>
			</div>

			<div class="form-holder">
				<div class="form-content">
					<div class="form-items">
						<h3>도비에 오신 걸 환영합니다.</h3>
						<p>Dobby is free</p>
						<div>
							<p class="active">ID 찾기</p>
						</div>

						<form action="" method="post">
							<input class="form-control" type="text" id="name" name="name"
								placeholder="이름을 입력하세요" required> <input
								class="form-control" type="text" id="phone" name="phone"
								placeholder="휴대폰번호를 입력하세요" required>

							<div class="form-button">

								<button type="button" id="idModal2" data-toggle="modal"
									data-target="#idModal"
									class="btn btn-block btn-primary btn-md pt-sm pb-sm text-md">완료
								</button>
								<!--data-target 가 모달창 div id값  -->


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






		<!-- Modal -->
		<div id="idModal" class="modal-block modal-block-primary mfp-hide">
			<section class="panel">
				<header class="panel-heading">
					<h2 class="panel-title">Registration Form</h2>
				</header>
				<div class="panel-body">
					<form id="demo-form" class="form-horizontal mb-lg"
						novalidate="novalidate">
						<div class="form-group mt-lg">
							<label class="col-sm-3 control-label">Name</label>
							<div class="col-sm-9">
								<input type="text" name="name" class="form-control"
									placeholder="Type your name..." required />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Email</label>
							<div class="col-sm-9">
								<input type="email" name="email" class="form-control"
									placeholder="Type your email..." required />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">URL</label>
							<div class="col-sm-9">
								<input type="url" name="url" class="form-control"
									placeholder="Type an URL..." />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Comment</label>
							<div class="col-sm-9">
								<textarea rows="5" class="form-control"
									placeholder="Type your comment..." required></textarea>
							</div>
						</div>
					</form>
				</div>
				<footer class="panel-footer">
					<div class="row">
						<div class="col-md-12 text-right">
							<button class="btn btn-primary modal-confirm">Submit</button>
							<button class="btn btn-default modal-dismiss">Cancel</button>
						</div>
					</div>
				</footer>
			</section>
		</div>
		<!-- /Modal -->






	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>