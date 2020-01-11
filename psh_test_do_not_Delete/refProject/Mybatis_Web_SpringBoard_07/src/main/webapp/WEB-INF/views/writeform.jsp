<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 쓰기</title>
<script type="text/javascript">
	function board_write(){
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
<h1>글 쓰기</h1>
<a href="list.htm">리스트</a>
<form name = "writeform" action="write.htm" method="post">
<table width="600">
	<tr>
		<th>이름</th>
		<td>
			<input type="text" name="name" maxlength="5" size="12"/>
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
			<input type="text" name="email" maxlength="30"  size="30"/>
		</td>
	</tr>
	
	
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="subject" maxlength="50" size="65"/>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="content" rows="5" cols="50"></textarea>
		</td>
	</tr>
	<tr>
		
		<td colspan="2">
			<input type="button" value="쓰기" onclick="board_write()"/>
			<input type="reset" value="취소" />
		</td>
	</tr>
	

</table>


</form>
</body>
</html>