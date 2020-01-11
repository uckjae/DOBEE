<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String board_msg = (String)request.getAttribute("board_msg");
  String board_url = (String)request.getAttribute("board_url");
  
  if(board_msg != null && board_url != null){
%>
	<script>
		alert('<%= board_msg %>');		
	    location.href='<%=board_url%>';
	</script>
<%	  
  }
%>