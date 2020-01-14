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
/* body 
{
	
	margin : 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items : center;
	min-height : 100vh;
	background : #fff;

} */

.pjcontainer
{
	position : relative;
	width:90%;
	display : grid;
	grid-template-columns : repeat(auto-fill, minmax(260px), 1fr));
	grid-template-rows : auto;
	grid-gap : 0 40px;
	
}
.pjcontainer .pjbox 
{
	position : relative;
	height : 380px;
	background :  #807c7e;
	display: flex;
	justify-content: center;
	align-items : center;
	/* border: 1px solid #000; */
}

.pjcontainer .pjbox:before
{
	content : '';
	position : absolute;
	top : -2px;
	left : -2px;
	right : -2px;
	bottom : -2px;
	background: #fff;
	transform : skew(2deg, 2deg);
	z-index : -1;
}

.pjcontainer .pjbox:nth-child(1):before
{
	background: linear-gradient(600deg, #807c7e, #f4f6f5);

}
.pjcontainer .pjbox:after
{
	content : '';
	position : absolute;
	top : 0;
	left : 0;
	width : 50%;
	height : 100%;
	background: rgba(255,255,255,0.05);
	pointer-events : none;
}


.content 
{
	position : relative;
	padding : 20px;

}

.pjbox .content h2 
{
	position : absolute;
	top : -60px;
	right : 20px;
	margin: 0;
	padding: 0;
	font-size: 10em;
	color : rgba(93,93,93,2);
	transition : 0.5s;
	
}

.pjbox:hover .content h2
{
	top : -140px;

}

.pjbox .content h3 
{
	margin : 0 0 10px;
	padding : 0;
	font-size: 24px;
	font-weight : 500;
	color: #fff;
}

.pjbox .content p 
{
	margin : 0;
	padding : 0;
	font-size: 16px;
	color: #fff;
}

.pjbox .content a
{
	position : relative;
	margin : 20px 0 0;
	padding : 10px 20px;
	text-decoration : none;
	border: 1px solid #fff;
	display : inline-block;
	color : #fff;
	transition : 0.5s;
	transform : translateY(-40px);
	opacity: 0;
	visibility: hidden;
}

.pjbox:hover .content a
{

	transform : translateY(0);
	opacity: 1;
	visibility: visible;
}
.pjbox .content a:hover
{
	color : #000;
	background: #fff;
}
/* @import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body {
   font-family: 'Noto Serif KR', serif;
}

:root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}

body {
  background: #007bff;
  background: linear-gradient(to right, #0062E6, #33AEFF);
}

.card-signin {
  border: 0;
  border-radius: 1rem;
  pjbox-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
}

.card-signin .card-title {
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

.card-signin {
  padding: 2rem;
 
}

.form-signin {
  width: 100%;
}

.form-signin .btn {
  font-size: 80%;
  border-radius: 5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group input {
  height: auto;
  border-radius: 2rem;
}

.form-label-group>input,
.form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}

.form-label-group>label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0;
  line-height: 1.5;
  color: #495057;
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

.form-label-group input:-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-moz-placeholder {
  color: transparent;
}

.form-label-group input::placeholder {
  color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

.form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}

.btn-google {
  color: white;
  background-color: #ea4335;
}

.btn-facebook {
  color: white;
  background-color: #3b5998;
}
.radio-display {
   display:inline-block;
   width: 2em;
   height: 2em;

}


@supports (-ms-ime-align: auto) {
  .form-label-group>label {
    display: none;
  }
  .form-label-group input::-ms-input-placeholder {
    color: #777;
  }
}


@media all and (-ms-high-contrast: none),
(-ms-high-contrast: active) {
  .form-label-group>label {
    display: none;
  }
  .form-label-group input:-ms-input-placeholder {
    color: #777;
  }
}
       .pjt{
          border : 2px;
          border-style: groove;
          padding-top : 1em;
          margin-top : 1em;
          margin-left : auto;
          margin-right: auto;
       }
       .pjt .title{
          text-align: center;
       }
       .pjt .add{
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
       .modal-content {
       
       width: 100%;
       background-color: darkgray;
       }
       .card-body{
       width: 100%;
       } */
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

  <!-- The Modal -->
  <div class="modal fade" id="NewPro">
    <div class="modal-dialog modal-lg">
      <div class="modal-content" >
      
        <!-- Modal body -->

        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto" style="display:contents ">
        <div class="card my-5">
          <div class="card-body">
            <h2 class="card-title text-center" style="color:#000000;"> 새 프로젝트</h2>
            <form class="form-signin" action="pjtAdd.do" accept-charset="UTF-8" method="post">
             <h4 class="title"> 제목 </h4>
              <div class="form-label-group">
            
                <input type="text" id="pjtName" name="pjtName" class="form-control" placeholder="예)웹사이트 디자인" required autofocus/>
               
              </div>
                <h4 class="title"> 설명 ( 선택사항 ) </h4>
              <div class="form-label-group">
                <input type="text" id="pjtProgress" name="pjtProgress" class="form-control" placeholder="" autofocus>
                  
              </div>
              
              <h4 class="title"> 시작일 </h4>
           <input type="date" name="pjtStartAt" id="pjtStartAt" style="width: 35%">
           <br><br>
            <h4 class="title"> 마감일 </h4>
           <input type="date" name="pjtEndAt" id="pjtEndAt" style="width: 35%">
           <br><br>
           
           
           <div class="line">
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label" style="font-size: 16px"> 프로젝트 멤버  </label>
                      </div>
                      <br>
                      <div class="col-sm-10 mb-3">
                     
                      <a href="generic.html" class="button alt"  data-toggle="modal" data-target="#NewPro"> <i class="fas fa-plus-circle" style="font-size: 50px; color : black; text-align: center;"></i> </a>
                     
                          <select id="memberList" name="memberList" class="form-control" style="width: 55%">
                        <option value="" selected disabled hidden > ==멤버를 선택해==</option>
                        <option>이혜리</option>
                    <option>박성호</option>
                    <option>이욱재</option>
                    <option>김정균</option>
                    <option>김광민</option>
                    <option>최경열</option>
                        </select>
                         <input id="pjtMember" value="" style="width: 55%"></input>
                      
                 
                    </div>
                    </div>
           
           
           <hr class="my-4">
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" style=" width: 40%; font-size: 18px; margin : auto;
     background: linear-gradient(90deg, rgba(255,0,0,0.6783088235294117) 0%, rgba(58,67,180,1) 50%, rgba(255,0,241,0.7259278711484594) 100%); border-color: #ffffff;">
     프로젝트 추가</button>
                        
            <button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" style="  width: 40%; font-size: 18px; margin : auto;
     background: linear-gradient(90deg, rgba(98,98,98,0.6783088235294117) 0%, rgba(0,0,0,1) 50%, rgba(133,133,133,0.7259278711484594) 100%); border-color: #ffffff;" data-dismiss="modal"; > 취소 </button>
            </form>
          </div>
        </div>
      </div>
       </div>      
    </div>
  </div>   
              
         
   <!-- Side Navbar -->
    <nav class="side-navbar">
       <c:import url="/common/left.jsp" />
    </nav>
    <div class="page">
       <!-- 상단 Navbar -->
       <c:import url="/common/top.jsp"/>

             <!-- 프로젝트 -->
             <div class="container-fluid">
             <div class="row">
             <div class="col-md-3">
	             <div class="pjcontainer">
						<div class="pjbox">
							 <div class="content">
							 	<h2>01</h2>
							 	<h3>Service One</h3>
							 	<p></p>
							 	<a href="#">Read More</a>
							 </div>
						 </div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="pjcontainer">
						 <div class="pjbox">
							 <div class="content">
							 	<h2>02</h2>
							 	<h3>Service Two</h3>
							 	<p></p>
							 	<a href="#">Read More</a>
							 </div>
						 </div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="pjcontainer">
						 <div class="pjbox">
							 <div class="content">
							 	<h2>03</h2>
							 	<h3>Service Three</h3>
							 	<p></p>
							 	<a href="#">Read More</a>
							 </div>
						 </div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="pjcontainer">
						 <div class="pjbox">
							 <div class="content">
							 	<h2>04</h2>
							 	<h3>Service Four</h3>
							 	<p></p>
							 	<a href="#">Read More</a>
							 </div>
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