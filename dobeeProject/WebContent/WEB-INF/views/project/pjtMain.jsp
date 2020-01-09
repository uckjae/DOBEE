<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/validate.js/0.12.0/validate.min.js"></script>


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<head>
    <c:import url="/common/tag.jsp"/>
    <style type="text/css">
    @import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

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
  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
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
  /* Override default `<label>` margin */
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

/* Fallback for Edge
-------------------------------------------------- */

@supports (-ms-ime-align: auto) {
  .form-label-group>label {
    display: none;
  }
  .form-label-group input::-ms-input-placeholder {
    color: #777;
  }
}

/* Fallback for IE
-------------------------------------------------- */

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
    	.modal-content {
    	
    	width: 100%;
    	background-color: darkgray;
    	}
    	.card-body{
    	width: 100%;
    	}
    </style>
    <script type="text/javascript">
		$(function(){
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
</head>
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
            <form class="form-signin" action="memberadd.me" accept-charset="UTF-8">
             <h4 class="title"> 제목 </h4>
              <div class="form-label-group">
            
                <input type="text" id="pjtName" name="pjtName" class="form-control" placeholder="예)웹사이트 디자인" required autofocus/>
               
              </div>
                <h4 class="title"> 설명 ( 선택사항 ) </h4>
              <div class="form-label-group">
                <input type="text" id="nickname" name="nickname" class="form-control" placeholder="" autofocus>
     	          
              </div>
              
              <h4 class="title"> 시작일 </h4>
        	<input type="date" name="pjtStartDate" id="pjtStratName" style="width: 35%">
        	<br><br>
        	 <h4 class="title"> 마감일 </h4>
        	<input type="date" name="pjtEndDate" id="pjtEndDate" style="width: 35%">
        	<br><br>
        	
        	
        	<div class="line">
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label" style="font-size: 16px"> 프로젝트 멤버  </label>
                      </div>
                      <br>
                      <div class="col-sm-10 mb-3">
                     
                      <a href="generic.html" class="button alt"  data-toggle="modal" data-target="#NewPro"> <i class="fas fa-plus-circle" style="font-size: 50px; color : black; text-align: center;"></i> </a>
                     
                          <select id="memberList" name="memberList" class="form-control" style="width: 55%">
                        <option value="" selected disabled hiddens > ==멤버를 선택해==</option>
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
    	
    	<select name="job">
    <option value="">전체 프로젝트 관리</option>
    <option value="2019-1분기">2019-1분기</option>
    <option value="2019-2분기">2019-2분기</option>
    <option value="2019-3분기">2019-3분기</option>
    <option value="2019-4분기">2019-4분기</option>
</select>
    	<!-- 프로젝트목록표시 -->
    	<div class="container">
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
	    			 <a href="generic.html" class="button alt"  data-toggle="modal" data-target="#NewPro"> <i class="fas fa-folder-plus" style="font-size: 50px; color : black; text-align: center;"></i> </a>
	    		</div>
    		</div>
    	</div>
    </div>
    <!-- Modal  -->
   
    <div class="modal fade" id="addProjectModal" tabindex="-1" role="dialog" aria-labelledby="addProjectModal" aria-hidden="true" draggable="true">
    <div class="modal-dialog" role="form">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="project">프로젝트 생성</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
     
     
     
     
      </div>
    </div>
  </div>
  
  
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h3 class="modal-title">새 협업공간 만들기</h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
       
        <!-- Modal body -->
       <form action="team.do" method="post"> 
        <div class="modal-body">
        <p style="font-size: 12px">협업공간은 함께 일하는 멤버들끼리만 자료를 공유하고 협업할 수 있는 공간입니다.<br>
             협업공간을 만들고 함께 일할 멤버들을 초대해보세요.</p>
          <label for="pname">협업공간 이름</label>
          <input class="form-control createmodal" type="text" id="pname" name="pname" style="width: 100%">
          <br>
          <label for="pcontent">협업공간 설명</label>
          <textarea class="form-control createmodal" rows="3" id="pcontent" name="pcontent" style="width: 100%"></textarea>
        </div>
        
        <!-- Modal footer -->
        
        <input type="hidden" name="tseq" value="1">
        <input type="hidden" name="ischarge" value="0">
        <input type="hidden" name="email" value="${sessionScope.email} ">
        <input type="hidden" name="istpalarm" value="0">
        <input type="hidden" name="ptime" value="20/01/08"> 
        <div class="modal-footer">
          <input type="submit" class="btn btn-secondary" value="만들기" style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;" >
          <input type="button" class="btn btn-secondary" value="취소" style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;" data-dismiss="modal">
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