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
		
		<!-- Chart.js -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	
	
	
	<!-- Sweet Alert -->
	<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
	
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
    <script type="text/javascript">

    	
		$(function(){
			var wsocket;
			connect();

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
				send("addTask");
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
							var tdContentDiv = $('<div style="margin-left:10px;">');
							var icon = $('<span><i class="fa fa-square"></i></span>');
							var label = $('<label class="taskDetail-label" style="cursor:pointer;margin-left: 10px;">');
							var span = $('<span>'+tdContent+'</span>');
							label.append(span);
							tdContentDiv.append(icon);
							tdContentDiv.append(label);

							//업무 아이콘
							var actionDiv = $('<div class="todo-actions">');
							var hiddenInput1 = $('<input type="hidden" name="tdSeq"> ');
							var hiddenInput2 = $('<input type="hidden" name="tskSeq"> ');
							hiddenInput1.val(tdSeq);
							hiddenInput2.val(tskSeq);
							var a1 = $('<a style="cursor: pointer;margin-right: 13px;" onclick="taskDetailEdit(this)"></a>');
							var editIcon = $('<i class="fa  fa-pencil"></i>');
							a1.append(editIcon);
							var a2 = $('<a style="cursor: pointer" onclick="taskDetailDelete(this)">');
							var deleteIcon = $('<i class="fa fa-times"></i>');
							a2.append(deleteIcon);
							actionDiv.append(hiddenInput1);
							actionDiv.append(hiddenInput2);
							actionDiv.append(a1);
							actionDiv.append(a2);

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
							li.append(actionDiv);
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
			
			/* 01.29 체크리스트 추가 -- 쳌쳌 알파카 */
			$("#addTaskCheckListBtn").click(function(){
				var tskSeq = $("#taskCheckListTskSeq").val();
				var formData = $("#addTaskCheckListForm").serialize();
				var content = $("#content").val();

				//일단 추가한 거 뿌려주기
				var li = $('<li>');
				//체크박스
				var checkDiv = $('<div class="checkbox-custom checkbox-default">');
				var checkInput = $('<input type="checkbox" id="todoListItem" onclick="checkLine(this)" name="isCheck">');
				$(checkInput).prop("checked",false);
				$(checkInput).val(0);
				var label = $('<label class="check-label" for="todoListItem">')
				var span = $('<span>'+content+'</span>');
				label.append(span);
				checkDiv.append(checkInput);
				checkDiv.append(label);

				//수정 삭제 아이콘
				var actionDiv = $('<div class="todo-actions">');
				var editIcon = $('<a style="cursor: pointer;margin-right: 13px;" onclick="taskCheckListEdit(this)"><i class="fa  fa-pencil"></i></a>');
				var deleteIcon = $('<a style="cursor: pointer" onclick="taskCheckListDelete(this)"><i class="fa fa-times"></i></a>');
				actionDiv.append(editIcon);
				actionDiv.append(deleteIcon);

				//수정창 만들기
				var editDiv = $('<div class="checkList-Edit" style="display:none">');
				var editForm = $('<form action="ajax/project/taskCheckListEdit.do" id="editCheckListForm" name="editCheckListForm" method="post" class="form-horizontal form-bordered">');
				var formGroup = $('<div class="form-group">');
				var div1 = $('<div class="col-sm-12">');
				var div2 = $('<div class="input-group mb-md">');
				var hiddenInput1 = $('<input type="hidden" form="editCheckListForm" id="checkListTskSeq" name="tskSeq"/>');
				hiddenInput1.val(tskSeq);
				var hiddenInput2 = $('<input type="hidden" form="editCheckListForm" id="checkListChkSeq" name="chkSeq"/>');
				var contentInput = $('<input type="text" id="checkListContent" name="content"  class="form-control" form="editCheckListForm">');
				contentInput.val(content);
				var btnDiv = $('<div class="input-group-btn" style="padding:0;">');
				var btn = $('<button type="button" class="btn btn-primary" tabindex="-1" id="editTaskDetailBtn" form="editCheckListForm" onclick="taskCheckListEditSubmit(this)"><span style="font-size:18px;">Save</span></button>');
				btnDiv.append(btn);
				div2.append(hiddenInput1);
				div2.append(hiddenInput2);
				div2.append(contentInput);
				
				div2.append(btnDiv);
				div1.append(div2);
				formGroup.append(div1);
				
				editForm.append(formGroup);
				editDiv.append(editForm);

				$(li).append(checkDiv);
				$(li).append(actionDiv);
				$(li).append(editDiv);
				$("#taskCheckList").append(li);
				$("#content").val("");
				
				//ajax로 db 연결해서 값 저장
				$.ajax({
	 	 			url:"ajax/project/addTaskCheckList.do",
	 				data: formData ,
	 				dataType: "json",
	 				contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
	 				type:"post",
	 				success:function(responseData){
	 					if(responseData.result == "success"){ //체크리스트 생성 완료 -> chkSeq 저장
		 					hiddenInput2.val(responseData.chkSeq);
	 					}
	 				},
	 				error:function(){
	 					console.log("code : " + request.status +"\n" + "message : " 
								+ request.responseText + "\n" + "error : " + error);
	 				}
	 			});
			});
			var pjtSeq = ${requestScope.project.pjtSeq};
			console.log('플젝 번호?'+pjtSeq);

			
			/*내 업무*/
			$.ajax({
 	 			url:"ajax/project/getMyTask.do",
 				data: {'pjtSeq' : pjtSeq },
 				dataType: "json",
 				type:"post",
 				success:function(responseData){
 	 				console.log(responseData)
 	 				$.each(responseData.overdueTaskList, function(key, obj) {
 	 	 				console.log('obj!!', obj.title);
 	 	 				console.log('seq?'+obj.tskSeq);
 	 	 				var a = $('<a style="text-decoration: none;cursor:pointer;" class="taskDetail" data-toggle="modal" data-target="#taskDetailModal" data-tskSeq="'+obj.tskSeq+'">');
 	 	 				var section = $('<section class="panel panel-featured-left panel-featured-secondary">');
 	 	 				var panelBody = $('<div class="panel-body">');
 	 	 				var bigDiv = $('<div class="widget-summary widget-summary-xs">');
 	 	 				var div1 = $('<div class="widget-summary-col widget-summary-col-icon">');
 	 	 				var iconDiv = $('<div class="summary-icon bg-secondary">');
 	 	 				var icon = $('<i class="fa fa-check"></i>');
 	 	 				var div2 = $('<div class="widget-summary-col">');
 	 	 				var summaryDiv = $('<div class="summary">');
 	 	 				var title = $('<h4 class="title">'+obj.title+'</h4>');
 	 	 				//첫번째 div
 	 	 				iconDiv.append(icon);
 	 	 				div1.append(iconDiv);
 	 	 				bigDiv.append(div1);
 	 	 				//두번째 div
 	 	 				summaryDiv.append(title);
 	 	 				div2.append(summaryDiv);
 	 	 				bigDiv.append(div2);
 	 	 				panelBody.append(bigDiv);
 	 	 				section.append(panelBody);
 	 	 				a.append(section);
 	 	 				$("#overdueTaskList").append(a);
 	 	 				});

	 	 				
 	 				$.each(responseData.deadlineTaskList, function(key, obj) {
 	 	 				var a = $('<a style="text-decoration: none;cursor:pointer;" class="taskDetail" data-toggle="modal" data-target="#taskDetailModal" data-tskSeq="'+obj.tskSeq+'">');
 	 					var section = $('<section class="panel panel-featured-left panel-featured-primary">');
 	 	 				var panelBody = $('<div class="panel-body">');
 	 	 				var bigDiv = $('<div class="widget-summary widget-summary-xs">');
 	 	 				var div1 = $('<div class="widget-summary-col widget-summary-col-icon">');
 	 	 				var iconDiv = $('<div class="summary-icon bg-primary">');
 	 	 				var icon = $('<i class="fa fa-check"></i>');
 	 	 				var div2 = $('<div class="widget-summary-col">');
 	 	 				var summaryDiv = $('<div class="summary">');
 	 	 				var title = $('<h4 class="title">'+obj.title+'</h4>');

 	 	 				//첫번째 div
 	 	 				iconDiv.append(icon);
 	 	 				div1.append(iconDiv);
 	 	 				bigDiv.append(div1);
 	 	 				//두번째 div
 	 	 				summaryDiv.append(title);
 	 	 				div2.append(summaryDiv);
 	 	 				bigDiv.append(div2);
 	 	 				panelBody.append(bigDiv);
 	 	 				section.append(panelBody);
 	 	 				a.append(section);
 	 	 				$("#deadlineTaskList").append(a);
 	 	 				});
 	 				$.each(responseData.otherTaskList, function(key, obj) {
 	 	 				var a = $('<a style="text-decoration: none;cursor:pointer;" class="taskDetail" data-toggle="modal" data-target="#taskDetailModal" data-tskSeq="'+obj.tskSeq+'">');
 	 	 				var section = $('<section class="panel panel-featured-left panel-featured-tertiary">');
 	 	 				var panelBody = $('<div class="panel-body">');
 	 	 				var bigDiv = $('<div class="widget-summary widget-summary-xs">');
 	 	 				var div1 = $('<div class="widget-summary-col widget-summary-col-icon">');
 	 	 				var iconDiv = $('<div class="summary-icon bg-tertiary">');
 	 	 				var icon = $('<i class="fa fa-check"></i>');
 	 	 				var div2 = $('<div class="widget-summary-col">');
 	 	 				var summaryDiv = $('<div class="summary">');
 	 	 				var title = $('<h4 class="title">'+obj.title+'</h4>');
 	 	 				//첫번째 div
 	 	 				iconDiv.append(icon);
 	 	 				div1.append(iconDiv);
 	 	 				bigDiv.append(div1);
 	 	 				//두번째 div
 	 	 				summaryDiv.append(title);
 	 	 				div2.append(summaryDiv);
 	 	 				bigDiv.append(div2);
 	 	 				panelBody.append(bigDiv);
 	 	 				section.append(panelBody);
 	 	 				a.append(section);
 	 	 				$("#otherTaskList").append(a);
 	 	 				});
 				},
 				error:function(){
 					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
 				}

			});
			

			/*프로젝트 현황 차트!!*/
			
			/*업무 담당 차트! */
			
			
			var pjtMember = new Array();
			var taskCount = new Array(); //담당자별 업무 할당량
			var pjtMemberTask = new Array();

			/*프로젝트 전체 업무*/
			var pjtTaskLength = 0; //전체 프로젝트 업무 갯수
			var pjtTaskScheduled = new Array(); //예정된 업무
			var pjtTaskInProgress = new Array(); //진행중 업무
			var pjtTaskTest = new Array(); //테스트 업무
			var pjtTaskCompleted = new Array(); //완료된 업무
			

			/*프로젝트 전체 진행률*/
			$.ajax({
 	 			url:"ajax/project/getPjtProgressChart.do",
 				data: {'pjtSeq' : pjtSeq } ,
 				dataType: "json",
 				type:"post",
 				success:function(responseData){
 	 				pjtTaskLength = responseData.length; 
 	 				$.each(responseData, function(index, element){
 	 					var progress = element.progress;
 	 					if(progress == '예정'){
 	 						pjtTaskScheduled.push(element);
 	 	 				} else if(progress == '진행') {
 	 	 					pjtTaskInProgress.push(element);
 	 	 	 			} else if(progress == '테스트') {
 	 	 	 				pjtTaskTest.push(element);
 	 	 	 			} else {
 	 	 	 				pjtTaskCompleted.push(element);
 	 	 	 	 		}
 	 	 			});
 				},
 				error:function(){
 					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
 				},
 				complete : function() {
 					Chart.pluginService.register({
 						beforeDraw: function (chart) {
 							if (chart.config.options.elements.center) {
 				        //Get ctx from string
 				        var ctx = chart.chart.ctx;
 				        var centerConfig = chart.config.options.elements.center;
 				      	var fontStyle = centerConfig.fontStyle || 'Arial';
 								var txt = centerConfig.text;
 				        var color = centerConfig.color || '#000';
 				        var sidePadding = centerConfig.sidePadding || 20;
 				        var sidePaddingCalculated = (sidePadding/100) * (chart.innerRadius * 2)
 				        //Start with a base font of 30px
 				        ctx.font = "30px " + fontStyle;
 				        var stringWidth = ctx.measureText(txt).width;
 				        var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;
 				        var widthRatio = elementWidth / stringWidth;
 				        var newFontSize = Math.floor(20 * widthRatio);
 				        var elementHeight = (chart.innerRadius * 2);
 				        var fontSizeToUse = Math.min(newFontSize, elementHeight);
 				        ctx.textAlign = 'center';
 				        ctx.textBaseline = 'middle';
 				        var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
 				        var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
 				        ctx.font = fontSizeToUse+"px " + fontStyle;
 				        ctx.fillStyle = color;
 				        
 				        //Draw text in center
 				        ctx.fillText(txt, centerX, centerY);
 							}
 						}
 					});
 						var config = {
 							type: 'doughnut',
 							data: {
 								labels: [
 								  "예정",
 								  "진행",
 								  "테스트",
 								  "완료"
 								],
 								datasets: [{
 									data: [pjtTaskScheduled.length, pjtTaskInProgress.length, pjtTaskTest.length,  pjtTaskCompleted.length ],
 									backgroundColor: [
 									  "#FF6384",
 									  "#36A2EB",
 									  "#FFCE56",
 									  "#c45850"
 									],
 									hoverBackgroundColor: [
 									  "#FF6384",
 									  "#36A2EB",
 									  "#FFCE56",
 									  "#c45850"
 									]
 								}]
 							},
 						options: {
 	 						title : {
 	 							display: true,
 	 							text: '완료된 업무 비중'
 	 	 						},
 							elements: {
 								center: {
 									text: Math.floor((pjtTaskCompleted.length/pjtTaskLength)*100) + "%",
 				          color: '#FF6384', // Default is #000000
 				          fontStyle: 'Arial', // Default is Arial
 				          sidePadding: 15 // Defualt is 20 (as a percentage)
 								}
 							}
 						}
 					};
 					var ctx = document.getElementById("pjt-progress").getContext("2d");
 					var myChart = new Chart(ctx, config);
 	 			}
 			});

			/* 담당자별 프로젝트 업무 진행률 가져오기*/
			$.ajax({
 	 			url:"ajax/project/getMembersTaskChart.do",
 				data: {'pjtSeq' : pjtSeq },
 				dataType: "json",
 				type:"post",
 				success:function(responseData){
 					for(key in responseData){
 						pjtMemberTask.push(responseData[key]);
 	 				}
 				},
 				error:function(){
 					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
 				},
 				complete : function() {

 					var ctx = document.getElementById("pjtMember-task");
 					var myChart = new Chart(ctx, {
 					    type: 'bar',
 					   data:{
 					   labels: pjtMember,
 					        datasets: [{
 					            label: 'Percentage',
 					            data: pjtMemberTask,
 					            backgroundColor: [
 					                'rgba(255, 99, 132, 0.2)',
 					                'rgba(54, 162, 235, 0.2)',
 					                'rgba(255, 206, 86, 0.2)',
 					                'rgba(75, 192, 192, 0.2)',
 					                'rgba(153, 102, 255, 0.2)',
 					                'rgba(255, 159, 64, 0.2)'
 					            ]
 					        }]
 					},
 					    options: {
 					    	responsive: false,
 					        scales: {
 					            
 					            yAxes: [{
 					            ticks: {
 					                   min: 0,
 					                   max: 100,
 					                   callback: function(value){return value+ "%"}
 					                },  
 									   scaleLabel: {
 					                   display: true,
 					                   labelString: "Percentage"
 					                }
 					            }]
 					        }
 					    }
 					});

 				}

			});
			
			$.ajax({
 	 			url:"ajax/project/getTaskAssignmentChart.do",
 				data: {'pjtSeq' : pjtSeq } ,
 				dataType: "json",
 				contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
 				type:"post",
 				success:function(responseData){

 	 				console.log('데이터는?'+responseData);
 					for(key in responseData){
 						pjtMember.push(key);
 						taskCount.push(responseData[key]);
 	 				}
 				},
 				error:function(){
 					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
 				},

 				complete : function() {
 					new Chart(document.getElementById("member-task"), {
 					    type: 'doughnut',
 					    data: {
 					      labels: pjtMember,
 					      datasets: [
 					        {
 					          label: "업무 할당 현황",
 					          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
 					          data: taskCount
 					        }
 					      ]
 					    },
 					    options: {
 					      title: {
 					        display: true,
 					        text: '담당자 별 업무 비중'
 					      }
 					    }
 					});
 	 			}
 			});
 			
			/* 업무 중요도별 담당자 비중*/
			$.ajax({
 	 			url:"ajax/project/getTaskImportantChart.do",
 				data: {'pjtSeq' : pjtSeq } ,
 				dataType: "json",
 				contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
 				type:"post",
 				success:function(responseData){
 	 				console.log('중요도');
 	 				console.log(responseData);
 	 				console.log('프로젝트 참여자?'+pjtMember);
 				},
 				error:function(){
 					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
 				},
 				complete : function() {

 					var ctx = document.getElementById("member-Important");
 					var myChart = new Chart(ctx, {
 					    type: 'horizontalBar',
 					    data: {
 					        labels: ["5", "4", "3", "2", "1"],
 					        
 					        datasets: [{
 					            data: [727, 589, 537, 543, 574],
 					            backgroundColor: "rgba(63,103,126,1)",
 					            hoverBackgroundColor: "rgba(50,90,100,1)"
 					        },{
 					            data: [238, 553, 746, 884, 903],
 					            backgroundColor: "rgba(163,103,126,1)",
 					            hoverBackgroundColor: "rgba(140,85,100,1)"
 					        },{
 					            data: [1238, 553, 746, 884, 903],
 					            backgroundColor: "rgba(63,203,226,1)",
 					            hoverBackgroundColor: "rgba(46,185,235,1)"
 					        }]
 					    },

 					    options: {
 					       tooltips: {
 					          enabled: false
 					      },
 					      hover :{
 					          animationDuration:0
 					      },
 					      scales: {
 					          xAxes: [{
 					              ticks: {
 					                  beginAtZero:true,
 					                  fontFamily: "'Open Sans Bold', sans-serif",
 					                  fontSize:11
 					              },
 					              scaleLabel:{
 					                  display:false
 					              },
 					              gridLines: {
 					              }, 
 					              stacked: true
 					          }],
 					          yAxes: [{
 					              gridLines: {
 					                  display:false,
 					                  color: "#fff",
 					                  zeroLineColor: "#fff",
 					                  zeroLineWidth: 0
 					              },
 					              ticks: {
 					                  fontFamily: "'Open Sans Bold', sans-serif",
 					                  fontSize:11
 					              },
 					              stacked: true
 					          }]
 					      },
 					      legend:{
 					          display:false
 					      },
 					      
 					      animation: {
 					          onComplete: function () {
 					              var chartInstance = this.chart;
 					              var ctx = chartInstance.ctx;
 					              ctx.textAlign = "left";
 					              ctx.font = "9px Open Sans";
 					              ctx.fillStyle = "#fff";

 					              Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
 					                  var meta = chartInstance.controller.getDatasetMeta(i);
 					                  Chart.helpers.each(meta.data.forEach(function (bar, index) {
 					                      data = dataset.data[index];
 					                      if(i==0){
 					                          ctx.fillText(data, 50, bar._model.y+4);
 					                      } else {
 					                          ctx.fillText(data, bar._model.x-25, bar._model.y+4);
 					                      }
 					                  }),this)
 					              }),this);
 					          }
 					      },
 					      pointLabelFontFamily : "Quadon Extra Bold",
 					      scaleFontFamily : "Quadon Extra Bold",
 					  }
 					});
 	 			}
 			});

 		
			var memberTask = new Array(); //업무
 			var taskScheduled = new Array(); //예정된 업무
 			var taskInProgress = new Array(); //진행중 업무
 			var taskTest = new Array(); //테스트 업무
 			var taskCompleted = new Array(); //완료된 업무
 			
 			/*개인 업무 현황 progress bar*/
			$.ajax({
 	 			url:"ajax/project/getMemberTaskChart.do",
 				data: {'pjtSeq' : pjtSeq } ,
 				dataType: "json",
 				type:"post",
 				success:function(responseData){
 					$.each(responseData, function(index, element){
 	 					
						/*차트용 데이터 넣기*/
 						memberTask.push(element.title);
 	 					var progress = element.progress;
 	 					if(progress == '예정'){
 	 						taskScheduled.push(element);
 	 	 				} else if(progress == '진행') {
 	 	 					taskInProgress.push(element);
 	 	 	 			} else if(progress == '테스트') {
 	 	 	 				taskTest.push(element);
 	 	 	 			} else {
 	 	 	 				taskCompleted.push(element);
 	 	 	 	 		}
 	 				});


 				},
 				error:function(){
 					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
 				},

 				complete : function() {
 					Chart.pluginService.register({
 						beforeDraw: function (chart) {
 							if (chart.config.options.elements.center) {
 				        //Get ctx from string
 				        var ctx = chart.chart.ctx;
 				        
 								//Get options from the center object in options
 				        var centerConfig = chart.config.options.elements.center;
 				      	var fontStyle = centerConfig.fontStyle || 'Arial';
 								var txt = centerConfig.text;
 				        var color = centerConfig.color || '#000';
 				        var sidePadding = centerConfig.sidePadding || 20;
 				        var sidePaddingCalculated = (sidePadding/100) * (chart.innerRadius * 2)
 				        //Start with a base font of 30px
 				        ctx.font = "30px " + fontStyle;
 				        
 								//Get the width of the string and also the width of the element minus 10 to give it 5px side padding
 				        var stringWidth = ctx.measureText(txt).width;
 				        var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

 				        // Find out how much the font can grow in width.
 				        var widthRatio = elementWidth / stringWidth;
 				        var newFontSize = Math.floor(20 * widthRatio);
 				        var elementHeight = (chart.innerRadius * 2);

 				        // Pick a new font size so it will not be larger than the height of label.
 				        var fontSizeToUse = Math.min(newFontSize, elementHeight);

 								//Set font settings to draw it correctly.
 				        ctx.textAlign = 'center';
 				        ctx.textBaseline = 'middle';
 				        var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
 				        var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
 				        ctx.font = fontSizeToUse+"px " + fontStyle;
 				        ctx.fillStyle = color;
 				        
 				        //Draw text in center
 				        ctx.fillText(txt, centerX, centerY);
 							}
 						}
 					});
 						var config = {
 							type: 'doughnut',
 							data: {
 								labels: [
 								  "예정",
 								  "진행",
 								  "테스트",
 								  "완료"
 								],
 								datasets: [{
 									data: [taskScheduled.length, taskInProgress.length,taskTest.length,  taskCompleted.length ],
 									backgroundColor: [
 									  "#FF6384",
 									  "#36A2EB",
 									  "#FFCE56",
 									  "#c45850"
 									],
 									hoverBackgroundColor: [
 									  "#FF6384",
 									  "#36A2EB",
 									  "#FFCE56",
 									  "#c45850"
 									]
 								}]
 							},
 						options: {
 	 						title : {
 	 							display: true,
 	 							text: '완료된 업무 비중'
 	 	 						},
 							elements: {
 								center: {
 									text: (taskCompleted.length/memberTask.length)*100 + "%",
 				          color: '#FF6384', // Default is #000000
 				          fontStyle: 'Arial', // Default is Arial
 				          sidePadding: 15 // Defualt is 20 (as a percentage)
 								}
 							}
 						}
 					};


 					var ctx = document.getElementById("user-task").getContext("2d");
 					var myChart = new Chart(ctx, config);
 					
 	 			}
 			});
			
		}); //onload 함수 끝

		
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
						var label = $('<label class="taskDetail-label" style="cursor:pointer;margin-left: 10px;">');
						var span = $('<span>'+tdContent+'</span>');
						label.append(span);
						tdContentDiv.append(icon);
						tdContentDiv.append(label);
						
						//업무 아이콘
						var actionDiv = $('<div class="todo-actions">');
						var hiddenInput1 = $('<input type="hidden" name="tdSeq"> ');
						var hiddenInput2 = $('<input type="hidden" name="tskSeq"> ');
						hiddenInput1.val(tdSeq);
						hiddenInput2.val(tskSeq);
						var a1 = $('<a style="cursor: pointer;margin-right: 13px;" onclick="taskDetailEdit(this)"></a>');
						var editIcon = $('<i class="fa  fa-pencil"></i>');
						a1.append(editIcon);
						var a2 = $('<a style="cursor: pointer" onclick="taskDetailDelete(this)">');
						var deleteIcon = $('<i class="fa fa-times"></i>');
						a2.append(deleteIcon);
						actionDiv.append(hiddenInput1);
						actionDiv.append(hiddenInput2);
						actionDiv.append(a1);
						actionDiv.append(a2);

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
						li.append(actionDiv);
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

		/* 업무상세 수정창 띄우는 함수*/
		function taskDetailEdit(data){
			var editDiv = $(data).parents('li').find('.taskDetail-Edit');
			var state = editDiv.css('display');
			if(state == 'none') {
				editDiv.css('display','block');
				editDiv.css('margin-top','15px');
				editDiv.css('margin-left','15px');
			} else {
				editDiv.css('display','none');
			}
		}

		/* 업무상세 삭제 하는함수 */
		function taskDetailDelete(data){
			var listDiv = $(data).closest('li');
			console.dir(listDiv);
			var tdSeq = listDiv.find('.taskDetail-Edit').find('input[name="tdSeq"]').val();
			var tskSeq = listDiv.find('.taskDetail-Edit').find('input[name="tskSeq"]').val();
			$(listDiv).remove();
			console.log('삭제됨???');
			$.ajax({
				url:"ajax/project/taskDetailDelete.do",
				data: {'tdSeq' : tdSeq},
				success: function(responseData){
					console.log("taskDetailDelete Ajax Success!!");
					if(responseData == "success"){
						console.log('상세업무 삭제됨!!')
					}
				},
				error: function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
			});
		}


		/* 업무상세 비동기로 수정! 요기요 --01.29 알파카 */
		function taskDetailEditSubmit(data){
			
			var parents = $(data).parents('div.taskDetail-Edit');
			var tdContent = $(parents).find('input[name="tdContent"]').val();
			var tskSeq = $(parents).find('input[name="tskSeq"]').val();
			var tdSeq = $(parents).find('input[name="tdSeq"]').val();
			
			taskDetailEdit(data); //수정창 닫기
			var span = $(data).closest('li').find('.taskDetail-label').find('span'); //원래 입력되어 있던 내용
			span.text(tdContent); //사용자가 수정한 내용으로 바꿔주기
			
			$.ajax({
				url:"ajax/project/taskDetailEdit.do",
				data: { 'tdSeq' : tdSeq , 'tdContent' : tdContent, 'tskSeq' : tskSeq},
				dataType:"text",
				success:function(data){
					if(data == "success"){ 
						console.log('업무 상세 수정 db 저장 완료')
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


		/* 체크리스트 가져와 뿌리는 함수 쳌쳌 --01.26 알파카 수정*/
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
						//체크박스
						var checkDiv = $('<div class="checkbox-custom checkbox-default">');
						var checkInput = $('<input type="checkbox" id="todoListItem'+num+'" onclick="checkLine(this)" name="isCheck">');
						var label = $('<label class="check-label" for="todoListItem'+num+'">')
						
						//checkLine(checkInput);
						var span = $('<span>'+content+'</span>');
						if(isCheck == true){
							console.log("if check=true");
							$(checkInput).prop("checked",true);
							$(checkInput).val(1);
							$(span).css('text-decoration','line-through');
						}else{
							console.log("else check=false");
							$(checkInput).prop("checked",false);
							$(checkInput).val(0);
							$(span).css('text-decoration','none');
						}
						label.append(span);
						checkDiv.append(checkInput);
						checkDiv.append(label);

						//수정 삭제 아이콘
						var actionDiv = $('<div class="todo-actions">');
						var editIcon = $('<a style="cursor: pointer;margin-right: 13px;" onclick="taskCheckListEdit(this)"><i class="fa  fa-pencil"></i></a>');
						var deleteIcon = $('<a style="cursor: pointer" onclick="taskCheckListDelete(this)"><i class="fa fa-times"></i></a>');
						actionDiv.append(editIcon);
						actionDiv.append(deleteIcon);

						//수정창 만들기
						var editDiv = $('<div class="checkList-Edit" style="display:none">');
						var editForm = $('<form action="ajax/project/taskCheckListEdit.do" id="editCheckListForm" name="editCheckListForm" method="post" class="form-horizontal form-bordered">');
						var formGroup = $('<div class="form-group">');
						var div1 = $('<div class="col-sm-12">');
						var div2 = $('<div class="input-group mb-md">');
						var hiddenInput1 = $('<input type="hidden" form="editCheckListForm" id="checkListTskSeq" name="tskSeq"/>');
						hiddenInput1.val(tskSeq);
						var hiddenInput2 = $('<input type="hidden" form="editCheckListForm" id="checkListChkSeq" name="chkSeq"/>');
						hiddenInput2.val(chkSeq);
						var contentInput = $('<input type="text" id="checkListContent" name="content"  class="form-control" form="editCheckListForm">');
						contentInput.val(content);
						var btnDiv = $('<div class="input-group-btn" style="padding:0;">');
						var btn = $('<button type="button" class="btn btn-primary" tabindex="-1" id="editTaskDetailBtn" form="editCheckListForm" onclick="taskCheckListEditSubmit(this)"><span style="font-size:18px;">Save</span></button>');
						btnDiv.append(btn);
						div2.append(hiddenInput1);
						div2.append(hiddenInput2);
						div2.append(contentInput);
						
						div2.append(btnDiv);
						div1.append(div2);
						formGroup.append(div1);
						
						editForm.append(formGroup);
						editDiv.append(editForm);

						$(li).append(checkDiv);
						$(li).append(actionDiv);
						$(li).append(editDiv);
						$("#taskCheckList").append(li);
						num++;
					});
				},
				error:function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
				
			});
		}

		/*체크박스 체크하는 함수 -> 밑줄 긋기 & 체크 여부 name 값 바꾸기 쳌쳌*/
		function checkLine(data){			
			var span = $(data).closest('li').find('.check-label').find('span');
			var chkSeq = $(data).closest('li').find('form').find('input[name="chkSeq"]').val();
			if($(data).is(':checked')){
				$(data).val(1);
				span.css('text-decoration','line-through');
			} else {
				$(data).val(0);
				span.css('text-decoration','none');
			}
			var isCheck = $(data).val();
			$.ajax({
				url:"ajax/project/taskCheckListIsCheck.do",
				data: {'chkSeq' : chkSeq, 'isCheck' : isCheck},
				success: function(data){
					if(data == "success"){
						console.log('체크 여부 수정 완료');
					}
				},
				error: function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
			});
		}


		/* 체크리스트 비동기로 수정하는 함수  요기요 */
		function taskCheckListEditSubmit(data){
			console.log("taskCheckListEditSubmit() in!!");
			var parents = $(data).parents('div.checkList-Edit');
			var tskSeq = $(parents).find('input[name="tskSeq"]').val();
			var chkSeq = $(parents).find('input[name="chkSeq"]').val();
			var content = $(parents).find('input[name="content"]').val();

			taskCheckListEdit(data); //수정창 닫기
			var span = $(data).closest('li').find('.check-label').find('span'); //원래 입력되어 있던 내용
			span.text(content); //사용자가 수정한 내용으로 바꿔주기
					
			$.ajax({
				url:"ajax/project/taskCheckListEdit.do",
				data: {'chkSeq' : chkSeq, 'content' : content },
				dataType:"text",
				success:function(data){
					if(data == "success"){
						console.log('체크리스트 수정 완료')
					}
				},
				error:function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
			});
			
		}

		/* 체크리스트 삭제하는 함수 */
		function taskCheckListDelete(data){
			var listDiv = $(data).closest('li');
			var chkSeq = listDiv.find('.checkList-Edit').find('input[name="chkSeq"]').val();
			var tskSeq = listDiv.find('.checkList-Edit').find('input[name="tskSeq"]').val();
			$(listDiv).remove(); //해당 li 삭제
			$.ajax({
				url:"ajax/project/taskCheckListDelete.do",
				data: {'chkSeq':chkSeq},
				success: function(data){
					if(data == "success"){
						console.log('체크리스트 삭제 성공');
					}
				},
				error: function(request,status,error){
					console.log("code : " + request.status +"\n" + "message : " 
							+ request.responseText + "\n" + "error : " + error);
				}
			});

			
		}

		/*체크리스트 수정창 띄우는 함수 쳌쳌 */
		function taskCheckListEdit(data){
			var editDiv = $(data).parents('li').find('.checkList-Edit');
			var state = editDiv.css('display');
			if(state == 'none') {
				editDiv.css('display','block');
				editDiv.css('margin-top','15px');
				editDiv.css('margin-left','15px');
			} else {
				editDiv.css('display','none');
			}
		}

		/* 체크박스변경시  value 세팅하는 함수 */
		function checkBoxChange(data){
			console.log("checkBoxChange() in!!");
			console.log(data)
			console.log('///////');
			console.dir(data);
			if($(data).prop("checked") == true){
				console.log("체크됐다!");
				$(data).val(1);
			}else{
				console.log("체크 해제 됐다");
				$(data).val(0);
			}
		}

		/* 알람 */
		function getContextPath() {//contextPath 구하는 함수
		  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		  return location.href.substring(6, location.href.indexOf('/', hostIndex + 1) );
		};
		
		

		function connect(){
			var contextPath = getContextPath();
			wsocket = new WebSocket("ws:"+contextPath+"/alram.do");
			wsocket.onopen = onOpen;
			wsocket.onmessage = onMessage;
			wsocket.onclose = onClose;
		}

		
		
		function send(data) {
			let mail = $('#taskMember').val();
			let content = $('#addTaskTitle').val();
			var jsonData = new Object();
			jsonData.cmd = data;
			jsonData.mail = mail;
			jsonData.content = content;

			var parsedData = JSON.stringify(jsonData);
			
			wsocket.send(parsedData);
		}
		/* /알람  */
	
		
		
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
                    </ol>

                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>
            <!-- start: page -->
            <div class="search-content">
                <div class="search-toolbar">
                    <ul class="list-unstyled nav nav-pills" id="">
                        <li class="active">
                            <a href="#kanban" data-toggle="tab">칸반보드</a>
                        </li>
                        <li>
                            <a href="#myTask" data-toggle="tab">내 업무</a>
                        </li>
                        <li>
                            <a href="#pjtDash" data-toggle="tab">현황</a>
                        </li>
                        <li>
                            <a href="#drive" data-toggle="tab">구글드라이브</a>
                        </li>
                    </ul>
                </div>
			</div>
                <!-- 칸반보드 넣기 -->
                <div class="tab-content">
                	<div class="tab-pane active" id="kanban">
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
                   <!-- 내 업무 시작 -->
                   <div class="tab-pane" id="myTask">
						<div class="row">
							<div class="col-md-12" id="overdueTaskList">
								<h5 class="text-semibold text-dark text-uppercase mb-md mt-lg">완료일 지남</h5>
							</div>
							<div class="col-md-12" id="deadlineTaskList">
								<h5 class="text-semibold text-dark text-uppercase mb-md mt-lg">오늘까지</h5>
							</div>
							<div class="col-md-12" id="otherTaskList">
								<h5 class="text-semibold text-dark text-uppercase mb-md mt-lg">기타</h5>
							</div>
						</div>
                   </div>
                   <!-- 내 업무 끝 -->
                   <!-- 프로젝트 현황 -->
                   <div class="tab-pane" id="pjtDash">
	                   <div class="row">
							<div class="col-md-6">
								<section class="panel">
									<header class="panel-heading">
										<h2 class="panel-title">전체 프로젝트 진행률</h2>
									</header>
									<div class="panel-body">
										<!-- Flot: Curves -->
										<div class="chart chart-md" id="flotDashRealTime">
											<canvas id="pjt-progress" width="800" height="450"></canvas>
										</div>
									</div>
								</section>
							</div>
							<div class="col-md-6">
								<section class="panel">
									<header class="panel-heading">
										<h2 class="panel-title">전체 프로젝트 업무 비중</h2>
									</header>
									<div class="panel-body">
										<!-- Flot: Basic -->
										<div class="chart chart-md" >
											<canvas id="member-task" width="800" height="450"></canvas>
										</div>
									</div>
								</section>
							</div>
						</div>
						<div class="col-md-12">
						<section class="panel">
								<header class="panel-heading">
									<h2 class="panel-title">전체 프로젝트 담당자별 업무 진행률</h2>
								</header>
								<div class="panel-body">
									<div class="chart chart-md" style="height:350px">
										<canvas id="pjtMember-task" style="width:1000px;height:350px;"></canvas>
									</div>
								</div>
							</section>
						</div>
						<div class="col-md-12">
						<section class="panel">
								<header class="panel-heading">
									<h2 class="panel-title">업무 중요도별 담당자 비중</h2>
								</header>
								<div class="panel-body">
									<div class="chart chart-md" style="height:350px">
										<canvas id="member-Important" style="width:1000px;height:350px;"></canvas>
									</div>
								</div>
							</section>
						</div>
						<!-- 프로젝트 업무 비중 -->
						<div class="row">
							<div class="col-md-6">
								<section class="panel">
									<header class="panel-heading">
										<h2 class="panel-title">나의 업무 진행 현황</h2>
									</header>
									<div class="panel-body">
										<!-- Flot: Curves -->
										<div class="chart chart-md" id="flotDashRealTime">
											<canvas id="user-task" width="800" height="450"></canvas>
										</div>
									</div>
								</section>
							</div>
							<div class="col-md-6">
								<section class="panel">
									<header class="panel-heading">
										<h2 class="panel-title">My Stats</h2>
									</header>
									<div class="panel-body">
										<section class="panel">
											<div class="panel-body">
												<div class="small-chart pull-right" id="sparklineBarDash"></div>
												<script type="text/javascript">
													var sparklineBarDashData = [5, 6, 7, 2, 0, 4 , 2, 4, 2, 0, 4 , 2, 4, 2, 0, 4];
												</script>
												<div class="h4 text-bold mb-none">488</div>
												<p class="text-xs text-muted mb-none">Average Profile Visits</p>
											</div>
										</section>
										<section class="panel">
											<div class="panel-body">
												<div class="circular-bar circular-bar-xs m-none mt-xs mr-md pull-right">
													<div class="circular-bar-chart" data-percent="45" data-plugin-options='{ "barColor": "#2baab1", "delay": 300, "size": 50, "lineWidth": 4 }'>
														<strong>Average</strong>
														<label><span class="percent">45</span>%</label>
													</div>
												</div>
												<div class="h4 text-bold mb-none">12</div>
												<p class="text-xs text-muted mb-none">Working Projects</p>
											</div>
										</section>
										<section class="panel">
											<div class="panel-body">
												<div class="small-chart pull-right" id="sparklineLineDash"></div>
												<script type="text/javascript">
													var sparklineLineDashData = [15, 16, 17, 19, 10, 15, 13, 12, 12, 14, 16, 17];
												</script>
												<div class="h4 text-bold mb-none">89</div>
												<p class="text-xs text-muted mb-none">Pending Tasks</p>
											</div>
										</section>
									</div>
								</section>
							</div>
						</div>
               		</div>
               		<!-- 프로젝트 현황 끝 -->       
               		<div class="tab-pane" id="drive">
               		
               		 <!-- 성호 - 구글 드라이브 뷰단 -->
               		 <!--  타임 라인 시작 -->
               		 	<script type="text/javascript">
               		 // 현재 유저 이메일 불러오기
               		 var nowEmail = '<c:out value= "${pjtMember[0].mail}"/>';
               		 
               		 
               		 /* 날짜 포맷 함수 */
               		 Date.prototype.format = function(f) {
               		 	if (!this.valueOf()) return " ";

               		 	var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
               		 	var d = this;
               		 	
               		 	return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
               		 		switch ($1) {
               		 			case "yyyy": return d.getFullYear();
               		 			case "yy": return (d.getFullYear() % 1000).zf(2);
               		 			case "MM": return (d.getMonth() + 1).zf(2);
               		 			case "dd": return d.getDate().zf(2);
               		 			case "E": return weekName[d.getDay()];
               		 			case "HH": return d.getHours().zf(2);
               		 			case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
               		 			case "mm": return d.getMinutes().zf(2);
               		 			case "ss": return d.getSeconds().zf(2);
               		 			case "a/p": return d.getHours() < 12 ? "오전" : "오후";
               		 			default: return $1;
               		 		}
               		 	});
               		 };
               		String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
               		String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
               		Number.prototype.zf = function(len){return this.toString().zf(len);};
               		// 날짜포맷함수 종료
							
						/* 타임라인 하나만 그리는 함수 */  //이 함수를 쓰지 않고 구글드라이브.js 에있는 함수를 사용함 여기 수정해도 반영안됨.
						function paintingTimeLine1(email, date, url, filename){
							$(".tm-items").prepend(
									'<li>'+
									'<div class="tm-info">'+
										'<div class="tm-icon"><i class="fa fa-google-plus-square"></i></div>'+
										'<time class="tm-datetime" datetime="2013-11-22 19:13">'+
											'<div class="tm-datetime-time">'+ date +'</div>'+
										'</time>'+
									'</div>'+
										'<div class="tm-box">'+
										'<p id="down">'+ '<a style="font-size:20px;" target="_blank" href='+url+
											'>' + '<i class="fa fa-google-plus-square"></i>' + filename + '</a>'+ 
										'</p>'+
										'<div class="tm-meta">'+  
											email +
										'</div>'+
									'</div>'+
								'</li>'
							);
						}; // 함수 종료
								
               		 
						/* 타임라인 리스트 갯수와 데이터 받아서 그만큼 타임리스트 뷰단 만들어 주는 함수 */
							function createTimeList(arrayData){
									 for(let i = 0 ; i < arrayData.length; i++){
											let gdSeq = arrayData[i].gdSeq;
											//let gdContent = arrayData[i].gdContent;
											let gdUrl = arrayData[i].gdUrl;
											let mail = arrayData[i].mail;
											let pjtSeq = arrayData[i].pjtSeq;
											let fileName = arrayData[i].fileName;

											/* 데이트 타입 변환  */
											let gdDate = new Date(arrayData[i].gdDate).format("yyyy-MM-dd");

											/*  타임라인 그리기 함수 */
											paintingTimeLine(mail, gdDate, gdUrl, fileName);
										 }
									 
							} // 함수 종료

               		 	
               			/*  타임 라인 불러오는 아작스 함수 */
               			//  프로젝트 넘버를 입력하면 그에 해당하는 타임리스트 받아오기
               			
               				// 해당 프로젝트 번호 받아오기
							let pjtSeq = ${requestScope.project.pjtSeq};
							let sendData = {
									"pjtSeq" : pjtSeq
									}
							console.log("성호 : " + sendData);
							var timeLineData = [];
							function loadTimeLine(){
								
							 	$.ajax({
									url : 'ajax/googleDrive/loadTimeLine.do',
									type : 'POST',
									data : sendData,
									dataType: "JSON",
									success:function(data){
											timeLineData = data;
										},

									complete : function(){
											// 불러오기에 성공하면 리스트만큼 타임라인을 만들어주는 함수 
											createTimeList(timeLineData);

										},


									error : function(){
											console.log("타임라인 불러오기 아작스 에러!!!!");
											
		

										},
								 }); // 아작스 종료
							}//불러오기 함수 종료
							
							console.log("성호 : " + pjtSeq);
							// 타임리스트 뿌리기 아작스 실행
							loadTimeLine();
							
	               		 </script>
               		 	 <!-- 구글 드라이브  -->
						<script src="assets/javascripts/googleDriveJs/googleDrive.js"> </script>
               		 	
               		 
               		 
               		 <!-- 구글 드라이브 타임라인 뷰단태그 시작 -->
               		 <div class="timeline">
               		 	<!--추가 버튼  -->
               			<div>
               				<a id="goGoogleDrive" class="mb-xs mt-xs mr-xs modal-basic btn btn-primary" >ADD GoogleDrive</a>
               			</div>
						<div class="tm-body">
						<!-- 	<div class="tm-title">
								<h3 class="h5 text-uppercase">November 2013</h3>
							</div> -->
							
						
							
							
							<ol class="tm-items">
							<!-- 	<li class="addTimeline">
									<div class="tm-info">
										<div class="tm-icon"><i class="fa fa-google-plus-square"></i></div>
										<time class="tm-datetime" datetime="2013-11-22 19:13">
											<div> 여기는 이메일</div>
											<div class="tm-datetime-time">2020-02-02</div>
										</time>
									</div>
										
										
										<div class="tm-box" >
											<p id="down">
												 
											</p>
										<div class="tm-meta">
												
											여기는 파일 내용 코멘트
										
										</div>
									</div>
								</li> -->
							
							
							
								<!-- <li>
									<div class="tm-info">
										<div class="tm-icon"><i class="fa fa-google-plus-square"></i></div>
										<time class="tm-datetime" datetime="2013-11-22 19:13">
											<div>  여기는 이메일 </div>
											<div class="tm-datetime-time">2020-02-02</div>
										</time>
									</div>
										<div class="tm-box appear-animation" data-appear-animation="fadeInRight"data-appear-animation-delay="50">
										<p>
											여기는 구글 드라이브 파일 링크 
										</p>
										<div class="tm-meta">
											여기는 파일 내용 코멘트
										</div>
									</div>
								</li> -->
								
							
							
								 <!--  원본 하나 남겨둠 -->
								<!-- <li>
									<div class="tm-info">
										<div class="tm-icon"><i class="fa fa-thumbs-up"></i></div>
										<time class="tm-datetime" datetime="2013-11-19 18:13">
											<div class="tm-datetime-date">7 months ago.</div>
											<div class="tm-datetime-time">06:13 PM</div>
										</time>
									</div>
									<div class="tm-box appear-animation" data-appear-animation="fadeInRight" data-appear-animation-delay="250">
										<p>
											What is your biggest developer pain point?
										</p>
									</div>
								</li> -->
								<!-- 원본 끝 -->
								
								
							
							
							</ol> <!--타임 라인 끝 -->
						<!-- 	<div class="tm-title">
								<h3 class="h5 text-uppercase">September 2013</h3>
							</div> -->
						</div>  <!--   타임 라인 바디 끝 -->
					</div>   <!-- 타임 라인 전체 디브 끝  -->
               		 
               		 
               		 <!--   타임라인 끝  -->
               		
               		 
               		 
               		 
               		 
               		</div><!--  타임 라인 페이지 전체디브 끝 -->
               		 
               		 
               		 
               		 
               		 
               		 
               		 
                </div> <!-- 이건 완전 전체 페이지 디브 이거 지우면 혜리한테 개혼남 -->
                
               
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
											<input type="text" id="addTaskTitle" class="form-control" type="text" name="title" placeholder="업무를 입력하세요" form="addPMTaskForm" required style="height:35px;">
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
	                                            <div style="margin-left:10px;" >
		                                            <span><i class="fa fa-square"></i></span>&nbsp;&nbsp;
		                                            <label class="taskDetail-label" style="cursor:pointer"><span>업무상세</span></label>
					 								<input type="hidden" name="tdSeq" value="">
				 								</div>
				 								
				 								업무 상세 아이콘
			 									<div class="todo-actions">
			 										<input type="hidden" name="tdSeq" value="">
							 						<a style="cursor: pointer;margin-right: 13px;" onclick="taskDetailEdit(this)">
							 							<i class="fa  fa-pencil"></i>
							 						</a>&nbsp;&nbsp;&nbsp;
							 						<a style="cursor: pointer" onclick="taskDetailDelete(this)">
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
								 					<input type="checkbox" id="todoListItem7" onclick="checkLine(this)">
								 					<label for="todoListItem7" class="check-label">
								 						<span>체크체크~!~!~!~!</span>
								 					</label>
					 							</div>
					 							<!-- 수정 & 삭제 아이콘 -->
							 					<div class="todo-actions">
							 						<a style="cursor: pointer;margin-right: 13px;" onclick="taskCheckListEdit(this)">
							 							<i class="fa  fa-pencil"></i>
							 						</a>&nbsp;&nbsp;&nbsp;
							 						<a style="cursor: pointer" onclick="taskCheckListDelete(this)">
							 							<i class="fa fa-times"></i>
							 						</a>
							 					</div>
							 					<!-- 수정창 -->
							 					<div class="checkList-Edit" style="display:none">
					 								<form action="ajax/project/editTaskCheckList.do" id="editCheckListForm" name="editCheckListForm" method="post" class="form-horizontal form-bordered">
														<div class="form-group">
															<div class="col-sm-12">
																<div class="input-group mb-md">
																	<input type="hidden" form="editCheckListForm" id="checkListTskSeq" name="tskSeq"/>
																	<input type="hidden" form="editCheckListForm" id="checkListChkSeq" name="chkSeq"/>
																	<input type="text" id="checkListContent" name="content"  class="form-control" form="editCheckListForm">
																	<div class="input-group-btn" style="padding:0;">
																		<button type="button" class="btn btn-primary" tabindex="-1" id="editTaskDetailBtn" form="editCheckListForm" onclick="taskCheckListEditSubmit(this)"><span style="font-size:18px;">Save</span></button>
																	</div>
																</div>
															</div>
														</div>
													</form>
							 					</div>
				 							</li>
											 <!-- 템플릿 원본 
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
				 							</li> -->
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
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>

		<!-- Examples -->
		<script src="assets/javascripts/forms/examples.advanced.form.js" /></script>
		
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
		
		<!-- 구글 드라이브 -->
		<script src="https://www.google.com/jsapi?key=AIzaSyB8YEvmQ3oj0tPg7_RyUeXMhsc5KmfJJTQ"></script>
		<script src="https://apis.google.com/js/client.js?onload=SetPicker"></script>
		
		
</body>
</html>