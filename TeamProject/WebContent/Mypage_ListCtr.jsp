<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	session.setAttribute("user", "HYEJUNG22");
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	현재의 나 :<%=session.getAttribute("user")%>
	<a href='CheckArrow.daa?user=<%=session.getAttribute("user")%>'>친구 요청받은 리스트</a><br>
</body>
</html>