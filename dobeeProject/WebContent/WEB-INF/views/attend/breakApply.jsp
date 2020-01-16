<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed">
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
				
			<!-- start : main Content -->
				<section role="main" class="content-body">
					<header class="page-header">
						<h2>Blank Page</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span>Pages</span></li>
								<li><span>Blank Page</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
					<!-- 작업 여기부터~!~!~!~~! -->
					<div id="navbar">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active"
								href="breakApply.do">부재일정 신청</a></li>
							<li class="nav-item"><a class="nav-link" href="extendApply.do">연장근무
									신청</a></li>
							<li class="nav-item"><a class="nav-link" href="breakManage.do">부재
									일정 관리</a></li>
							<li class="nav-item"><a class="nav-link" href="workManage.do">근무
									내역 확인</a></li>
						</ul>
					</div>
					
					<br>
					<h1>부재 신청</h1>
					<br>
					
					
					<form action="breakApply.do" method="post">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-5">
								<div class="calendarArea" style="width: 100%">
									<div id="loading">loading...</div>
									<div id="calendar"></div>
								</div>
							</div>
							<div class="col-md-5">
			
			
								- 시작시간 :
								<input type='text' class="form-control" id='datetimepickerStart' name="startAt"/>
								<!-- <input type="text" name="startAt" value="20200202"><br> -->
								- 종료시간 :
								<input type='text' class="form-control" id='datetimepickerEnd' name="endAt"/>
								<!-- <input type="text" name="endAt" value="20200203"><br> -->
			
								<input type="hidden" name="drafter" value="${sessionScope.user.mail }"><br>
								- 결재자 :	
								<br>
								<select name="approval" id="approvalList" style="width: 60%;">
									<option hidden="">== 결재자 선택 ==</option>
									<!-- Ajax -->
								</select><br>
								- 부재항목코드 :
								<br>
								<select name="apyCode" id="apycodelist" style="width: 60%;">
									<option hidden="">== 항목 선택 ==</option>
									<!-- Ajax -->
								</select><br>
								
								- 사유 : <br>
								<textarea name="reason" placeholder="연장근무 사유를 입력해주세요." style="width:100%; height: 100px;"></textarea>
								<br>
								<br>
								<input type="submit" value="확인 값 넘김"> &nbsp;&nbsp;
								<input type="reset" value="리셋하시오~">
							</div>
							<div class="col-md-1"></div>
			
							
						</div>
					</form>
					
					<!-- start: page -->
					<!-- end: page -->
				</section>
			</div>

					<!-- start: page -->
					<!-- end: page -->
				</section>
			</div>




			<!-- 오른쪽 사이드바!! -->
		<c:import url="./common/RightSide.jsp"/>
	
			
			<!-- 오른쪽 사이드바 끝!! -->
		</section>

		<c:import url="/common/BottomTag.jsp"/>
	</body>
</html>