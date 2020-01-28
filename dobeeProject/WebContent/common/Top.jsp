<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/common/HeadTag.jsp"/>
<link rel="stylesheet" href="assets/vendor/pnotify/pnotify.custom.css" />
<header class="header">
				<div class="logo-container">
					<a href="#" class="logo">
						<img src="./img/beemain2.png" height="44" alt="로고" />
					</a>
					<div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
						<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
					</div>
				</div>
			
				<!-- start: search & user box -->
				<div class="header-right">
			
					<span class="separator"></span>
					<ul class="notifications">
						<li>
							<a href="#" class="dropdown-toggle notification-icon" data-toggle="dropdown">
								<i class="fa fa-tasks"></i>
								<span class="badge">3</span>
							</a>
			
							<div class="dropdown-menu notification-menu large">
								<div class="notification-title">
									<span class="pull-right label label-default">3</span>
									Tasks
								</div>
			
								<div class="content">
									<ul>
										<li>
											<p class="clearfix mb-xs">
												<span class="message pull-left">Generating Sales Report</span>
												<span class="message pull-right text-dark">60%</span>
											</p>
											<div class="progress progress-xs light">
												<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
											</div>
										</li>
			
										<li>
											<p class="clearfix mb-xs">
												<span class="message pull-left">Importing Contacts</span>
												<span class="message pull-right text-dark">98%</span>
											</p>
											<div class="progress progress-xs light">
												<div class="progress-bar" role="progressbar" aria-valuenow="98" aria-valuemin="0" aria-valuemax="100" style="width: 98%;"></div>
											</div>
										</li>
			
										<li>
											<p class="clearfix mb-xs">
												<span class="message pull-left">Uploading something big</span>
												<span class="message pull-right text-dark">33%</span>
											</p>
											<div class="progress progress-xs light mb-xs">
												<div class="progress-bar" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100" style="width: 33%;"></div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</li>
						<li>
							<a href="#" class="dropdown-toggle notification-icon" data-toggle="dropdown">
								<i class="fa fa-envelope"></i>
								<span class="badge">4</span>
							</a>
			
							<div class="dropdown-menu notification-menu">
								<div class="notification-title">
									<span class="pull-right label label-default">230</span>
									Messages
								</div>
			
								<div class="content">
									<ul>
										<li>
											<a href="#" class="clearfix">
												<figure class="image">
													<img src="assets/images/!sample-user.jpg" alt="Joseph Doe Junior" class="img-circle" />
												</figure>
												<span class="title">Joseph Doe</span>
												<span class="message">Lorem ipsum dolor sit.</span>
											</a>
										</li>
										<li>
											<a href="#" class="clearfix">
												<figure class="image">
													<img src="assets/images/!sample-user.jpg" alt="Joseph Junior" class="img-circle" />
												</figure>
												<span class="title">Joseph Junior</span>
												<span class="message truncate">Truncated message. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet lacinia orci. Proin vestibulum eget risus non luctus. Nunc cursus lacinia lacinia. Nulla molestie malesuada est ac tincidunt. Quisque eget convallis diam, nec venenatis risus. Vestibulum blandit faucibus est et malesuada. Sed interdum cursus dui nec venenatis. Pellentesque non nisi lobortis, rutrum eros ut, convallis nisi. Sed tellus turpis, dignissim sit amet tristique quis, pretium id est. Sed aliquam diam diam, sit amet faucibus tellus ultricies eu. Aliquam lacinia nibh a metus bibendum, eu commodo eros commodo. Sed commodo molestie elit, a molestie lacus porttitor id. Donec facilisis varius sapien, ac fringilla velit porttitor et. Nam tincidunt gravida dui, sed pharetra odio pharetra nec. Duis consectetur venenatis pharetra. Vestibulum egestas nisi quis elementum elementum.</span>
											</a>
										</li>
										<li>
											<a href="#" class="clearfix">
												<figure class="image">
													<img src="assets/images/!sample-user.jpg" alt="Joe Junior" class="img-circle" />
												</figure>
												<span class="title">Joe Junior</span>
												<span class="message">Lorem ipsum dolor sit.</span>
											</a>
										</li>
										<li>
											<a href="#" class="clearfix">
												<figure class="image">
													<img src="assets/images/!sample-user.jpg" alt="Joseph Junior" class="img-circle" />
												</figure>
												<span class="title">Joseph Junior</span>
												<span class="message">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet lacinia orci. Proin vestibulum eget risus non luctus. Nunc cursus lacinia lacinia. Nulla molestie malesuada est ac tincidunt. Quisque eget convallis diam.</span>
											</a>
										</li>
									</ul>
			
									<hr />
			
									<div class="text-right">
										<a href="#" class="view-more">View All</a>
									</div>
								</div>
							</div>
						</li>
						<li>
							<a href="#" class="dropdown-toggle notification-icon" data-toggle="dropdown">
								<i class="fa fa-bell"></i>
								<span class="badge">3</span>
							</a>
			
							<div class="dropdown-menu notification-menu">
								<div class="notification-title">
									<span class="pull-right label label-default">3</span>
									Alerts
								</div>
			
								<div class="content">
									<ul>
										<li>
											<a href="#" class="clearfix">
												<div class="image">
													<i class="fa fa-thumbs-down bg-danger"></i>
												</div>
												<span class="title">Server is Down!</span>
												<span class="message">Just now</span>
											</a>
										</li>
										<li>
											<a href="#" class="clearfix">
												<div class="image">
													<i class="fa fa-lock bg-warning"></i>
												</div>
												<span class="title">User Locked</span>
												<span class="message">15 minutes ago</span>
											</a>
										</li>
										<li>
											<a href="#" class="clearfix">
												<div class="image">
													<i class="fa fa-signal bg-success"></i>
												</div>
												<span class="title">Connection Restaured</span>
												<span class="message">10/10/2014</span>
											</a>
										</li>
									</ul>
			
									<hr />
			
									<div class="text-right">
										<a href="#" class="view-more">View All</a>
									</div>
								</div>
							</div>
						</li>
					</ul>
			
					<span class="separator"></span>
					<div id="userbox" class="userbox">
						<a href="#" data-toggle="dropdown">
							<figure class="profile-picture">
								<img src="assets/images/!logged-user.jpg" alt="Joseph Doe" class="img-circle" data-lock-picture="assets/images/!logged-user.jpg" />
							</figure>
							<div class="profile-info" data-lock-name="John Doe" data-lock-email="johndoe@JSOFT.com">
								<span class="name" id="name">${user.name}</span>
								<span class="role" id="mail">${user.mail}</span>
							</div>
			
							<i class="fa custom-caret"></i>
						</a>
			
						<div class="dropdown-menu">
							<ul class="list-unstyled">
								<li class="divider"></li>
								<li>
									<c:set var="isWork" value="${sessionScope.user.isWork }"/>
									<c:choose>
										<c:when test="${isWork != null }">
											<a role="menuitem" tabindex="-1" href="#" onclick="leave();"><i class="fa fa-power-off"></i>퇴근</a>
										</c:when>
										<c:otherwise>
											<a role="menuitem" tabindex="-1" href="#" onclick="attend();"><i class="fa fa-power-off"></i>출근</a>
										</c:otherwise>
									</c:choose>
								</li>
								<li>
									<a role="menuitem" tabindex="-1" href="mypage.do?mail=${user.mail}"><i class="fa fa-user"></i>마이페이지</a>
								</li>
								<li>
									<a role="menuitem" tabindex="-1" href="#" onclick="document.getElementById('logout-form').submit();"><i class="fa fa-sign-out"></i>로그아웃</a>
									<form id="logout-form" action='<c:url value='/logout'/>' method="POST">
   										<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
									</form>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- end: search & user box -->
			</header>
			
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="assets/vendor/pnotify/pnotify.custom.js"></script>
<script>

	window.onload = function(){
		connect();
	}

	/* 알람 */
	var wsocket;
	
	function getContextPath() {//contextPath 구하는 함수
		  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		  return location.href.substring(6, location.href.indexOf('/', hostIndex + 1) );
		};
		

	function connect(){
		var contextPath = getContextPath();
		wsocket = new WebSocket("ws:"+contextPath+"/alram.do");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	
	function disconnect() {
		wsocket.close();
	}
	
	function onOpen(evt) {
		send();
	}
	
	function onMessage(evt) {
		var data = evt.data;
		showAlarm(data);
	}
	
	function onClose(evt) {
	}
	

	function showAlarm(data) {
		  var notice = new PNotify({
		    title: '알림',
		    text: data,
		    type: 'success',
		    addclass: 'click-2-close notification-primary',
		    icon: 'fa fa-bell-o',
		    hide: false,
		    buttons: {
		      closer: false,
		      sticker: false
		    }
		  });

		  notice.get().click(function() {
		    notice.remove();
		  });
		}
	/* /알람  */
	
	//출근하기
	function attend() {
		swal({
			   title: "출근",
			   text: "출근 하시겠습니까?",
			   icon: "info" //"info,success,warning,error" 중 택1
			}).then((YES) => {
				console.log('이거 타??');
				var mail = $("#mail").text();
				console.log('메일은??'+mail);
				$.ajax({
		 			url:"attend.do?mail="+mail,
					dataType: "text",
					contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
					type:"post",
					success:function(responsedata){
						console.log('ajax 됨??');
						console.log(responsedata);
						if(responsedata == "success"){
							swal({
								   title: "출근",
								   text: "출근 처리 되었습니다.",
								   icon: "success" //"info,success,warning,error" 중 택1
								}).then((YES) => {
									location.reload(true); 
								});
							}
						
					},
					error:function(){
						
					}
				});

				
				});
		
		}


	//퇴근하기
	function leave() {
		swal({
			   title: "퇴근",
			   text: "퇴근 하시겠습니까?",
			   icon: "warning" //"info,success,warning,error" 중 택1
			}).then((YES) => {
				console.log('이거 타??');
				var attSeq = ${user.isWork}
				console.log('seq??'+attSeq);
				$.ajax({
		 			url:"leave.do?attSeq="+attSeq,
					dataType: "text",
					contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
					type:"post",
					success:function(responsedata){
						console.log('ajax 됨??');
						console.log(responsedata);
						if(responsedata == "success"){
							swal({
								   title: "퇴근",
								   text: "퇴근 처리 되었습니다.",
								   icon: "success" //"info,success,warning,error" 중 택1
								}).then((YES) => {
									location.reload(true); 
								});
							}
						
					},
					error:function(){
						
					}
				});

				
				});
		
		}
</script>