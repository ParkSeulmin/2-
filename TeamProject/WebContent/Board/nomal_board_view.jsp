<%@page import="Board.DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Board board = (Board)request.getAttribute("boarddata");
%>

<html>
<head>
	<title>MVC 게시판</title>
</head>

<body>
<c:import url="/Include/Header.jsp" />
	<div style="padding: 200px;"> <!-- 임의임의임의  -->
<!-- 게시판 수정 -->
		<table cellpadding="0" cellspacing="0">
			<tr align="center" valign="middle">
				<td colspan="5">MVC 게시판</td>
			</tr>
			
			<tr>
				<th style="font-family:돋음; font-size:12" height="20">
					<div align="center">제 목&nbsp;&nbsp;</div>
				</th>
				
				<td style="font-family:돋음; font-size:12">
				<%=board.getBo_title()%>
				</td>
				
			</tr>
			<tr>
				<th style="font-family:돋음; font-size:12" height="20">
					<div align="center">조회수&nbsp;&nbsp;</div>
				</th>
				
				<td style="font-family:돋음; font-size:12">
					<%=board.getBo_count()%>
				</td>

			</tr>
			<tr>
				<th style="font-family:돋음; font-size:12" height="20">
					<div align="center">작성일&nbsp;&nbsp;</div>
				</th>
				
				<td style="font-family:돋음; font-size:12">
					<%=board.getBo_date()%>
				</td>

			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height:1px;">
				</td>
			</tr>
			
			<tr>
				<th style="font-family:돋음; font-size:12">
					<div align="center">내 용</div>
				</th>
				<td style="font-family:돋음; font-size:12">
					<table border=0 width=490 height=250 style="table-layout:fixed">
						<tr>
							<td valign=top style="font-family:돋음; font-size:12">
							<%=board.getBo_content() %>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<th style="font-family:돋음; font-size:12">
					<div align="center">첨부파일</div>
				</th>
				<td style="font-family:돋음; font-size:12">
				<%-- <%if(!(board.getBOARD_FILE()==null)){ %>
				<a href="./boardupload/<%=board.getBOARD_FILE()%>">
					<%=board.getBOARD_FILE() %>
				</a>
				<%} %> --%>
				</td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height:1px;"></td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr align="center" valign="middle">
				<td colspan="5">
					<font size=2>
					<a href="./BoardReplyAction.bo?num=<%=board.getBo_no() %>">
					[답변]
					</a>&nbsp;&nbsp;
					<a href="./BoardModify.bo?num=<%=board.getBo_no() %>">
					[수정]
					</a>&nbsp;&nbsp;
					<a href="./BoardDeleteAction.bo?num=<%=board.getBo_no() %>"
					>
					[삭제]
					</a>&nbsp;&nbsp;
					<a href="./BoardList.bo?boardtype=<%=board.getBo_id() %>">[목록]</a>&nbsp;&nbsp;
					</font>
				</td>
			</tr>
		</table>
<!-- 게시판 수정 -->
	</div>
<c:import url="/Include/Footer.jsp" />
</body>
</html>