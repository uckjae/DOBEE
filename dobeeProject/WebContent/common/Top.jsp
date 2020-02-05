<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/common/HeadTag.jsp"/>
<link rel="stylesheet" href="assets/vendor/pnotify/pnotify.custom.css" />
<header class="header">
		<div class="logo-container">
			<a href="main.do" class="logo">
				<img src="./img/beemain2.png" height="44" alt="로고" />
			</a>
			<div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
				<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
			</div>
		</div>
		<!-- start: search & user box -->
		<div class="header-right">
			<span class="separator"></span>
			<div id="userbox" class="userbox">
				<a href="#" data-toggle="dropdown">
					<figure class="profile-picture">
					<!-- 등록된 사원 사진 뿌려주기!!! -->
						<img src="upload/${user.myPic}" onError="this.src='img/avatar.jpg'" alt="사원" class="img-circle" />
					</figure>
					<div class="profile-info">
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
		console.log("top onload");
		connect();
	
	/* 알람 */
	var wsocket;
	
	function getContextPath() {//contextPath 구하는 함수
		  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		  return location.href.substring(6, location.href.indexOf('/', hostIndex + 1) );
		};
		

	function connect(){
		console.log("웹소켓 커넥트!!!!!");
		var contextPath = getContextPath();
		wsocket = new WebSocket("ws:"+contextPath+"/alram.do");
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
		wsocket.onerror = onError;
	}
	
	function disconnect() {
		wsocket.close();
	}

	function onError(){
		console.log("웹소켓 에ㅓㄹ");
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
			   icon: "info", //"info,success,warning,error" 중 택1
				buttons : ["Cancle", true]
			}).then((result) => {
				if (result) {
					var mail = $("#mail").text();
					$.ajax({
			 			url:"ajax/attend/attend.do",
			 			data : {'mail' : mail},
						dataType: "text",
						contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
						type:"post",
						success:function(responsedata){
							if(responsedata == "success"){
								swal({
									   title: "출근",
									   text: "출근 처리 되었습니다.",
									   icon: "success"
									}).then((YES) => {
										location.reload(true); 
									});
								}
						},
						error:function(){
							
						}
					});
				}
			});
		}


	//퇴근하기
	function leave() {
		swal({
			   title: "퇴근",
			   text: "퇴근 하시겠습니까?",
			   icon: "warning",
			   buttons : ["Cancle", true]
			}).then((result) => {
				if (result) {
					console.log('이거 타??');
					var attSeq = ${user.isWork}
					console.log('seq??'+attSeq);
					$.ajax({
			 			url:"ajax/attend/leave.do",
			 			data : {'attSeq' : attSeq},
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
								   icon: "success"
								}).then((YES) => {
									location.reload(true); 
								});
							}
						},
						error:function(){
							
						}
					});
				}				
			});
		}
	
</script>