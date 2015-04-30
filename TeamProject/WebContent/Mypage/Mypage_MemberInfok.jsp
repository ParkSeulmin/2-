<%@page import="java.io.PrintWriter"%>
<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<%
		Member member=(Member) request.getAttribute("memberinfo");
		String gender="F";
		if(member.getGender()==1){
			gender="M";
		}
	%>
</head>
<body>
	<table border="1">
		<tr><th>name</th><th>sex</th><th>mail</th><th>age</th><th>addr</th></tr>
		<tr><td><%=member.getName()%></td><td><%=gender %></td>
		
			<td><%=member.getEmail() %></td><td><%=member.getAge() %></td>
			<td><%=member.getAddress() %></td></tr>
	</table>
	<input align="middle" type="button" value="close" onclick="window.close()">
</body>
</html>