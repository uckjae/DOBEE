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
	Hello world! File Upload!! 
</h1>

<form id="multiform" action="fileUpload2" method="post" enctype="multipart/form-data">
	이름 : <input type="text" name="title" /> <br/><br/>
    파일 : 
    <input type="file" name="file" />
    <br/><br/>
    <input type="button" value="서버전달1" onclick="fnAction('fileUpload1')"/>
    <input type="button" value="서버전달2" onclick="fnAction('fileUpload2')"/>
</form>
<script>
	function fnAction(url) {
		var frm = document.getElementById("multiform");
		frm.action = url;
		frm.submit();
		
	}
</script>
</body>
</html>
