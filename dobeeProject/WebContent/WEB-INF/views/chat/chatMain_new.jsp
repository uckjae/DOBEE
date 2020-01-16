<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed sidebar-left-collapsed">
<head>
	<c:import url="/common/HeadTag.jsp"/>
</head>
<body>
	<section class="body">
	<!-- start: header -->
	<c:import url="./common/Top.jsp"/>
	<!-- end: header -->
			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<c:import url="./common/Side.jsp"/>
				<!-- end: sidebar -->

				<section role="main" class="content-body">
					<header class="page-header">
						<h2>Map Builder</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>Maps</span></li>
								<li><span>Builder</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>

					<!-- start: page -->
					<section class="content-with-menu" data-theme-gmap-builder>
						<div class="content-with-menu-container">

							<div class="inner-menu-toggle">
								<a href="#" class="inner-menu-expand" data-open="inner-menu">
									Show Options <i class="fa fa-chevron-right"></i>
								</a>
							</div>

							<menu id="content-menu" class="inner-menu" role="menu">
								<div class="nano">
									<div class="nano-content">

										<div class="inner-menu-toggle-inside">
											<a href="#" class="inner-menu-collapse">
												<i class="fa fa-chevron-up visible-xs-inline"></i><i class="fa fa-chevron-left hidden-xs-inline"></i> Hide Options
											</a>
											<a href="#" class="inner-menu-expand" data-open="inner-menu">
												Show Options <i class="fa fa-chevron-down"></i>
											</a>
										</div>

										<div class="inner-menu-content">

											<p class="title">Configuration</p>

											<div class="form-group">
												<div class="row">
													<label class="col-xs-12 control-label" for="longitude">Map #ID</label>
													<div class="col-xs-12">
														<input id="mapid" name="mapid" class="form-control" value="map" type="text" data-builder-field="mapid">
													</div>
												</div>
											</div>

											<hr class="separator" />

											<p class="title">Map Center</p>

											<div class="form-group">
												<div class="row">
													<label class="col-xs-12 control-label" for="latitude">Latitude</label>
													<div class="col-xs-12">
														<input id="latitude" name="latitude" class="form-control" type="text" data-builder-field="latlng">
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="row">
													<label class="col-xs-12 control-label" for="longitude">Longitude</label>
													<div class="col-xs-12">
														<input id="longitude" name="longitude" class="form-control" type="text" data-builder-field="latlng">
													</div>
												</div>
											</div>

											<hr class="separator" />
											<div class="form-group">
												<div class="row">
													<div class="col-sm-6">
														<button class="btn btn-primary btn-block mb-lg" type="button" data-toggle="modal" data-target="#ModalGetCode">Get Code</button>
													</div>
													<div class="col-sm-6">
														<button class="btn btn-primary btn-block mb-lg" type="button" data-toggle="modal" data-target="#ModalPreview">Preview</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</menu>
							
							<!-- 원래 구글맵 있던 자리!! -->
							<div class="inner-body">
						
							</div>
							
							
					</section>

					<div id="MarkerModal" class="marker-modal modal fade" tabindex="-1" role="dialog" aria-labelledby="MarkerModal" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title">Choose Marker Location</h4>
								</div>
								<form>
									<div class="modal-body">
										<div class="form-group">
											<label for="MarkerLocation">Address or Latitude and Longitude</label>
											<input id="MarkerLocation" name="location" type="text" class="form-control">
										</div>
										<div class="form-group">
											<label for="MarkerTitle">Title</label>
											<input id="MarkerTitle" name="title" type="text" class="form-control">
										</div>
										<div class="form-group">
											<label for="MarkerDescription">Description</label>
											<textarea id="MarkerDescription" name="description" type="text" rows="3" class="form-control"></textarea>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										<button id="MarkerSave" type="submit" class="btn btn-primary">Save</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<div id="ModalPreview" class="preview-modal modal fade" tabindex="-1" role="dialog" aria-labelledby="ModalPreview" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title">Map Preview</h4>
								</div>
								<div class="modal-body">
									<iframe src="" style="border: none; width: 100%; height: 70vh;"></iframe>
								</div>
							</div>
						</div>
					</div>

					<div id="ModalGetCode" class="preview-modal modal fade" tabindex="-1" role="dialog" aria-labelledby="ModalGetCode" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title">Generated Code</h4>
								</div>
								<div class="modal-body">
									<pre></pre>
								</div>
							</div>
						</div>
					</div>

					<!-- end: page -->
				</section>
			</div>

		<c:import url="./common/RightSide.jsp"/>
			
			
		</section>

		<c:import url="/common/BottomTag.jsp"/>

	</body>
</html>