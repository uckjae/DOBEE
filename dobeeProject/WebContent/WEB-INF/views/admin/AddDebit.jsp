<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="/common/tag.jsp" />
	
</head>
<body>
	<!-- Side Navbar -->
    <nav class="side-navbar">
    <c:import url="/common/Left_Admin.jsp" />
    </nav>

    <div class="page">
      <!-- navbar-->
      <c:import url="/common/top.jsp"/>
      
      <div id="content-wrapper">
            <!-- !! Content !! -->
            <div class="container-fluid">
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-user-edit"></i>
                 
                        <b>법인카드 등록</b>
               
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
                                                   				<!-- 나중에 카드사진까지 등록할거면 이 부분 활성해서 수정해서 써야함 -->
                                                        		<!-- <div class="form-label-group">
                                                            		
                                                            		<input type="file" id="myPic" name="myPic" class="form-control" accept="image/*" hidden="true">
                                                            		<label for="myPic"><img id="viewPhoto" name="viewPhoto" src="img/avatar.jpg" alt="프로필사진"  style="width:13em; height:100%;"></label>
                                                        		</div> -->
                                                        		<div class="form-label-group">
                                                        			<input type="text" id="cardNum" name="cardNum" class="form-control" autofocus="autofocus">
                                                            		<label for="name">카드번호</label>
                                                            		<br>
                                                            		<br>
                                                            		<input type="text" id="corp" name="corp" class="form-control">
                                                            		<label for="name">카드사</label>
                                                            		<br>
                                                            	</div>
                                                    		</div>
                                                    		<div class="col-md-6">
                                                        		<div class="form-label-group">
                                                            		<input type="text" id="name" name="name" class="form-control">
                                                            		<label for="name">명의자이름</label>
                                                            		<br>
                                                            		<br>
                                                            		<input type="text" id="nickName" name="nickName" class="form-control">
                                                            		<label for="name">카드별칭</label>
                                                            		<br>
                                                            
                                                        		</div>
                                                    		</div>
                                                		</div>
                                            		</div>
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                            <input type="date" id="valDate" name="valDate" class="form-control" placeholder="유효기간 ( ex)2020-02-02~2030-02-02 )"  >
                                                            <label for="position">유효기간</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-label-group">
                                                           	<select id="entry" name="entry" class="form-control" placeholder="팀이름" >
                                                           		<option hidden>선택하세요</option>
                                                           	</select>
                                                            <label for="teamCode">카드구분</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                            
                                            
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
            	
      </div>
      
    </div>
</body>
</html>