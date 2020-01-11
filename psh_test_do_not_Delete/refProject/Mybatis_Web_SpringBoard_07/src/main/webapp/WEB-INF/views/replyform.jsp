<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="kr.co.mycom.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답변</title>

<script type="text/javascript">
function board_reply(){
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
<h1> 답변 </h1>
<a href="list.htm?pg=${param.pg}">리스트</a> 
<form name = "writeform" action="reply.htm" method="post">
<table width="600">
	<tr>
		<th>이름</th>
		<td>
			<!-- 히든 필드로 정보 보내기 -->
			<input type="hidden" name="pg" value="${pg}"/>
			<input type="hidden" name="parent" value="${b.parent}"/>
			<input type="hidden" name="sort" value="${b.sort}"/>
			<input type="hidden" name="tab" value="${b.tab}"/>
			<!-- 히든 필드로 정보 보내기 -->
			
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
			<input type="text" name="subject" maxlength="50" size="65" value="RE:${b.subject}"/>
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
			<input type="button" value="답변" onclick="board_reply()"/>
			<input type="reset" value="취소" />
			<a href="list.htm?pg=${param.pg}">리스트</a>
		</td>
	</tr>
	

</table>


</form>


</body>
</html>