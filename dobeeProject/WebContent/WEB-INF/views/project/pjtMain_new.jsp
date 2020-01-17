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
						
						<!-- 프로젝트 리스트 -->
						<div class="tab-content">
						<div class="row">
						<c:forEach items="${list}" var="n">
							<div class="col-md-6 col-lg-6 col-xl-3">
								<a href="pjtKanban.do?pjtSeq=${n.pjtSeq}" style="text-decoration:none;color:#777">
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
									</a>
								</div>
							</c:forEach>
						<!-- 프로젝트 만들기 -->
						<div class="col-md-6 col-lg-6 col-xl-3">
							<a data-toggle="modal" href="#pjtModal" style="text-decoration:none;color:#777">
								<section class="panel">
									<header class="panel-heading bg-secondary">
										<div class="panel-heading-icon">
											<i class="fa fa-globe"></i>
										</div>
									</header>
									<div class="panel-body text-center">
										<h3 class="text-semibold mt-sm text-center">프로젝트 생성</h3>
										<p class="text-center">새로만들기</p>
									</div>
								</section>
							</a>
						</div>
						</div>
						</div>
					<!-- end: page -->
				</section>
			</div>
			
				   <!-- 프로젝트 생성 modal -->
		   	<div class="modal fade" id="pjtModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		   		<div class="modal-dialog cascading-modal" role="document">
  						 <!--Content-->
   							<div class="modal-content">
						      <!--Header-->
						      <div class="modal-header light-blue darken-3 white-text" style="text-align: center">
						        <h4 id="pjtModalTitle" class="title"><i class="fa fa-folder-plus"></i>&nbsp;새 프로젝트</h4>
						        <button type="button" class="close waves-effect waves-light" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">×</span>
						        </button>
						      </div>
						      <!--Body-->
						      <div class="modal-body mb-0">
						      <form name="pjtForm" method="post">
						      		<label for="pjtName" class="col-form-label"><i class="fa fa-pencil"></i><span>&nbsp;프로젝트 이름</span></label>
							        <input type="text" class="form-control" id="pjtName" name="pjtName">
							        <br>
							    <div class="row">
						      		<div class="col-sm-3">
						      			<label for="pjtStartAt" class="col-form-label"><i class="fa fa-calendar"></i><span>&nbsp;시작일</span></label>
						      		</div>
						      		<div class="col-sm-9">
							          <input type="date" class="form-control" id="pjtStartAt" name="pjtStartAt">
							       </div>
							   </div>
							   <br>
							    <div class="row">
						      		<div class="col-sm-3">
						      			<label for="pjtEndAt" class="col-form-label"><i class="fa fa-calendar"></i><span>&nbsp;마감일</span></label>
						      		</div>
						      		<div class="col-sm-9">
							          <input type="date" class="form-control" id="pjtEndAt" name="pjtEndAt">
							       </div>
							   </div>
							   <br>
						        <div class="row">
						      		<div class="col-sm-3">
						      			<label for="userList" class="col-form-label"><i class="fa fa-user"></i><span>&nbsp;멤버 추가</span></label>
						      		</div>
						      		<div class="col-sm-9">
		                                    <select class="form-control" id="userSelect" name="userSelect" style="height : 35px">
		                                    <option hidden>멤버</option>
		                                    </select>
						      		</div>
							   </div>
							   <br>
							   <div class="row">
								   <div class="col-sm-3">
							       </div>
							       <div class="col-sm-9" id="pjtUserList" style="display:none">
								   </div>
								</div>
							   <div>
							   <br>
							      <div class="text-center mt-1-half">
							        <button type="button" id="makePjtBtn" class="btn btn-info mb-2 waves-effect" ><i class="fa fa-send"></i>&nbsp;프로젝트 만들기</button>
							      </div>
						        </form>
						      </div>
						      <!-- body -->
						    </div>
						    <!--/.Content-->
						  </div>
				</div>						
						<!-- end of modal -->
			<!-- 오른쪽 사이드 시작 -->
			<c:import url="/common/RightSide.jsp"/>
			<!-- 오른쪽 사이드 끝 -->
			
		</section>

	<c:import url="/common/BottomTag.jsp"/>
	
	<script>
	   $(function() {

	    	$.ajax({
	      		url:"getUserList.do",
	      		dataType:"json",
	      		type:"post",
	      		success:function(data){
	      			$.each(data, function(index, element){
	    				let option = $("<option></option>");
	    				$(option).text(element.name+"("+element.mail+")");
	    				$(option).val(element.name+":"+element.mail);
	    				$("#userSelect").append(option);
	    			})
	      		}
	      	});

	    	$("#userSelect").change(function(){
	    		var userInfo = $("select[name='userSelect'] option:selected").val().split(":");
	    		var userName = userInfo[0]			
	    		var userMail = userInfo[1];
	    		$("#pjtUserList").append("<div style='display:inline' class='list'><i class='fa fa-user'><span name='name'>"
	    						+userName+"</span><input type='hidden' name='mail[]' value='"+userMail+"'>&nbsp;&nbsp;</i></div>");
	    	
	    		$("#pjtUserList").css("display","block");
	    	
	    		});

			/* 프로젝트 생성 */
	    	$("#makePjtBtn").on('click', function(e){
	    		if($("#pjtName").val() == "" || $("#pjtName").val() == null){
	    			swal({
	    				title: "프로젝트명",
	    				text: "프로젝트명을 입력하세요",
	    				icon: "warning" //"info,success,warning,error" 중 택1
	    					}).then((YES) => {
	    						if (YES) {
	    							$("#pjtName").focus();
	    							}
	    						})
	    			}else{
	        			var pjtForm = $("form[name=pjtForm]").serialize() ;
	    	 			$.ajax({
	    	 	 			url:"ajax/project/pjtAdd.do",
	    	 				data: pjtForm ,
	    	 				dataType: "text",
	    	 				contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
	    	 				type:"post",
	    	 				success:function(responsedata){
	        	 				console.log('ajax 통신 성공?');
	    	 					console.log(responsedata);
	    	 					if(responsedata == "success"){ //프로젝트 생성 완료
	    	 	 					console.log('채팅방 만듦')
	    	 	 					swal({
	    	 						   title: "프로젝트 생성 완료",
	    	 						   text: "프로젝트가 만들어졌습니다.",
	    	 						   icon: "success" //"info,success,warning,error" 중 택1
	    	 						}).then((YES) => {
	    	 							if (YES) {
	    	 								location.reload(true); 
	    	 							     }
	    	 							})
	    	 					
	    	 	 					}
	    	 				},
	    	 				error:function(){
	    	 					
	    	 				}
	    	 			});

	    	 			
	    	 			}
	    			});
	    });
	</script>

	</body>
</html>