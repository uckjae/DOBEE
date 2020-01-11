<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%session.setAttribute("login", "login");%>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    
    <!-- Google fonts - Popppins for copy-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
    
    <!-- orion icons-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/orionicons.css">
    
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.red.css" id="theme-stylesheet">
    
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/custom.css">
    
    <!-- Favicon-->
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/img/favicon.png?3">
    
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
  <c:set var="id" value="${sessionScope.id}"/>
  
    <%-- <c:set var="id" value="${fn:trim(id)}"/> --%>
  
    <!-- navbar-->
    <header class="header">
      <nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow">
         <a href="#" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead"><i class="fas fa-align-left"></i></a>
         <a href="index.jsp" class="navbar-brand font-weight-bold text-uppercase text-base">Team_5</a>
        <ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
           
           <c:choose>
           	<c:when test="${id!=null}" >
           		 ${id}님 반갑습니다<br>
           	</c:when>
           	<c:otherwise>
           		환영합니다~~
           	</c:otherwise>
           </c:choose>
           
          <li class="nav-item dropdown ml-auto">
             <a id="userInfo" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">
             <img src="img/avatar.png" alt="Jason Doe" style="max-width: 2.5rem;" class="img-fluid rounded-circle shadow"></a>
             
             <c:choose>
   				<c:when test="${id!=null}">
   					<div aria-labelledby="userInfo" class="dropdown-menu">
   						
      					<c:if test="${id=='admin'}" >
      						<a href="empList.do" class="dropdown-item">List</a><!-- select 처리로.. -->
      						<a href="empAdd.do" class="dropdown-item">Register</a><!-- 등록화면으로.. -->
      					</c:if>
      					
      					<a href="adminLogout.do" class="dropdown-item">Logout</a>
      					<!-- 로그아웃 처리로.. -->
                  	</div>
				</c:when>
   				<c:otherwise>
      				<div aria-labelledby="userInfo" class="dropdown-menu">              
						<a href="emplist.do" class="dropdown-item">Search</a>
						<a href="empAdd.do" class="dropdown-item">Register</a><!-- 등록화면으로.. -->
						<a href="multiple.do" class="dropdown-item">Multiple</a>
						<!-- 로그인 화면으로... -->           
					</div>
   				</c:otherwise>
			</c:choose>
			 
          </li>
          
        </ul>
      </nav>
    </header>