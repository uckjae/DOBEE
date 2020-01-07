<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>
   <c:import url="/common/tag.jsp"/>
   <c:import url="/common/HeadTag.jsp" />
   <jsp:include page="/common/DataTableTag.jsp"></jsp:include>
   
   <script type="text/javascript">
   </script>
  </head>
  
  
  <body>

<!-- Side Navbar -->
    <nav class="side-navbar">
      <c:import url="/common/left.jsp" />
    </nav>
    
    <div class="page">
      <!-- navbar-->
      <c:import url="/common/top.jsp"/>
      
      	<!-- 테이블 go -->
	<div class="content">
		<div class="comment-form-wrap pt-xl-2">
			<h1 class="text-center mb-3 bread">공지사항</h1>
			<div class="table-responsive">
						<table class="table table-bordered" id="dataTable">
							<thead>
								<tr>
									<th width="10%">No</th>
									<th width="60%">제목</th>
									<th width="20%">작성일</th>
									<th width="10%">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="boardList" items="${noticeList}">
									<tr >
										<td width="10%" style="text-align: center !important;">${boardList.bIdx}</td>
										<td width="60%" class="sorting_1" >
											<a href="NoticeBoardDetail.do?bIdx=${boardList.bIdx}">${boardList.title}</a></td>
										<td width="20%" style="text-align: center !important;">
											<fmt:formatDate value="${boardList.wDate}" pattern="yyyy-MM-dd HH:mm:ss" />
										</td>
										<td width="10%" style="text-align: center !important;">${boardList.rNum}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
			</div>
		</div>
	</div>
      
      
    </div>
    
    <c:import url="/common/bottom.jsp"/>
    
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
