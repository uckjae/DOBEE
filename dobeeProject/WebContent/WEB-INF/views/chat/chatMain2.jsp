<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed sidebar-left-collapsed">
<head>
	<c:import url="/common/HeadTag.jsp"/>
	<!-- Sweet Alert -->
   	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   	<style>
	html, body {
		width: 100%; height: 100%;
	}
	img{ max-width:100%;}
	.inbox_people {
	  background: #f8f8f8 none repeat scroll 0 0;
	  float: left;
	  overflow: hidden;
	  width: 40%; border-right:1px solid #c4c4c4;
	}
	.inbox_msg {
	  border: 1px solid #c4c4c4;
	  clear: both;
	  overflow: hidden;
	}
	.top_spac{ margin: 20px 0 0;}
	
	
	.recent_heading {float: left; width:40%;}
	.srch_bar {
	  display: inline-block;
	  text-align: right;
	  width: 60%; padding:
	}
	.headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}
	
	.recent_heading h4 {
	  color: #05728f;
	  font-size: 21px;
	  margin: auto;
	}
	.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
	.srch_bar .input-group-addon button {
	  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	  border: medium none;
	  padding: 0;
	  color: #707070;
	  font-size: 18px;
	}
	.srch_bar .input-group-addon { margin: 0 0 0 -27px;}
	
	.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
	.chat_ib h5 span{ font-size:13px; float:right;}
	.chat_ib p{ font-size:14px; color:#989898; margin:auto}
	.chat_img {
	  float: left;
	  width: 11%;
	}
	.chat_ib {
	  float: left;
	  padding: 0 0 0 15px;
	  width: 88%;
	}
	
	.chat_people{ overflow:hidden; clear:both;}
	.chat_list {
	  border-bottom: 1px solid #c4c4c4;
	  margin: 0;
	  padding: 18px 16px 10px;
	}
	.inbox_chat { height: 550px; overflow-y: scroll;}
	
	.active_chat{ background:#ebebeb;}
	
	.incoming_msg_img {
	  display: inline-block;
	  width: 6%;
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

			<!-- 오른쪽 사이드 시작 -->
			<c:import url="/common/RightSide.jsp"/>
			<!-- 오른쪽 사이드 끝 -->			
			<!-- 채팅방 만드는 모달 -->
			<c:import url="/WEB-INF/views/chat/newChatRoomModal.jsp"/>
			<!-- 채팅방 만드는 모달 끝 -->
			
			
		</section>
		<c:import url="/common/BottomTag.jsp"/>
		<!-- Specific Page Vendor -->
		<script src="assets/vendor/pnotify/pnotify.custom.js"></script>
    
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
	  	
		var chatType = $("#chatType").val();
		var userMail = $("#mail").text();
		var socket = io.connect( 'http://192.168.6.2:5000/self', {path: '/socket.io'});

		socket.on('connect', function() {
			//db에 있던 이전 대화 내용 가져오기
			socket.emit('getChatContent', userMail);
		});

		socket.on('printChatHistory', function(msg){
	        var msgArray = msg.reverse();
	        console.log(msgArray);
	       
	        $.each(msgArray, function(index,element){
	            console.log(element);
	            $('#chatLog').append('<div class="row">'
	                +'<div class="col-sm-9" style="text-align:left;">'+element.NAME+' : '+element.CHATCONTENT+'</div>'
	                +'<div class="col-sm-3" style="text-align:right;">'+element.CHATTIME+'</div>'
	                +'</div><br>');
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
				+'</div>'   
				);
	});
	
		
	var count = 0;
	
	$("#userSelect").change(function(){
		 console.log('이거 실행됨?');
		var userInfo = $("select[name='userSelect'] option:selected").val().split(":");
		var userName = userInfo[0]			
		var userMail = userInfo[1];
		$("#chatUserList").append("<div style='display:inline' class='list'><i class='fa fa-user'><span name='name' id='name"+(count++)+"'>"
						+userName+"</span><input type='hidden' name='userMail' value='"+userMail+"'>&nbsp;&nbsp;</i></div>");
	
		$("#chatUserList").css("display","block");
	
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
				$("input[name=userMail]").each(function(index, item){
					chatUserList.push($(item).val());
					});
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
	</body>
</html>