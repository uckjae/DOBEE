<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed search-results">
<head>
	<c:import url="/common/HeadTag.jsp"/>	
	<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

	<link href="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
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
		          url: "ajax/project/getUserList.do",
		          dataType: 'json',
		          type:"post",
		          processResults: function (data) {			          
		        	  	var arr = []
			          	var res = $.each(data, function(index, item) {
								arr.push({
		                            id: item.mail,
		                            text: item.name+"("+item.mail+")"
		                        });
	        	        });
      	       			return {
      	       				results: arr
          	       		}
		        	}
		      },
		 });
	   

	 
		$('.progressSelect').select2({
		 });
		
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
            		var pjtSeq;

            		console.log('플젝 만드는 중'+pjtMembers);
            	
    	 		$.ajax({
    	 	 			url:"ajax/project/pjtAdd.do",
    	 				data: formData,
    	 				dataType: "json",
    	 				contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
    	 				type:"post",
    	 				success:function(responsedata){
    	 					if(responsedata !== "" || responsedata !== null){ //프로젝트 & 프로젝트 일정 생성 완료
    	 						pjtSeq = responsedata;
    	 						console.log('플젝 번호 ajax로 가져오니??'+pjtSeq);
    	 						
        	 					$.ajax({
        	 						url:"ajax/project/addPjtMember.do",
        	    	 				data: {'pjtMembers' : pjtMembers, 'pjtSeq' : pjtSeq},
        	    	 				dataType: "text",
        	    	 				contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
        	    	 				type:"post",
        	    	 				success:function(responsedata){
            	    	 				if(responsedata == "success"){
        	 								send("addPjt",pjtMembers,$("#pjtName").val());
            	    	 					swal({
            	    	 						   title: "프로젝트 생성 완료",
            	    	 						   text: "프로젝트가 만들어졌습니다.",
            	    	 						   icon: "success" //"info,success,warning,error" 중 택1
            	    	 						}).then((YES) => {
            	    	 							if (YES) {
            	    	 								location.reload(true); 
            	    	 							     }
            	    	 							});

                	    	 				}
        	    	 				},
        	    	 				error:function(request,status,error){
        	    						console.log("code : " + request.status +"\n" + "message : " 
        	    								+ request.responseText + "\n" + "error : " + error);
        	    					}
            	 				}); //ajax 끝
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
			console.log('값은?'+pjtSeq);
			
			//pjtSeq로 프로젝트 정보 가져와서 모달창에 뿌리기
			var mails = [];
			
			$.ajax({
 	 			url:"ajax/project/getPjtAndUser.do",
 				data: { 'pjtSeq' : pjtSeq},
 				type:"post",
 				success:function(responseData){
 	 				
 	 				$("#pjtEditPjtSeq").val(pjtSeq);
	 				console.log(responseData);
 					var project = responseData.project;
	 				var user = responseData.user;
	 				var schedule = responseData.schedule;

	 				//스케쥴 셋팅
	 				$("#pjtEditSchSeq").val(schedule.schSeq);

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
		 				mails.push(element.mail);
		 			});
		 			
	 				$.ajax({
	 	 	 			url:"getUserList.do",
	 	 	 			dataType: 'json',
				        type:"post",
	 	 				success:function(responseData){
		 	 				console.log(responseData);
		 	 				var id = new Array();
		 	 				var name = new Array();
		 	 				$.each(responseData, function(index, element){
			 	 				id.push(element.mail);
			 	 				name.push(element.name+"("+element.mail+")");
			 	 				var option = $('<option>');
			 	 					$(option).val(element.mail);
			 	 					$(option).text(element.name+"("+element.mail+")");
				 	 			$('#userSelectEdit').append(option);
			 	 			});

							$("#userSelectEdit").select2();

							//이미 속해있는 회원은 추가할  수 없게 막기
			 	 			$("#userSelectEdit > option").each(function(){
			 	 				for (var i = 0; i < mails.length; i++){
				 	 				if($(this).val() == mails[i]){
				 	 					$(this).prop('disabled','true'); 
						 				//$(this).css('display','none');
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
   /*프로젝트 삭제 함수*/
    function pjtDelete(data){
	   console.log('이거 타??');
	   var pjtSeq = $(data).find('input[type=hidden]').val();

	   swal({
			title: "프로젝트 삭제",
			text: "프로젝트를 삭제하시겠습니까?",
			icon: "warning", //"info,success,warning,error" 중 택1
			button : {
				confirm: {
				    text: "확인",
				    value: true,
				    visible: true,
				    className: "",
				    closeModal: true
				  },
				 cancel: {
					    text: "취소",
					    value: null,
					    visible: false,
					    className: "",
					    closeModal: true,
					  }
				}
		}).then((YES) => {
			if(YES){
				$.ajax({
	 	 			url:"ajax/project/pjtDelete.do",
	 	 			data: {"pjtSeq":pjtSeq},
	 				dataType: "text",
	 				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	 				type:"post",
	 				success:function(responsedata){
	 					if(responsedata == "success"){ //프로젝트 생성 완료
	 	 					console.log('삭제 완료')
	 	 					swal({
	 						   title: "프로젝트 삭제 완료",
	 						   text: "프로젝트가 삭제되었습니다.",
	 						   icon: "success" //"info,success,warning,error" 중 택1
	 						}).then((YES) => {
	 							location.href="pjtMain.do";
	 						})
	 	 				}
	 				},
	 				error:function(request,status,error){
						console.log("code : " + request.status +"\n" + "message : " 
								+ request.responseText + "\n" + "error : " + error);
					}
	 			});

				} 
			})

	   
	}

	/* 프로젝트 수정 전송 */
	function editPjtButton(data){
		console.log('수정 버튼 타니?');
		
		var pjtSeq = $('#pjtEditPjtSeq').val();

		var pjtMembers = new Array();
		var value = $('#userSelectEdit').select2().val(); //선택된 것의 value 값 가져오기
		var arrLength = value.length;
		for(var i = 0; i < arrLength; i++){
			pjtMembers.push(value[i]);
		}

		//스케쥴 객체 값 넣어주기
		$("#pjtEditStartTime").val($("#pjtEditStartAt").val());
		$("#pjtEditEndTime").val($("#pjtEditEndAt").val());
		var formData = $('#editPjtForm').serialize();

		
		$.ajax({
	 			url:"ajax/project/pjtUpdate.do",
	 			data : formData,
	 			dataType: 'text',
	        	type:"post",
				success:function(responseData){
	 				if(responseData == "success"){
		 				$.ajax({
     	 						url:"ajax/project/updatePjtMember.do",
     	    	 				data: {'pjtMembers' : pjtMembers, 'pjtSeq' : pjtSeq},
     	    	 				dataType: "text",
     	    	 				contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
     	    	 				type:"post",
     	    	 				success:function(responsedata){
         	    	 				if(responsedata == "success"){
     	 								//send("addPjt",pjtMembers,$("#pjtName").val());
     	 								swal({
     	 		 						   title: "프로젝트 수정 완료",
     	 		 						   text: "프로젝트가 수정되었습니다.",
     	 		 						   icon: "success" //"info,success,warning,error" 중 택1
     	 		 						}).then((YES) => {
     	 		 							location.reload(true);
     	 		 						});
             	    	 			}
     	    	 				},
     	    	 				error:function(request,status,error){
     	    						console.log("code : " + request.status +"\n" + "message : " 
     	    								+ request.responseText + "\n" + "error : " + error);
     	    					}
         	 				}); //ajax 끝
			 			}
				},
				error:function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 

							+ request.responseText + "\n" + "error : " + error);
				},
			});
		
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

	/* 알람 */
	function send(data, member, title) {
		console.log("send message 실행");
		console.log(data);
		console.log(member);
		console.log(title);
		var jsonData = new Object();
		jsonData.cmd = data;
		console.log("data");
		jsonData.mail = member;
		console.log("member");
		jsonData.content = title;
		console.log("title");

		var parsedData = JSON.stringify(jsonData);
		console.log(parsedData);
		wsocket.send(parsedData);
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
				
						<i class="fa fa-chevron-left"></i>
					</div>
				</header>

				<!-- start: page -->
				<!-- 메뉴 -->
				<div class="search-content">
					<div class="search-toolbar">
						<ul class="list-unstyled nav nav-pills">
							<li class="active">
								<a href="#inProgress" data-toggle="tab">진행</a>
							</li>
							<li>
								<a href="#completed" data-toggle="tab">완료</a>
							</li>
						</ul>
					</div>
				
				<!-- 프로젝트 리스트 -->
				<div class="tab-content">
				<div class="tab-pane active" id="inProgress">
					<div class="row">
						<c:forEach items="${requestScope.inProgressPjtList}" var="pjtList">
							<div class="col-md-6 col-lg-6 col-xl-3">
								<a href="pjtKanban.do?pjtSeq=${pjtList.pjtSeq}" style="text-decoration:none;color:#777">
									<section class="panel">
										<header class="panel-heading bg-primary">
												<div class="panel-heading-icon">
													<i class="fa fa-globe"></i>
												</div>
										</header>
										<div class="panel-body text-center">
											<c:if test="${ user.authCode == '3'}">
											<div class="todo-actions" style="margin-left: 170px;">
						 						<a style="cursor: pointer;text-decoration:none;margin-right: 10px;" class="editPjt" data-toggle="modal" data-target="#editPjtModal"  data-pjtSeq="${pjtList.pjtSeq}" >
						 							<i class="fa  fa-pencil"></i>
						 						</a>
						 						<a style="cursor: pointer" onclick="pjtDelete(this)">
						 							<input type="hidden" id="pjtSeq" value="${pjtList.pjtSeq}">
						 							<i class="fa fa-times"></i>
						 						</a>
						 					</div>
						 					</c:if>
						 					<h3 class="text-semibold mt-sm text-center">${pjtList.pjtName}</h3>
											<p class="text-center">${pjtList.pjtProgress}</p>
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
					<div class="tab-pane" id="completed">
							<c:forEach items="${requestScope.completedPjtList}" var="pjtList">
								<div class="col-md-6 col-lg-6 col-xl-3">
									<a href="pjtKanban.do?pjtSeq=${pjtList.pjtSeq}" style="text-decoration:none;color:#777">
										<section class="panel">
											<header class="panel-heading bg-primary">
													<div class="panel-heading-icon">
														<i class="fa fa-globe"></i>
													</div>
											</header>
											<div class="panel-body text-center">
												<c:if test="${ user.authCode == '3'}">
												<div class="todo-actions" style="margin-left: 170px;">
							 						<a style="cursor: pointer;text-decoration:none;margin-right: 10px;" class="editPjt" data-toggle="modal" data-target="#editPjtModal"  data-pjtSeq="${pjtList.pjtSeq}" >
							 							<i class="fa  fa-pencil"></i>
							 						</a>
							 						<a style="cursor: pointer" onclick="pjtDelete(this)">
							 							<input type="hidden" id="pjtSeq" value="${pjtList.pjtSeq}">
							 							<i class="fa fa-times"></i>
							 						</a>
							 					</div>
							 					</c:if>
							 					<h3 class="text-semibold mt-sm text-center">${pjtList.pjtName}</h3>
												<p class="text-center">${pjtList.pjtProgress}</p>
											</div>
										</section>
									</a>
								</div>
							</c:forEach>
					</div>
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
								<button type="submit" class="btn btn-default" id="makePjtBtn" style="background-color: #34495e; color:white;"><i class="fa fa-send"></i>&nbsp;프로젝트 만들기</button>
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
									<input type="text" class="form-control" id="pjtEditName" name="pjtName" style="height:35px;" form="editPjtForm">
 									<input type="hidden" class="form-control" id="pjtEditPjtSeq" name="pjtSeq" style="height:35px;" form="editPjtForm">
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
										<input type="text" id="pjtEditStartAt" name="pjtStartAt" class="form-control" form="editPjtForm">
										<input type="hidden" id="pjtEditStartTime" name="startTime" class="form-control" form="editPjtForm">
										<span class="input-group-addon">to</span>
										<input type="text" id="pjtEditEndAt" name="pjtEndAt" class="form-control" form="editPjtForm">
										<input type="hidden" id="pjtEditEndTime" name="endTime" class="form-control" form="editPjtForm">
										<input type="hidden" id="pjtEditSchSeq" name="schSeq" class="form-control" form="editPjtForm">
									</div>
								</div>
							</div>
							<!-- 담당자 -->
							<div class="form-group">
								<label class="col-md-3 control-label">담당자 추가</label>
									<div class="col-md-7">
										<select  id="userSelectEdit" name="mail" multiple="multiple" style="width:100%;">
										</select>
									</div>
							</div>
							<!-- 진행 상황 -->
							<div class="form-group">
								<label class="col-md-3 control-label">진행 상태</label>
									<div class="col-md-7">
										<select data-plugin-selectOne class="form-control populate" id="progressSelect" name="pjtProgress" style="width:100%;" form="editPjtForm">
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
								<button onclick="editPjtButton(this)" class="btn btn-default" style="background-color: #34495e; color:white;" ><i class="fa fa-send"></i>&nbsp;프로젝트 수정</button>
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