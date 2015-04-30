<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<%
		response.sendRedirect("MemberInfo.daa?id="+request.getParameter("id"));
	%>
	<!-- load되자마자 다른 페이지로 넘기기 위해서 만든 페이지
		이 페이지가 없으면 무한 반복으로 같은 페이지를 호출하게된다. -->
</head>
<body>
</body>
</html>