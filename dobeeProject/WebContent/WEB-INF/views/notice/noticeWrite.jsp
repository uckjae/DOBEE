<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html >
<head>
<c:import url="/common/tag.jsp"/>
<!-- include libraries(jQuery, bootstrap) -->

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" 
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" 
    crossorigin="anonymous">
</script>

<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>

<!-- include Nobootstrap summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
<script src="./lang/summernote-ko-KR.js"></script>
<script src="./packages/summerfile/summernote-file.js"></script>
<title>write</title>


</head>

<script>
    $(document).ready(function() {
        $('#summernote').summernote({
        	
        	height: 350,
        	placeholder: "글을 입력하세요.",
        	lang: 'ko-KR', /*한국어*/ 
        	toolbar: [   /*summernote 글옵션 상자*/
        		  ['fontname'],
        		  ['fontsize'],
        		  ['font', ['bold', 'underline','italic','strikethrough','superscript','subscript']],  
        		  ['color', ['forecolor','backcolor']],
        		  ['para', ['ul', 'ol', 'paragraph','hr','height']],
        		  ['table', ['table']],
        		  ['insert', ['link', 'picture', 'video','file']],
        		  ['view', ['fullscreen', 'codeview', 'help']],
        		],
        	spellCheck: true,  /*맞춤법 검사 */
        	codemirror: { // codemirror options
        		    theme: 'monokai',
        		    htmlMode: true
        		  },
        	 callbacks: {
        		    onFileUpload: function(file){
        		    	myOwnCallBack(file[0]);
        		        },
        		    },    	       	
            });
        $.summernote.interface;
        
        function myOwnCallBack(file) {
            let data = new FormData();
            data.append("file", file);
            $.ajax({
                data: data,
                type: "POST",
                url: "file-uploader.php", //Your own back-end uploader
                cache: false,
                contentType: false,
                processData: false,
                xhr: function() { //Handle progress upload
                    let myXhr = $.ajaxSettings.xhr();
                    if (myXhr.upload) myXhr.upload.addEventListener('progress', progressHandlingFunction, false);
                    return myXhr;
                },
                success: function(reponse) {
                    if(reponse.status === true) {
                        let listMimeImg = ['image/png', 'image/jpeg', 'image/webp', 'image/gif', 'image/svg'];
                        let listMimeAudio = ['audio/mpeg', 'audio/ogg'];
                        let listMimeVideo = ['video/mpeg', 'video/mp4', 'video/webm'];
                        let elem;
         
                        if (listMimeImg.indexOf(file.type) > -1) {
                            //Picture
                            $('.summernote').summernote('editor.insertImage', reponse.filename);
                        } else if (listMimeAudio.indexOf(file.type) > -1) {
                            //Audio
                            elem = document.createElement("audio");
                            elem.setAttribute("src", reponse.filename);
                            elem.setAttribute("controls", "controls");
                            elem.setAttribute("preload", "metadata");
                            $('.summernote').summernote('editor.insertNode', elem);
                        } else if (listMimeVideo.indexOf(file.type) > -1) {
                            //Video
                            elem = document.createElement("video");
                            elem.setAttribute("src", reponse.filename);
                            elem.setAttribute("controls", "controls");
                            elem.setAttribute("preload", "metadata");
                            $('.summernote').summernote('editor.insertNode', elem);
                        } else {
                            //Other file type
                            elem = document.createElement("a");
                            let linkText = document.createTextNode(file.name);
                            elem.appendChild(linkText);
                            elem.title = file.name;
                            elem.href = reponse.filename;
                            $('.summernote').summernote('editor.insertNode', elem);
                        }
                    }
                }
            });
        }
         
        function progressHandlingFunction(e) {
            if (e.lengthComputable) {
                //Log current progress
                console.log((e.loaded / e.total * 100) + '%');
         
                //Reset progress on complete
                if (e.loaded === e.total) {
                    console.log("Upload finished.");
                }
            }
        }
       
        
    });
</script>




<body>

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
  <b-card-header header-tag="nav">
   <b-nav card-header pills>
	<b-nav-item active>공지사항</b-nav-item>
   </b-nav>
  </b-card-header>
 </div>
 
 <div class="content" style="margin-right: 85px; margin-left: 85px">
  <div class="comment-form-wrap pt-xl-2">
   <h1 class="text-center mb-3 bread">게시글 작성</h1>
   
   <form action="noticeWrite.do" method="post" enctype="multipart/form-data">
   
    <input type="text" class="form-control mb-3" id="title" name="title"
     placeholder="글 제목을 입력하시오" value="">
     
    <textarea id="summernote" name="content"></textarea>
    
    <div class="text-right" id="lengthBox"> 
	  <span id="total-characters"></span><span id="max"></span>
	</div>
	
    <div class ="text-center">
     <input type="submit" class="btn btn-primary mr-3" value="작성">
     <a class="btn btn-primary mr-3" href="noticeList.do">취소</a>
    </div>
    
   </form>
   
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