<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/common/tag.jsp"/>
    <style type="text/css">
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
	<!-- Side Navbar -->
    <nav class="side-navbar">
    	<c:import url="/common/left.jsp" />
    </nav>
    <div class="page">
    	<!-- 상단 Navbar -->
    	<c:import url="/common/top.jsp"/>
    	<!-- 프로젝트목록표시 -->
    	<div class="row">
    		<!-- 프로젝트 -->
    		<div class="col-xl-2 col-md-2 col-sm-12 col-2 pjt">
    			<h5 class="title">프로젝트이름</h5><br/>
    			<span class="bg-lgiht">진행상황</span><br/>
    			<p>날짜</p>
    		</div>
    		<!-- 프로젝트 -->
    		<div class="col-xl-2 col-md-2 col-sm-12 col-2 pjt">
    			<h5 class="title">프로젝트이름</h5><br/>
    			<span class="bg-lgiht">진행상황</span><br/>
    			<p>날짜</p>
    		</div>
    		<!-- 프로젝트 -->
    		<div class="col-xl-2 col-md-2 col-sm-12 col-2 pjt">
    			<h5 class="title">프로젝트이름</h5><br/>
    			<span class="bg-lgiht">진행상황</span><br/>
    			<p>날짜</p>
    		</div>
    		<!-- 프로젝트 -->
    		<div class="col-xl-2 col-md-2 col-sm-12 col-2 pjt">
    			<h5 class="title">프로젝트 추가</h5><br/>
    			<a data-toggle="modal" href="#addProjectModal"><button class="add">+</button></a>
    		</div>
    	</div>
    </div>
    <!-- Modal  -->
    <div class="modal fade" id="addProjectModal" tabindex="-1" role="dialog" aria-labelledby="addProjectModal" aria-hidden="true" draggable="true">
    <div class="modal-dialog" role="form">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="project">새 프로젝트</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <form id="frm" method = "post">
        <div class="modal-body" id="innerModal">   		
        	<input type="text" name="editFolder" id="inputInnerModal"> 
        </div>
        <div class="modal-footer">
          <input type="submit" class="btn btn-primary" id="modalBtn">
          
       <button id="deletebtn" class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
        </div>
        </form>
      </div>
    </div>
  </div>
	<!-- JavaScript files-->
    <script src="./vendor/jquery/jquery.min.js"></script>
    <script src="./vendor/popper.js/umd/popper.min.js"> </script>
    <script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="./js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="./vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="./vendor/chart.js/Chart.min.js"></script>
    <script src="./vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="./vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="./js/charts-home.js"></script>
    <!-- Main File-->
    <script src="./js/front.js"></script>
    <script src="https://kit.fontawesome.com/5d4e7bbd25.js" crossorigin="anonymous"></script>
</body>
</html>