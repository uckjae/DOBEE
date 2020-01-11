<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>단일검색하기</h3>
	<form action="guest.do?cmd=search" method="post">
		<select name="column">
			<option value="name">작성자</option>
			<option value="email">메일</option>
			<option value="home">홈페이지</option>
		</select>
		<input type="text" name="keyvalue">
		<input type="submit" value="검색">
	</form>

<h3>다중검색하기</h3>
	검색: where name='kglim' or email='naver' or home='kosta'
	<form action="guest.do?cmd=search2" method="post">
		<input type="checkbox" name="name" value="name" checked>작성자
		<input type="checkbox" name="email" value="email" >메일
		<input type="checkbox" name="home" value="home" >홈페이지
		<br>
		검색어:<input type="text" name="keyvalue">
		<input type="submit" value="검색">
	</form>

<hr>
	<table border="1" width="600">
		<tr>
			<td>NUM</td>
			<td>Writer</td>
			<td>Email</td>
			<td>HomePage</td>
			<td>Detail</td>
			<td>Delete</td>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.no}</td>
				<td>${list.name}</td>
				<td>${list.email}</td>
				<td>${list.home}</td>
				<td><a href="javascript:location.href='guest.do?cmd=detail&no=${list.no}'">상세보기</a></td>
				<td><a href="javascript:location.href='guest.do?cmd=delete&no=${list.no}'">삭제하기</a></td>
			</tr>
		</c:forEach>
	</table>	
	<a href="WriteForm.html">글쓰기</a>
</body>
</html>