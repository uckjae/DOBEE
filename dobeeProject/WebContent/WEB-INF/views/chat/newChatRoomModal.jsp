<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 채팅방 모달 -->
			<div class="modal fade" id="modalBootstrap" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		   		<div class="modal-dialog cascading-modal" role="document">
					<div class="modal-content">
					<!--Header-->
						<div class="modal-header light-blue darken-3 white-text" style="text-align: center;padding-top: 25px;padding-bottom: 25px;">
							<button type="button" class="close" data-dismiss="modal" style="margin-top:-9px;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
								<h4 class="modal-title" id="myModalLabel"><i class="fa fa-wechat fa-2x"></i>&nbsp;새 대화 채널</h4>
						</div>
						<!--Body-->
						<div class="container-fluid">
						<div class="modal-body mb-0" style="margin-top: 30px;">
						      <form id="makeChatRoom" name="makeChatRoom" method="post">
						      	<div class="row">
						      		<div class="col-md-3">
						      			<label for="newChatRoomName" class="col-form-label"><i class="fa fa-comment fa-2x"></i><span style="font-size:15px">&nbsp;&nbsp;채널 이름</span></label>
						      		</div>
						      		<div class="col-md-9">
							          <input type="text" class="form-control" id="newChatRoomName" name="newChatRoomName">
							       </div>
							   </div>
							   <br>
						        <div class="row">
						      		<div class="col-md-3">
						      			<label for="userList" class="col-form-label"><i class="fa fa-user fa-2x"></i><span style="font-size:15px">&nbsp;&nbsp;멤버 초대</span></label>
						      		</div>
						      		<div class="col-md-9">
		                                    <select class="form-control" id="userSelect" name="userSelect" style="height : 43px">
		                                    <option hidden>멤버 추가</option>
		                                    </select>
						      		</div>
							   </div>
							   <div>
							   <br>
							   <div class="row">
								   <div class="col-sm-3">
							       </div>
							       <div class="col-sm-9" id="chatUserList" style="display:none">
								   </div>
								</div>
							   </div>
							   <br>
							 </form>
						</div>
						</div>
						<div class="modal-footer">
						<div class="row">
							<div class="col-md-4">
							</div>
							<div class="col-md-4 text-center">
								<button type="button" id="makeChatRoomBtn" class="btn btn-primary modal-confirm">만들기</button>
							</div>
							<div class="col-md-4">
							</div>
							</div>
						</div>
						</div>
				</div>
			</div>
			