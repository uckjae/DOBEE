<%@page import="com.dobee.vo.chat.ChatRoom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
  <head>
  
    <!-- Jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="./vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="./vendor/font-awesome/css/font-awesome.min.css">
    
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="./css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="./css/custom.css">
    <!-- Sweet Alert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
  </head>
  <style>
	@import url(https://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
	body{
			font-size: 20px; font-family: 'Nanum Brush Script', serif; line-height: 1.5; color: #222222;
	
	}
	h4, span {
			font-size: 20px; font-family: 'Nanum Brush Script', serif; line-height: 1.5; color: #222222;
	
	}
	a {
		color: #222222;
	}
	
	body{
    background:#eee;    
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
    <!-- Side Navbar -->
    <nav class="side-navbar">
    <c:import url="/common/left.jsp" />
    </nav>
  	

    <div class="page">
   
      <!-- navbar-->
      <c:import url="/common/top.jsp"/>
 
<div class="card grey lighten-3 chat-room">
  <div class="card-body">

    <!-- Grid row -->
    <div class="row px-lg-2 px-2" style="height:100%">

      <!-- Grid column -->
      <div class="col-md-6 col-xl-3 px-0">
        <div class="white z-depth-1 px-3 pt-3 pb-0">
          <ul class="list-unstyled friend-list">
            <li>
            	<div class="row">
            	<div class="col-md-10">
                  <h4 style="display:inline;">Channels</h4>
                </div>
                <div class="col-md-2">
	                <div class="text-center">
					    <button type="button" id="channelModal" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalContactForm"><strong>+</strong></button>
					</div>
						<!-- modal -->
						<div class="modal fade" id="modalContactForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog cascading-modal" role="document">
						    <!--Content-->
						    <div class="modal-content">
						
						      <!--Header-->
						      <div class="modal-header light-blue darken-3 white-text">
						        <h4 class="title"><i class="fas fa-pencil-alt"></i> 새 대화 채널 만들기</h4>
						        <button type="button" class="close waves-effect waves-light" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">×</span>
						        </button>
						      </div>
						      <!--Body-->
						      <div class="modal-body mb-0">
						      <form id="makeChatRoom" name="makeChatRoom" method="post">
						      	<div class="row">
						      		<div class="col-sm-3">
						      			<label for="newChatRoomName" class="col-form-label"><i class="fas fa-comment-dots"></i><span>&nbsp;채널 이름</span></label>
						      		</div>
						      		<div class="col-sm-9">
							          <input type="text" class="form-control" id="newChatRoomName" name="newChatRoomName">
							       </div>
							   </div>
						        <div class="row">
						      		<div class="col-sm-3">
						      			<label for="userList" class="col-form-label"><i class="fas fa-user"></i><span>&nbsp;멤버 초대</span></label>
						      		</div>
						      		<div class="col-sm-9">
		                                    <select class="form-control" id="userSelect" name="userSelect" style="height : 43px">
		                                    <option hidden>멤버</option>
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
							      <div class="text-center mt-1-half">
							        <button type="button" id="makeChatRoomBtn" class="btn btn-info mb-2 waves-effect waves-light" >만들기<i class="fas fa-send ml-1"></i></button>
							      </div>
						        </form>
						      </div>
						    </div>
						    <!--/.Content-->
						  </div>
						</div>						
						<!-- end of modal -->
                	</div>
            	</div>
            </li> <br>
            <c:set var="roomNameList" value="${requestScope.roomNameList}"/>
	           <c:forEach var="roomName" items="${roomNameList}">
		            <li>
			           	<div><a href='chatGroup.do?roomName=${roomName }' class="groupChatRoom"><i class='fas fa-user'></i><span>&nbsp;&nbsp;${roomName}</span></a>
			     	  	</div>
		     	  	</li>
	           </c:forEach>
            <hr>
            </ul>
            <ul class="list-unstyled friend-list">
	            <li>
	            	<div class="row">
	            	<div class="col-md-10">
	                  <h4 style="display:inline;">Direct Messages</h4>
	                </div>
	                <div class="col-md-2"><div>
	            	</div>
	            </li><br>
	            </ul>
	           <ul class="list-unstyled friend-list">
	           <c:forEach var="userList" items="${requestScope.userList}">
		            <li>
		            	<div><a href='chatDm.do?chatMail=${userList.mail}' class="dmUser" value=${userList.mail }><i class='fas fa-user'></i><span>&nbsp;&nbsp;${userList.name }</span></a>
			     	  	</div>
		     	  	</li>
	           </c:forEach>
	           </ul>
        </div>
      </div>
      <!-- Grid column -->
     
      <div class="col-md-6 col-xl-9 pl-md-3 px-lg-auto px-0">
        <div class="chat-message">
          <ul class="list-unstyled chat">
            <li class="d-flex justify-content-between mb-4">
            	<div class="row">
            		<div class="col-md-6">
            			<img src="./img/alpaca.jpg" alt="avatar" class="rounded-circle" width="100px;" heigt="100px;">
            		</div>
        			<div class="col-md-6" style="margin-top:20px;" >
               			<b id="chatRoomName" style="font-size:30px;">${requestScope.roomName}</b>
            		</div>
            	</div>
            </li>
            <hr>
            <br><br>
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
            <div class="container content" id="chatMsgMain">
            <div class="col-md-12">
	            <ul class="chat-list" id="chatLog" style="height: 250px; overflow-y: scroll;">
	        	</ul>
			</div>
			</div>
			<br>
            <!-- 채팅 보내기창 -->
            <form id="sendMessage">
				<div>        
		            <li class="white">
		              <div class="form-group basic-textarea">
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
      <!-- Grid column -->

    </div>
    <!-- Grid row -->
  </div>
</div>
     <c:import url="/common/bottom.jsp"/>
    
   	</div>

<!-- JavaScript files-->
    
<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="./js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
<script src="./vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="https://kit.fontawesome.com/5d4e7bbd25.js" crossorigin="anonymous"></script>
    
<!-- socket 연결 -->
<script src="http://192.168.6.2:5000/socket.io/socket.io.js"></script>
<script>
	$(function(){

		var chatType = $("#chatType").val();
		var chatRoomName = $("#chatRoomName").text();
		var fromName = $("#name").val();
		var socket = io.connect( 'http://192.168.6.2:5000/group', {
					path: '/socket.io'
				});
				
				$("#sendMessage").on('submit', function(e){
					chatContent = $('#chatContent').val();

					socket.emit('send message to group', chatRoomName, chatType, chatContent, fromName);
					$('#chatContent').val("");
					$("#chatContent").focus();
					e.preventDefault();
					
					});
				
				socket.on('receive message to group', function(chatContent,currentDate, name){
					console.log('현재 입력한 사람은???'+fromName);
					console.log('발신자는???'+name);
					if(fromName == name) {
						$('#chatLog').append('<div id="scroll"> <li class="out"><div class="chat-img" >'
								+'<img alt="Avtar" src="./img/alpaca.jpg"></div>'
								+'<div class="chat-body"><div class="chat-message">'
								+'<h3>'+name+'</h3>'
								+'<span>'+chatContent+'</span>&nbsp;&nbsp;&nbsp;<span>'+currentDate+'</span>'
								+'</div></div></li></div><br>');
						$('#scroll').scrollTop($('#scroll')[0].scrollHeight);
 
						} else {

							$('#chatLog').append('<div id="scroll"> <li class="in"><div class="chat-img" >'
									+'<img alt="Avtar" src="./img/alpaca.jpg"></div>'
									+'<div class="chat-body"><div class="chat-message">'
									+'<h3>'+name+'</h3>'
									+'<span>'+chatContent+'</span>&nbsp;&nbsp;&nbsp;<span>'+currentDate+'</span>'
									+'</div></div></li></div><br>');
							$('#scroll').scrollTop($('#scroll')[0].scrollHeight);

							}

					});
		
		
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
		
	var count = 0;
	
	$("#userSelect").change(function(){
		var userInfo = $("select[name='userSelect'] option:selected").val().split(":");
		var userName = userInfo[0]			
		var userMail = userInfo[1];
		$("#chatUserList").append("<div style='display:inline' class='list'><i class='fas fa-user'><span name='name' id='name"+(count++)+"'>"
						+userName+"</span><input type='hidden' name='userMail' value='"+userMail+"'>&nbsp;&nbsp;</i></div>");
	
		$("#chatUserList").css("display","block");
	
		});
	
	$("#makeChatRoomBtn").on('click', function(e){
		if($("#newChatRoomName").val() == "" || $("#newChatRoomName").val() == null){
			swal({
				title: "채널명",
				text: "채널명을 입력하세요",
				icon: "warning" //"info,success,warning,error" 중 택1
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
	 						   icon: "success" //"info,success,warning,error" 중 택1
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


/*

	
	$("#chatMsgMain").empty();
						$("#chatMsgMain").append('<div class="col-md-12">'
								+ '<ul class="chat-list" id="chatLog" style="height: 250px; overflow-y: scroll;">'
								+ '</ul></div>');

						$("#chatRoomName").text("");
						$("#chatRoomName").text(chatRoomName);
						$("#chatType").val('group');
						var nameSpace = "group";
						var chatType = $("#chatType").val();
						console.log('타입 바뀌니??'+chatType);
	*/
	});

</script>
</body>
</html>




