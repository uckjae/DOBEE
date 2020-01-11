<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="/common/tag.jsp"/>


<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script>


$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})

</script>
<style >


img {
    vertical-align: middle;
}

.img-responsive {
    display: block;
    height: auto;
    max-width: 100%;
}

.img-rounded {
    border-radius: 3px;
}

.img-thumbnail {
    background-color: #fff;
    border: 1px solid #ededf0;
    border-radius: 3px;
    display: inline-block;
    height: auto;
    line-height: 1.428571429;
    max-width: 100%;
    moz-transition: all .2s ease-in-out;
    o-transition: all .2s ease-in-out;
    padding: 2px;
    transition: all .2s ease-in-out;
    webkit-transition: all .2s ease-in-out;
}

.img-circle {
    border-radius: 50%;
}

.kanban-centered {
    position: relative;
    margin-bottom: 30px;
}

    .kanban-centered:before, .kanban-centered:after {
        content: " ";
        display: table;
    }

    .kanban-centered:after {
        clear: both;
    }

    .kanban-centered:before, .kanban-centered:after {
        content: " ";
        display: table;
    }

    .kanban-centered:after {
        clear: both;
    }

    .kanban-centered:before {
        content: '';
        position: absolute;
        display: block;
        width: 2px;
        /*background: #f5f5f6;*/
        top: 20px;
        bottom: 20px;
        /*margin-left: 18px;*/
    }

    .kanban-centered .kanban-entry {
        position: relative;
        /*width: 50%;
        float: right;*/
        margin: 10px 8px;
        clear: both;
        border-radius: 4px;
        -webkit-box-shadow: 1px 1px 2px 0px rgba(50, 50, 50, 0.5);
        -moz-box-shadow: 1px 1px 2px 0px rgba(50, 50, 50, 0.5);
        box-shadow: 1px 1px 2px 0px rgba(50, 50, 50, 0.5);
    }

        .kanban-centered .kanban-entry:before, .kanban-centered .kanban-entry:after {
            content: " ";
            display: table;
        }

        .kanban-centered .kanban-entry:after {
            clear: both;
        }

        .kanban-centered .kanban-entry:before, .kanban-centered .kanban-entry:after {
            content: " ";
            display: table;
        }

        .kanban-centered .kanban-entry:after {
            clear: both;
        }

        .kanban-centered .kanban-entry.begin {
            margin-bottom: 0;
        }

        .kanban-centered .kanban-entry.left-aligned {
            float: left;
        }

            .kanban-centered .kanban-entry.left-aligned .kanban-entry-inner {
                margin-left: 0;
                margin-right: -18px;
            }

                .kanban-centered .kanban-entry.left-aligned .kanban-entry-inner .kanban-time {
                    left: auto;
                    right: -100px;
                    text-align: left;
                }

                .kanban-centered .kanban-entry.left-aligned .kanban-entry-inner .kanban-icon {
                    float: right;
                }

                .kanban-centered .kanban-entry.left-aligned .kanban-entry-inner .kanban-label {
                    margin-left: 0;
                    margin-right: 70px;
                }

                    .kanban-centered .kanban-entry.left-aligned .kanban-entry-inner .kanban-label:after {
                        left: auto;
                        right: 0;
                        margin-left: 0;
                        margin-right: -9px;
                        -moz-transform: rotate(180deg);
                        -o-transform: rotate(180deg);
                        -webkit-transform: rotate(180deg);
                        -ms-transform: rotate(180deg);
                        transform: rotate(180deg);
                    }

        .kanban-centered .kanban-entry .kanban-entry-inner {
            position: relative;
            /*margin-left: -24px;*/
        }

            .kanban-centered .kanban-entry .kanban-entry-inner:before, .kanban-centered .kanban-entry .kanban-entry-inner:after {
                content: " ";
                display: table;
            }

            .kanban-centered .kanban-entry .kanban-entry-inner:after {
                clear: both;
            }

            .kanban-centered .kanban-entry .kanban-entry-inner:before, .kanban-centered .kanban-entry .kanban-entry-inner:after {
                content: " ";
                display: table;
            }

            .kanban-centered .kanban-entry .kanban-entry-inner:after {
                clear: both;
            }

            .kanban-centered .kanban-entry .kanban-entry-inner .kanban-time {
                position: absolute;
                left: -100px;
                text-align: right;
                padding: 10px;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }

                .kanban-centered .kanban-entry .kanban-entry-inner .kanban-time > span {
                    display: block;
                }

                    .kanban-centered .kanban-entry .kanban-entry-inner .kanban-time > span:first-child {
                        font-size: 15px;
                        font-weight: bold;
                    }

                    .kanban-centered .kanban-entry .kanban-entry-inner .kanban-time > span:last-child {
                        font-size: 12px;
                    }

            .kanban-centered .kanban-entry .kanban-entry-inner .kanban-icon {
                background: #fff;
                color: #737881;
                display: block;
                width: 25px;
                height: 25px;
                -webkit-background-clip: padding-box;
                -moz-background-clip: padding;
                background-clip: padding-box;
                -webkit-border-radius: 20px;
                -moz-border-radius: 20px;
                border-radius: 20px;
                text-align: center;
                -moz-box-shadow: 0 0 0 4px #f5f5f6;
                -webkit-box-shadow: 0 0 0 4px #f5f5f6;
                box-shadow: 0 0 0 4px #f5f5f6;
                float: left;
                margin-top: 6px;
            }

                .kanban-centered .kanban-entry .kanban-entry-inner .kanban-icon.bg-primary {
                    background-color: #303641;
                    color: #fff;
                }

                .kanban-centered .kanban-entry .kanban-entry-inner .kanban-icon.bg-secondary {
                    background-color: #ee4749;
                    color: #fff;
                }

                .kanban-centered .kanban-entry .kanban-entry-inner .kanban-icon.bg-success {
                    background-color: #00a651;
                    color: #fff;
                }

                .kanban-centered .kanban-entry .kanban-entry-inner .kanban-icon.bg-info {
                    background-color: #21a9e1;
                    color: #fff;
                }

                .kanban-centered .kanban-entry .kanban-entry-inner .kanban-icon.bg-warning {
                    background-color: #fad839;
                    color: #fff;
                }

                .kanban-centered .kanban-entry .kanban-entry-inner .kanban-icon.bg-danger {
                    background-color: #cc2424;
                    color: #fff;
                }

            .kanban-centered .kanban-entry .kanban-entry-inner .kanban-label {
                position: relative;
                background: #f5f5f6;
                padding: 0.75em;
                /*margin-left: 50px;*/
                -webkit-background-clip: padding-box;
                -moz-background-clip: padding;
                background-clip: padding-box;
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                border-radius: 3px;
            }

                /*.kanban-centered .kanban-entry .kanban-entry-inner .kanban-label:after {
                    content: '';
                    display: block;
                    position: absolute;
                    width: 0;
                    height: 0;
                    border-style: solid;
                    border-width: 9px 9px 9px 0;
                    border-color: transparent #f5f5f6 transparent transparent;
                    left: 0;
                    top: 10px;
                    margin-left: -9px;
                }*/

                .kanban-centered .kanban-entry .kanban-entry-inner .kanban-label h2, .kanban-centered .kanban-entry .kanban-entry-inner .kanban-label p {
                    color: #737881;
                    font-family: "Noto Sans",sans-serif;
                    font-size: 12px;
                    margin: 0;
                    line-height: 1.428571429;
                }

                    .kanban-centered .kanban-entry .kanban-entry-inner .kanban-label p + p {
                        margin-top: 15px;
                    }

                .kanban-centered .kanban-entry .kanban-entry-inner .kanban-label h2 {
                    font-size: 16px;
                    margin-bottom: 10px;
                }

                    .kanban-centered .kanban-entry .kanban-entry-inner .kanban-label h2 a {
                        color: #303641;
                    }

                    .kanban-centered .kanban-entry .kanban-entry-inner .kanban-label h2 span {
                        -webkit-opacity: .6;
                        -moz-opacity: .6;
                        opacity: .6;
                        -ms-filter: alpha(opacity=60);
                        filter: alpha(opacity=60);
                    }


