<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<aside id="sidebar-left" class="sidebar-left">
	<div class="sidebar-header">
		<!-- <div class="sidebar-title">Navigation</div> -->
		<div class="sidebar-toggle hidden-xs"
			data-toggle-class="sidebar-left-collapsed" data-target="html"
			data-fire-event="sidebar-left-toggle">
			<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
		</div>
	</div>
	<div class="nano">
		<div class="nano-content">
			<nav id="menu" class="nav-main" role="navigation">
				<ul class="nav nav-main">
					<li class="nav-active">
						<a href="main.do"><i class="fa fa-home" aria-hidden="true"></i><span>메인</span></a>
					</li>
					<li>
						<a href="noticeList.do">
						<span class="pull-right label label-primary">182</span> 
						<i class="fa fa-clipboard" aria-hidden="true"></i><span>공지사항</span></a>
					</li>
					
					<li class="nav-parent">
						<a><i class="fa fa-briefcase" aria-hidden="true"></i><span>근무</span></a>
						<ul class="nav nav-children">
							<li><a href="breakApply.do">부재 일정 신청</a></li>
							<li><a href="extendApply.do">연장 근무 신청</a></li>
							<li><a href="breakManage.do">부재 일정 관리</a></li>
							<li><a href="workManage.do">근무 내역 확인</a></li>
							
							<c:choose>
								<c:when test="${user.authCode == 3 }">
									<li><a href="absManage.do">부재 신청 관리</a></li>
									<li><a href="extManage.do">연장 근무 신청 관리</a></li>
								</c:when>
							</c:choose>
							
						</ul>
					</li>
					<li class="nav-parent">
						<a><i class="fa fa-credit-card" aria-hidden="true"></i><span>비용</span></a>
						<ul class="nav nav-children">
							<li><a href="receiptRegit.do">정산신청</a></li>
							<li><a href="receiptList.do">비용현황</a></li>
							<li><a href="paymentChart.do">비용차트</a></li>
						</ul>
					</li>
					<li>
						<a href="pjtMain.do?mail=${user.mail}"><i class="fa fa-tasks" aria-hidden="true"></i><span>프로젝트</span></a>
					</li>
					<li>
						<a href="chat.do">
						<i class="fa fa-comments" aria-hidden="true"></i><span>채팅</span></a>
					</li>
				</ul>
			</nav>

			<hr class="separator" />

			<div class="sidebar-widget widget-tasks">
				<div class="widget-header">
					<h6>Projects</h6>
					<div class="widget-toggle">+</div>
				</div>
				<div class="widget-content">
					<ul class="list-unstyled m-none">
						<c:forEach items="${requestScope.pjtList}" var="pjtList" varStatus="status">
							<li><a href="pjtKanban.do?pjtSeq=${pjtList.pjtSeq}">${pjtList.pjtName}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>

	</div>

</aside>