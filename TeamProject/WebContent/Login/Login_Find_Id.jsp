<%@page import="Login.DTO.Member"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<% 
		Member member=(Member)request.getAttribute("result");
		String name=member.getName();
	%>
</head>
<body>
	<form action="find_id.check">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" size="20" name="name" value="<%=name %>"></td>
				<!-- 테스트하기 위해 readonly 풀어 둠  -->
				<td colspan="2"><input type="button" value="본인확인"></td>
			</tr>
			<tr>

				<td>이메일</td>
				<td><input type="text" name="email"></td>
				<td><input type="text" size="1" value="@" disabled="disabled"></td>
				<td><input type="text" name="email_domain" size="20"></td>
			</tr>
			<tr>
				<td><input type="submit" value="아이디 찾기"></td>
				<td><input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>