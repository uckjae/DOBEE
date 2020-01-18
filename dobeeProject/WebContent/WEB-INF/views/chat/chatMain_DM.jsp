<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed sidebar-left-collapsed">
	<head>
		<c:import url="/common/HeadTag.jsp"/>
		<!-- Sweet Alert -->
   		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	</head>
	<style>
	/* @import url(https://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
	body{
			font-size: 20px; font-family: 'Nanum Brush Script', serif; line-height: 1.5; color: #222222;
	
	}
	h4 {
			font-size: 20px; font-family: 'Nanum Brush Script', serif; line-height: 1.5; color: #222222;
	
	} */
	a {
		color: #222222;
	}
	
	.chat-list {
	    padding: 0;
	    font-size: .8rem;
	}
	
	.chat-list li {
	    margin-bottom: 10px;
	    overflow: auto;
	    color: #ffffff;
	}
	
	.chat-list .chat-img {
	    float: left;
	    width: 48px;
	}
	
	.chat-list .chat-img img {
	    -webkit-border-radius: 50px;
	    -moz-border-radius: 50px;
	    border-radius: 50px;
	    width: 100%;
	}
	
	.chat-list .chat-message {
	    -webkit-border-radius: 50px;
	    -moz-border-radius: 50px;
	    border-radius: 50px;
	    background: #888888;
	    display: inline-block;
	    padding: 10px 20px;
	    position: relative;
	}
	
	.chat-list .chat-message:before {
	    content: "";
	    position: absolute;
	    top: 15px;
	    width: 0;
	    height: 0;
	}
	
	.chat-list .chat-message h5 {
	    margin: 0 0 5px 0;
	    font-weight: 600;
	    line-height: 100%;
	    font-size: .9rem;
	}
	
	.chat-list .chat-message p {
	    line-height: 18px;
	    margin: 0;
	    padding: 0;
	    font-color:#453d3d;
	}
	
	.chat-list .chat-body {
	    margin-left: 20px;
	    float: left;
	    width: 70%;
	}
	
	.chat-list .in .chat-message:before {
	    left: -12px;
	    border-bottom: 20px solid transparent;
	    border-right: 20px solid #888888;
	}
	
	.chat-list .out .chat-img {
	    float: right;
	}
	
	.chat-list .out .chat-body {
	    float: right;
	    margin-right: 20px;
	    text-align: right;
	}
	
	.chat-list .out .chat-message {
	    background: #888888;
	}
	
	.chat-list .out .chat-message:before {
	    right: -12px;
	    border-bottom: 20px solid transparent;
	    border-left: 20px solid #888888;
	}
	
	.card .card-header:first-child {
	    -webkit-border-radius: 0.3rem 0.3rem 0 0;
	    -moz-border-radius: 0.3rem 0.3rem 0 0;
	    border-radius: 0.3rem 0.3rem 0 0;
	}
	.card .card-header {
	    background: #17202b;
	    border: 0;
	    font-size: 1rem;
	    padding: .65rem 1rem;
	    position: relative;
	    font-weight: 600;
	    color: #ffffff;
	}
	
	.content{
	    margin-top:40px;    
	}
	
  </style>
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
						<h2>채팅</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="#">
										<i class="fa fa-comments"></i>
									</a>
								</li>
								<li><span>채팅</span></li>
							</ol>
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
					<section class="content-with-menu mailbox">
						<div class="content-with-menu-container" data-mailbox data-mailbox-view="folder">
							<div class="inner-menu-toggle">
								<a href="#" class="inner-menu-expand" data-open="inner-menu">
									Show Menu <i class="fa fa-chevron-right"></i>
								</a>
							</div>
							
							<menu id="content-menu" class="inner-menu" role="menu">
								<div class="nano">
									<div class="nano-content">
										<div class="inner-menu-toggle-inside">
											<a href="#" class="inner-menu-collapse">
												<i class="fa fa-chevron-up visible-xs-inline"></i><i class="fa fa-chevron-left hidden-xs-inline"></i> Hide Menu
											</a>
										</div>
										<div class="inner-menu-content">
											<button type="button" id="channelModal" data-toggle="modal" data-target="#modalBootstrap" class="btn btn-block btn-primary btn-md pt-sm pb-sm text-md">
												<i class="fa fa-wechat mr-xs"></i>
												새 대화 채널 만들기
											</button>
											<hr class="separator" />
										
											<div class="sidebar-widget m-none">
												<div class="widget-header">
													<h6 class="title">Channel</h6>
													<span class="widget-toggle">+</span>
												</div>
												<div class="widget-content">
													<ul class="list-unstyled mailbox-bullets">
													 <c:set var="roomNameList" value="${requestScope.roomNameList}"/>
	           											<c:forEach var="roomName" items="${roomNameList}">
												            <li>
													           	<a href='chatGroup.do?roomName=${roomName }' class="menu-item"><span><i class='fa fa-user'></i></span>${roomName}</a>
												     	  	</li>
										          		</c:forEach>
													</ul>
												</div>
											</div>
							
											<hr class="separator" />
							
											<!-- DM 목록 -->
											<div class="sidebar-widget m-none">
												<div class="widget-header">
													<h6 class="title">Direct Messages</h6>
													<span class="widget-toggle">+</span>
												</div>
												<div class="widget-content">
													<ul class="list-unstyled mailbox-bullets">
													<c:forEach var="userList" items="${requestScope.userList}">
											            <li>
												           	<a href='chatDm.do?dmName=${userList.name}&dmMail=${userList.mail}' class="menu-item" value=${userList.mail }><span><i class='fa fa-user'></i></span>${userList.name }</a>
											     	  	</li>
										           </c:forEach>
													</ul>
												</div>
											</div>
											
											
										</div>
									</div>
								</div>
							</menu>
							
							<div class="inner-body mailbox-folder">
								<!-- START: .mailbox-header -->
								<header class="mailbox-header">
									<div class="row">
										<div class="col-sm-6">
											<h1 class="mailbox-title text-light m-none">
               									<b id="dmName" style="font-size:30px;">${requestScope.dmName}</b>
											</h1>
										</div>
										<div class="col-sm-6">
											
										</div>
									</div>
								</header>
								<!-- END: .mailbox-header -->
							
								<!-- START: .mailbox-actions -->
								 <div class="row">
					            	<div class="col-md-4">
					            		<hr width="70%">
					            	</div>
					       			<div class="col-md-4" id="currentDate">
					            		<h3 style="text-align:center;font-size:25px;">오늘 </h3>
					            	</div>     
					            	<div class="col-md-4">
					            		<hr width="70%">
					            	</div>
					            </div>
								
								<!-- END: .mailbox-actions -->
								<div class="nano">
								<div class="container content" id="chatMsgMain">
						            <ul class="list-unstyled" id="chatLog" style="height: 250px; overflow-y: scroll;">
						        	</ul>
								</div>
							</div>
							<form id="sendMessage" method="post">
							<div>        
					            <li class="white">
					              <div class="form-group basic-textarea" stlye="width:300px">
					                <textarea class="form-control pl-2 my-0" id="chatContent" name="chatContent" rows="3" placeholder="메시지를 입력해주세요"></textarea>
									<input type="hidden" id="chatType" name="chatType" value="${requestScope.chatType}">
					                <input type="hidden" id="name" name="name" value="${user.name}">
					              </div>
					            </li>
				            </div>
					            	<button type="submit" class="btn btn-dark" style="float:right;">send</button>
				             </ul>
							</form>
								
								
							</div>
							</div>
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
<script src="http://192.168.6.2:5000/socket.io/socket.io.js"></script> -->
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
	var fromName = $("#name").text();
	var dmName = $("#dmName").text();
	//채팅방 이름 : 발신자 - 수신자
	var chatRoomName = fromName + "-" + dmName;
	var socket = io.connect( 'http://192.168.6.2:5000/dm', {path: '/socket.io'});

	socket.on('connect', function() {
		//db에 있던 이전 대화 내용 가져오기
		socket.emit('getChatContent', chatRoomName);
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
		chatContent = $('#chatContent').val();
		var chatUsers = [fromName, dmName];
		socket.emit('send message to dm', chatRoomName, chatType, chatContent, userMail, chatUsers);
		$('#chatContent').val("");
		$("#chatContent").focus();
	}

	/*send 버튼 클릭시 채팅 서버 전송*/
	$("#sendMessage").on('submit', function(e){
		sendMessage();
		e.preventDefault();
	});
	/*엔터 쳤을 때 채팅 서버 전송 */
	$("#chatContent").keydown(function(){
		if(event.keyCode ==13 && $('#chatContent').val()!=''){
			sendMessage();
			}
		});
	
	/*채팅 뿌려주기*/
	socket.on('receive message to dm', function(chatContent,currentDate, fromName){
		if(fromName == dmName) { 
			$('#chatLog').append('<div> <li class="in"><div class="chat-img" >'
								+'<div class="chat-body"><div class="chat-message">'
								+'<h3>'+fromName+'</h3>'
								+'<span>'+chatContent+'</span>&nbsp;&nbsp;&nbsp;<span>'+currentDate+'</span>'
								+'</div></div></li></div><br>');
						//$('#scroll').scrollTop($('#scroll')[0].scrollHeight);

		} else { //입력한 사람한테 뿌리기
			$('#chatLog').append('<div> <li class="out"><div class="chat-img" >'
									+'<div class="chat-body"><div class="chat-message">'
									+'<h3>'+fromName+'</h3>'
									+'<span>'+chatContent+'</span>&nbsp;&nbsp;&nbsp;<span>'+currentDate+'</span>'
									+'</div></div></li></div><br>');
							//$('#scroll').scrollTop($('#scroll')[0].scrollHeight);
			}

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