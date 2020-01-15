<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<head>


<style>
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
  vertical-align:middle;
}

/* Hide default HTML checkbox */
.switch input {display:none;}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}

p {
	margin:0px;
	display:inline-block;
	font-size:15px;
	font-weight:bold;
}

</style>

<header class="header">
        <nav class="navbar">
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
              <div class="navbar-header"><a id="toggle-btn" href="#" class="menu-btn"><i class="fas fa-bars" style="margin-top:10px;"> </i></a><a href="#" class="navbar-brand">
                  <div class="brand-text d-none d-md-inline-block"><strong class="text-primary">DoBee</strong></div></a></div>
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Notifications dropdown-->
                <li class="nav-item dropdown"> <a id="notifications" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-bell fa-2x" style="color:#888888;"></i><span class="badge badge-warning">12</span></a>
                  <ul aria-labelledby="notifications" class="dropdown-menu">
                    <li><a rel="nofollow" href="#" class="dropdown-item"> 
                        <div class="notification d-flex justify-content-between">
                          <div class="notification-content"><i class="fa fa-envelope"></i>You have 6 new messages </div>
                          <div class="notification-time"><small>4 minutes ago</small></div>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item"> 
                        <div class="notification d-flex justify-content-between">
                          <div class="notification-content"><i class="fa fa-twitter"></i>You have 2 followers</div>
                          <div class="notification-time"><small>4 minutes ago</small></div>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item"> 
                        <div class="notification d-flex justify-content-between">
                          <div class="notification-content"><i class="fa fa-upload"></i>Server Rebooted</div>
                          <div class="notification-time"><small>4 minutes ago</small></div>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item"> 
                        <div class="notification d-flex justify-content-between">
                          <div class="notification-content"><i class="fa fa-twitter"></i>You have 2 followers</div>
                          <div class="notification-time"><small>10 minutes ago</small></div>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item all-notifications text-center"> <strong> <i class="fa fa-bell"></i>view all notifications</strong></a></li>
                  </ul>
                </li>
                
                <!-- Messages dropdown-->
                <li class="nav-item dropdown"> <a id="notifications" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fas fa-user fa-2x" style="color:#888888;"></i></a>
                  <ul aria-labelledby="notifications" class="dropdown-menu" style="text-align:center">
                    <li><a rel="nofollow" href="#" > 
                        <span class="d-none d-sm-inline-block" style="color:#888888; ">출근/퇴근</span>
                        <i class="fas fa-power-off" style="color:#888888;"></i></a>
                        </li>
                        
                        <label class="switch">
 						 <input type="checkbox" id="one">
 						 <span class="slider round"></span>
						</label>
							<p>OFF</p>
							<p style="display:none">ON</p>


                    </li>
                    <hr>
                    <li><a rel="nofollow" href="#" > 
                        <span class="d-none d-sm-inline-block" style="color:#888888;">정보 수정</span>
                        <i class="fas fa-cog" style="color:#888888;"></i></a>
                        </li>
                    </li>
                    <hr>
                    <li><a rel="nofollow" href="#" onclick="document.getElementById('logout-form').submit();">
                         <span class="d-none d-sm-inline-block" style="color:#888888;">로그아웃</span>
                        <i class="fa fa-sign-out" style="color:#888888;"></i></a>
                        <form id="logout-form" action='<c:url value='/logout'/>' method="POST">
   							<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
						</form>
                        </li>
                    </li>
                 
                  </ul>
                </li>
               
              </ul>
            </div>
          </div>
        </nav>
</header>
<script>
var check = $("#one");
check.click(function(){
	$("p").toggle();
});

</script>

</head>
