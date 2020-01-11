<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정</title>

<script type="text/javascript">
	function board_update(){
		//alert("쓰기")	;
		if(document.writeform.name.value==""){
			alert("이름을 입력해주세요");
		}else if(document.writeform.pwd.value==""){
			alert("비밀번호을 입력해주세요");
			document.writeform.pwd.focus();
		}else if(document.writeform.email.value==""){
			alert("이메일을 입력해주세요");
			document.writeform.email.focus();
		}else if(document.writeform.subject.value==""){
			alert("제목을 입력해주세요");
			document.writeform.subject.focus();
		}else if(document.writeform.content.value==""){
			alert("내용을 입력해주세요");
			document.writeform.content.focus();
		}else{
			document.writeform.submit(); //전송
		}
	}
</script>
<style type="text/css">
	th {text-align: right; background: orange}

</style>

</head>
<body>
<h1>글 수정</h1>
<form name = "writeform" action="update.htm" method="post">
<table width="600">
	<tr>
		<th>이름</th>
		<td>
		
			<input type="hidden" name="pg" value="${pg}"/>
			<input type="hidden" name="num" value="${b.num}"/>
			<input type="text" name="name" maxlength="5" size="12" value="${b.name}"/>
		</td>
	</tr>
	
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" name="pwd" maxlength="12"  size="13"/>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
			<input type="text" name="email" maxlength="30"  size="30" value="${b.email}" />
		</td>
	</tr>
	
	
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="subject" maxlength="50" size="65" value="${b.subject}" />
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="content" rows="5" cols="50">${b.content}</textarea>
		</td>
	</tr>
	<tr>
		
		<td colspan="2">
			<input type="button" value="수정" onclick="board_update()"/>
			<input type="reset" value="취소" />
		</td>
	</tr>
	

</table>


</form>


</body>
</html>