.modal-static {
    position: fixed;
    top: 50% !important;
    left: 50% !important;
    margin-top: -100px;
    margin-left: -100px;
    overflow: visible !important;
}

    .modal-static,
    .modal-static .modal-dialog,
    .modal-static .modal-content {
        width: 200px;
        height: 150px;
    }

        .modal-static .modal-dialog,
        .modal-static .modal-content {
            padding: 0 !important;
            margin: 0 !important;
        }

.kanban-col {
    width: 300px;
    margin-right: 20px;
    float: left;
}

.panel-body {
    padding: 15px 0 0 0;
    overflow-y: auto;
}



/*.panel-heading {
    cursor: -moz-grab;
    cursor: -webkit-grab;
    cursor: grab;
}*/

.grab {
    cursor: -moz-grab;
    cursor: -webkit-grab;
}

.grabbing {
    cursor: -moz-grabbing;
    cursor: -webkit-grabbing;
}

.panel-heading {
    cursor: context-menu;
}

    .panel-heading i {
        cursor: pointer;
    }

body {
    -webkit-user-select: none; /* Chrome/Safari */
    -moz-user-select: none; /* Firefox */
    -ms-user-select: none; /* IE10+ */
    /* Rules below not implemented in browsers yet */
    -o-user-select: none;
    user-select: none;
}

