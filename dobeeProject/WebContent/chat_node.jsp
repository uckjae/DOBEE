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

  </style>
 
  <body>
  <div id="app">
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
    <div class="row px-lg-2 px-2">

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
				  <template>
					  <div>
					    <b-button @click="show=true" variant="dark"><strong>+</strong></b-button>
					    <!-- <i class="fas fa-plus-circle"></i> -->
					    <b-modal
					      v-model="show"
					      title="새 대화 채널 만들기"
					      :header-bg-variant="headerBgVariant"
					      :header-text-variant="headerTextVariant"
					      :body-bg-variant="bodyBgVariant"
					      :body-text-variant="bodyTextVariant"
					      :footer-bg-variant="footerBgVariant"
					      :footer-text-variant="footerTextVariant"
					    >
					      <b-container fluid>
					       <b-row class="mb-1">
					          <b-col cols="3">채널명</b-col>
					          <b-col>
					          <b-form-input id="input-default" placeholder="채널명을 입력해주세요"></b-form-input>
					          </b-col>
					        </b-row>
					        <b-row class="mb-1">
					          <b-col cols="3">멤버 초대</b-col>
					          <b-col>
					            <b-form-select
					              v-model="bodyBgVariant"
					              :options="variants"
					            ></b-form-select>
					          </b-col>
					        </b-row>
					      </b-container>
					      <template v-slot:modal-footer>
					        <div class="w-100">
					        <b-row class="mb-1">
					        <b-col cols="7">
					        <b-button
					            variant="dark"
					            size="lg"
					            class="float-right"
					            @click="show=false"
					          >
					            만들기
					          </b-button>
					        </b-col>
					        </b-row>
					          
					        </div>
					      </template>
					    </b-modal>
					  </div>
				</template>
                  
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
                <div class="col-md-2">
                    <template>
					  <div>
					    <b-button @click="show=true" variant="dark"><strong>+</strong></b-button>
					    <!-- <i class="fas fa-plus-circle"></i> -->
					    <b-modal
					      v-model="show"
					      title="새 대화 채널 만들기"
					      :header-bg-variant="headerBgVariant"
					      :header-text-variant="headerTextVariant"
					      :body-bg-variant="bodyBgVariant"
					      :body-text-variant="bodyTextVariant"
					      :footer-bg-variant="footerBgVariant"
					      :footer-text-variant="footerTextVariant"
					    >
					      <b-container fluid>
					       <b-row class="mb-1">
					          <b-col cols="3">채널명</b-col>
					          <b-col>
					          <b-form-input id="channelName" placeholder="채널명을 입력해주세요"></b-form-input>
					          </b-col>
					        </b-row>
					        <b-row class="mb-1">
					          <b-col cols="3">멤버 초대</b-col>
					          <b-col>
					            <b-form-select
					              v-model="bodyBgVariant"
					              :options="variants"
					            ></b-form-select>
					          </b-col>
					        </b-row>
					      </b-container>
					      <template v-slot:modal-footer>
					        <div class="w-100">
					        <b-row class="mb-1">
					        <b-col cols="7">
					        <b-button
					            variant="dark"
					            size="lg"
					            class="float-right"
					            @click="show=false"
					            v-on:click="makeRoom"
					          >
					            만들기
					          </b-button>
					        </b-col>
					        </b-row>
					          
					        </div>
					      </template>
					    </b-modal>
					  </div>
				</template>
                </div>
            	</div>
            </li> <br>
            <li>
                 <i class="fas fa-user"></i>
                  	<span>갓경균</span>
            </li>
             <li>
                <i class="fas fa-user"></i>
                  	<span>게다죽</span>
            </li>
            
         
          </ul>
        </div>

      </div>
      <!-- Grid column -->

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
       			<div class="col-md-4">
            		<h3 style="text-align:center;font-size:25px;">오늘 </h3>
            	</div>     
            	<div class="col-md-4">
            		<hr width="70%">
            	</div>
            </div>
            <form id="chat">
				<div style="margin-top:250px;">        
		            <li class="white">
		              <div class="form-group basic-textarea">
		                <textarea class="form-control pl-2 my-0" id="message" rows="3" placeholder="메시지를 입력해주세요"></textarea>
		              </div>
		            </li>
	            </div>    
		            <template>
		            	<b-button variant="dark"
							      size="lg"
							      class="float-right"
							      @click="show=false">
							            send
						</b-button>
					</template>
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
    <script src="http://localhost:3000/socket.io/socket.io.js"></script>

  <script>
  window.onload = function() {

	  var socket = io("http://localhost:3000");
	  
	  //socket.emit('makeRoom')
	  console.log('소켓 연결 성공');

	  
      var app = new Vue({
          el: "#app",
          data() {
              return {
                  show: false,
                  variants: ['primary', 'secondary', 'success', 'warning', 'danger', 'info', 'light', 'dark'],
                  headerBgVariant: 'dark',
                  headerTextVariant: 'light',
                  bodyBgVariant: 'light',
                  bodyTextVariant: 'dark',
                  footerBgVariant: 'light',
                  footerTextVariant: 'light'
                }
          },
          methods : {
			makeRoom : function(){
					var channelName = $("#channelName").val();
				  	console.log('채널 명' + channelName);
				  	
				}
              }
      });

      $('#chat').on('submit', function(e){
          socket.emit('send message', $('#message').val());
          $('#message').val("");
          $("#message").focus();
          e.preventDefault();
      });
      
  }

  
  </script>
    </body>
</html>




