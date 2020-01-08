<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
                  <ul aria-labelledby="notifications" class="dropdown-menu">
                    <li><a rel="nofollow" href="#" style="text-align:center"> 
                        <span class="d-none d-sm-inline-block" style="color:#888888;">출근/퇴근</span>
                    <li><a rel="nofollow" href="#"> 
                        <span class="d-none d-sm-inline-block" style="color:#888888;">ì¶ê·¼/í´ê·¼</span>
                        <i class="fas fa-power-off" style="color:#888888;"></i></a>
                        </li>
                    </li>
                    <hr>
                    <li><a rel="nofollow" href="#"> 
                        <span class="d-none d-sm-inline-block" style="color:#888888;">정보 수정</span>
                        <span class="d-none d-sm-inline-block" style="color:#888888;">ë§ì´íì´ì§Â</span>
                        <i class="fas fa-cog" style="color:#888888;"></i></a>
                        </li>
                    </li>
                    <hr>
                    <li><a rel="nofollow" href="#"> 
                         <span class="d-none d-sm-inline-block" style="color:#888888;">로그아웃</span>
                        <span class="d-none d-sm-inline-block" style="color:#888888;">ë¡ê·¸ìì</span>
                        <i class="fa fa-sign-out" style="color:#888888;"></i></a>
                        </li>
                    </li>
                 
                  </ul>
                </li>
               
              </ul>
            </div>
          </div>
        </nav>
</header>