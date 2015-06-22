<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	 function resultcheck(){
		alert('메시지가 발송되었습니다!.');
		window.close();
	 }
</script>
<body>
	<form action="sendmessage.daa">
		<input type="text" name="title" size="40" align="middle"><br>
		받는 사람 : ${param.id}
		<input type="text" name="id" value="${param.id}" hidden>
		<br><br>
		<textarea name="content" rows="10" cols="50"></textarea>
		<br>
		<input type="submit" value="보내기" onclick="resultcheck()">
		<input type="submit" value="닫기" onclick="window.close()">
	</form>
</body>
</html>