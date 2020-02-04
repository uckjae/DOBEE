<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed sidebar-left-collapsed">
<head>
	<c:import url="/common/HeadTag.jsp"/>
	<!-- Specific Page Vendor CSS -->
	<link rel="stylesheet" href="assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
	<link href="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/css/select2.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css" />
	<link rel="stylesheet" href="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.css" />
	<link rel="stylesheet" href="assets/vendor/bootstrap-markdown/css/bootstrap-markdown.min.css" />
<style>
	html, body {
		width: 100%; height: 100%;
	}
	img{ max-width:100%;}
	
	.incoming_msg_img {
	  display: inline-block;
	  width: 6%;
	}
	.incoming_msg_img img{
	  border-radius: 50%;
	}
	.received_msg {
	  display: inline-block;
	  padding: 0 0 0 10px;
	  vertical-align: top;
	  width: 92%;
	 }
	 .received_withd_msg p {
	  background: #ebebeb none repeat scroll 0 0;
	  border-radius: 3px;
	  color: #646464;
	  font-size: 14px;
	  margin: 0;
	  padding: 5px 10px 5px 12px;
	  width: 100%;
	}
	.time_date {
	  color: #747474;
	  display: block;
	  font-size: 12px;
	  margin: 8px 0 0;
	}
	.received_withd_msg { width: 48%;}
	.mesgs {
	  float: left;
	  padding: 30px 15px 0 25px;
	  width: 60%;
	}
	
	.sent_msg p {
	  background: #537291 none repeat scroll 0 0; /*#05728f*/
	  border-radius: 3px;
	  font-size: 14px;
	  margin: 0; color:#fff;
	  padding: 5px 10px 5px 12px;
	  width:100%;
	}
	.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
	.sent_msg {
	  float: right;
	  width: 46%;
	}
	.input_msg_write input {
	  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	  border: medium none;
	  color: #4c4c4c;
	  font-size: 15px;
	  min-height: 48px;
	  width: 100%;
	}
	
	.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
	.msg_send_btn {
	  background: #05728f none repeat scroll 0 0;
	  border: medium none;
	  border-radius: 50%;
	  color: #fff;
	  cursor: pointer;
	  font-size: 17px;
	  height: 33px;
	  position: absolute;
	  right: 0;
	  top: 11px;
	  width: 33px;
	}
	.messaging { padding: 0 0 50px 0;}
	.msg_history {
	  height: 450px;
	  overflow-y: auto;
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

				<section role="main" class="content-body" style="height:100%;">
					<header class="page-header">
						<h2>채팅</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="#">
										<i class="fa fa-comments"></i>
									</a>
								</li>
								<li><span>채팅</span></li>
								<li><span>나에게 메시지 보내기</span></li>
							</ol>
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
					<section class="content-with-menu mailbox">
						<div class="content-with-menu-container">
						
							<!-- 채팅 메뉴 시작 -->
							<c:import url="/WEB-INF/views/chat/chatMenu.jsp"/>
							<!-- 채팅 메뉴 끝 -->
							
							<!-- 채팅 영역 시작 -->
							<div class="inner-body mailbox-email" style="padding-left: 30px;padding-top: 30px;height:100%;">
									<!-- START: .mailbox-header -->
									<header class="mailbox-header" style="padding-top: 10px;padding-bottom: 15px;">
										<b class="mailbox-title text-light m-none" style="font-size:25px;" id="chatRoomName">
											<c:set var="user" value="${requestScope.user}"/>
			               					${user.name}
										</b>
									</header>
									<hr class="separator" />
									<!-- END: .mailbox-header -->
										<!-- 채팅 대화 뿌려지는 곳 -->
											<div class="mailbox-email-container" style="width:100%">
									          <div class="msg_history" id="msg_history">
									          </div>											
											<div class="type_msg">
									            <div class="input_msg_write">
										          <input type="text" class="write_msg" id="chatContent" name="chatContent" placeholder="메시지를 입력하세요" />
									              <input type="hidden" id="chatType" name="chatType" value="${requestScope.chatType}">
									              <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
									            </div>
								          	</div>
										</div>
									</div>
									<!-- 채팅 영역 끝 -->
						</div>
					</section>
					<!-- end: page -->
				</section>
			</div>
	
			<!-- 채팅방 만드는 모달 -->
			<c:import url="/WEB-INF/views/chat/newChatRoomModal.jsp"/>
			
			<!-- 채팅방 만드는 모달 끝 -->
			
		</section>
		
<c:import url="/common/BottomTag.jsp"/>
<!-- Specific Page Vendor -->
<script src="assets/vendor/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
<script src="assets/vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/js/select2.min.js"></script>
<script src="assets/vendor/bootstrap-multiselect/bootstrap-multiselect.js"></script>
<script src="assets/vendor/jquery-maskedinput/jquery.maskedinput.js"></script>
<script src="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
<script src="assets/vendor/bootstrap-markdown/js/markdown.js"></script>
<script src="assets/vendor/bootstrap-markdown/js/to-markdown.js"></script>
<script src="assets/vendor/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="assets/javascripts/forms/examples.advanced.form.js" /></script>
<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- socket 연결 -->
<script src="http://192.168.6.2:5000/socket.io/socket.io.js"></script>
<script>
	$(function(){
		$.ajax({
			 
	  		url:"getUserList.do",
	  		dataType:"json",
	  		type:"post",
	  		success:function(data){
	  			$.each(data, function(index, element){
		  			
					let option = $("<option></option>");
					$(option).text(element.name+"("+element.mail+")");
					$(option).val(element.name+":"+element.mail);
					$("#userSelect").append(option);

				})
	  		}
	  	});


	  	/*select2 플러그인 쓰기*/
		$('#userSelect').select2({
	        placeholder: '멤버 선택'
			});
		
		var chatType = $("#chatType").val();
		var userMail = $("#mail").text();
		var socket = io.connect( 'http://192.168.6.2:5000/self', {path: '/socket.io'});

		socket.on('connect', function() {
			//db에 있던 이전 대화 내용 가져오기
			socket.emit('getChatContent', userMail, chatType);
		});

		socket.on('printChatHistory', function(msg){
	        var msgArray = msg.reverse();
	        console.log(msgArray);
	       
	        $.each(msgArray, function(index,element){
	        	$("#msg_history").append('<div class="outgoing_msg">'
						+'<div class="sent_msg">'
						+'<p>'+element.CHATCONTENT+'</p>'
						+'<span class="time_date">'+element.CHATTIME+'</span> </div>'
						+'</div>');
	        	$("#msg_history").scrollTop($("#msg_history")[0].scrollHeight);
                
	        });
	    });
	    
			
	/* 서버 채팅으로 전달해주는 함수*/
	var sendMessage = function() {
		var chatRoomName = userMail;
		chatContent = $('#chatContent').val();
		socket.emit('send message to self', chatRoomName, chatType, chatContent, userMail);
		$('#chatContent').val("");
		$("#chatContent").focus();
		}

	/*send 버튼 클릭시 채팅 서버 전송*/
	$("#sendMessage").on('submit', function(e){
		sendMessage();
		e.preventDefault();
	});
	
	
	/*엔터 쳤을 때 채팅 서버 전송 */
	$("input[name='chatContent']").keypress(function(){
		if(event.keyCode ==13 && $('#chatContent').val()!=''){
			console.log('키프레스 넘어가라 ???');
			sendMessage();
			}
		});

	/*채팅 뿌려주기*/
	socket.on('receive message to self', function(chatContent,currentDate){
		$("#msg_history").append('<div class="outgoing_msg">'
				+'<div class="sent_msg">'
				+'<p>'+chatContent+'</p>'
				+'<span class="time_date">'+currentDate+'</span> </div>'
				+'</div>');
		$("#msg_history").scrollTop($("#msg_history")[0].scrollHeight);
	});

	
	$("#makeChatRoomBtn").on('click', function(e){
		if($("#newChatRoomName").val() == "" || $("#newChatRoomName").val() == null){
			swal({
				title: "채널명",
				text: "채널명을 입력하세요", 
				icon: "warning", //"info,success,warning,error" 중 택1
				showConfirmButton: true
				//icon: "warning" //"info,success,warning,error" 중 택1
					}).then((YES) => {
						if (YES) {
							$("#newChatRoomName").focus();
							}
						})
						$("#newChatRoomName").focus();
			}else{
				var chatUserList = new Array();
				var selected = $("#userSelect").select2().val(); //선택된 것만 가져옴!
				$.each(selected, function(index,element){
					var userInfo = element.split(":");
					chatUserList.push(userInfo[1]);
					});
			
				console.log('메일 리스트 만들어짐?'+chatUserList);
				var chatRoom = {
						"newChatRoomName" : $("#newChatRoomName").val(),
	 	    			"chatUserList" : chatUserList
	 	    			};
	 			$.ajax({
	 	 			url:"makeChatRoom.do",
	 				data: chatRoom ,
	 				dataType: "text",
	 				contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
	 				type:"post",
	 				success:function(responsedata){
	 					console.log(responsedata);
	 					if(responsedata == "success"){ //채팅방 생성 완료
	 	 					console.log('채팅방 만듦')
	 	 					swal({
	 						   title: "채널 생성 완료",
	 						   text: "채널이 만들어졌습니다.",
	 						   icon: "success", //"info,success,warning,error" 중 택1
	 						  showConfirmButton: true
	 						}).then((YES) => {
	 							if (YES) {
	 								location.reload(true); 
	 							     }
	 							})
	 					
	 	 					}
	 				},
	 				error:function(){
	 					
	 				}
	 			});
	 			}


		
			});
	});
</script>

</html>