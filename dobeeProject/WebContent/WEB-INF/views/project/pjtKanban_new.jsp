<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="fixed search-results">
<head>
    <c:import url="/common/HeadTag.jsp"/>
    <c:import url="/common/BottomTag.jsp"/>
	
	
	<!-- Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
		<link rel="stylesheet" href="assets/vendor/select2/select2.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css" />
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
		
		<!-- Specific Page Vendor -->
		<script src="assets/vendor/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
		<script src="assets/vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.js"></script>
		<script src="assets/vendor/select2/select2.js"></script>
		<script src="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.js"></script>
		<script src="assets/vendor/jquery-maskedinput/jquery.maskedinput.js"></script>
		<script src="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
		<script src="assets/vendor/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
		<script src="assets/vendor/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
		<script src="assets/vendor/fuelux/js/spinner.js"></script>
		<script src="assets/vendor/dropzone/dropzone.js"></script>
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
    <script type="text/javascript">
		$(function(){
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

			/* 모달띄우는함수 */
			$('.addTask').click('show.bs.modal',function(e){
				console.log("addTask class 가 눌렸어");
				console.log($('#addTaskModal'));
				$('#addPMTaskForm').trigger('reset');
				$('.ui-slider-range').attr('style','width: 0%;');
				$('.ui-slider-handle').attr('style','left:0%');
				$('#importantShow').text('0');	
				var pjtSeq = $(this).data('pjtseq');
				

				
					
			});
				
			
			$('.taskDetail').click('show.bs.modal', function(e) {
				console.log("taskDetail class가 눌렸어");
				var tskSeq = $(this).data('tskseq');

				$('#taskForm').trigger('reset');
				$('#taskDetailForm').trigger('reset');
				$('#checkListForm').trigger('reset');
				$('.progress-button').attr("style","background-color:white; color:black;");
				$('#taskDetailTskSeq').attr("value",tskSeq);
				$.ajax({
					url:"ajax/project/getTask.do",
					data: {"tskSeq":tskSeq},
					dataType: "JSON",
					success: function(data){
						console.log(data);
						var task = data;
						$('#taskDetailTitle').val(task.title);
						var startDate = new Date(task.startAt);
						var formatedStartDate = date_to_str(startDate);
						$('#taskFormStartAt').val(formatedStartDate);
						var endDate = new Date(task.endAt);
						var formatedEndDate = date_to_str(endDate);
						$('#taskFormEndtAt').val(formatedEndDate);
						$('#taskFormMail').val(task.name);
						$('#listenSlider').val(task.important);
						$('#importantShow').text(task.important);
						$('.progress-button').each(function(index,element){
							if($(element).text() == task.progress){
								$(element).attr("style","background-color:#34495e; color:white;");
								$('#taskFormProgress').val($(element).text());
							}
						});
							
					}
				});
				console.log("getTaskDetailList() 앞!!")
				getTaskDetailList(tskSeq);
				console.log("getTaskDetailList() 뒤!!")
				/* $.ajax({
					url:"ajax/project/getTaskDetailList.do",
					data: {"tskSeq":tskSeq},
					dataType: "JSON",
					success:function(data){
						console.log("taskDetailLis Ajax Success!!!");
						console.log(data);
						
					}
				}); */
					
				$('#taskFormTskSeq').val(tskSeq);

				getTaskDetailList(tskSeq);
				console.log(tskSeq);
			});

			$('.progress-button').click(function(){
				$('.progress-button').attr("style","background-color:white; color:black;");
				$(this).attr("style","background-color:#34495e; color:white;");
				$('#taskFormProgress').val($(this).text());
			});
			/* /모달띄우는 함수 */

			/* 버튼에따라  value */
			
			
			
		});

		function date_to_str(format)

		{
		    var year = format.getFullYear();
		    var month = format.getMonth() + 1;
		    if(month<10) month = '0' + month;
		    var date = format.getDate();
		    if(date<10) date = '0' + date;
		
		    return year + "-" + month + "-" + date;
		}

		function makeContent(data){
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

		function taskDetailSubmit(data){
			
			console.log(data);
			var thisForm = $('#taskContentForm');
			console.log(thisForm);
			var formData = thisForm.serialize();
			console.log(formData);
			$.ajax({
				url: "ajax/project/addTaskDetail.do",
				method: "post",
				data: formData,
				dataType: "JSON",
				success:function(){
					makeContent($('#addTaskContentButton'));
				}
									
			});
			
		}

		function getTaskDetailList(tskSeq){
			console.log("getTaskDetailList() in!!");

			$.ajax({
				url:"ajax/project/getTaskDetailList.do",
				method:"post",
				data: {"tskSeq":tskSeq},
				dataType:"JSON",
				success: function(data){
					console.log("getTaskDetailList Ajax Success!!");
					var TaskDetailList = data;
					$(TaskDetailList).each(function(index,element){
						console.log(index +" / " +element);
						var tdSeq = element.tdSeq;
						var tdContent = element.tdContent;
						console.log(tdSeq);
						console.log(tdContent);
						var list = $('<li>');
						
						var taskDetailListForm = $('<form>');
							$(taskDetailListForm).attr("id",tdSeq);
							$(taskDetailListForm).attr("action","ajax/project/editTaskDetail.do?tdSeq="+tdSeq);

							var div = $('<div class="col-md-6>');
								var input = $('<input disalbed class="form-control">');
									$(input).attr("id",tdSeq+"input");
									$(input).val(tdContent);
									$(input).text(tdContent);
								console.log("inputTag");
								console.log(input);
							$(div).append(input);
								var anchorEdit = $('<a onclick="taskDetailEdit(this)">');
									var editIcon = $('<i class="fa fa-edit">');
								$(anchorEdit).append(editIcon);
							$(div).append(anchorEdit);
								var anchorDelete = $('<a onclick="taskDetailDelete(this)">');
									var deleteIcon = $('<i class="fa fa-trash-o">');
								$(anchorDelete).append(deleteIcon);
							$(div).append(anchorDelete);
						$(taskDetailListForm).append(div);

						$(list).append(taskDetailListForm);
						console.log(list);
						$('#taskDetailListView').append(list);
							
						console.log(tdSeq+" / "+tdContent);
					})
				}
				
			});
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
                            <a href="index.html">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Pages</span></li>
                        <li><span>Search</span></li>
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
                            <button></button>
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
                                                	<div class="col-md-2">
	                                                	<a class="addTask" style="width:20%;" data-toggle="modal" data-target="#addTaskModal" data-pjtSeq="${requestScope.project.pjtSeq}">
		                                                    <i class="fa fa-plus-square"></i>
		                                                </a>
	                                                </div>
                                                </div>
                                            </div>
                                            <div id="collapse1One" class="accordion-body collapse in">
                                                <div class="panel-body">
                                                    <ul class="widget-todo-list">
                                                    	<c:forEach items="${ taskList}" var="task" varStatus="status">
                                                        <c:if test="${task.progress eq '예정' }">
                                                        <div class="row">
	                                                        <li>
	                                                        	<a class="taskDetail" data-toggle="modal" data-target="#taskDetailModal" data-tskSeq="${task.tskSeq}">${task.title}</a>
	                                                        	<span class="label label-primary text-normal pull-right">
		                                                        	<fmt:formatDate value="${task.startAt}" pattern="yy-MM-dd"/>
		                                                        	~
		                                                        	<fmt:formatDate value="${task.endAt}" pattern="yy-MM-dd"/>
	                                                        	</span>
	                                                        </li>
                                                        </div>
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
                                                    <ul class="widget-todo-list">
                                                    <c:forEach items="${ taskList}" var="task" varStatus="status">
                                                        <c:if test="${task.progress eq '진행' }">
                                                        <div class="row">
	                                                        <li>
	                                                        	<a class="taskDetail" data-toggle="modal" data-target="#taskDetailModal" data-tskSeq="${task.tskSeq}">${task.title}</a>
	                                                        	<span class="label label-primary text-normal pull-right">
		                                                        	<fmt:formatDate value="${task.startAt}" pattern="yy-MM-dd"/>
		                                                        	~
		                                                        	<fmt:formatDate value="${task.endAt}" pattern="yy-MM-dd"/>
	                                                        	</span>
	                                                        </li>
                                                        </div>
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
                                                    <ul class="widget-todo-list">
                                                    <c:forEach items="${ taskList}" var="task" varStatus="status">
                                                        <c:if test="${task.progress eq '테스트' }">
                                                        <div class="row">
	                                                        <li>
	                                                        	<a class="taskDetail" data-toggle="modal" data-target="#taskDetailModal" data-tskSeq="${task.tskSeq}">${task.title}</a>
	                                                        	<span class="label label-primary text-normal pull-right">
		                                                        	<fmt:formatDate value="${task.startAt}" pattern="yy-MM-dd"/>
		                                                        	~
		                                                        	<fmt:formatDate value="${task.endAt}" pattern="yy-MM-dd"/>
	                                                        	</span>
	                                                        </li>
                                                        </div>
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
                                                    <ul class="widget-todo-list">
                                                    <c:forEach items="${ taskList}" var="task" varStatus="status">
                                                        <c:if test="${task.progress eq '완료' }">
                                                        <div class="row">
	                                                        <li>
	                                                        	<a class="taskDetail" data-toggle="modal" data-target="#taskDetailModal" data-tskSeq="${task.tskSeq}">${task.title}</a>
	                                                        	<span class="label label-primary text-normal pull-right">
		                                                        	<fmt:formatDate value="${task.startAt}" pattern="yy-MM-dd"/>
		                                                        	~
		                                                        	<fmt:formatDate value="${task.endAt}" pattern="yy-MM-dd"/>
	                                                        	</span>
	                                                        </li>
                                                        </div>
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
                <div id="addTaskModal" class="modal fade">
					<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<h2><input type="text" name="title" class="input-line" placeholder="업무를 입력하세요" form="addPMTaskForm" required/></h2>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									
									<div class="tab-content">
										<div class="tab-pane active" id="addTaskTab">
											<div class="form-group">
												<div class="col-md-6" style="float: left;">
													
												</div>
											</div>
											<form action="addPMTask.do" id="addPMTaskForm" class="form-horizontal mb-lg" method="post">
													<div class="form-group mt-lg">
														<label class="col-md-3 control-label">담당자</label>
														<div class="col-md-6">
															<select class="form-control" id="taskMember" name="mail" form="addPMTaskForm">
																<option hidden>선택하세요</option>
																<c:forEach items="${pjtMember}" var="user" varStatus="status">
																	<option value="${user.mail}">${user.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-md-3 control-label">중요도&nbsp;<b id="addPMTaskImportant">1</b><b>/5</b></label>
														<div class="col-md-6">
															<div class="m-md slider-primary" data-plugin-slider data-plugin-options='{ "value": 1, "range": "min","min":1, "max": 5 }' data-plugin-slider-output="#addPMTaskFormBar">
																<input id="addPMTaskFormBar" class="addPMTaskFormBar" name="important" type="hidden" value="1" form="addPMTaskForm" />
																<input type="hidden" name="pjtSeq" value="${project.pjtSeq}" form="addPMTaskForm">
															</div>
														</div>
													</div>
												</form>
										</div>
										
									</div>
										<div class="modal-footer">
											<input type="submit" class="btn btn-default" value="업무추가" form="addPMTaskForm">
											&nbsp;&nbsp;
											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										</div>
									
									
								</div>
							</div>
				</div>
                
                <!-- 상세보기모달 -->
				<div id="taskDetailModal" class="modal fade">
					<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<h2><input id="taskDetailTitle" type="text" name="title" class="input-line" value="" readonly="readonly"></h2>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<ul class="list-unstyled nav nav-pills">
											<li class="active">
												<a href="#detail" data-toggle="tab">상세</a>
											</li>
											<li>
												<a href="#content" data-toggle="tab">내용</a>
											</li>
											<li>
												<a href="#checkList" data-toggle="tab">체크리스트</a>
											</li>
										</ul>
									</div>
									
									<div class="tab-content">
										<div class="tab-pane active" id="detail">
											<form id="ajax/project/taskForm.do" class="form-horizontal mb-lg">
												<div class="form-group">
													<label class="col-md-3 control-label">날짜</label>
													<div class="col-md-6">
														<div class="input-daterange input-group" data-plugin-datepicker>
															<span class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</span>
															<input type="text" id="taskFormStartAt" name="startAt" class="form-control">
															<span class="input-group-addon">to</span>
															<input type="text" id="taskFormEndAt" name="endAt" class="form-control">
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">담장자</label>
													<div class="col-md-6 row">
															<i class="fa fa-reddit"></i><input type="text" id="taskFormMail" name="mail" class="input-noneborder" readonly="readonly"/>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">중요도&nbsp;<b id="taskImportant">1</b><b>/5</b></label>
													<div class="col-md-6">
														<div class="m-md slider-primary" data-plugin-slider data-plugin-options='{ "value": 1, "range": "min","min":1, "max": 5 }' data-plugin-slider-output="#taskFormBar">
															<input id="taskFormBar" class="taskFormBar" name="important" type="hidden" value="1" />
															<input type="hidden" id="taskFormPjtSeq" name="pjtSeq" value="" />
															<input type="hidden" id="taskFormTskSeq" name="tskSeq" value="" />
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">진행상황</label>
													<input type="hidden" id="taskFormProgress" name="progress" value=""> 
													<div class="col-md-6 btn-group">
														<button type="button" class="btn btn-default progress-button">예정</button>
														<button type="button" class="btn btn-default progress-button">진행</button>
														<button type="button" class="btn btn-default progress-button">테스트</button>
														<button type="button" class="btn btn-default progress-button">완료</button>
													</div>
												</div>
												<br>
												<br>
												<hr>
												<div class="form-group" style="text-align: center;">
													<input type="submit" class="btn btn-default" style="background-color: #34495e; color:white;" value="변경사항등록">
														&nbsp;&nbsp;
													<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
												</div>	
											</form>
										</div>
										<div class="tab-pane" id="content">
											
											<form action="ajax/project/taskContentForm.do" id="taskContentForm" class="form-horizontal mb-lg" >
												<label>상세업무 추가하기&nbsp;&nbsp;<a><i id="addTaskContentButton" class="fa fa-plus-square before" onclick="makeContent(this)"></i></a></label>
												<div class="form-group">
													<div class="col-md-6">
														<input type="hidden" form="taskContentForm" id="taskDetailTskSeq" name="tskSeq"/>
													</div>
												</div>
											</form>
											<div>
												<ul id="taskDetailListView">
													
												</ul>
											</div>
										</div>
										<div class="tab-pane" id="checkList">
											<h1>second</h1>
											<form id="checkListForm" class="form-horizontal mb-lg" >
													
												<div class="form-group">
													<label class="col-sm-3 control-label">Comment</label>
													<div class="col-sm-9">
														<textarea rows="5" class="form-control" placeholder="Type your comment..." required></textarea>
													</div>
												</div>
												
											</form>
										</div>
									</div>
										<div class="modal-footer">
											<input type="submit" class="btn btn-default" value="확인">
											&nbsp;&nbsp;
											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										</div>
									
									
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




</body>
</html>