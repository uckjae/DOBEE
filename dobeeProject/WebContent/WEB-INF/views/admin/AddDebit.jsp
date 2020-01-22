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
			<c:import url="/common/Top.jsp"/>
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<c:import url="/common/SideAdmin.jsp"/>
				<!-- end: sidebar -->
				
			<!-- start : main Content -->
				<section role="main" class="content-body">
					<header class="page-header">
						<h2>법인카드 등록</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-credit-card"></i>
									</a>
								</li>
								<li><span>법인카드</span></li>
								<li><span>법인카드 등록</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
					<div class="container-fluid">
		                <div class="card mb-3">
		                    <div class="card-header">
		                        <i class="fas fa-user-edit"></i>
		                    </div>
		                    <div class="card-body">
		                        <div class="table-responsive">
		                            <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
		                                <div class="row">
		                                    <div class="col-sm-12">
		                                        <form action="AdminDebit.do" method="post" >
		                                        	<div class="form-group">
		                                                		<div class="form-row">
		                                                			<div class="col-md-6">
		                                                			<!--form-row 첫번째 컬럼에서만 보안경고문이 뜸 나중에 js,css 확인 필요 -->
		                                                        		<div class="form-label-group">
		                                                        			<label for="name">카드번호</label>
		                                                            		<input type="text" id="cardNum" name="cardNum" placeholder="1234-1234-1234-1234" class="form-control" autofocus="autofocus" autocomplete="off"/>
		                                                            		<br>
		                                                            		<label for="name">카드사</label>
		                                                            		<input type="text" id="corp" name="corp" class="form-control" placeholder="국민은행" autocomplete="off"/>
		                                                            		<br>
		                                                            		
		                                                        		</div>
		                                                    		</div>
		                                                    		
		                                                			<div class="col-md-6">
		                                                        		<div class="form-label-group">
		                                                            		<label for="name">명의자이름</label>
		                                                            		<input type="text" id="name" name="name" class="form-control" autocomplete="off"/>
		                                                            		<br>
		                                                            		<label for="name">카드별칭</label>
		                                                            		<input type="text" id="nickName" name="nickName" class="form-control" autocomplete="off"/>
		                                                            		<br>
		                                                        		</div>
		                                                    		</div>
		                                                    		
		                                                		</div>
		                                            		</div>
		                                            <div class="form-group">
		                                                <div class="form-row">
		                                                    <div class="col-md-6">
		                                                        <div class="form-label-group">
		                                                        	<label for="position">유효기간</label>
		                                                            <input type="date" id="valDate" name="valDate" class="form-control" placeholder="유효기간 ( ex)2020-02-02~2030-02-02 )"  >
		                                                        </div>
		                                                    </div>
		                                                    <div class="col-md-6">
		                                                        <div class="form-label-group">
		                                                            <label for="teamCode">카드구분</label>
		                                                           	<select id="entry" name="entry" class="form-control" placeholder="법인카드구분" >
		                                                           		<option hidden>선택하세요</option>
		                                                           		<option>법인(공용)</option>
																	    <option>법인(개인)</option>
																	    <option>법인(체크)</option>
		                                                           	</select>
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <br>
		                                            <div class="form-row">
		                                           		 <div class="col-md-6">
		                                                    <button type="submit" class="btn btn-primary btn-block" >등록하기</button>
		                                                </div>
		                                                <div class="col-md-6"><!-- 취소하고 뒤로 가기 -->
		                                                    <input type="button" class="btn btn-danger btn-block" value="뒤로가기"
		                                                        		onClick='history.go(-1)'>
		                                                </div>
		                                            </div>
		                                        </form>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
            </div>	
					<!-- start: page -->
					<!-- end: page -->
				</section>
			</div>




			<!-- 오른쪽 사이드바!! -->
		<c:import url="/common/RightSide.jsp"/>
	
			
			<!-- 오른쪽 사이드바 끝!! -->
		</section>

		<c:import url="/common/BottomTag.jsp"/>
	</body>
</html>