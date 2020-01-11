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
	    border-left: 20px solid #fc6d4c;
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
						      <form id="newChannel">
						      
						      	<div class="row">
						      		<div class="col-sm-3">
						      			<label for="channelName" class="col-form-label"><i class="fas fa-comment-dots"></i><span>&nbsp;채널 이름</span></label>
						      		</div>
						      		<div class="col-sm-9">
							          <input type="text" class="form-control" id="channelName" name="channelName">
							       </div>
							   </div>
						        <div class="row">
						      		<div class="col-sm-3">
						      			<label for="member" class="col-form-label"><i class="fas fa-user"></i><span>&nbsp;멤버 초대</span></label>
						      		</div>
						      		<div class="col-sm-9">
		                                    <select class="form-control" id="memberSelect" name="member" style="height : 43px">
		                                    	<option hidden></option>
		                                    </select>
						      		</div>
							   </div>
							   <br>
							      <div class="text-center mt-1-half">
							        <button class="btn btn-info mb-2 waves-effect waves-light" >Send <i class="fas fa-send ml-1"></i></button>
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
            <li>
                <div><a style="cursor:pointer" id="groupChatBtn" href="groupChat.do"><i class="fab fa-slack-hash"></i><span class="chat-room">전체</span></a>
           		</div>
           		
            </li>
             <li>
	             <div><a href="#"><i class="fab fa-slack-hash"></i><span class="chat-room">IT</span></a>
	           	 </div>
            </li>
            
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
	           <c:set var="userList" value="${requestScope.userList}"/>
	           <c:forEach var="user" items="${userList }">
		            <li>
			           	<div><a href='#'><i class='fas fa-user'></i><span>&nbsp;&nbsp;${user.name }</span></a>
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
        			<div class="col-md-6" style="margin-top:20px;">
               			<b style="font-size:40px; text-align:center;">알파카</b>
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
            <form id="sendMessage" method="post">
				<div>        
		            <li class="white">
		              <div class="form-group basic-textarea">
		                <textarea class="form-control pl-2 my-0" id="message" name="message" rows="3" placeholder="메시지를 입력해주세요"></textarea>
		                <input type="hidden" id="username" name="username" value="알파카">
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
    <script src="http://localhost:5000/socket.io/socket.io.js"></script>
    <script>
  $(function(){
	  
	  var username = $("#username").val();

	  
	  var socket = io.connect("http://localhost:5000/groupchat",{
		  path: '/socket.io'
		  });

	  
	      $("#sendMessage").on('submit', function(e){
	    	  var msg = $('#message').val();
	    	  socket.emit('send message to self', username, msg);
	          $('#message').val("");
	          $("#message").focus();
	          e.preventDefault();
	       });
	       
	       socket.on('receive message', function(msg,currentDate){
	    	   $('#chatLog').append('<div id="scroll"> <li class="in"><div class="chat-img" >'
	    	    	   +'<img alt="Avtar" src="./img/alpaca.jpg"></div>'
	    	    	   +'<div class="chat-body"><div class="chat-message">'
		               +'<h3>'+username+'</h3>'
		               +'<span>'+msg+'</span>&nbsp;&nbsp;&nbsp;<span>'+currentDate+'</span>'
		               +'</div></div></li></div><br>');
	    	   $('#scroll').scrollTop($('#scroll')[0].scrollHeight);

	       });

	   	  //전체 채팅방으로 이동하기
	   	/*   $("#groupChatBtn").click(function(){

	   		 
	   		  	$("#chatMsgMain").remove();
	   		  	



	   		}); */
  });

  </script>
    </body>
</html>




