<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")){ //값이 없거나, admin이 아니면
		//강제로 페이지 이동
		//response.sendRedirect("index.jsp");
		out.print("<script>");
			out.print("alert('관리자만 접근 가능합니다.');");	
			out.print("location.href='index.jsp'");	
		out.print("</script>");
	}
%>