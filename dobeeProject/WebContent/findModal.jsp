<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 채팅방 모달 -->
<div class="modal fade" id="modalBootstrap" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog cascading-modal" role="document">
		<div class="modal-content">
			<!--Header-->
			<div class="modal-header light-blue darken-3 white-text"
				style="text-align: center; padding-top: 25px; padding-bottom: 25px;">
				<button type="button" class="close" data-dismiss="modal"
					style="margin-top: -9px;">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">아아디 찾기</h4>
			</div>
			<!--Body-->
			<div class="container-fluid">
				<div class="modal-body mb-0" style="margin-top: 30px;">
					<form id="makeChatRoom" name="makeChatRoom" method="post">
						<div class="form-group">
							<label class="col-md-3 control-label">
							   <span style="font-size: 15px">아이디</span>
							</label>
							<div class="col-md-9">
								<input type="text" class="form-control" id="newChatRoomName"
									name="newChatRoomName" style="height: 35px;">
							</div>
						</div>
						<br>
					</form>
				</div>
			</div>
			
			<div class="modal-footer">
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4 text-center">
						<button type="button" id="makeChatRoomBtn"
							class="btn btn-primary modal-confirm">확인</button>
					</div>
					<div class="col-md-4"></div>
				</div>
			</div>
			
		</div>
	</div>
</div>