body{
	margin-top: 100px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6
}
.container{
	width: 500px;
	margin: 0 auto;
}



ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}

</style>


</head>


<body>
    <!-- notice DataTables js-->
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"type="text/javascript">
	</script>

	<script>
  

     </script>

<!-- Side Navbar -->
    <nav class="side-navbar">
      <c:import url="/common/left.jsp"/>
    </nav>
    
    <div class="page" >
      <!-- navbar-->
      <c:import url="/common/top.jsp"/>
      
      <script> /*view 객체 생성*/
		window.onload = function(){
			var app = new Vue ({
				el : '#navbar',
				data : []
			})
		}		
  	</script>
  	
  	<div id="navbar">
	  <b-card title="Card Title" no-body>
	    <b-card-header header-tag="nav">
	      <b-nav card-header pills>
	        <b-nav-item active> 프로젝트 1 </b-nav-item>
	        <b-nav-item ><a href="#"> 업무 </a></b-nav-item>
	        <b-nav-item><a href="#"> 캘린더 </a></b-nav-item>
	        <b-nav-item><a href="#"> 분석 </a></b-nav-item>
	        
	         <select name="job" style="width: 20%; float : right; margin: auto">
   				 <option value="">전체 프로젝트 </option>
    			 <option value="나의 프로젝트"> 나의 프로젝트 </option>
    			 <option value="팀 프로젝트"> 팀 프로젝트 </option>
    		 </select>
 	      </b-nav>
	    </b-card-header>
  	   
