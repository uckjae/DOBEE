<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="fixed search-results">
<head>
	    <c:import url="/common/HeadTag.jsp"/>
	
		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
		<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-colorpicker/css/bootstrap-colorpicker.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-timepicker/css/bootstrap-timepicker.css" />
		<link rel="stylesheet" href="assets/vendor/dropzone/css/basic.css" />
		<link rel="stylesheet" href="assets/vendor/dropzone/css/dropzone.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-markdown/css/bootstrap-markdown.min.css" />
		<link rel="stylesheet" href="assets/vendor/summernote/summernote.css" />
		<link rel="stylesheet" href="assets/vendor/summernote/summernote-bs3.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

		<!-- Head Libs -->
		<script src="assets/vendor/modernizr/modernizr.js"></script>
	
	
		<!-- Vendor -->
		<script src="assets/vendor/jquery/jquery.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
    	
    	
    	<!-- Star Rating -->
    	<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
		
		
	
	
	
	<!-- Sweet Alert -->
	<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
	
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
    <script type="text/javascript">
		$(function(){

			var authCode = $("#authCode").val(); //현재 로그인한 회원의 권한 코드 가져오기

			

			$("#rateYo").rateYo({
			    rating: 1,
			    fullStar: true,
			    onSet: function (rating, rateYoInstance) {
				    var value = rating;
				    $('#addPMTaskImportant').text(value); //중요도 값 표시해주기
			      }
			  });

			
			
			/* 중요도 슬라이드 변경시 값표시 */
			$('#addPMTaskFormBar').change(function(){
				var value = $(this).val();
				console.log(value);
				$('#addPMTaskImportant').text(value);
			});

			
			$('#taskFormBar').change(function(){
				var value = $(this).val();
				console.log(value);
				$('#taskImportant').text(value);
			});

			/* 업무추가 모달띄우는함수 */
			$('.addTask').click('show.bs.modal',function(e){
				console.log("addTask class 가 눌렸어");
				console.log($('#addTaskModal'));
				$('#addPMTaskForm').trigger('reset');
				$('.ui-slider-range').attr('style','width: 0%;');
				$('.ui-slider-handle').attr('style','left:0%');
				$('#importantShow').text('0');	
				var pjtSeq = $(this).data('pjtseq');					
			});

			

			
			/* 업무상세 모달띄우는 함수 모모달*/
			$('.taskDetail').click('show.bs.modal', function(e) {
				console.log("taskDetail class가 눌렸어");
				var tskSeq = $(this).data('tskseq');
				$('#taskForm').trigger('reset');
				$('#taskDetailForm').trigger('reset');
				$('#checkListForm').trigger('reset');
				$('.progress-button').attr("style","background-color:white; color:black;");
				$('#taskDetailTskSeq').attr("value",tskSeq);
				$('#taskCheckListTskSeq').attr("value",tskSeq);
				$('#addTaskDetailTskSeq').attr("value",tskSeq);
				$.ajax({
					url:"ajax/project/getTask.do",
					data: {"tskSeq":tskSeq},
					dataType: "JSON",
					success: function(data){
						console.log('getTask ajax 성공?');
						console.log(data);
						var task = data;
						$('#taskDetailEditTitle').val(task.title);
						$('#taskDetailTitle').text(task.title);
						$('#taskFormTitle').val(task.title);
						//날짜 셋팅
						var startDate = new Date(task.startAt);
						var formatedStartDate = date_to_str(startDate);
						$('#taskFormStartAt').val(formatedStartDate);
						if(task.endAt == null){ //끝나는 날짜가 없는 경우 그냥 공백으로 만들기
							$('#taskFormEndAt').val("");
						} else {
							var endDate = new Date(task.endAt);
							var formatedEndDate = date_to_str(endDate);
							$('#taskFormEndAt').val(formatedEndDate);
						}

						
						//담당자 셋팅
						$('#taskMemberEditSelect').val(task.mail); //pm의 경우 select에 value 값 셋팅하기
						$('#taskFormName').text(task.name);
						$('#taskFormMail').val(task.mail);
						
						//프로젝트 seq 셋팅
						$('#taskFormPjtSeq').val(task.pjtSeq);
						
						//중요도 셋팅
						$('#taskImportant').text(task.important); //중요도 표시해주기
						setStar(authCode, task.important); //권한에 따라 별 플러그인 적용

						
						$('.progress-button').each(function(index,element){
							if($(element).text() == task.progress){
								$(element).attr("style","background-color:#34495e; color:white;");
								$('#taskFormProgress').val($(element).text());
							}
						});
							
					},
					error:function(request,status,error){
						console.log("code : " + request.status +"\n" + "message : " 
								+ request.responseText + "\n" + "error : " + error);
					}
				});
				
				getTaskDetailList(tskSeq);
				getTaskCheckList(tskSeq);
				$('#taskFormTskSeq').val(tskSeq);

			});

			$('.progress-button').click(function(){
				$('.progress-button').attr("style","background-color:white; color:black;");
				$(this).attr("style","background-color:#34495e; color:white;");
				$('#taskFormProgress').val($(this).text());
			});
			/* /모달띄우는 함수 */


			/* 01.28 pm 업무 추가 >> 추가시에 중요도를 별도로 셋팅해서 백단으로 보내야 함-- 알파카*/
			$("#addPMTaskBtn").click(function(){
				var important = $('#addPMTaskImportant').text();
				$("#addPMTaskStarImportant").val(important);
				$("#addPMTaskForm").submit();
			});


			$("#taskEditBtn").click(function(){
				var important = $('#taskImportant').text();
				$("#taskEditImportant").val(important); //db에 저장할 값 넣어주기
				$("#taskEditForm").submit();

			});
			
				
				

			/* 01.26 업무 상세 추가 -- 알파카 */
			$("#addTaskDetailBtn").click(function(e){
				var formData = $("#addTaskDetailForm").serialize();
				var tdContent = $("#addTdContent").val();
				var tskSeq = $("#addTaskDetailTskSeq").val();
 				
				$.ajax({
	 	 			url:"ajax/project/addTaskDetail.do",
	 				data: formData ,
	 				dataType: "text",
	 				contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
	 				type:"post",
	 				success:function(responsedata){
	 					var jsonData = JSON.parse(responsedata);
	 					
	 					if(jsonData.result == "success"){ //업무 상세 생성 완료
		 					var tdSeq = jsonData.tdSeq;
	 						//상세 업무 뿌리기
							var li = $('<li style="padding-bottom:10px;">');
							//업무 뿌려주는 div 
							var tdContentDiv = $('<div style="margin-left:10px;" onclick="taskDetailEdit(this)">');
							var icon = $('<span><i class="fa fa-square"></i></span>');
							var label = $('<label class="taskDetail-label" style="cursor:pointer">');
							var span = $('<span>&nbsp;&nbsp;'+tdContent+'</span>');
							label.append(span);
							tdContentDiv.append(icon);
							tdContentDiv.append(label);

							//업무 삭제창
							var deleteDiv = $('<div class="todo-actions" onclick="taskDetailDelete(this)">');
							var hiddenInput1 = $('<input type="hidden" name="tdSeq"> ');
							var hiddenInput2 = $('<input type="hidden" name="tskSeq"> ');
							hiddenInput1.val(tdSeq);
							hiddenInput2.val(tskSeq);
							var a = $('<a style="cursor: pointer"></a>');
							var deleteIcon = $('<i class="fa fa-times"></i>');
							a.append(deleteIcon);
							deleteDiv.append(hiddenInput1);
							deleteDiv.append(hiddenInput2);
							deleteDiv.append(a);

							//업무 상세 수정창
							var editDiv = $('<div class="taskDetail-Edit" style="display:none">');
							var editForm = $('<form action="#" id="editTaskDetailForm" method="post" class="form-horizontal form-bordered">');
							var formDiv1 = $('<div class="form-group">');
							var formDiv2 = $('<div class="col-sm-12">');
							var formDiv3 = $('<div class="input-group mb-md">');
							var textInput = $('<input type="text" id="tdContent" name="tdContent" class="form-control" form="editTaskDetailForm">');
							var hiddenInput3 = $('<input type="hidden" form="editTaskDetailForm" name="tskSeq"/>')
							var hiddenInput4 = $('<input type="hidden" form="editTaskDetailForm" name="tdSeq"/>')
							var btnDiv = $('<div class="input-group-btn" style="padding:0;">');
							var btn = $('<button type="button" class="btn btn-primary" tabindex="-1" id="editTaskDetailBtn" form="editTaskDetailForm" onclick="taskDetailEditSubmit(this)"><span style="font-size:18px;">Save</span></button>');
							btnDiv.append(btn);
							textInput.val(tdContent);
							formDiv3.append(textInput);
							hiddenInput3.val(tskSeq);
							hiddenInput4.val(tdSeq);
							formDiv3.append(hiddenInput3);
							formDiv3.append(hiddenInput4);
							formDiv3.append(btnDiv);
							formDiv2.append(formDiv3);
							formDiv1.append(formDiv2);
							editForm.append(formDiv1);
							editDiv.append(editForm);
	
							li.append(tdContentDiv);
							li.append(deleteDiv);
							li.append(editDiv);
							$("#taskDetailList").append(li);
		 					$("#addTdContent").val("");
	 					}
	 				},
	 				error:function(){
	 					console.log("code : " + request.status +"\n" + "message : " 
								+ request.responseText + "\n" + "error : " + error);
	 				}
	 			});
			});
			/* 01.26 체크리스트 추가 -- 알파카 */
			$("#addTaskCheckListBtn").click(function(){
				var formData = $("#addTaskCheckListForm").serialize();
				var content = $("#content").text();
				console.log('내용?'+content);
				$.ajax({
	 	 			url:"ajax/project/addTaskCheckList.do",
	 				data: formData ,
	 				dataType: "text",
	 				contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
	 				type:"post",
	 				success:function(responsedata){
	 					if(responsedata == "success"){ //체크리스트 생성 완료 여기얌
		 					var num = 1;
		 					var li = $('<li>');
		 					var checkDiv = $('<div class="checkbox-custom checkbox-default">');
		 					var checkInput = $('<input type="checkbox" class="todo-check">');
		 					checkInput.attr('id','todoListItem'+num);
		 					checkDiv.append(checkInput);
		 					var label = $('<label class="todo-label" for="todoListItem'+num+'">');
		 					var span = $('<span>'+$("#content").val()+'</span></label></div>');
		 					label.append(span);
		 					checkDiv.append(label);
		 					var actionDiv = $('<div class="todo-actions">');
		 					var remove = $('<a class="todo-remove" href="#"><i class="fa fa-times"></i></a></div>');
		 					actionDiv.append(remove);
		 					li.append(checkDiv);
		 					li.append(actionDiv);
		 					
		 					$("#taskCheckList").append(li);
		 					$("#content").val("");

		 					/*
		 					$("#taskCheckList").append('<li><div class="checkbox-custom checkbox-default">'
				 					+'<input type="checkbox" id="todoListItem2" class="todo-check">'
				 					+'<label class="todo-label" for="todoListItem2"><span>'+$("#content").val()+'</span></label></div>'
				 					+'<div class="todo-actions">'
				 					+'<a class="todo-remove" href="#">'
				 					+'<i class="fa fa-times"></i>'
				 					+'</a></div></li>');
				 					
				 					
		 					<div class="checkbox-custom checkbox-default">
			 					<input type="checkbox" id="todoListItem1" class="todo-check">
			 					<label class="todo-label" for="todoListItem1"><span>체크체크</span></label>
 							</div>
		 					<div class="todo-actions">
		 						<a class="todo-remove" href="#">
		 						<i class="fa fa-times"></i>
		 						</a>
		 					</div>
		 					*/		
	 					}
	 				},
	 				error:function(){
	 					console.log("code : " + request.status +"\n" + "message : " 
								+ request.responseText + "\n" + "error : " + error);
	 				}
	 			});
			});


			/* 01.26 업무 상세 수정 추가 -- 알파카 taskDetailEditSubmit*/
			/*
			function taskDetailEditSubmit(data){
			console.log(data);
			var editForm = $(data).parent().parent();
			var formData = $(editForm).serialize();
			var tskSeq = $('#taskDetailTskSeq').val();
			$.ajax({
				url:"ajax/project/taskDetailEdit.do",
				data: formData,
				dataType:"JSON",
				success:function(data){
					getTaskDetailList(tskSeq);
				},
				error:function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
			});
		}
			
		

			*/
			

			


		});

		
		/* DB에서 가져온 중요도로 별 표시해주는 함수
		*/
		function setStar(authCode, important){ //권한 코드에 따라 별 플러그인 다르게 셋팅
			if(authCode == '2'){ //일반 회원
				$("#starBar").attr('id', 'taskImportantRead');
				$("#taskImportantRead").rateYo({
					 rating: important,
					 fullStar: true,
					 readOnly: true
				 });
			} else { //pm
				console.log('pm 타니??');
				console.log('중요도는?'+important);
				$("#starBar").attr('id', 'taskImportantEdit');
				$("#taskImportantEdit").rateYo({
				    rating: important,
				    fullStar: true,
				    onSet: function (rating, rateYoInstance) {
					    //var value = rating;
					    //$('#taskImportant').text(value); //중요도 값 표시해주기
				    	var value = rating;
						$('#taskImportant').text(value); //중요도 값 표시해주기
						//$("#taskEditImportant").val(value); //db에 저장할 값 넣어주기
				      }
				  });
			}
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


		/* PM 업무삭제함수 */
		function PMTaskDelete(tskSeq){
			//console.log("PMTaskDelete() in!!");
			var pjtSeq = ${requestScope.project.pjtSeq};
			console.log('플젝 번호?'+pjtSeq);
			swal({
				title: "업무 삭제",
				text: "업무를 삭제하시겠습니까?",
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
		 	 			url:"ajax/project/PMTaskDelete.do",
		 	 			data: {"tskSeq":tskSeq},
		 				dataType: "text",
		 				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		 				type:"post",
		 				success:function(responsedata){
		 					if(responsedata == "success"){ //프로젝트 생성 완료
		 	 					console.log('삭제 완료')
		 	 					swal({
		 						   title: "업무 삭제 완료",
		 						   text: "업무가 삭제되었습니다.",
		 						   icon: "success" //"info,success,warning,error" 중 택1
		 						}).then((YES) => {
		 							location.href="pjtKanban.do?pjtSeq="+pjtSeq;
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
		
		/* 업무상세 추가창 띄구고/내리는 함수 */
		/* function makeContent(data){
			console.log(data);
			console.log($(data).attr("class"));
			if($(data).attr("class") == "fa fa-plus-square before"){
				var formDiv = $('<div class="row">');
					var form = $('<form action="ajax/project/addTaskDetail.do" id="addTaskDetailForm" style="text-align:center; width: -moz-max-content;">');
						var taskDetailInput = $('<input type="text" form="taskContentForm" name="tdContent" class="input-line" style="width: text-align: center; margin-left: 5em;">');
						var taskDetailSubmit = $('<a class="mb-xs mt-xs mr-xs btn btn-primary" onclick="taskDetailSubmit(this)" style="margin-left:1em">');
							$(taskDetailSubmit).text("추가하기");
						var taskDetailCancle = $('<button class = "mb-xs mt-xs mr-xs btn btn-primary" style="margin-left:1em">');
							$(taskDetailCancle).attr("onclick","makeContent("+data+")");
							$(taskDetailCancle).text("취소하기");
					$(form).append(taskDetailInput);
					$(form).append(taskDetailSubmit);
					$(form).append(taskDetailCancle);
				$(formDiv).append(form);
				$('#taskDetailTskSeq').after(formDiv);
				$(data).attr("class","fa fa-minus-square after");
			}else{
				console.log("else 탔다");
				$('#addTaskDetailForm').remove();
				$(data).attr("class","fa fa-plus-square before");
			}
		}
 */
		/* 업무상세 비동기 작업입력함수 */
		function taskDetailSubmit(data){
			
			console.log(data);
			var thisForm = $('#taskContentForm');
			console.log(thisForm);
			var formData = thisForm.serialize();
			var tskSeq = $('#taskDetailTskSeq').val();
			console.log("Temp");
			console.log();
			$.ajax({
				url: "ajax/project/addTaskDetail.do",
				method: "post",
				data: formData,
				dataType: "JSON",
				success:function(data){
					console.log("여기야");
					console.log(data);
					makeContent($('#addTaskContentButton'));
					getTaskDetailList(tskSeq);
					
				},
				error:function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
									
			});
			
		}

		/* 비동기로 업무상세 가져와서 뿌리는 함수  -- 01.26 알파카 수정*/
		function getTaskDetailList(tskSeq){
			console.log("getTaskDetailList() in!!");
			$('#taskDetailList').empty();
			
			$.ajax({
				url:"ajax/project/getTaskDetailList.do",
				method:"post",
				data: {"tskSeq":tskSeq},
				dataType:"JSON",
				success: function(data){
					console.log("getTaskDetailList Ajax Success!!");
					var TaskDetailList = data;
					
					$(TaskDetailList).each(function(index,element){
						var tdSeq = element.tdSeq;
						var tdContent = element.tdContent;
						var tskSeq = element.tskSeq;
						//상세 업무 뿌리기
						var li = $('<li style="padding-bottom:10px;">');
						//업무 뿌려주는 div 
						var tdContentDiv = $('<div style="margin-left:10px;"  onclick="taskDetailEdit(this)">');
						var icon = $('<span><i class="fa fa-square"></i></span>');
						var label = $('<label class="taskDetail-label" style="cursor:pointer">');
						var span = $('<span>&nbsp;&nbsp;'+tdContent+'</span>');
						label.append(span);
						tdContentDiv.append(icon);
						tdContentDiv.append(label);
						
						//업무 삭제창
						var deleteDiv = $('<div class="todo-actions" onclick="taskDetailDelete(this)">');
						var hiddenInput1 = $('<input type="hidden" name="tdSeq"> ');
						var hiddenInput2 = $('<input type="hidden" name="tskSeq"> ');
						hiddenInput1.val(tdSeq);
						hiddenInput2.val(tskSeq);
						var a = $('<a style="cursor: pointer"></a>');
						var deleteIcon = $('<i class="fa fa-times"></i>');
						a.append(deleteIcon);
						deleteDiv.append(hiddenInput1);
						deleteDiv.append(hiddenInput2);
						deleteDiv.append(a);

						//업무 상세 수정창
						var editDiv = $('<div class="taskDetail-Edit" style="display:none">');
						var editForm = $('<form action="#" id="editTaskDetailForm" method="post" class="form-horizontal form-bordered">');
						var formDiv1 = $('<div class="form-group">');
						var formDiv2 = $('<div class="col-sm-12">');
						var formDiv3 = $('<div class="input-group mb-md">');
						var textInput = $('<input type="text" id="tdContent" name="tdContent" class="form-control" form="editTaskDetailForm">');
						var hiddenInput3 = $('<input type="hidden" form="editTaskDetailForm" name="tskSeq"/>')
						var hiddenInput4 = $('<input type="hidden" form="editTaskDetailForm" name="tdSeq"/>')
						var btnDiv = $('<div class="input-group-btn" style="padding:0;">');
						var btn = $('<button type="button" class="btn btn-primary" tabindex="-1" id="editTaskDetailBtn" form="editTaskDetailForm" onclick="taskDetailEditSubmit(this)"><span style="font-size:18px;">Save</span></button>');
						btnDiv.append(btn);
						textInput.val(tdContent);
						formDiv3.append(textInput);
						hiddenInput3.val(tskSeq);
						hiddenInput4.val(tdSeq);
						formDiv3.append(hiddenInput3);
						formDiv3.append(hiddenInput4);
						formDiv3.append(btnDiv);
						formDiv2.append(formDiv3);
						formDiv1.append(formDiv2);
						editForm.append(formDiv1);
						editDiv.append(editForm);

						li.append(tdContentDiv);
						li.append(deleteDiv);
						li.append(editDiv);
						$("#taskDetailList").append(li);
						
					})
				},
				error:function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
				
			});
		}

		/* 업무상세 수정창 띄우는 함수 */
		function taskDetailEdit(data){
			$(data).parents('li').find('.taskDetail-Edit').css('display','block');
			$(data).parents('li').find('.taskDetail-Edit').css('margin-top','8px');
			$(data).parents('li').find('.taskDetail-Edit').css('margin-left','10px');
		}


		/* 업무상세 제거하는함수 */
		function taskDetailDelete(data){
			var tdSeq = $(data).find('input[name="tdSeq"]').val();
			var tskSeq = $(data).find('input[name="tskSeq"]').val();
			
			$.ajax({
				url:"ajax/project/taskDetailDelete.do",
				data: {'tdSeq' : tdSeq},
				success: function(responseData){
					console.log("taskDetailDelete Ajax Success!!");
					console.log(responseData);
					if(responseData == "success"){
						getTaskDetailList(tskSeq);
					}
				},
				error: function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
			});
		}


		/* 업무상세 비동기로 수정! --01.27 알파카 */
		function taskDetailEditSubmit(data){
			var parents = $(data).parents('div.taskDetail-Edit');
			var tdContent = $(parents).find('input[name="tdContent"]').val();
			var tskSeq = $(parents).find('input[name="tskSeq"]').val();
			var tdSeq = $(parents).find('input[name="tdSeq"]').val();
			$.ajax({
				url:"ajax/project/taskDetailEdit.do",
				data: { 'tdSeq' : tdSeq , 'tdContent' : tdContent, 'tskSeq' : tskSeq},
				dataType:"text",
				success:function(data){
					console.log('데이터??'+data);
					if(data == "success"){ //성공 성공!
						getTaskDetailList(tskSeq);
					}
				},
				error:function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
			});
			
		}


		/* 업무수정하는 함수 PM */
		function taskEditSubmit(data){
			console.log("taskEditSubmit() in!!");
			console.log($(data).parent().parent());
		}

		
		/* 체크리스트 추가하는 창 띄우고 내리는 함수 */
		function makeCheckList(data){
			console.log("makeCheckList() in!!");
			if($(data).attr("class") == "fa fa-plus-square before"){
				var formDiv = $('<div class="row">');
					var form = $('<form action="ajax/project/addTaskCheckList.do" id="addTaskCheckListForm" style="text-align:center; width: -moz-max-content;">');
						var taskCheckListInput = $('<input type="text" form="addTaskCheckListForm" name="content" class="input-line" style="width: text-align: center; margin-left: 5em;">');
						var taskCheckListSubmit = $('<a class="mb-xs mt-xs mr-xs btn btn-primary" onclick="taskCheckListSubmit(this)" style="margin-left:1em">');
							$(taskCheckListSubmit).text("추가하기");
						var taskCheckListCancle = $('<button class = "mb-xs mt-xs mr-xs btn btn-primary" style="margin-left:1em">');
							$(taskCheckListCancle).attr("onclick","makeCheckList("+data+")");
							$(taskCheckListCancle).text("취소하기");
					$(form).append(taskCheckListInput);
					$(form).append(taskCheckListSubmit);
					$(form).append(taskCheckListCancle);
				$(formDiv).append(form);
				$('#taskCheckListTskSeq').after(formDiv);
				$(data).attr("class","fa fa-minus-square after");
			}else{
				$('#addTaskCheckListForm').remove();
				$(data).attr("class","fa fa-plus-square before");
			}
		};


		/* 체크리스트 비동기로 입력하는 함수 */
		function taskCheckListSubmit(data){
			
			var thisForm = $('#addTaskCheckListForm');
			var formData = thisForm.serialize();
			var tskSeq = $('#taskCheckListTskSeq').val();
			$.ajax({
				url: "ajax/project/addTaskCheckList.do",
				method: "post",
				data: formData,
				dataType: "JSON",
				success:function(data){
					console.log("여기야");
					console.log(data);
					makeCheckList($('#addTaskCheckListButton'));
					getTaskCheckList(tskSeq);
					
				},
				error:function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
									
			});
			
		}


		/* 체크리스트 가져와 뿌리는 함수 --01.26 알파카 수정*/
		function getTaskCheckList(tskSeq){
			console.log("getTaskChecklList() in!!");
			$('#taskCheckList').empty();
			
			$.ajax({
				url:"ajax/project/getTaskCheckList.do",
				method:"post",
				data: {"tskSeq":tskSeq},
				dataType:"JSON",
				success: function(data){
					console.log("getTaskCheckList Ajax Success!!");
					var TaskCheckList = data;
					var num = 1;
					$(TaskCheckList).each(function(index,element){
						var chkSeq = element.chkSeq;
						var content = element.content;
						var isCheck = element.check;
						
						var li = $('<li>');
						var checkDiv = $('<div class="checkbox-custom checkbox-default">');
						/* var hiddenInput = $('<input hidden name="chkSeq">');
						$(hiddenInput).val(chkSeq);
						$(checkDiv).append(hiddenInput);
						var hiddenInput2 = $('<input hidden name="tskSeq">');
						$(hiddenInput2).val(tskSeq);
						$(checkDiv).append(hiddenInput2); */
						var checkBox = $('<input type="checkbox" id="todoListItem'+num+'" class="todo-check" name="isCheck">');
						if(isCheck == true){
							console.log("if check=true");
							$(checkBox).prop("checked",true);
							$(checkBox).val(1);
						}else{
							console.log("else check=false");
							$(checkBox).prop("checked",false);
							$(checkBox).val(0);
						}
						$(checkDiv).append(checkBox);
						var label = $('<label class="todo-label" for="todoListItem'+num+'">');
						var span = $('<span>');
						span.text(content);
						label.append(span);
						$(checkDiv).append(label);
						var actionDiv = $('<div class="todo-actions"><a class="todo-remove" href="#"><i class="fa fa-times"></i></a></div>');
						$(li).append(checkDiv);
						$(li).append(actionDiv);
						$("#taskCheckList").append(li);
						num++;


						/*
						
						<li>
							<div class="checkbox-custom checkbox-default">
			 					<input type="checkbox" id="todoListItem1" class="todo-check">
			 					<label class="todo-label" for="todoListItem1"><span>체크체크</span></label>
								</div>
		 					<div class="todo-actions">
		 						<a class="todo-remove" href="#">
		 							<i class="fa fa-times"></i>
		 						</a>
		 					</div>
						</li>
						*/
					});
				},
				error:function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
				
			});
		}


		/* 체크리스트 수정창 띄우는 함수 */
		function taskCheckListEdit(data){
			$('#taskCheckListView').find('.content').each(function(index,element){
				$(element).attr("disabled","true");
			});
			$(data).prev().removeAttr("disabled");
			$(data).prev().prev().removeAttr("disabled");
			$(data).prev().prev().attr("onclick","checkBoxChange(this)");
			$(data).children().removeAttr("class");
			$(data).children().attr("class","fa fa-magic");
			$(data).removeAttr("onclick");
			$(data).attr("onclick","taskCheckListEditSubmit(this)");
			$(data).next().children().removeAttr("class");
			$(data).next().children().attr("class","fa fa-times");
			$(data).next().removeAttr("onclick");
			$(data).next().attr("onclick","taskCheckListEditCancle");
		}


		/* 체크리스트 비동기로 수정하는 함수 */
		function taskCheckListEditSubmit(data){
			console.log("taskCheckListEditSubmit() in!!");
			var editForm = $(data).parent().parent();
			var formData = $(editForm).serialize();
			var tskSeq = $('#taskCheckListTskSeq').val();
			console.log(editForm);
			$.ajax({
				url:"ajax/project/taskCheckListEdit.do",
				data: formData,
				dataType:"JSON",
				success:function(data){
					getTaskCheckList(tskSeq);
				},
				error:function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
			});
		}

		/* 체크리스트 삭제하는 함수 */
		function taskCheckListDelete(data){
			var form = $(data).prev().prev().parent().parent();
			var formData = $(form).serialize();
			var tskSeq = $('#taskCheckListTskSeq').val();
			console.log(formData);
			$.ajax({
				url:"ajax/project/taskCheckListDelete.do",
				data: formData,
				success: function(){
					console.log("taskCheckListDelete Ajax Success!!");
					getTaskCheckList(tskSeq);
				},
				error: function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
			});
		}

		/* 체크박스변경시  value 세팅하는 함수 */
		function checkBoxChange(data){
			console.log("checkBoxChange() in!!");
			console.log(data)
			if($(data).prop("checked") == true){
				console.log("체크됐다!");
				$(data).val(1);
			}else{
				console.log("체크 해제 됐다");
				$(data).val(0);
			}
		}

		
		
		
    </script>
    <style type="text/css">
	.input-line{
	    background: transparent;
	    border: none;
	    border-bottom: 2px solid #000000;
	    border-color: #428bca;
	    color : #428bca;
	}
	.input-noneborder{
		background: transparent;
	    border: none;
	    font-size: 1.5em;
	}
	
	.progress-button:focus{
		background-color: #34495e;
		color: white;
	}
	
	
	</style>
	
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
                        <li><span>칸반보드</span></li>
                    </ol>

                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <!-- start: page -->
            <div class="search-content">
                <div class="search-toolbar">
                    <ul class="list-unstyled nav nav-pills" id="">
                        <li class="active">
                            <a href="#everything" data-toggle="tab">2019년 4분기</a>
                        </li>
                        <li>
                            <a href="#medias" data-toggle="tab">2020년 1분기</a>
                        </li>
                    </ul>
                </div>
			</div>
                <!-- 프로젝트 넣기 -->
                <div class="tab-content">
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <!-- 예정 -->
                            <div class="col-md-3 col-xl-3">
                                <section class="panel panel-group">
                                    <header class="panel-heading bg-primary">

                                        <div class="widget-profile-info">
                                            <div class="profile-picture">
                                                <img src="assets/images/!logged-user.jpg">
                                            </div>
                                            <div class="profile-info">
                                                <h4 class="name text-semibold">예정</h4>
                                                <h5 class="role">total number : </h5>
                                                <div class="profile-footer">
                                                    	진행도
                                                </div>
                                            </div>
                                            <input type="hidden" id="authCode" value="${user.authCode}">
                                        </div>
                                    </header>
                                    <div id="accordion">
                                        <div class="panel panel-accordion panel-accordion-first">
                                            <div class="panel-heading">
                                                <div class="row">
                                                 	<div class="col-md-9">
	                                                	<h4 class="panel-title">
		                                                    <a class="accordion-toggle" data-toggle="collapse"
		                                                       data-parent="#accordion" href="#collapse1One" style="width: 80%;">
		                                                        <i class="fa fa-check"></i> Tasks
		                                                    </a>
	                                                	</h4>
                                                	</div>
                                                	<!-- 업무 추가 버튼 (PM만 볼 수 있음) -->
                                                	<c:if test="${ user.authCode == '3'}">
														<div class="col-md-2">
		                                                	<a class="addTask" style="width:20%;" data-toggle="modal" data-target="#addTaskModal" data-pjtSeq="${requestScope.project.pjtSeq}">
			                                                    <i class="fa fa-plus-square"></i>
			                                                </a>
		                                                </div>
													</c:if>												
                                                </div>
                                            </div>
                                            <div id="collapse1One" class="accordion-body collapse in">
                                                <div class="panel-body">
                                                    <ul class="simple-todo-list">
	                                                    <c:forEach items="${ taskList}" var="task" varStatus="status">
	                                                    <c:if test="${task.progress eq '예정' }">
		                                                    <li class="completed">
		                                                    	<div style="padding-top: 2px;">
																	<span style="cursor:pointer;"><a style="text-decoration: none;" class="taskDetail" data-toggle="modal" data-target="#taskDetailModal" data-tskSeq="${task.tskSeq}">${task.title}</a></span>
			                                                       	<span class="label label-primary text-normal pull-right" style="margin-top: 4px">
			                                                        	<fmt:formatDate value="${task.startAt}" pattern="yy-MM-dd"/>
			                                                        	~
			                                                        	<fmt:formatDate value="${task.endAt}" pattern="yy-MM-dd"/>
			                                                       	</span>
			                                                       	<!-- 업무 삭제 버튼 (PM만 볼 수 있음) -->
				                                                	<c:if test="${ user.authCode == '3'}">
																		 &nbsp;&nbsp;&nbsp;<a onclick="PMTaskDelete(${task.tskSeq})"><i class="fa fa-trash-o"></i></a>
																	</c:if>		
																</div>
															</li>
	                                                     </c:if>
	                                                    </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                            <!-- 진행 -->
                            <div class="col-md-3 col-xl-3">
                                <section class="panel panel-group">
                                    <header class="panel-heading bg-primary">
                                        <div class="widget-profile-info">
                                            <div class="profile-picture">
                                                <img src="assets/images/!logged-user.jpg">
                                            </div>
                                            <div class="profile-info">
                                                <h4 class="name text-semibold">진행</h4>
                                                <h5 class="role">total number : </h5>
                                                <div class="profile-footer">
                                                    	진행도
                                                </div>
                                            </div>
                                        </div>

                                    </header>
                                    <div id="accordion">
                                        <div class="panel panel-accordion panel-accordion-first">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="accordion-toggle" data-toggle="collapse"
                                                       data-parent="#accordion" href="#collapse1One">
                                                        <i class="fa fa-check"></i> Tasks
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapse1One" class="accordion-body collapse in">
                                                <div class="panel-body">
                                                
                                                 <ul class="simple-todo-list">
	                                                    <c:forEach items="${ taskList}" var="task" varStatus="status">
	                                                    <c:if test="${task.progress eq '진행' }">
		                                                    <li class="completed">
		                                                    	<div style="padding-top: 2px;">
																	<span style="cursor:pointer;"><a style="text-decoration: none;" class="taskDetail" data-toggle="modal" data-target="#taskDetailModal" data-tskSeq="${task.tskSeq}">${task.title}</a></span>
			                                                       	<span class="label label-primary text-normal pull-right" style="margin-top: 4px">
			                                                        	<fmt:formatDate value="${task.startAt}" pattern="yy-MM-dd"/>
			                                                        	~
			                                                        	<fmt:formatDate value="${task.endAt}" pattern="yy-MM-dd"/>
			                                                       	</span>
				                                                   <!-- 업무 삭제 버튼 (PM만 볼 수 있음) -->
				                                                	<c:if test="${ user.authCode == '3'}">
																		 &nbsp;&nbsp;&nbsp;<a onclick="PMTaskDelete(${task.tskSeq})"><i class="fa fa-trash-o"></i></a>
																	</c:if>	
																</div>
															</li>
	                                                     </c:if>
	                                                    </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                            <!-- 테스트 -->
                            <div class="col-md-3 col-xl-3">
                                <section class="panel panel-group">
                                    <header class="panel-heading bg-primary">

                                        <div class="widget-profile-info">
                                            <div class="profile-picture">
                                                <img src="assets/images/!logged-user.jpg">
                                            </div>
                                            <div class="profile-info">
                                                <h4 class="name text-semibold">테스트</h4>
                                                <h5 class="role">total number : </h5>
                                                <div class="profile-footer">
                                                    	진행도
                                                </div>
                                            </div>
                                        </div>
                                    </header>
                                    <div id="accordion">
                                        <div class="panel panel-accordion panel-accordion-first">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="accordion-toggle" data-toggle="collapse"
                                                       data-parent="#accordion" href="#collapse1One">
                                                        <i class="fa fa-check"></i> Tasks
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapse1One" class="accordion-body collapse in">
                                                <div class="panel-body">
                                                 <ul class="simple-todo-list">
	                                                    <c:forEach items="${ taskList}" var="task" varStatus="status">
	                                                    <c:if test="${task.progress eq '테스트' }">
		                                                    <li class="completed">
		                                                    	<div style="padding-top: 2px;">
																	<span style="cursor:pointer;"><a style="text-decoration: none;" class="taskDetail" data-toggle="modal" data-target="#taskDetailModal" data-tskSeq="${task.tskSeq}">${task.title}</a></span>
			                                                       	<span class="label label-primary text-normal pull-right" style="margin-top: 4px">
			                                                        	<fmt:formatDate value="${task.startAt}" pattern="yy-MM-dd"/>
			                                                        	~
			                                                        	<fmt:formatDate value="${task.endAt}" pattern="yy-MM-dd"/>
			                                                       	</span>
				                                                   <!-- 업무 삭제 버튼 (PM만 볼 수 있음) -->
				                                                	<c:if test="${ user.authCode == '3'}">
																		 &nbsp;&nbsp;&nbsp;<a onclick="PMTaskDelete(${task.tskSeq})"><i class="fa fa-trash-o"></i></a>
																	</c:if>	
																</div>
															</li>
	                                                     </c:if>
	                                                    </c:forEach>
                                                    </ul>
                                                    
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                            <!-- 완료 -->
                            <div class="col-md-3 col-xl-3">
                                <section class="panel panel-group">
                                    <header class="panel-heading bg-primary">

                                        <div class="widget-profile-info">
                                            <div class="profile-picture">
                                                <img src="assets/images/!logged-user.jpg">
                                            </div>
                                            <div class="profile-info">
                                                <h4 class="name text-semibold">완료</h4>
                                                <h5 class="role">total number : </h5>
                                                <div class="profile-footer">
                                                  	 진행도
                                                </div>
                                            </div>
                                        </div>

                                    </header>
                                    <div id="accordion">
                                        <div class="panel panel-accordion panel-accordion-first">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="accordion-toggle" data-toggle="collapse"
                                                       data-parent="#accordion" href="#collapse1One">
                                                        <i class="fa fa-check"></i> Tasks
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapse1One" class="accordion-body collapse in">
                                                <div class="panel-body">
                                                 <ul class="simple-todo-list">
	                                                    <c:forEach items="${ taskList}" var="task" varStatus="status">
	                                                    <c:if test="${task.progress eq '완료' }">
		                                                    <li class="completed">
		                                                    	<div style="padding-top: 2px;">
																	<span style="cursor:pointer;"><a style="text-decoration: none;" class="taskDetail" data-toggle="modal" data-target="#taskDetailModal" data-tskSeq="${task.tskSeq}">${task.title}</a></span>
			                                                       	<span class="label label-primary text-normal pull-right" style="margin-top: 4px">
			                                                        	<fmt:formatDate value="${task.startAt}" pattern="yy-MM-dd"/>
			                                                        	~
			                                                        	<fmt:formatDate value="${task.endAt}" pattern="yy-MM-dd"/>
			                                                       	</span>
				                                                    <!-- 업무 삭제 버튼 (PM만 볼 수 있음) -->
				                                                	<c:if test="${ user.authCode == '3'}">
																		 &nbsp;&nbsp;&nbsp;<a onclick="PMTaskDelete(${task.tskSeq})"><i class="fa fa-trash-o"></i></a>
																	</c:if>	
																</div>
															</li>
	                                                     </c:if>
	                                                    </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end: page -->
                <!-- Modal Form -->
                <!-- PM업무추가모달 -->
                
               <div class="modal fade" id="addTaskModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		   		<div class="modal-dialog cascading-modal" role="document">
					<div class="modal-content">
					<!--Header-->
						<div class="modal-header light-blue darken-3 white-text" style="text-align: center;padding-top: 25px;padding-bottom: 25px;">
							<button type="button" class="close" data-dismiss="modal" style="margin-top:-9px;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
								<h4 class="modal-title" id="myModalLabel"><i class="fa fa-pencil-square-o fa-lg"></i>&nbsp;업무추가</h4>
						</div>
						<!--Body-->
						<div class="container-fluid">
						<div class="modal-body mb-0" style="margin-top: 30px;">
						      <form action="addPMTask.do" id="addPMTaskForm" method="post">
						      <!-- 업무 이름 -->
						      	<div class="form-group">
									<label class="col-md-3 control-label"><i class="fa fa-tasks fa-lg"></i><span style="font-size:15px">&nbsp;&nbsp;업무</span></label>
										<div class="col-md-9">
											<input type="text" class="form-control" type="text" name="title" placeholder="업무를 입력하세요" form="addPMTaskForm" required style="height:35px;">
										</div>
								</div>
							  	<br>
							  	 <!-- 담당자 -->
							  		<div class="form-group">
									<label class="col-md-3 control-label" for="userList"><i class="fa fa-user fa-lg"></i><span style="font-size:15px">&nbsp;&nbsp;담당자</span></label>
										<div class="col-md-9">
											<select class="form-control" id="taskMember" name="mail" form="addPMTaskForm">
												<option value="" disabled selected>선택해주세요</option>
												<c:forEach items="${pjtMember}" var="user" varStatus="status">
													<option value="${user.mail}">${user.name}</option>
												</c:forEach>
											</select>
										</div>
									</div>
							   	<br>
							   	<!-- 중요도 -->
							   	<div class="form-group">
									<label class="col-md-3 control-label"><i class="fa fa-star fa-lg"></i><span style="font-size:15px">&nbsp;&nbsp;중요도</span><b id="addPMTaskImportant" style="margin-left:40px">1</b><b>/5</b></label>
									<div class="col-md-6">
										<div id="rateYo">
										</div>
										<input type="hidden" name="pjtSeq" value="${project.pjtSeq}" form="addPMTaskForm">
										<input type="hidden" id="addPMTaskStarImportant" name="important" form="addPMTaskForm" />
									</div>
								</div>
							 </form>
							</div>
						</div>
						<div class="modal-footer">
							<div class="row">
								<div class="col-md-4">
								</div>
								<div class="col-md-4 text-center">
									<button type="submit" id="addPMTaskBtn" class="btn btn-primary modal-confirm" form="addPMTaskForm">추가</button>
								</div>
								<div class="col-md-4">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
                <!-- 상세보기 모달 -->
                <div class="modal fade" id="taskDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		   		<div class="modal-dialog cascading-modal" role="document">
						<div class="modal-content">
						<!-- Modal Header -->
							<div class="modal-header light-blue darken-3 white-text" style="text-align: center;padding-bottom: 0px;border-bottom-width: 0px;">
								<button type="button" class="close" data-dismiss="modal" style="margin-top:-9px;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
									<div style="margin-top: 20px;margin-bottom: 25px;">
										<span><i class="fa fa-tasks"></i></span>&nbsp;&nbsp;<h4 class="modal-title" id="taskDetailTitle" style="display:inline"></h4>
									</div>
								<div class="tabs tabs-primary">
									<ul class="nav nav-tabs nav-justified">
										<li class="active">
											<a href="#attribute" data-toggle="tab">속성</a>
										</li>
										<li>
											<a href="#detail" data-toggle="tab">상세업무</a>
										</li>
										<li>
											<a href="#checkList" data-toggle="tab">체크리스트</a>
										</li>
									</ul>
								</div>
							</div>
							<!-- 속성 Tab -->
							<div class="tab-content" style="border-bottom-width: 0px;padding-top: 0px;">
								<div class="tab-pane active" id="attribute">
								<div class="panel-body" style="padding-top: 0px;">
									<form id="taskEditForm" action="taskEdit.do" class="form-horizontal mb-lg"><!--  method="post" -->
										<!-- 업무 pm만 수정 가능-->
										<c:if test="${ user.authCode == '3'}">
											<div class="form-group">
													<label class="col-md-3 control-label">업무</label>
													<div class="col-md-7">
														<input type="text" id="taskDetailEditTitle" name="title" class="form-control" form="taskEditForm">
													</div>
											</div>
										</c:if>
										<!-- 날짜 -->
										<div class="form-group">
											<label class="col-md-3 control-label">날짜</label>
											<div class="col-md-7">
												<div class="input-daterange input-group" data-plugin-datepicker>
													<span class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</span>
													<input type="text" id="taskFormStartAt" name="startAt" class="form-control" form="taskEditForm">
													<span class="input-group-addon">to</span>
													<input type="text" id="taskFormEndAt" name="endAt" class="form-control" form="taskEditForm">
													<c:if test="${ user.authCode == '2'}">
														<input type="hidden" id="taskFormTitle" name="title" class="form-control" form="taskEditForm">
													</c:if>
												</div>
											</div>
										</div>
										<!-- 담당자 -->
										<div class="form-group">
											<label class="col-md-3 control-label">담당자</label>
											<c:choose>
												<c:when test="${ user.authCode == '2'}">
														<div class="col-md-7" style="margin-top: 8px;">
															<i class="fa fa-user"></i>
															<h5 id="taskFormName" name="name" form="taskEditForm" style="display:inline;"></h5>
															<!-- <input type="text" id="taskFormName" name="name" class="input-noneborder" readonly="readonly" form="taskEditForm"/> -->
															<input type="hidden" id="taskFormMail" name="mail" form="taskEditForm"/>
														</div>
												</c:when>
												<c:otherwise>
														<div class="col-md-7">
															<select class="form-control" id="taskMemberEditSelect" name="mail" form="taskEditForm">
																<c:forEach items="${pjtMember}" var="user" varStatus="status">
																	<option value="${user.mail}">${user.name}</option>
																</c:forEach>
															</select>
														</div>
												</c:otherwise>
											</c:choose>
										</div>
										<!-- 중요도 pm만 수정 가능! -->
										<div class="form-group">
											<label class="col-md-3 control-label">중요도&nbsp;<b id="taskImportant">1</b><b>/5</b></label>
											<div class="col-md-6">
												<div id="starBar">
												</div>
												<input type="hidden" id="taskFormPjtSeq" name="pjtSeq" value="" form="taskEditForm"/>
												<input type="hidden" id="taskFormTskSeq" name="tskSeq" value="" form="taskEditForm"/>
												<input type="hidden" id="taskEditImportant" name="important" form="taskEditForm"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">진행상황</label>
											<input type="hidden" id="taskFormProgress" name="progress" value="" form="taskEditForm"> 
											<div class="col-md-6 btn-group">
												<button type="button" class="btn btn-default progress-button">예정</button>
												<button type="button" class="btn btn-default progress-button">진행</button>
												<button type="button" class="btn btn-default progress-button">테스트</button>
												<button type="button" class="btn btn-default progress-button">완료</button>
											</div>
										</div>
										<br>
										<div class="form-group" style="text-align: center;">
											<button type="button" id="taskEditBtn" class="btn btn-default" style="background-color: #34495e; color:white;" form="taskEditForm">수정</button>
										</div>	
									</form>
									</div>
								</div>
								<!-- 속성 Tab 끝-->
								
								<!-- 상세업무 Tab-->
								<div class="tab-pane" id="detail">
									<div class="panel-body" style="padding-top: 0px;">
                                         <ul class="widget-todo-list" id="taskDetailList">
                                           <!--  <li style="padding-bottom:10px;">
	                                            <div style="margin-left:10px;"  onclick="taskDetailEdit(this)">
		                                            <span><i class="fa fa-square"></i></span>&nbsp;&nbsp;
		                                            <label class="taskDetail-label" style="cursor:pointer"><span>업무상세</span></label>
					 								<input type="hidden" name="tdSeq" value="">
				 								</div>
			 									<div class="todo-actions" onclick="taskDetailDelete(this)">
			 										<input type="hidden" name="tdSeq" value="">
								 					<a style="cursor:pointer">
								 						<i class="fa fa-times"></i>
								 					</a>
			 									</div>
				 								업무 상세 수정 창
				 								<div class="taskDetail-Edit" style="display:none">
					 								<form action="#" id="editTaskDetailForm" name="editTaskDetailForm" method="post" class="form-horizontal form-bordered">
														<div class="form-group">
															<div class="col-sm-12">
																<div class="input-group mb-md">
																	<input type="hidden" form="editTaskDetailForm" id="taskDetailTskSeq" name="tskSeq"/>
																	<input type="text" id="tdContent" name="tdContent"  class="form-control" form="editTaskDetailForm">
																	<div class="input-group-btn" style="padding:0;">
																		<button type="button" class="btn btn-primary" tabindex="-1" id="editTaskDetailBtn" form="editTaskDetailForm" onclick="taskDetailEditSubmit(this)"><span style="font-size:18px;">Save</span></button>
																	</div>
																</div>
															</div>
														</div>
													</form>
							 					</div>
			 								</li> -->
                                          </ul>                                       	
										<hr class="solid mt-sm mb-lg">
											<form action="#" id="addTaskDetailForm" method="post" class="form-horizontal form-bordered">
												<div class="form-group">
													<div class="col-sm-12">
														<div class="input-group mb-md">
															<input type="hidden" form="addTaskDetailForm" id="addTaskDetailTskSeq" name="tskSeq"/>
															<input type="text" id="addTdContent" name="tdContent"  class="form-control" form="addTaskDetailForm" placeholder="상세 업무를 추가해주세요">
															<div class="input-group-btn" style="padding:0;">
																<button type="button" class="btn btn-primary" tabindex="-1" id="addTaskDetailBtn" form="addTaskDetailForm"><span style="font-size:18px;">+</span></button>
															</div>
														</div>
													</div>
												</div>
											</form>
									</div>
								</div>
								<!-- 상세업무 Tab 끝-->
								
								<!-- 체크리스트 Tab -->
								<div class="tab-pane" id="checkList">
									<div class="panel-body" style="padding-top: 0px;" id="taskCheckListDiv">
										<ul class="widget-todo-list" id="taskCheckList">
											 <li>
												<div class="checkbox-custom checkbox-default">
								 					<input type="checkbox" id="todoListItem1" class="todo-check">
								 					<label class="todo-label" for="todoListItem1"><span>체크체크</span></label>
					 							</div>
							 					<div class="todo-actions">
							 						<a class="todo-remove" href="#">
							 							<i class="fa fa-times"></i>
							 						</a>
							 					</div>
				 							</li>
										</ul>
									<!-- 체크리스트 추가(일반 회원만 보임) -->
									<c:if test="${ user.authCode == '2'}">
										<form id="addTaskCheckListForm" method="get" class="form-horizontal form-bordered">
											<hr class="solid mt-sm mb-lg">
											<div class="form-group">
												<div class="col-sm-12">
													<div class="input-group mb-md">
														<input type="text" class="form-control" form="addTaskCheckListForm" name="content" id="content">
														<input type="hidden" form="addTaskCheckListForm" id="taskCheckListTskSeq" name="tskSeq">
														<div class="input-group-btn" style="padding:0;">
															<button type="button" class="btn btn-primary" id="addTaskCheckListBtn" tabindex="-1"><span style="font-size:18px;">+</span></button>
														</div>
													</div>
												</div>
											</div>
										</form>
									</c:if>
								</div>
							</div>
							
							<!-- 체크리스트 Tab 끝-->
							
							<!-- Modal Content 끝 -->
							
							<!-- Modal Footer -->
								<div class="modal-footer" style="border-top-width: 0px;">
									<div class="row">
										<div class="col-md-4">
										</div>
										<div class="col-md-4 text-center">
											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										</div>
										<div class="col-md-4">
										</div>
									</div>
								</div>
							</div>
							<!-- Modal Footer 끝 -->
						</div>
					</div>
				</div>
				
				
				<!-- /Modal -->
        </section>
    </div>

    <!-- 오른쪽 사이드 시작 -->
    <c:import url="/common/RightSide.jsp"/>
    <!-- 오른쪽 사이드 끝 -->

</section>
		<c:import url="/common/BottomTag.jsp"/>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		
		
		<!-- Specific Page Vendor -->
		<script src="assets/vendor/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
		<script src="assets/vendor/select2/select2.js"></script>
		<script src="assets/vendor/jquery-maskedinput/jquery.maskedinput.js"></script>
		<script src="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
		<script src="assets/vendor/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
		<script src="assets/vendor/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
		<script src="assets/vendor/fuelux/js/spinner.js"></script>
		<script src="assets/vendor/bootstrap-markdown/js/markdown.js"></script>
		<script src="assets/vendor/bootstrap-markdown/js/to-markdown.js"></script>
		<script src="assets/vendor/bootstrap-markdown/js/bootstrap-markdown.js"></script>
		<script src="assets/vendor/summernote/summernote.js"></script>
		<script src="assets/vendor/bootstrap-maxlength/bootstrap-maxlength.js"></script>
		<script src="assets/vendor/ios7-switch/ios7-switch.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>

		<!-- Examples -->
		<script src="assets/javascripts/forms/examples.advanced.form.js" /></script>
		
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
		
		
</body>
</html>