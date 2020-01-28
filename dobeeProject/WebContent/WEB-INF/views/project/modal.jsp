<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<ul class="widget-todo-list" id="taskDetailList">
	<li style="padding-bottom: 10px;">
		<div style="margin-left: 10px;" onclick="taskDetailEdit(this)">
			<span><i class="fa fa-square"></i></span>&nbsp;&nbsp; 
			<label class="taskDetail-label" style="cursor: pointer"><span>업무상세</span></label>
			<!-- <div class="todo-actions">
				 					<a  onclick="taskDetailDelete(this)">
				 						<i class="fa fa-times"></i>
				 					</a>
									</div> -->
		</div>
		<div class="todo-actions" onclick="taskDetailDelete(this)">
			<input type="hidden" name="tdSeq" value=""> 
			<a	style="cursor: pointer"> <i class="fa fa-times"></i>
			</a>
		</div> <!-- 업무 상세 수정 창 -->
		<div class="taskDetail-Edit" style="display: none">
			<form action="#" id="editTaskDetailForm" name="editTaskDetailForm"
				method="post" class="form-horizontal form-bordered">
				<div class="form-group">
					<div class="col-sm-12">
						<div class="input-group mb-md">
							<input type="hidden" form="editTaskDetailForm"
								id="taskDetailTskSeq" name="tskSeq" /> <input type="text"
								id="tdContent" name="tdContent" class="form-control"
								form="editTaskDetailForm">
							<div class="input-group-btn" style="padding: 0;">
								<button type="button" class="btn btn-primary" tabindex="-1"
									id="editTaskDetailBtn" form="editTaskDetailForm"
									onclick="taskDetailEditSubmit(this)">
									<span style="font-size: 18px;">Save</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</li>
</ul>


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
						
						
						