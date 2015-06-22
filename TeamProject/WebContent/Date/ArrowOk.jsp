<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	Member member = (Member)request.getAttribute("member");
	String name = member.getName();
	String phone = member.getPhone();
	String nick = member.getNick();
	String email = member.getEmail();
	int age = member.getAge();
	String add = member.getAddress();
%>
</head>
<body>
<fieldset>
	<legend>보내는 사람</legend>
	이름 : <%=name %><br>
	전화번호 : <%=phone %><br>
	닉네임 : <%=nick %><br>
	이메일 : <%=email %><br>
	나이 : <%=age %><br>
	주소 : <%=add %><br>
</fieldset>
</body>
</html>