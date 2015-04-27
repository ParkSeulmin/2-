<%@page import="Board.DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	//String id=(String)session.getAttribute("id");
	String id ="HYEJUNG22";
	Board board = (Board)request.getAttribute("boarddata");
	System.out.println(board.getBo_no());
%>

<html>
<head>
	<title>MVC 게시판</title>
	<script type="text/javascript">
	function modifyboard(){
		
		if (!modifyform.BOARD_SUBJECT.value) {
			alert("제목을 입력하세요");
			modifyform.BOARD_SUBJECT.focus();
			return false;
		}
		
		var ckeditor = CKEDITOR.instances['BOARD_CONTENT']; //객체가져오기
        if (ckeditor.getData()=="") {//null값은 안옴 = 빈문자열
             alert("글 내용을 입력하세요");
             ckeditor.focus();
             return false;
        }
		
		
		modifyform.submit();
	}
	
	</script>
	
</head>

<body>
<script type="text/javascript" 
	src="<%=request.getContextPath()%>/Board/ckeditor/ckeditor.js">
	</script>
<c:import url="/Include/Header.jsp" />
	<div style="padding: 200px;"> <!-- 임의임의임의  -->
		<!-- 게시판 수정 -->
		<form action="BoardModifyAction.bo" method="post" name="modifyform">
		<input type="hidden" name="BOARD_NUM" value="<%=board.getBo_no() %>">
		<input type="hidden" name="BOARD_ID" value="<%=id %>">
		
		<table cellpadding="0" cellspacing="0">
			<tr align="center" valign="middle">
				<td colspan="5">MVC 게시판</td>
			</tr>
			<tr>
				<td height="16" style="font-family:돋음; font-size:12">
					<div align="center">제 목</div>
				</td>
				<td>
					<input name="BOARD_SUBJECT" size="50" maxlength="100" 
						value="<%=board.getBo_title()%>">
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12">
					<div align="center">내 용</div>
				</td>
				<td>
					<textarea name="BOARD_CONTENT" cols="80" rows="15"><%=board.getBo_content() %></textarea>
					 <script type="text/javascript">
						 CKEDITOR.replace('BOARD_CONTENT',{
					            toolbar: 'Full'
					        }
					    );
					 </script>
				</td>
			</tr>
			<%if(!(board.getBo_file()==null)){ %>
			<tr>
				<td style="font-family:돋음; font-size:12">
					<div align="center">파일 첨부</div>
				</td>
				<td>
					&nbsp;&nbsp;<%=board.getBo_file() %>
				</td>
			</tr>
			<%} %>
			
			<tr bgcolor="cccccc">
				<td colspan="2" style="height:1px;">
				</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			
			<tr align="center" valign="middle">
				<td colspan="5">
					<font size=2>
					<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
					<a href="./BoardList.bo?boardtype=<%=board.getBo_id() %>">[뒤로]</a>&nbsp;&nbsp;
					</font>
				</td>
			</tr>
		</table>
		</form>
		<!-- 게시판 수정 -->
	</div>
<c:import url="/Include/Footer.jsp" />
</body>
</html>