<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed search-results">
	<head>
		<c:import url="/common/HeadTag.jsp"/>
	</head>
	<body>
		<section class="body">

			<!-- start: header -->
			<c:import url="/common/Top.jsp"/>
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<c:import url="/common/Side.jsp"/>

				<!-- end: sidebar -->

				<section role="main" class="content-body">
					<header class="page-header">
						<h2>프로젝트</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>Pages</span></li>
								<li><span>Search</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
					<div class="search-content">
						<div class="search-toolbar">
							<ul class="list-unstyled nav nav-pills">
								<li class="active">
									<a href="#everything" data-toggle="tab">2019년 4분기</a>
								</li>
								<li>
									<a href="#medias" data-toggle="tab">2020년 1분기</a>
								</li>
							</ul>
						</div>
						<!-- 프로젝트 넣기 -->
						<div class="tab-content">
						<div class="row">
						<c:forEach items="${list}" var="n">
							<div class="col-md-6 col-lg-6 col-xl-3">
								<section class="panel">
									<header class="panel-heading bg-primary">
										<div class="panel-heading-icon">
											<i class="fa fa-globe"></i>
										</div>
									</header>
									<div class="panel-body text-center">
										<h3 class="text-semibold mt-sm text-center">${n.pjtName}</h3>
										<p class="text-center">${n.pjtProgress}</p>
									</div>
								</section>
							</div>
							</c:forEach>
						<div class="col-md-6 col-lg-6 col-xl-3">
								<section class="panel">
									<header class="panel-heading bg-primary">
										<div class="panel-heading-icon">
											<i class="fa fa-globe"></i>
										</div>
									</header>
									<div class="panel-body text-center">
										<h3 class="text-semibold mt-sm text-center">프로젝트 생성</h3>
										<p class="text-center">새로만들기</p>
									</div>
								</section>
							</div>
						</div>
						</div>
					<!-- end: page -->
				</section>
			</div>
			
			<!-- 오른쪽 사이드 시작 -->
			<c:import url="/common/RightSide.jsp"/>
			<!-- 오른쪽 사이드 끝 -->
			
		</section>

	<c:import url="/common/BottomTag.jsp"/>


	</body>
</html>