</b-card>
</div>





  	   
  	    <div class="container-fluid">
        <div id="sortableKanbanBoards" class="row">

            <!--sütun başlangıç-->
            <div class="panel panel-primary kanban-col">
                <div class="panel-heading">
                    	예정단계
                    <i class="fa fa-2x fa-plus-circle pull-right"></i>
                </div>
                <div class="panel-body">
                    <div id="TODO" class="kanban-centered">

                          <a href="#" class="button alt"  data-toggle="modal" data-target="#NewPro"> <article class="kanban-entry grab" id="item1" draggable="true">
                            <div class="kanban-entry-inner">
                                <div class="kanban-label">
                     <h2> 로그인 페이지 만들기 <span> 2019.12.20~2020.01.20</span></h2>
                                    <p>ㅇㅇㅇㅇ </p>
                                </div>
                            </div>
                        </article></a> 

                        <article class="kanban-entry grab" id="item2" draggable="true">
                            <div class="kanban-entry-inner">
                                <div class="kanban-label">
                                    <h2><a href="#">로그아웃 페이지 만들기 </a></h2>
                                    <p> <strong>2019.12.20~2020.01.20</strong> </p>
                                </div>
                            </div>
                        </article>

                      <article class="kanban-entry grab" id="item2" draggable="true">
                            <div class="kanban-entry-inner">
                                <div class="kanban-label">
                                    <h2><a href="#">채팅방 만들기 </a></h2>
                                    <p> <strong>2019.12.20~2020.01.20</strong> </p>
                                </div>
                            </div>
                        </article>

                    
                    </div>
                </div>
                <div class="panel-footer">
                    <a href="#"> 잔여 업무수 </a>
                </div>
            </div>
            
            
            
                 <div class="panel panel-primary kanban-col">
                <div class="panel-heading">
                    	진행단계 
                    <i class="fa fa-2x fa-plus-circle pull-right"></i>
                </div>
                <div class="panel-body">
                    <div id="TODO" class="kanban-centered">

                        <article class="kanban-entry grab" id="item1" draggable="true">
                            <div class="kanban-entry-inner">
                                <div class="kanban-label">
                                    <h2><a href="#">로그인 페이지 만들기</a> <span> 2019.12.20~2020.01.20</span></h2>
                                    <p>ㅇㅇㅇㅇ </p>
                                </div>
                            </div>
                        </article>

                        <article class="kanban-entry grab" id="item2" draggable="true">
                            <div class="kanban-entry-inner">
                                <div class="kanban-label">
                                    <h2><a href="#">로그아웃 페이지 만들기 </a></h2>
                                    <p> <strong>2019.12.20~2020.01.20</strong> </p>
                                </div>
                            </div>
                        </article>

                      <article class="kanban-entry grab" id="item2" draggable="true">
                            <div class="kanban-entry-inner">
                                <div class="kanban-label">
                                    <h2><a href="#">채팅방 만들기 </a></h2>
                                    <p> <strong>2019.12.20~2020.01.20</strong> </p>
                                </div>
                            </div>
                        </article>

                    
                    </div>
                </div>
                <div class="panel-footer">
                    <a href="#"> 잔여 업무수 </a>
                </div>
            </div>
            
            
            
                 <div class="panel panel-primary kanban-col">
                <div class="panel-heading">
                    	테스트 단계 
                    <i class="fa fa-2x fa-plus-circle pull-right"></i>
                </div>
                <div class="panel-body">
                    <div id="TODO" class="kanban-centered">

                        <article class="kanban-entry grab" id="item1" draggable="true">
                            <div class="kanban-entry-inner">
                                <div class="kanban-label">
                                    <h2><a href="#">로그인 페이지 만들기</a> <span> 2019.12.20~2020.01.20</span></h2>
                                    <p>ㅇㅇㅇㅇ </p>
                                </div>
                            </div>
                        </article>

                        <article class="kanban-entry grab" id="item2" draggable="true">
                            <div class="kanban-entry-inner">
                                <div class="kanban-label">
                                    <h2><a href="#">로그아웃 페이지 만들기 </a></h2>
                                    <p> <strong>2019.12.20~2020.01.20</strong> </p>
                                </div>
                            </div>
                        </article>

                      <article class="kanban-entry grab" id="item2" draggable="true">
                            <div class="kanban-entry-inner">
                                <div class="kanban-label">
                                    <h2><a href="#">채팅방 만들기 </a></h2>
                                    <p> <strong>2019.12.20~2020.01.20</strong> </p>
                                </div>
                            </div>
                        </article>

                    
                    </div>
                </div>
                <div class="panel-footer">
                    <a href="#"> 잔여 업무수 </a>
                </div>
            </div>
           
			       <div class="panel panel-primary kanban-col">
                <div class="panel-heading">
                    	완료
                    <i class="fa fa-2x fa-plus-circle pull-right"></i>
                </div>
                <div class="panel-body">
                    <div id="TODO" class="kanban-centered">

                        <article class="kanban-entry grab" id="item1" draggable="true">
                            <div class="kanban-entry-inner">
                                <div class="kanban-label">
                                    <h2><a href="#">로그인 페이지 만들기</a> <span> 2019.12.20~2020.01.20</span></h2>
                                    <p>ㅇㅇㅇㅇ </p>
                                </div>
                            </div>
                        </article>

                        <article class="kanban-entry grab" id="item2" draggable="true">
                            <div class="kanban-entry-inner">
                                <div class="kanban-label">
                                    <h2><a href="#">로그아웃 페이지 만들기 </a></h2>
                                    <p> <strong>2019.12.20~2020.01.20</strong> </p>
                                </div>
                            </div>
                        </article>

                      <article class="kanban-entry grab" id="item2" draggable="true">
                            <div class="kanban-entry-inner">
                                <div class="kanban-label">
                                    <h2><a href="#">채팅방 만들기 </a></h2>
                                    <p> <strong>2019.12.20~2020.01.20</strong> </p>
                                </div>
                            </div>
                        </article>

                    
                    </div>
                </div>
                <div class="panel-footer">
                    <a href="#"> 잔여 업무수 </a>
                </div>
            </div>
        </div>
    </div>



    <!-- The Modal -->
  <div class="modal fade" id="NewPro">
    <div class="modal-dialog modal-lg">
      <div class="modal-content" >
      
        <!-- Modal body -->

        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto" style="display:contents ">
        <div class="card my-5">
          <div class="card-body">
            <h4 class="card-title text-center" style="color:#000000;"> 업무 : 채팅창 만들기 </h4>
            
      <div class="container">

	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">속성</li>
		<li class="tab-link" data-tab="tab-2">내용</li>
		<li class="tab-link" data-tab="tab-3">체크리스트</li>
	</ul>

	<div id="tab-1" class="tab-content current">
		 <form class="form-signin" action="memberadd.me" accept-charset="UTF-8">
             
             <div class="col-md-12">
           
               <div class="form-label-group col-md-6">
                 <h4 class="title"> 작성자  </h4>
                <input type="text" id="pjtName" name="pjtName" class="form-control" placeholder="예)웹사이트 디자인" required autofocus/>
              </div>
               <div class="form-label-group col-md-6" style="float:right">
              <h4 class="title"> 작성일 </h4>
           		<input type="date" name="pjtStartDate" id="pjtStratName" style="width: 35%"/>
               </div>
               </div>
               
               <div class="col-md-12">
              <h4 class="title"> 날짜 </h4>
           <input type="date" name="pjtStartDate" id="pjtStratName" style="width: 35%"/>
           </div>
           <br><br>
           <div class="col-md-12">
            <h4 class="title"> 예상업무량 </h4>
           <input type="date" name="pjtEndDate" id="pjtEndDate" style="width: 35%"/>
           <br><br>
           </div>
           
           
           <div class="line col-md-12">
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label" style="font-size: 16px"> 관리자  </label>
                      </div>
                     
                      <div class="col-sm-10 mb-3">
                        <select id="memberList" name="memberList" class="form-control" style="width: 55%">
                        <option value="" selected disabled hiddens > ==멤버를 선택해주세요 ==</option>
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
           
           
             <div class="form-label-group col-md-12">
                 <h4 class="title"> 중요도  </h4>
                <input type="text" id="pjtName" name="pjtName" class="form-control" placeholder="평가 되지않음" required autofocus/>
              </div>
              
             </form>
	</div>
	
	
	<div id="tab-2" class="tab-content">
		<div class="custom-control ">
			<input type="text">
		     <button> 내용  추가 </button>
					</div>
					
			
	</div>
	
	
	<div id="tab-3" class="tab-content">
	
	
	<div class="custom-control custom-checkbox">
						<input type="checkbox" id="jb-checkbox-1" class="custom-control-input">
						<label class="custom-control-label" for="jb-checkbox-1" style="font-size: 15px"> <input type="text"><button> 리스트 추가 </button></label>
					</div>
	<div class="custom-control custom-checkbox">
						<input type="checkbox" id="jb-checkbox-2" class="custom-control-input">
						<label class="custom-control-label" for="jb-checkbox-2" style="font-size: 15px"> <input type="text"><button> 리스트 삭제</button> </label>
					</div>
	
	
					

	</div>

</div>
            
           
          </div>
        </div>
      </div>
       </div>      
    </div>
  </div>   

    <!-- Static Modal -->
    <div class="modal modal-static fade" id="processing-modal" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="text-center">
                        <i class="fa fa-refresh fa-5x fa-spin"></i>
                        <h4>Processing...</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
  	   
  	   
  	   
  	   
  	   
  	   
  	   
  	   
	<c:import url="/common/bottom.jsp"/>
	
	<!-- JavaScript files-->
    <script src="./vendor/popper.js/umd/popper.min.js"> </script>
    <script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="./js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="./vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="./vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="./vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- Main File-->
    <script src="./js/front.js"></script>
    <script src="https://kit.fontawesome.com/5d4e7bbd25.js" crossorigin="anonymous"></script>
	

</body>
</html>
