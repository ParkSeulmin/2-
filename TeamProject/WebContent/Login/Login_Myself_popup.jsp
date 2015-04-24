<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인 인증</title>
<<<<<<< HEAD

<script type="text/javascript">
=======
>>>>>>> branch 'master' of https://github.com/ParkSeulmin/2Team_Project.git
<%	String name = "";
	String msg = "";
	if ((String) request.getAttribute("result") != null) {
		msg = (String) request.getAttribute("result");
			if (msg == "본인 인증에 성공했습니다.") {
				name = (String) request.getAttribute("name1");
				}
			else{
				msg="본인 인증에 실패했습니다.";
			}
		}
		
%>
<<<<<<< HEAD
	
	/////얘가 팝업 된 녀석입니다.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=======
<script type="text/javascript">
	function insert(){
		opener.document.getElementById("name").value='<%=name%>';
		window.close();
	}
>>>>>>> branch 'master' of https://github.com/ParkSeulmin/2Team_Project.git
</script>
</head>
<body>

	<form action="MySelf.check">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" size="20" name="name" id="popname"></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="birthdate"></td>
				<td><input type="submit" value="본인확인"></td>
			</tr>
			<tr>
				<td><input type="button" value="확인"	onclick="insert()"></td>

			</tr>
		</table>
	</form>
	<div>
		<%=msg%>
		<%=name%>
		<!-- 본인확인에 대한 메세지  -->
	</div>
</body>
</html>
