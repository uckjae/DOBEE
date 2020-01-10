<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
  <head>
    <c:import url="/common/tag.jsp"/>
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
					  <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap"><strong>+</strong></button>
						<!-- modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">새 대화 채널 만들기</h5>
						       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        <form>
						          <div class="form-group">
							          <div class="row">
							          	<div class="col-sm-2">
							          		<label for="channelName" class="col-form-label">채널 이름</label>
							          	</div>
							          	<div class="col-sm-8">
							            	<input type="text" class="form-control" id="channelName">
							            </div>
							          </div>
						          </div>						          
						          <div class="form-group">
						            <label for="message-text" class="col-form-label">대화 상대</label>
						           	<select id="member" name="memeber">
						           		<option>멤버 선택</option>
						           	</select>
						          </div>
						          
						        </form>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						        <button type="button" class="btn btn-primary">Send message</button>
						      </div>
						    </div>
						  </div>
						</div> 
                </div>
            	</div>
            </li> <br>
            <li>
                 <i class="fab fa-slack-hash"></i>
                  	<span class="chat-room">Design</span>
            </li>
             <li>
                 <i class="fab fa-slack-hash"></i>
                  	<span class="chat-room">IT</span>
            </li>
            <hr>
            <li>
            	<div class="row">
            	<div class="col-md-10">
                  <h4 style="display:inline;">Direct Messages</h4>
                </div>
                <div class="col-md-2"><div>
            	</div>
            </li><br>
            <li>
           		<div><a href="#"><i class="fas fa-user"></i><span>&nbsp;&nbsp;알파카</span></a>
           		</div>
            </li>
            <li>
           		<div><a href="#"><i class="fas fa-user"></i><span>&nbsp;&nbsp;갓경균</span></a>
           		</div>
            </li>
             <li>
                <div><a href="#"><i class="fas fa-user"></i><span>&nbsp;&nbsp;게다죽</span></a>
           		</div>
            </li>
          </ul>
        </div>
      </div>
      <!-- Grid column -->

     
      <div class="col-md-6 col-xl-9 pl-md-3 px-lg-auto px-0" >
        <div class="chat-message">
          <ul class="list-unstyled chat">
            <li class="d-flex justify-content-between mb-4">
            	<div class="row">
            		<div class="col-md-6">
            			<img src="./img/alpaca.jpg" alt="avatar" class="rounded-circle" width="100px;" heigt="100px;">
            		</div>
        			<div class="col-md-6" style="margin-top:20px;">
               			<b style="font-size:40px; text-align:center;" id="username">알파카</b>
            		</div>
            	</div>
            </li>
            <hr>
            <br><br>
            <div class="row">
            	<div class="col-md-4">
            		<hr width="70%">
            	</div>
       			<div class="col-md-4">
            		<h3 style="text-align:center;font-size:25px;">오늘 </h3>
            	</div>     
            	<div class="col-md-4">
            		<hr width="70%">
            	</div>
            </div>
            <div class="container content">
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
		                <textarea class="form-control pl-2 my-0" id="message" rows="3" placeholder="메시지를 입력해주세요"></textarea>
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
    <script src="./vendor/jquery/jquery.min.js"></script>
    <script src="./vendor/popper.js/umd/popper.min.js"> </script>
    <script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="./js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="./vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="./vendor/chart.js/Chart.min.js"></script>
    <script src="./vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="./vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="./js/charts-home.js"></script>
    <!-- Main File-->
    <script src="./js/front.js"></script>
    <script src="https://kit.fontawesome.com/5d4e7bbd25.js" crossorigin="anonymous"></script>
    
    <!-- socket 연결 -->
    <script src="http://localhost:82/socket.io/socket.io.js"></script>

  <script>
  window.onload = function() {

	  var username = $("#username").text();
	  console.log(username);

	  $('#exampleModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  modal.find('.modal-title').text('New message to ' + recipient)
		  modal.find('.modal-body input').val()
		})
		
		
	  var socket = io("http://localhost:82");
	  
	  console.log('소켓 연결 성공');
	      $("#sendMessage").on('submit', function(e){
	    	  var msg = $('#message').val();
	          console.log(msg);
	          socket.emit('send message to self', username, msg);
	          $('#message').val("");
	          $("#message").focus();
	          e.preventDefault();
	       });
	       
	       socket.on('receive message', function(msg, time){
		       console.log('time'+time);
	    	   $('#chatLog').append('<div id="scroll"> <li class="in"><div class="chat-img" >'
	    	    	   +'<img alt="Avtar" src="./img/alpaca.jpg"></div>'
	    	    	   +'<div class="chat-body"><div class="chat-message">'
		               +'<h3>'+username+'</h3>'
		               +'<span>'+msg+'</span>&nbsp;&nbsp;&nbsp;<span>'+time+'</span>'
		               +'</div></div></li></div><br>');
	    	   $('#scroll').scrollTop($('#scroll')[0].scrollHeight);

	       });
  }

  </script>
    </body>
</html>




