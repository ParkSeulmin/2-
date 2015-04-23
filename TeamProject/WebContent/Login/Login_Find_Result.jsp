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
	String id="";
	String name="";
	String email="";
	String msg="";
	
	if (member.getId()!=null){
		msg="일치 합니다.";
		id=member.getId();
		name=member.getName();
		email=member.getEmail();
		
	}
	else{
		msg="값이 틀렸당";
	}
	%> 
	
</head>
<body>

	msg :<%=msg %><br>
	너의 ID값 : <%=id %><br>
	너의 Name 값 : <%=name %><br>
	너의 email 값 : <%=email %><br> 
	
</body>
</html>