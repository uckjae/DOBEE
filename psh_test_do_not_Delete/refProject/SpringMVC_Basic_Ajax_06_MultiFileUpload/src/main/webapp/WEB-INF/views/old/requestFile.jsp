<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
</head>
<body>
<h1>
	업로드 완료  
</h1>
	이름 : ${name} <br/><br/>
	<c:if test="${not empty fileName}">
	
	파라미터이름: ${paramName} <br/>
	파일명:	${fileName }<br/>
	파일사이즈: ${fileSize}<br/>
	
	<a href="${downlink }">다운로드</a>
	</c:if>
</body>

</html>
