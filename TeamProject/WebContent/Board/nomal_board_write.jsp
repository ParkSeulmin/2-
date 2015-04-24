<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	//String id=(String)session.getAttribute("id"); 
	// 일단 wirte 기능을 처리하기 위해
	//String id = request.getParameter("id");
	String id = "HYEJUNG22";

	int boardtype = Integer.parseInt(request.getParameter("boardtype"));
	System.out.println("write boardtype: "+boardtype);
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>MVC 게시판</title>
	<script type="text/javascript" 
	src="<%=request.getContextPath()%>/Board/ckeditor/ckeditor.js">
	</script>
	<script language="javascript">
		function addboard(){
			
			
			var ckeditor = CKEDITOR.instances['bo_content']; //객체가져오기
	        if (ckeditor.getData()=="") {//null값은 안옴 = 빈문자열
	             alert("글 내용을 입력하세요");
	             ckeditor.focus();
	             return false;
	        }
			
			boardform.submit();
		}
	
		
	</script>
</head>
<body>
<c:import url="/Include/Header.jsp" />
<<<<<<< HEAD
	<div style="padding: 200px;"> <!-- 임의임의임의  -->
		<!-- 게시판 등록 -->
		<form action="./BoardAddAction.bo?boardtype=<%=boardtype%>" method="post" 
			enctype="multipart/form-data" name="boardform">
		<input type="hidden" name="BOARD_ID" value="<%=id %>">
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr align="center" valign="middle">
				<td colspan="5">MVC 게시판</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center">글쓴이</div>
				</td>
				<td>
					<input id="bo_writer" name="bo_writer" type="text" size="50" maxlength="100" 
						value="<%=id %>" readonly/>
						
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center">제 목</div>
				</td>
				<td>
					<input id="bo_title" name="bo_title" type="text" size="50" maxlength="100" 
						value=""/>
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12">
					<div align="center">내 용</div>
				</td>
				<td>
					<textarea id="bo_content" name="bo_content" cols="80" rows="15"></textarea>
=======
	<div style="padding: 200px;"> <!-- 임의임의임의  -->
		<!-- 게시판 등록 -->
		<form action="./BoardAddAction.bo" method="post" 
			enctype="multipart/form-data" name="boardform">
		<input type="hidden" name="BOARD_ID" value="<%=id %>">
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr align="center" valign="middle">
				<td colspan="5">MVC 게시판</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center">글쓴이</div>
				</td>
				<td>
					<%=id %>
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center">제 목</div>
				</td>
				<td>
					<input id="bo_title" name="bo_title" type="text" size="50" maxlength="100" 
						value=""/>
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12">
					<div align="center">내 용</div>
				</td>
				<td>
					<textarea id="bo_content" name="bo_content" cols="80" rows="15"></textarea>
>>>>>>> branch 'master' of https://github.com/ParkSeulmin/2Team_Project.git
					<script>
					 CKEDITOR.replace('bo_content',{
				            toolbar: 'Full'
				            
				            
				        }
				    );
					</script>
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12">
					<div align="center">파일 첨부</div>
				</td>
				<td>
					<input id="bo_file" name="bo_file" type="file"/>
				</td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height:1px;">
				</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr align="center" valign="middle">
				<td colspan="5">
					<a href="javascript:addboard()">[등록]</a>&nbsp;&nbsp;
					<a href="javascript:history.back()">[뒤로]</a>
				</td>
			</tr>
		</table>
		</form>
		<!-- 게시판 등록 -->
	</div>
<c:import url="/Include/Footer.jsp" />
</body>
</html>
