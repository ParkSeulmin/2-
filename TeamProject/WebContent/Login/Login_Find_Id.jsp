<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ID찾기 페이지</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script type="text/javascript">
		
		
		$(function() {
			$("#idfindbtn").click(function() {
				<% Member mb= (Member)request.getAttribute("member");%>
				console.log(<%=mb%>);
				$.ajax({
					method : "GET",
					url : "find_id.check",
					dataType : "html",
					success : function(data) { //서버가 보낸 data
						if(<%=mb%> != null){
							$('#respan').text("Email로 당신의 ID가 발송 되었습니다.");}
						else{
							$('#respan').text("일치하지 않습니다..");
						}
					}
				});
			});
		});
	</script>
</head>
<body>
	<form action="find_id.check">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" size="20" name="name" readonly id="name"></td>
				<td colspan="2"><input type="button" id="selfcheck" value="본인확인" 
				onclick="window.open('Login_Myself_popup.jsp','zip','width=500 height=200')"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email"></td>
				<td>@</td>
				<td><input type="text" name="email_domain" size="20"></td>
			</tr>
			<tr>
				<td><input type="button" id="idfindbtn" value="아이디 찾기"></td>
				<td><input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
	<span id="respan"></span>
</body>
</html>