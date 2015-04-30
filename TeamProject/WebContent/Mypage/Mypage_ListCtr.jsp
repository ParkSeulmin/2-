<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//session.setAttribute("user", "HYEJUNG22");//test용 계정
	//String user=(String)session.getAttribute("user");
	//request.setAttribute("user", "HYEJUNG22");
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- <body>
	<h3>현재의 나 :<%=session.getAttribute("user")%></h3><br>
	<a href='CheckArrow.daa?user=<%=session.getAttribute("user")%>'>친구 요청받은 리스트</a><br>
	<hr>
	<a href='CheckSendArrow.daa?user=<%=session.getAttribute("user")%>'>내가 요청한 친구 리스트</a><br>
	
</body> --%>
<body>
<%
	Member member=(Member)session.getAttribute("user");
	String userid=member.getId();
%>
	<h3>현재의 나 :<%=userid%></h3><br>
	<a href='CheckArrow.daa?user=<%=userid%>'>친구 요청받은 리스트</a><br>
	<hr>
	<a href='CheckSendArrow.daa?user=<%=userid%>'>내가 요청한 친구 리스트</a><br>
	
</body>
</html>