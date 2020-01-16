<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="/common/tag.jsp"/>

   <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    <!-- jQuery Circle-->
    <link rel="stylesheet" href="css/grasp_mobile_progress_circle-1.0.0.min.css">
    <!-- Custom Scrollbar-->
    <link rel="stylesheet" href="vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">

<script>


$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})

</script>
<style >


.modal-static {
    position: fixed;
    top: 50% !important;
    left: 50% !important;
    margin-top: -100px;
    margin-left: -100px;
    overflow: visible !important;
}

    .modal-static,
    .modal-static .modal-dialog,
    .modal-static .modal-content {
        width: 200px;
        height: 150px;
    }

        .modal-static .modal-dialog,
        .modal-static .modal-content {
            padding: 0 !important;
            margin: 0 !important;
        }

.kanban-col {
    width: 300px;
    margin-right: 20px;
    float: left;
}

.panel-body {
    padding: 15px 0 0 0;
    overflow-y: auto;
}



/*.panel-heading {
    cursor: -moz-grab;
    cursor: -webkit-grab;
    cursor: grab;
}*/

.grab {
    cursor: -moz-grab;
    cursor: -webkit-grab;
}

.grabbing {
    cursor: -moz-grabbing;
    cursor: -webkit-grabbing;
}

.panel-heading {
    cursor: context-menu;
}

    .panel-heading i {
        cursor: pointer;
    }

body {
    -webkit-user-select: none; /* Chrome/Safari */
    -moz-user-select: none; /* Firefox */
    -ms-user-select: none; /* IE10+ */
    /* Rules below not implemented in browsers yet */
    -o-user-select: none;
    user-select: none;
}

body{
	margin-top: 100px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6
}
.container{
	width: 500px;
	margin: 0 auto;
}



ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}

   .pjt{
          border : 2px;
          border-style: groove;
          padding-top : 1em;
          /*padding-left : 5em; */
          margin-top : 1em;
          margin-left : auto;
          margin-right: auto;
       }
       .pjt .title{
          text-align: center;
       }
       .pjt .add{
          /* margin-left: 3em; */
          width: 4%;
          margin-left: 48%;
          margin-right: 48%;
          border: none;
          background-color: #d3d3d3;
          padding: auto;
          cursor: pointer;
       }
       .pjt .add:hover{
          background-color: #acacac;
       }

</style>


</head>


<body>
    <!-- notice DataTables js-->
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"type="text/javascript">
	</script>

	<script>
  

     </script>

<!-- Side Navbar -->
    <nav class="side-navbar">
      <c:import url="/common/left.jsp"/>
    </nav>
    
    <div class="page" >
      <!-- navbar-->
      <c:import url="/common/top.jsp"/>
      
      <script> /*view 객체 생성*/
		window.onload = function(){
			var app = new Vue ({
				el : '#navbar',
				data : []
			})
		}		
  	</script>
  	
  	<div id="navbar">
	  <b-card title="Card Title" no-body>
	    <b-card-header header-tag="nav">
	      <b-nav card-header pills>
	        <b-nav-item active> 프로젝트 1 </b-nav-item>
	        <b-nav-item ><a href="#"> 업무 </a></b-nav-item>
	        <b-nav-item><a href="#"> 캘린더 </a></b-nav-item>
	        <b-nav-item><a href="#"> 분석 </a></b-nav-item>
	        
	        </b-nav>
	    </b-card-header>
  	   
</b-card>
</div>


<div class="col-lg-6" style="float: left">


  <div class="container">
          <div class="row">
             <!-- 프로젝트 -->
             <div class="col-lg-12 pjt">
                <h5 class="title">프로젝트이름</h5><br/>
                <span class="bg-lgiht">진행상황</span><br/>
                <p>날짜</p>
             </div>
             
             <!-- 프로젝트 -->
              <div class="col-lg-12 pjt">
                <h5 class="title">프로젝트이름</h5><br/>
                <span class="bg-lgiht">진행상황</span><br/>
                <p>날짜</p>
             </div>
            
</div>
</div>
</div>


</div> 


 <div class="col-lg-6" style="float:right">
              <div class="card bar-chart-example">
                <div class="card-header d-flex align-items-center">
                  <h4>프로젝트 업무 현황 </h4>
                </div>
                <div class="card-body">
                  <canvas id="barChartExample"></canvas>
                </div>
              </div>
            </div>

    <!-- Static Modal -->
    <div class="modal modal-static fade" id="processing-modal" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="text-center">
                        <i class="fa fa-refresh fa-5x fa-spin"></i>
                        <h4>Processing...</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
  	   
  	   
  	   
	<c:import url="/common/bottom.jsp"/>
	
  <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/charts-custom.js"></script>
    <!-- Main File-->
    <script src="js/front.js"></script>

</body>
</html>
