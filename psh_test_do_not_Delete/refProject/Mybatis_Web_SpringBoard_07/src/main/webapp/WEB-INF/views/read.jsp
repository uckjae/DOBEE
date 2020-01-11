<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	th { text-align: left ; background:orange;}
	textarea { background-color: #ddd; border:1px solid blick;}
</style>
<script type="text/javascript">
function board_update(){
	//alert("수정");
	location.href="updateform.htm?num=${b.num}&pg=${pg}";
	
}
function board_delete(){
	//alert("삭제");
	location.href="deleteform.htm?num=${b.num}&pg=${pg}";
}
function board_reply(){
	//alert("답변");
	location.href="replyform.htm?num=${b.num}&pg=${pg}";
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 읽기</title>
</head>
<body>
<h1>글 읽기</h1>

<a href="list.htm?pg=${pg}"> 리스트 </a>
<table width="500">

	<tr>		
		<th colspan="4">
			${b.subject}
		</th>
	</tr>
	
	<tr>
		<td width="20%"><!-- 이름 -->${b.name}</td>
		<td><!-- 이메일 -->${b.email}</td>
		<td width="15%"><!-- 날짜 -->${b.regdate}</td>
		<td width="15%"><!-- 히트 -->${b.hit} hit</td>
	</tr>
	

	<tr>
		
		<td colspan="4">
			<textarea rows="10" cols="60" readonly="readonly">${b.content}</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="right">
			<input type="button" value="수정" onclick="board_update()"/>
			<input type="button" value="삭제" onclick="board_delete()"/>
			<!-- <input type="button" value="답변" onclick="board_reply()"/> -->
		</td>
	</tr>
	
</table>



</body>
</html>