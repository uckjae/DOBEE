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
       	<select class="form-control" id="userSelect" name="userSelect" style="height : 43px">
		 <option hidden>멤버</option>
		</select>
       <br><br><br>

             <!-- 프로젝트 -->
           <div class="row">
           
        
             <!-- Card -->
         <div class="col-xs-2">
         </div>
		<div class="col-xs-3">
		
		<div class="card weather-card">
		
		  <!-- Card content -->
		  <div class="card-body pb-3">
		
		    <!-- Title -->
		    <h4 class="card-title font-weight-bold">Warsaw</h4>
		    <!-- Text -->
		    <p class="card-text">Mon, 12:30 PM, Mostly Sunny</p>
		    <div class="d-flex justify-content-between">
		      <p class="display-1 degree">23</p>
		      <i class="fas fa-sun-o fa-5x pt-3 amber-text"></i>
		    </div>
		    <div class="d-flex justify-content-between mb-4">
		      <p><i class="fas fa-tint fa-lg text-info pr-2"></i>3% Precipitation</p>
		      <p><i class="fas fa-leaf fa-lg grey-text pr-2"></i>21 km/h Winds</p>
		    </div>
		    <div class="progress md-progress">
		      <div class="progress-bar black" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
		    </div>
		    <ul class="list-unstyled d-flex justify-content-between font-small text-muted mb-4">
		      <li class="pl-4">8AM</li>
		      <li>11AM</li>
		      <li>2PM</li>
		      <li>5PM</li>
		      <li class="pr-4">8PM</li>
		    </ul>
		
		    <div class="collapse-content">
		
		      <div class="collapse" id="collapseExample">
		
		        <table class="table table-borderless table-sm mb-0">
		          <tbody>
		            <tr>
		              <td class="font-weight-normal align-middle">Tuesday</td>
		              <td class="float-right font-weight-normal">
		                <p class="mb-1">24&deg;<span class="text-muted">/12&deg;</span></p>
		              </td>
		              <td class="float-right mr-3">
		                <i class="fas fa-sun fa-lg amber-text"></i>
		              </td>
		            </tr>
		            <tr>
		              <td class="font-weight-normal align-middle">Wednesday</td>
		              <td class="float-right font-weight-normal">
		                <p class="mb-1">19&deg;<span class="text-muted">/10&deg;</span></p>
		              </td>
		              <td class="float-right mr-3">
		                <i class="fas fa-cloud-sun-rain fa-lg text-info"></i>
		              </td>
		            </tr>
		            <tr>
		              <td class="font-weight-normal align-middle">Thursday</td>
		              <td class="float-right font-weight-normal">
		                <p class="mb-1">23&deg;<span class="text-muted">/15&deg;</span></p>
		              </td>
		              <td class="float-right mr-3">
		                <i class="fas fa-sun fa-lg amber-text"></i>
		              </td>
		            </tr>
		            <tr>
		              <td class="font-weight-normal align-middle">Friday</td>
		              <td class="float-right font-weight-normal">
		                <p class="mb-1">26&deg;<span class="text-muted">/19&deg;</span></p>
		              </td>
		              <td class="float-right mr-3">
		                <i class="fas fa-sun fa-lg amber-text"></i>
		              </td>
		            </tr>
		            <tr>
		              <td class="font-weight-normal align-middle">Saturday</td>
		              <td class="float-right font-weight-normal">
		                <p class="mb-1">20&deg;<span class="text-muted">/16&deg;</span></p>
		              </td>
		              <td class="float-right mr-3">
		                <i class="fas fa-cloud fa-lg text-info"></i>
		              </td>
		            </tr>
		            <tr>
		              <td class="font-weight-normal align-middle">Sunday</td>
		              <td class="float-right font-weight-normal">
		                <p class="mb-1">22&deg;<span class="text-muted">/13&deg;</span></p>
		              </td>
		              <td class="float-right mr-3">
		                <i class="fas fa-cloud-sun fa-lg text-info"></i>
		              </td>
		            </tr>
		          </tbody>
		        </table>
		
		      </div>
		
		      <hr class="">
		
		        <a class="btn btn-flat red-text p-1 my-1 mr-0 mml-1 deep-purple-text collapsed" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"></a>
		
		    </div>
		
		  </div>
		
		</div>
		</div>
		
<!-- Card -->
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