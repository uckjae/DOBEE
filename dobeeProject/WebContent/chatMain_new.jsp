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

											<div class="form-group">
												<div class="row">
													<label class="col-xs-12 control-label" for="zoomLevel">Zoom Level</label>
													<div class="col-xs-12">
														<select id="zoomLevel" class="form-control mb-md" data-plugin-selectTwo data-plugin-options='{ "minimumResultsForSearch": -1 }' data-builder-field="zoomlevel">
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
															<option value="6">6</option>
															<option value="7">7</option>
															<option value="8">8</option>
															<option value="9">9</option>
															<option value="10">10</option>
															<option value="11">11</option>
															<option value="12">12</option>
															<option value="13">13</option>
															<option value="14">14</option>
															<option value="15">15</option>
															<option value="16">16</option>
															<option value="17">17</option>
															<option value="18">18</option>
															<option value="19">19</option>
															<option value="20">20</option>
															<option value="21">21</option>
														</select>
													</div>
												</div>
											</div>

											<hr class="separator" />

											<p class="title">Markers</p>

											<div class="form-group">
												<ul id="MarkersList" class="list-markers list-unstyled mb-lg hidden">
												</ul>

												<div class="row">
													<div class="col-sm-6">
														<button class="btn btn-primary btn-block mb-lg" type="button" data-toggle="modal" data-target="#MarkerModal">Add</button>
													</div>
													<div class="col-sm-6">
														<button id="MarkerRemoveAll" class="btn btn-danger btn-block mb-lg" type="button">Remove All</button>
													</div>
												</div>
											</div>

											<hr class="separator" />

											<p class="title">Settings</p>

											

											<div class="form-group">
												<div class="row">
													<label class="col-xs-12 control-label" for="maptheme">Map Theme</label>
													<div class="col-xs-12">
														<select id="maptheme" class="form-control mb-md" data-plugin-selectTwo data-plugin-options='{ "minimumResultsForSearch": -1 }' data-builder-field="maptheme">
															<option value="false" selected="selected">Default</option>
														</select>
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
							<div class="inner-body">
								<div id="gmap"></div>
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

			<aside id="sidebar-right" class="sidebar-right">
				<div class="nano">
					<div class="nano-content">
						<a href="#" class="mobile-close visible-xs">
							Collapse <i class="fa fa-chevron-right"></i>
						</a>
			
						<div class="sidebar-right-wrapper">
			
							<div class="sidebar-widget widget-calendar">
								<h6>Upcoming Tasks</h6>
								<div data-plugin-datepicker data-plugin-skin="dark" ></div>
			
								<ul>
									<li>
										<time datetime="2014-04-19T00:00+00:00">04/19/2014</time>
										<span>Company Meeting</span>
									</li>
								</ul>
							</div>
			
							<div class="sidebar-widget widget-friends">
								<h6>Friends</h6>
								<ul>
									<li class="status-online">
										<figure class="profile-picture">
											<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
									<li class="status-online">
										<figure class="profile-picture">
											<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
									<li class="status-offline">
										<figure class="profile-picture">
											<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
									<li class="status-offline">
										<figure class="profile-picture">
											<img src="assets/images/!sample-user.jpg" alt="Joseph Doe" class="img-circle">
										</figure>
										<div class="profile-info">
											<span class="name">Joseph Doe Junior</span>
											<span class="title">Hey, how are you?</span>
										</div>
									</li>
								</ul>
							</div>
			
						</div>
					</div>
				</div>
			</aside>
		</section>

		<!-- Vendor -->
		<script src="assets/vendor/jquery/jquery.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- Specific Page Vendor -->
		<script src="assets/vendor/select2/select2.js"></script>
		<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
		<script src="assets/javascripts/maps/snazzy.themes.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>


		<!-- Examples -->
		<script src="assets/javascripts/maps/examples.map.builder.js"></script>
	</body>
</html>