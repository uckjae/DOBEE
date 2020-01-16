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
  background-color: #000;
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
    <script type="text/javascript">
      $(function(){
		$.ajax({
			url:"ajax/project/projectList.do",
			success: function(data){
				console.log(data)
				dataType: "JSON",
				success: function(data){
					$.each(data, function(i, elt) {
						if(elt.authCode !=1){
							var option = $("<option>");
							$(option).val(elt.authCode);
							if(elt.authCode == 2){
								$(option).text("사람1");
							}
							else{
								$(option).text("사람2");
							}
							$('#pjtCode').append(option);
						}
					})
				}
			})
          
         /* 프로젝트 멤버추가 */
         $('#memberList').change(function(){
            var memberList = $('#pjtMember').val();
            var selectedMember = $('#memberList').val();

            if(memberList.indexOf(selectedMember) == -1){
               console.log(memberList.indexOf(selectedMember))
               if(memberList==null || memberList==""){
                  
                  memberList += selectedMember;
               }
               else{
                  memberList += ","+selectedMember;
               }
            }
            $('#pjtMember').val(memberList);
            $('#memberList').val(null);
         });


         /* 취소 클릭시 form value 제거 */
         $('#deletebtn').click(function(){
            console.log("deletebtn click!!");
            $('#addProjetForm').find("input").each(function(){
               if(this.id != "modalBtn"){
                  $(this).val(null);
               }
            });
         });

         var usedNames = {}; 
         $("select[name='memberList'] > option").each(function() { 
             if(usedNames[this.text]) { 
              $(this).remove(); 
             } else { 
              usedNames[this.text] = this.value; 
             } 
         }); 

         $(document).on('hidden.bs.modal', function (event) {
            if ($('.modal:visible').length) {
               $('body').addClass('modal-open');
            }
         });	

         
               
      });
    </script>
<body>

   <!-- Side Navbar -->
    <nav class="side-navbar">
       <c:import url="/common/left.jsp" />
    </nav>
    
    <div class="page">
       <!-- 상단 Navbar -->
       <c:import url="/common/top.jsp"/>
       
       	<select class="form-control" id="userSelect" name="userSelect" style="height : 43px">
		 <option hidden>멤버</option>
		</select>
       <br><br>
           <!-- 프로젝트 -->
           <div class="col-xs-12">
           <div class="row">
	           <div class="col-xs-2"></div>
	           
	           <c:forEach items="${list}" var="n">
		         <div class="col-xs-3">
					 <div class="container mr-3">
						  <div class="img-container">
						    <img src="./img/catcat.jpg" alt="">
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
						    <img src="./img/catcat.jpg" alt="">
						  </div>
							<div class="user-info">
								<h2>프로젝트 생성</h2>
					      		<span></span>
							</div>
						</div>
					</div>
					
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