<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--font  -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:700&display=swap" rel="stylesheet">
<menu id="content-menu" class="inner-menu" role="menu">
	<div class="nano">
		<div class="nano-content" style="font-family: 'Nanum Gothic', sans-serif;">
			<div class="inner-menu-toggle-inside">
				<i	class="fa fa-chevron-up visible-xs-inline"></i><i
					class="fa fa-chevron-left hidden-xs-inline"></i> Hide Menu
				
			</div>
			<div class="inner-menu-content">
				<button type="button" id="channelModal" data-toggle="modal"
					data-target="#modalBootstrap"
					class="btn btn-block btn-primary btn-md pt-sm pb-sm text-md">
					<i class="fa fa-wechat mr-xs"></i> 새 대화 채널 만들기
				</button>
				<hr class="separator" />

				<div class="sidebar-widget m-none">
					<div class="widget-header">
						<h6 class="title">Channel</h6>
						<span class="widget-toggle">+</span>
					</div>
					<div class="widget-content">
						<ul class="list-unstyled mailbox-bullets">
							<c:set var="roomNameList" value="${requestScope.roomNameList}" />
							<c:forEach var="roomName" items="${roomNameList}">
								<li><a href='chatGroup.do?roomName=${roomName }'
									class="menu-item"><span><i class='fa fa-user'></i></span>${roomName}</a>
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
							<c:forEach var="dmUserList" items="${requestScope.dmUserList}">
								<li><a
									href='chatDm.do?dmName=${dmUserList.name}&dmMail=${dmUserList.mail}'
									class="menu-item" value=${dmUserList.mail }><span><i
											class='fa fa-user'></i></span>${dmUserList.name } (${dmUserList.mail })</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</menu>