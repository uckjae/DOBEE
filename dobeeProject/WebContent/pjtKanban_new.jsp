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
							<div class="col-md-6 col-lg-6 col-xl-3">
								<section class="panel">
									<header class="panel-heading bg-white">
										<div class="panel-heading-icon bg-primary mt-sm">
											<i class="fa fa-rocket"></i>
										</div>
									</header>
									<div class="panel-body">
										<h3 class="text-semibold mt-none text-center">Simple Block Title</h3>
										<p class="text-center">Nullam quiris risus eget urna mollis ornare vel eu leo. Soccis natoque penatibus et magnis dis parturient montes. Soccis natoque penatibus et magnis dis parturient montes.</p>
									</div>
								</section>
							</div>
							<div class="col-md-6 col-lg-6 col-xl-3">
								<section class="panel">
									<header class="panel-heading bg-primary">
										<div class="panel-heading-icon">
											<i class="fa fa-globe"></i>
										</div>
									</header>
									<div class="panel-body text-center">
										<h3 class="text-semibold mt-sm text-center">Simple Block Title</h3>
										<p class="text-center">Nullam quiris risus eget urna mollis ornare vel eu leo. Soccis natoque penatibus et magnis dis parturient montes. Soccis natoque penatibus et magnis dis parturient montes.</p>
									</div>
								</section>
							</div>
							<div class="col-md-12 col-lg-12 col-xl-6">
								<section class="panel panel-horizontal">
									<header class="panel-heading bg-white">
										<div class="panel-heading-icon bg-primary mt-sm">
											<i class="fa fa-music"></i>
										</div>
									</header>
									<div class="panel-body p-lg">
										<h3 class="text-semibold mt-sm">Simple Block Title</h3>
										<p>Nullam quiris risus eget urna mollis ornare vel eu leo. Soccis natoque penatibus et magnis dis parturient montes.</p>
									</div>
								</section>
								<section class="panel panel-horizontal">
									<header class="panel-heading bg-primary">
										<div class="panel-heading-icon">
											<i class="fa fa-music"></i>
										</div>
									</header>
									<div class="panel-body p-lg">
										<h3 class="text-semibold mt-sm">Simple Block Title</h3>
										<p>Nullam quiris risus eget urna mollis ornare vel eu leo. Soccis natoque penatibus et magnis dis parturient montes.</p>
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