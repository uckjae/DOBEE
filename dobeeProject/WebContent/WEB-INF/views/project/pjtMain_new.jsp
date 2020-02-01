<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed search-results">
<head>
	<c:import url="/common/HeadTag.jsp"/>	
	<link href="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/css/select2.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
	
<!-- 	<script src="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/js/select2.min.js"></script>
 -->	
	<!-- Sweet Alert -->
   	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   	<style>
	   	.swal-button {
	    	background: #34495E;
		}
		.swal-footer {
	  		text-align: center;
		}
		.swal-icon--warning {
			border-color: #f27474;
		}
   	</style>
  	<script>
  	function formatRepoSelection (repo) {
		  var $container = jQuery("<option value='"+repo.id+"'>"+repo.text+"</option>");
		  return $container;
		}
		
   $(function() {
	  
	   $('.userSelect').select2({
		   placeholder: "사원 선택",
		   multiple: true,
		   ajax: {
		          url: "getUserList.do",
		          dataType: 'json',
		          type:"post",
		          processResults: function (data) {
		        	  	var arr = []
			          	var res = $.each(data, function(index, item) {
			          		arr.push({
	                            id: item.mail,
	                            text: item.name+"("+item.mail+")"
	                        })
	        	        });
      	       			return {
      	       				results: arr
          	       		}
		        	}
		      },
		 });
	   

	 
		$('.progressSelect').select2({
		 });
		 
    /* 	$.ajax({
      		url:"getUserList.do",
      		dataType:"json",
      		type:"post",
      		success:function(data){
          		console.log('과연?'+data);
      			$.each(data, function(index, element){
    				let option = $("<option></option>");
    				$(option).text(element.name+"("+element.mail+")");
    				$(option).val(element.mail);
    				$(".userSelect").append(option);
    			})
      		}
      	});
 */
    	

		 

    	/* $("#userSelect").change(function(){
    		var userInfo = $("select[name='userSelect'] option:selected").val().split(":");
    		var userName = userInfo[0]			
    		var userMail = userInfo[1];
    		$("#pjtUserList").append("<div style='display:inline' class='list'><i class='fa fa-user'><span name='name'>"
    						+userName+"</span><input type='hidden' name='mail[]' value='"+userMail+"'>&nbsp;&nbsp;</i></div>");
    	
    		$("#pjtUserList").css("display","block");
    	
    		}); */

		/* 프로젝트 생성 */
    	$("#makePjtBtn").on('click', function(e){
    		if($("#pjtName").val() == "" || $("#pjtName").val() == null){
    			swal({
    				title: "프로젝트명",
    				text: "프로젝트명을 입력하세요",
    				icon: "warning", //"info,success,warning,error" 중 택1
    				showConfirmButton: true
    					}).then((YES) => {
    						if (YES) {
    							$("#pjtName").focus();
    							}
    						})
    			}else{
        			var pjtMembers = new Array();
        			var value = $('#userSelect').select2().val(); //선택된 것의 value 값 가져오기
        			var arrLength = value.length;
        			for(var i = 0; i < arrLength; i++){
        				pjtMembers.push(value[i]);
            		}

            		//일정 객체 주입을 위해서 값 셋팅해주기
            		$("#startTime").val($("#pjtStartAt").val());
            		$("#endTime").val($("#pjtEndAt").val());
            		var formData = $("#newPjtForm").serialize();
            		
        			var pjt = {
							"pjtName" : $("#pjtName").val(),
							"pjtStartAt" : $("#pjtStartAt").val(),
							"pjtEndAt" : $("#pjtEndAt").val(),
							"pjtMembers" : pjtMembers
                		}
    	 			$.ajax({
    	 	 			url:"ajax/project/pjtAdd.do",
    	 				data: formData,
    	 				dataType: "text",
    	 				contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
    	 				type:"post",
    	 				success:function(responsedata){


        	 				
        	 				console.log('ajax 통신 성공?');
    	 					console.log(responsedata);
    	 					if(responsedata == "success"){ //프로젝트 생성 완료

        	 					
    	 	 					swal({
    	 						   title: "프로젝트 생성 완료",
    	 						   text: "프로젝트가 만들어졌습니다.",
    	 						   icon: "success" //"info,success,warning,error" 중 택1
    	 						}).then((YES) => {
    	 							if (YES) {
    	 								location.reload(true); 
    	 							     }
    	 							})
    	 	 					}


	 	 					
	 	 					
    	 				},
    	 				error:function(request,status,error){
    						console.log("code : " + request.status +"\n" + "message : " 
    								+ request.responseText + "\n" + "error : " + error);
    					}
    	 			});
    	 			}
    			});
		$('#newPjt').click('show.bs.modal',function(e){
			$('#newPjtForm').trigger('reset');

			
		});

    		
		$(".editPjt").click('show.bs.modal', function(e) {
			$('#editPjtForm').trigger('reset');
			var pjtSeq = $(this).data('pjtseq');
			
			//pjtSeq로 프로젝트 정보 가져와서 모달창에 뿌리기
			var mails = [];
			
			$.ajax({
 	 			url:"ajax/project/getPjtAndUser.do",
 				data: { 'pjtSeq' : pjtSeq},
 				type:"post",
 				success:function(responseData){
	 				//console.log(responseData);
 					var project = responseData.project;

	 				var user = responseData.user;

	 				$('#pjtEditName').val(project.pjtName);
	 				//날짜 셋팅
					var startDate = new Date(project.pjtStartAt);
					var formatedStartDate = date_to_str(startDate);
					$('#pjtEditStartAt').val(formatedStartDate);
					var endDate = new Date(project.pjtEndAt);
					var formatedEndDate = date_to_str(endDate);
					$('#pjtEditEndAt').val(formatedEndDate);

					//진행 상태
	 				var pjtProgress = project.pjtProgress;
	 				$("#progressSelect > option[value='pjtProgress']").attr('selected','true');

	 				//담당자!! -> userSelect 중에 벨류 값이 같으면 attr로 true 넣어주기
	 				$.each(user, function(index, element){
		 				mails.push(element.name+"("+element.mail+")");
		 				/* $("#userSelectEdit > option").each(function(){
		 					if($(this).val() == element.mail){
				 				$(this).attr('selected','selected');
							}
				 		}); */
				 		
		 			});

	 				$.ajax({
	 	 	 			url:"getUserList.do",
	 	 	 			dataType: 'json',
				        type:"post",
	 	 				success:function(responseData){
		 	 				console.log(responseData);
		 	 				var id = new Array();
		 	 				var name = new Array();
		 	 				var object = new Object();
		 	 				$.each(responseData, function(index, element){
			 	 				id.push(element.mail);
			 	 				name.push(element.name+"("+element.mail+")");
			 	 				var option = $('<option>');
			 	 					$(option).val(element.mail);
			 	 					$(option).text(element.name+"("+element.mail+")");

				 	 			$('#userSelectEdit').append(option);
			 	 			});

							$("#userSelectEdit").select2();
							
			 	 			
		 	 				
			 	 			$("#userSelectEdit > option").each(function(){

			 	 				for (var i = 0; i < mails.length; i++){
				 	 				if($(this).val() == mails[i]){
						 				$(this).attr('selected','selected');
									}
					 	 		}
					 		});
	 	 				},
	 	 				error:function(request,status,error){
	 						console.log("code : " + request.status +"\n" + "message : " 

		 							+ request.responseText + "\n" + "error : " + error);
	 					},
	 				});
		 			
	 			

 				},
 				error:function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
		 	});

			  

		});

	
		
    });
   /*프로젝트 수정 함수*/
   /* function pjtEdit(data){
	   console.log('이거 타??');

	} 
	
	$('#userSelectEdit').select2({
			   placeholder: "사원 선택",
			   multiple: true,
			   ajax: {
			          url: "getUserList.do",
			          dataType: 'json',
			          type:"post",
			          processResults: function (data) {
			        	  	var arr = []
				          	var res = $.each(data, function(index, item) {
				          		arr.push({
		                            id: item.mail,
		                            text: item.name
		                        });
		        	        });
	      	       			return {
	      	       				results: arr
	          	       		}
			        	}
			      },
			 });
	
	*/

	/* 프로젝트 수정 전송 */
	function editPjtButton(data){
		console.log("eidtPjtButton()");
		console.log($('#editPjtForm').serialize());
		console.log($('#userSelectEdit').val());
	}
	
	/* DateFormatting  함수 */
	function date_to_str(format)

	{
	    var year = format.getFullYear();
	    var month = format.getMonth() + 1;
	    if(month<10) month = '0' + month;
	    var date = format.getDate();
	    if(date<10) date = '0' + date;
	
	    return year + "-" + month + "-" + date;
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
			<c:import url="/common/Side.jsp"/>

			<!-- end: sidebar -->

			<section role="main" class="content-body">
				<header class="page-header">
					<h2>프로젝트</h2>
				
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li>
								<a href="#">
									<i class="fa fa-tasks"></i>
								</a>
							</li>
							<li><span>프로젝트</span></li>
							<li><span>메인</span></li>
						</ol>
				
						<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
					</div>
				</header>

				<!-- start: page -->
				<!-- 메뉴 -->
				<div class="search-content">
					<div class="search-toolbar">
						<ul class="list-unstyled nav nav-pills">
							<li class="active">
								<a href="#everything" data-toggle="tab">2019년 4분기</a>
							</li>
							<li>
								<a href="#medias" data-toggle="tab">2020년 1분기</a>
							</li>
						</ul>
					</div>
				</div>
				<!-- 프로젝트 리스트 -->
				<div class="tab-content">
					<div class="row">
					<c:forEach items="${list}" var="n">
						<div class="col-md-6 col-lg-6 col-xl-3">
							<a href="pjtKanban.do?pjtSeq=${n.pjtSeq}" style="text-decoration:none;color:#777">
								<section class="panel">
									<header class="panel-heading bg-primary">
											<div class="panel-heading-icon">
												<i class="fa fa-globe"></i>
											</div>
									</header>
									<div class="panel-body text-center">
										<div class="todo-actions" style="margin-left: 170px;">
					 						<a style="cursor: pointer;text-decoration:none;margin-right: 10px;" class="editPjt" data-toggle="modal" data-target="#editPjtModal"  data-pjtSeq="${n.pjtSeq}" >
					 							<i class="fa  fa-pencil"></i>
					 						</a>
					 						<a style="cursor: pointer" onclick="taskDetailDelete(this)">
					 							<i class="fa fa-times"></i>
					 						</a>
					 					</div>
					 					<h3 class="text-semibold mt-sm text-center">${n.pjtName}</h3>
										<p class="text-center">${n.pjtProgress}</p>
									</div>
								</section>
							</a>
						</div>
					</c:forEach>
					<!-- 프로젝트 만들기 -->
					<c:if test="${ user.authCode == '3'}">
						<div class="col-md-6 col-lg-6 col-xl-3">
							<a id="newPjt" data-toggle="modal" href="#newPjtModal" style="text-decoration:none;color:#777">
								<section class="panel">
									<header class="panel-heading bg-secondary">
										<div class="panel-heading-icon">
											<i class="fa fa-globe"></i>
										</div>
									</header>
									<div class="panel-body text-center">
										<h3 class="text-semibold mt-sm text-center">프로젝트 생성</h3>
										<p class="text-center">새로만들기</p>
									</div>
								</section>
							</a>
						</div>
					</c:if>
					</div>
				</div>
				<!-- end: page -->
			</section>
		</div>
		
		<!-- 새 프로젝트 만드는 Modal -->
		<div class="modal fade" id="newPjtModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	   		<div class="modal-dialog cascading-modal" role="document">
				<div class="modal-content">
				<!--Header-->
					<div class="modal-header light-blue darken-3 white-text" style="text-align: center;padding-top: 18px;padding-bottom: 0px;">
						<button type="button" class="close" data-dismiss="modal" style="margin-top:-9px;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						<div style="margin-top: 20px;margin-bottom: 25px;">
							<span><i class="fa fa-tasks"></i></span>&nbsp;&nbsp;<h4 class="modal-title" id="myModalLabel" style="display:inline">새 프로젝트</h4>
						</div>
					</div>
					<!--Body-->
					<div class="container-fluid">
					<div class="modal-body mb-0" style="margin-top: 10px;margin-bottom:10px;">
						<form id="newPjtForm">
						<!-- 프로젝트명 -->
							<div class="form-group">
								<label class="col-md-3 control-label">프로젝트명</label>
								<div class="col-md-7">
									<input type="text" class="form-control" id="pjtName" name="pjtName" form="newPjtForm" style="height:35px;">
								</div>
							</div>
						<!-- 날짜 -->
							<div class="form-group">
								<label class="col-md-3 control-label">날짜</label>
								<div class="col-md-7">
									<div class="input-daterange input-group" data-plugin-datepicker>
										<span class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</span>
										<input type="text" id="pjtStartAt" name="pjtStartAt" class="form-control" form="newPjtForm">
										<input type="hidden" id="startTime" name="startTime" class="form-control" form="newPjtForm">
										<span class="input-group-addon">to</span>
										<input type="text" id="pjtEndAt" name="pjtEndAt" class="form-control" form="newPjtForm">
										<input type="hidden" id="endTime" name="endTime" class="form-control" form="newPjtForm">
									</div>
								</div>
							</div>
							<!-- 담당자 -->
							<div class="form-group">
								<label class="col-md-3 control-label">담당자</label>
									<div class="col-md-7">
										<select  class="userSelect" id="userSelect" name="mail" multiple="multiple" style="width:100%;">
										</select>
									</div>
							</div>
						</form>
						</div>
					</div>
					
					<div class="modal-footer" style="padding-top: 20px;padding-bottom: 20px;">
						<div class="row">
							<div class="col-md-4">
							</div>
							<div class="col-md-4 text-center">
								<button type="submit" class="btn btn-default" id="makePjtBtn" style="background-color: #34495e; color:white;" form="taskEditForm"><i class="fa fa-send"></i>&nbsp;프로젝트 만들기</button>
							</div>
							<div class="col-md-4">
							</div>
						</div>
					</div>
					</div>
			</div>
		</div>
		<!-- Modal 끝 -->
		
		<!-- 프로젝트 수정 Modal -->
		<div class="modal fade" id="editPjtModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	   		<div class="modal-dialog cascading-modal" role="document">
				<div class="modal-content">
				<!--Header-->
					<div class="modal-header light-blue darken-3 white-text" style="text-align: center;padding-top: 18px;padding-bottom: 0px;">
						<button type="button" class="close" data-dismiss="modal" style="margin-top:-9px;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						<div style="margin-top: 20px;margin-bottom: 25px;">
							<span><i class="fa fa-tasks"></i></span>&nbsp;&nbsp;<h4 class="modal-title" id="myModalLabel" style="display:inline">프로젝트 수정</h4>
						</div>
					</div>
					<!--Body-->
					<div class="container-fluid">
					<div class="modal-body mb-0" style="margin-top: 10px;margin-bottom:10px;">
						<form id="editPjtForm">
						<!-- 프로젝트명 -->
							<div class="form-group">
								<label class="col-md-3 control-label">프로젝트명</label>
								<div class="col-md-7">
									<input type="text" class="form-control" id="pjtEditName" name="pjtName" style="height:35px;">
								</div>
							</div>
						<!-- 날짜 -->
							<div class="form-group">
								<label class="col-md-3 control-label">날짜</label>
								<div class="col-md-7">
									<div class="input-daterange input-group" data-plugin-datepicker>
										<span class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</span>
										<input type="text" id="pjtEditStartAt" name="pjtStartAt" class="form-control" form="pjtForm">
										<span class="input-group-addon">to</span>
										<input type="text" id="pjtEditEndAt" name="pjtEndAt" class="form-control" form="pjtForm">
									</div>
								</div>
							</div>
							<!-- 담당자 -->
							<div class="form-group">
								<label class="col-md-3 control-label">담당자</label>
									<div class="col-md-7">
										<select  id="userSelectEdit" name="mail" multiple="multiple" style="width:100%;">
										</select>
									</div>
							</div>
							<!-- 진행 상황 -->
							<div class="form-group">
								<label class="col-md-3 control-label">진행 상태</label>
									<div class="col-md-7">
										<select data-plugin-selectOne class="form-control populate" id="progressSelect" name="pjtProgress" style="width:100%;">
											<option value="미완료">미완료</option>
											<option value="진행">진행</option>
											<option value="완료">완료</option>
										</select>
									</div>
							</div>
							</form>
						</div>
					</div>
					
					<div class="modal-footer" style="padding-top: 20px;padding-bottom: 20px;">
						<div class="row">
							<div class="col-md-4">
							</div>
							<div class="col-md-4 text-center">
								<button onclick="editPjtButton(this)" class="btn btn-default" id="makePjtBtn" style="background-color: #34495e; color:white;" form="taskEditForm"><i class="fa fa-send"></i>&nbsp;프로젝트 수정</button>
							</div>
							<div class="col-md-4">
							</div>
						</div>
					</div>
					</div>
			</div>
		</div>
		
		
		
		
		
		
		<!-- 오른쪽 사이드 시작 -->
		<c:import url="/common/RightSide.jsp"/>
		<!-- 오른쪽 사이드 끝 -->
		
	</section>

<c:import url="/common/BottomTag.jsp"/>
</body>
</html>