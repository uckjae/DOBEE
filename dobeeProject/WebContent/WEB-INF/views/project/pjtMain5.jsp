<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/validate.js/0.12.0/validate.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <c:import url="/common/tag.jsp"/>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  
<head>
<style type="text/css">
@import url(https://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);

	h4, span {
			font-size: 20px; font-family: 'Nanum Brush Script', serif; line-height: 1.5; color: #222222;
	
	}
	a {
		color: #222222;
	}
	
	
	
body 
{
	font-size: 20px; font-family: 'Nanum Brush Script', serif; line-height: 1.5;
	margin : 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items : center;
	min-height : 100vh;

}


.container {
  position: relative;
  height: 250px;
  width: 250px;
  overflow: hidden;
  box-shadow: 0px 2px 5px rgba(0,0,0,0.3);
  transition: box-shadow 0.3s ease-out;
}

.container:hover {
  box-shadow: 1px 2px 10px rgba(0,0,0,0.5);
}

.img-container {
  background-color: #eeeee;
  position: absolute;
  left: 0;
  top: 0;
  height: 100%;
  width: 100%;
  transition: transform 0.3s ease-out;
  z-index: 2;
}

.img-container:hover {
	cursor: pointer;
}

.container:hover .img-container {
	transform: translateY(-100px);
}

.img-container > img {
  height: 100%;
  width: 100%;
  transition: opacity 0.3s ease-out;
}

.container:hover > .img-container > img {
  opacity: 0.5;
}

.social-media {
  display: flex;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  z-index: 3;
  margin: 0;
  padding: 0;
}

.social-media > li {
  list-style: none;
}

.social-media > li > a {
  display: block;
  height: 50px;
  width: 50px;
  background-color: #FFF;
  text-align: center;
  color: #262626;
  margin: 0 5px;
  border-radius: 50%;
  opacity: 0;
  transform: translateY(200px);
  transition: all 0.3s ease-out;
}

.container:hover > .social-media > li > a {
  transform: translateY(0);
  opacity: 1;
}

.social-media > li > a > .fa {
  font-size: 24px;
  line-height: 50px;
  transition: transform 0.3s ease-out;
}

.social-media > li > a:hover > .fa {
  transform: rotateY(360deg);
}

.container:hover .social-media li:nth-child(1) a {
	transition-delay: 0s;
}

.container:hover .social-media li:nth-child(2) a {
	transition-delay: 0.1s;
}

.container:hover .social-media li:nth-child(3) a {
	transition-delay: 0.2s;
}

.container:hover .social-media li:nth-child(4) a {
	transition-delay: 0.3s;
}

.container:hover .social-media li:nth-child(5) a {
	transition-delay: 0.4s;
}

.user-info {
  position: absolute;
	bottom: 0;
	left: 0;
	background-color: #FFF;
	height: 100px;
	width: 100%;
	box-sizing: border-box;
	padding: 10px;
  text-align: center
}

.user-info > h2 {
  padding: 0;
  margin: 10px 0;
}

.user-info > span {
  color: #262626;
  font-size: 16px;
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
       
       	<%-- <select class="form-control" id="userSelect" name="userSelect" style="height : 43px">
		 <option hidden>멤버</option>
		</select> --%>
       <br><br>
           <!-- 프로젝트 -->
           <div class="col-xs-12">
           <div class="row">
	           <div class="col-xs-2"></div>
	           
	           <c:forEach items="${list}" var="n">
		         <div class="col-xs-3">
					 <div class="container mr-3">
						  <div class="img-container">
						    <img src="./img/folder.png" alt="">
						  </div>
					  		<ul class="social-media">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
							<div class="user-info">
								<h2>${n.pjtName}</h2>
					      		<span>${n.pjtProgress}</span>
							</div>
						</div>
					</div>
			</c:forEach>
			 <div class="col-xs-3">
				<div class="container mr-3">
				<div class="img-container">
						<img src="./img/plusgray.png" alt="">
					</div>
					<div class="user-info">
						<a data-toggle="modal" href="#modalContactForm" style="text-decoration:none"><h2>프로젝트 생성</h2></a>
					    <span></span>
					</div>
				</div>
			</div>
  		</div>
  </div>
   </div>
   
   <!-- 프로젝트 생성 modal -->
   						<!-- modal -->
						<div class="modal fade" id="modalContactForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog cascading-modal" role="document">
						    <!--Content-->
						    <div class="modal-content">
						
						      <!--Header-->
						      <div class="modal-header light-blue darken-3 white-text" style="text-align: center">
						        <h4 class="title"><i class="fas fa-folder-plus"></i>&nbsp;새 프로젝트</h4>
						        <button type="button" class="close waves-effect waves-light" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">×</span>
						        </button>
						      </div>
						      <!--Body-->
						      <div class="modal-body mb-0">
						      <form name="pjtForm" method="post">
						      		<label for="pjtName" class="col-form-label"><i class="fas fa-pencil-alt"></i><span>&nbsp;프로젝트 이름</span></label>
							        <input type="text" class="form-control" id="pjtName" name="pjtName">
							        <br>
							    <div class="row">
						      		<div class="col-sm-3">
						      			<label for="pjtStartAt" class="col-form-label"><i class="fas fa-calendar"></i><span>&nbsp;시작일</span></label>
						      		</div>
						      		<div class="col-sm-9">
							          <input type="date" class="form-control" id="pjtStartAt" name="pjtStartAt">
							       </div>
							   </div>
							    <div class="row">
						      		<div class="col-sm-3">
						      			<label for="pjtEndAt" class="col-form-label"><i class="fas fa-calendar"></i><span>&nbsp;마감일</span></label>
						      		</div>
						      		<div class="col-sm-9">
							          <input type="date" class="form-control" id="pjtEndAt" name="pjtEndAt">
							       </div>
							   </div>
						        <div class="row">
						      		<div class="col-sm-3">
						      			<label for="userList" class="col-form-label"><i class="fas fa-user"></i><span>&nbsp;멤버 추가</span></label>
						      		</div>
						      		<div class="col-sm-9">
		                                    <select class="form-control" id="userSelect" name="userSelect" style="height : 43px">
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
							        <button type="button" id="makePjtBtn" class="btn btn-info mb-2 waves-effect" ><i class="fas fa-send"></i>&nbsp;프로젝트 만들기</button>
							      </div>
						        </form>
						      </div>
						      <!-- body -->
						    </div>
						    <!--/.Content-->
						  </div>
						</div>						
						<!-- end of modal -->   
  
  
   <!-- JavaScript files-->
    <script src="./vendor/jquery/jquery.min.js"></script>
    <script src="./vendor/popper.js/umd/popper.min.js"> </script>
    <script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="./js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="./vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="./vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="./vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="./js/charts-home.js"></script>
    <!-- Main File-->
    <script src="./js/front.js"></script>
    <script src="https://kit.fontawesome.com/5d4e7bbd25.js" crossorigin="anonymous"></script>
    <script>
    $(function() {
        var count = 0;
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
    		$("#pjtUserList").append("<div style='display:inline' class='list'><i class='fas fa-user'><span name='name'>"
    						+userName+"</span><input type='hidden' name='mail[]' value='"+userMail+"'>&nbsp;&nbsp;</i></div>");
    	
    		$("#pjtUserList").css("display","block");
    	
    		});


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
    						$("#pjtName").focus();
    			}else{
        			console.log('else 타니???');
        			var queryString = $("form[name=pjtForm]").serialize() ;
        			console.log('폼??'+queryString);
        			/* var pjtName = $("#pjtName").val();
        			var pjtStartAt = $("#pjtStartAt").val();
        			var pjtEndAt = $("#pjtEndAt").val();
        			var pjtUserList = new Array();
    				$("input[name=userMail]").each(function(index, item){
    					pjtUserList.push($(item).val());
    					});
    				var newPjt = {
    	    				"pjtName" : pjtName,
    	    				"pjtStartAt" : pjtStartAt,
    	    				"pjtEndAt" : pjtEndAt,
    	 	    			"pjtUserList" : pjtUserList
    	 	    			}; */
    	 			$.ajax({
        	 			
    	 	 			url:"ajax/project/pjtAdd.do",
    	 				data: queryString ,
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