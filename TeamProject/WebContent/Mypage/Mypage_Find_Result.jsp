<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<%
		Member member=(Member)request.getAttribute("member");
		String id=member.getId();
		String name=member.getName();
		String email=member.getEmail();
		
	%> 
	
</head>
<body>

<%=id %>
	<%=name %>
	<%=email %> 
</body>
</html>