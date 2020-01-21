<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>iofrm</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/fontawesome-all.min.css">
    <link rel="stylesheet" type="text/css" href="css/iofrm-style.css">
    <link rel="stylesheet" type="text/css" href="css/iofrm-theme2.css">
    
    
   <script>
$(document).on('click','#findId',function(){
	var name = $('#name').val();

 	var phone = $('#phone').val();

 	var postData = {'name' : name ,'phone' : phone};

	$.ajax({
        url:'/findingId.do',
        type:'POST',
        data: postData,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType : "json",

        success:function(data){
        	var emailLists = data.user_email;
        	var emailLength = emailLists.length
        	var emailfind = emailLists.substring(1, emailLength-1)
       	 		 $("#emailList").append("<h1>"+"회원님의 정보로 등록된 이메일은 : "+emailfind+" 입니다.</h1>")

        },
        error: function (XMLHttpRequest, textStatus, errorThrown){
        	alert('정보를 다시 입력해주시길 바랍니다.' );
        }
    });
});

</script>
</head>
<body>
    <div class="form-body">
    
        <!--시작  -->
        <div class="website-logo">
            <a href="#">
                <div class="logo">
                    <img class="logo-size" src="img/logo-light.svg" alt="">
                </div>
            </a>
        </div>
        <!--끝 -->
        
        <div class="row">
        
            <div class="img-holder">
                <div class="bg"></div>
                <div class="info-holder">
                </div>
            </div>
            
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <h3>도비에 오신 걸 환영합니다.</h3>
                        <p>Dobby is free</p>
                        <div>
                            <p class="active">ID 찾기</p>
                        </div>
                        
                        <form>
                         <input class="form-control" type="text" name="user_name" id ="name" placeholder="이름을 입력하세요" required>
                         <input class="form-control" type="text" name="user_phone" id ="phone"  placeholder="휴대폰번호를 입력하세요" required>

                            <div class="form-button">
                            
                             <button type="button" id="findId"
					           class="btn btn-block btn-primary btn-md pt-sm pb-sm text-md">완료
				             </button>
				             
                                <a href="forget2.html">Forget password?</a>
                                
                            </div>
                           
                        </form>
                         
                       <!--  <div class="other-links">
                            <span>Or login with</span><a href="#">Facebook</a><a href="#">Google</a><a href="#">Linkedin</a>
                        </div> -->
                    </div>
                </div>
            </div>
            
        </div>

    </div>
    
  
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>