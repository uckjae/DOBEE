<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
  <head>
    <c:import url="/common/tag.jsp"/>
  </head>
  <style>
  .card.chat-room .members-panel-1,
.card.chat-room .chat-1 {
position: relative;
overflow-y: scroll; }

.card.chat-room .members-panel-1 {
height: 570px; }

.card.chat-room .chat-1 {
height: 495px; }

.card.chat-room .friend-list li {
border-bottom: 1px solid #e0e0e0; }
.card.chat-room .friend-list li:last-of-type {
border-bottom: none; }

.scrollbar-light-blue::-webkit-scrollbar-track {
-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
background-color: #F5F5F5;
border-radius: 10px; }

.scrollbar-light-blue::-webkit-scrollbar {
width: 12px;
background-color: #F5F5F5; }

.scrollbar-light-blue::-webkit-scrollbar-thumb {
border-radius: 10px;
-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
background-color: #82B1FF; }

.rare-wind-gradient {
background-color: #e1e1e1;}
  
  </style>
 
  <body>
    <!-- Side Navbar -->
    <nav class="side-navbar">
    <c:import url="/common/left.jsp" />
    </nav>
  	

    <div class="page">
      <!-- navbar-->
      <c:import url="/common/top.jsp"/>

<div class="card rare-wind-gradient chat-room">
  <div class="card-body">

    <!-- Grid row -->
    <div class="row px-lg-2 px-2">

      <!-- Grid column -->
      <div class="col-md-6 col-xl-4 px-0">
        <i class="fas fa-plus"></i>&nbsp;&nbsp;&nbsp;<span class="font-weight-bold mb-3 text-center text-lg-left">새 대화 채널 만들기</span>
        <div class="white z-depth-1 px-2 pt-3 pb-0 members-panel-1 scrollbar-light-blue">
          <ul class="list-unstyled friend-list">
            <li class="active grey lighten-3 p-1">
              <a href="#" class="d-flex justify-content-between">
                <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-8.jpg" alt="avatar" class="avatar rounded-circle d-flex align-self-center mr-2 z-depth-1">
                <div class="text-small">
                  <strong>John Doe</strong>
                  <p class="last-message text-muted">Hello, Are you there?</p>
                </div>
                <div class="chat-footer">
                  <p class="text-smaller text-muted mb-0">Just now</p>
                  <span class="badge badge-danger float-right">1</span>
                </div>
              </a>
            </li>
            
            <li class="p-1">
              <a href="#" class="d-flex justify-content-between">
                <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-1.jpg" alt="avatar" class="avatar rounded-circle d-flex align-self-center mr-2 z-depth-1">
                <div class="text-small">
                  <strong>Danny Smith</strong>
                  <p class="last-message text-muted">Lorem ipsum dolor sit.</p>
                </div>
                <div class="chat-footer">
                  <p class="text-smaller text-muted mb-0">5 min ago</p>
                  <span class="text-muted float-right"><i class="fas fa-mail-reply" aria-hidden="true"></i></span>
                </div>
              </a>
            </li>
            <li class="p-2">
              <a href="#" class="d-flex justify-content-between">
                <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-2.jpg" alt="avatar" class="avatar rounded-circle d-flex align-self-center mr-2 z-depth-1">
                <div class="text-small">
                  <strong>Alex Steward</strong>
                  <p class="last-message text-muted">Lorem ipsum dolor sit.</p>
                </div>
                <div class="chat-footer">
                  <p class="text-smaller text-muted mb-0">Yesterday</p>
                  <span class="text-muted float-right"><i class="fas fa-mail-reply" aria-hidden="true"></i></span>
                </div>
              </a>
            </li>
            <li class="p-2">
              <a href="#" class="d-flex justify-content-between">
                <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-3.jpg" alt="avatar" class="avatar rounded-circle d-flex align-self-center mr-2 z-depth-1">
                <div class="text-small">
                  <strong>Ashley Olsen</strong>
                  <p class="last-message text-muted">Lorem ipsum dolor sit.</p>
                </div>
                <div class="chat-footer">
                  <p class="text-smaller text-muted mb-0">Yesterday</p>
                  <span class="text-muted float-right"><i class="fas fa-mail-reply" aria-hidden="true"></i></span>
                </div>
              </a>
            </li>
            <li class="p-2">
              <a href="#" class="d-flex justify-content-between">
                <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-4.jpg" alt="avatar" class="avatar rounded-circle d-flex align-self-center mr-2 z-depth-1">
                <div class="text-small">
                  <strong>Kate Moss</strong>
                  <p class="last-message text-muted">Lorem ipsum dolor sit.</p>
                </div>
                <div class="chat-footer">
                  <p class="text-smaller text-muted mb-0">Yesterday</p>
                  <span class="text-muted float-right"><i class="fas fa-mail-reply" aria-hidden="true"></i></span>
                </div>
              </a>
            </li>
            
           
          </ul>
        </div>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-6 col-xl-8 pl-md-3 px-lg-auto px-0">

        <div class="chat-message">

          <ul class="list-unstyled chat-1 scrollbar-light-blue">
            
            <li class="d-flex justify-content-between mb-4">
              <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-6.jpg" alt="avatar" class="avatar rounded-circle mr-2 ml-lg-3 ml-0 z-depth-1">
              <div class="chat-body white p-3 ml-2 z-depth-1">
                <div class="header">
                  <strong class="primary-font">Brad Pitt</strong>
                  <small class="pull-right text-muted"><i class="far fa-clock"></i> 12 mins ago</small>
                </div>
                <hr class="w-100">
                <p class="mb-0">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                  labore et dolore magna aliqua.
                </p>
              </div>
            </li>
            <li class="d-flex justify-content-between mb-4">
              <div class="chat-body white p-3 z-depth-1">
                <div class="header">
                  <strong class="primary-font">Lara Croft</strong>
                  <small class="pull-right text-muted"><i class="far fa-clock"></i> 13 mins ago</small>
                </div>
                <hr class="w-100">
                <p class="mb-0">
                  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                  laudantium.
                </p>
              </div>
              <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg" alt="avatar" class="avatar rounded-circle mr-0 ml-3 z-depth-1">
            </li>
            <li class="d-flex justify-content-between mb-4 pb-3">
              <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-6.jpg" alt="avatar" class="avatar rounded-circle mr-2 ml-lg-3 ml-0 z-depth-1">
              <div class="chat-body white p-3 ml-2 z-depth-1">
                <div class="header">
                  <strong class="primary-font">Brad Pitt</strong>
                  <small class="pull-right text-muted"><i class="far fa-clock"></i> 12 mins ago</small>
                </div>
                <hr class="w-100">
                <p class="mb-0">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                  labore et dolore magna aliqua.
                </p>
              </div>
            </li>
          </ul>
          <div class="white">
            <div class="form-group basic-textarea">
              <textarea class="form-control pl-2 my-0" id="exampleFormControlTextarea2" rows="3" placeholder="Type your message here..."></textarea>
            </div>
          </div>
          <button type="button" class="btn btn-outline-pink btn-rounded btn-sm waves-effect waves-dark float-right">Send</button>

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
    
  </body>
</html>




