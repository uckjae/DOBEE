<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<ul class="widget-todo-list" id="taskCheckList">
	<li>
		<div class="checkbox-custom checkbox-default">
				<input type="checkbox" id="todoListItem1" onclick="checkLine(this)">
				<label for="todoListItem1" class="check-label">
					<span>체크체크~!~!~!~!</span>
				</label>
			</div>
			<!-- 수정 & 삭제 아이콘 -->
			<div class="todo-actions">
				<a style="cursor: pointer" onclick="taskCheckListEdit(this)">
					<i class="fa  fa-pencil"></i>
				</a>&nbsp;&nbsp;&nbsp;
				<a style="cursor: pointer" onclick="taskCheckListDelete(this)">
					<i class="fa fa-times"></i>
				</a>
			</div>
			<!-- 수정창 -->
			<div class="checkList-Edit" style="display:none">
				<form action="ajax/project/taskCheckListEdit.do" id="editCheckListForm" name="editCheckListForm" method="post" class="form-horizontal form-bordered">
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
</ul>