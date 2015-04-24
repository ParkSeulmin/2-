<%@page import="Board.DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	/* String id=null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	} */
	List boardList=(List)request.getAttribute("boardlist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
%>

<html>
<head>
	<title>MVC 게시판</title>
</head>

<body>
<c:import url="/Include/Header.jsp" />
	<div style="padding: 200px;"> <!-- 임의임의임의  -->
		<!-- 게시판 리스트 -->
		<table width=570 border="0" cellpadding="0" cellspacing="0">
			<tr align="center" valign="middle">
				<td colspan="4">MVC 게시판</td>
				<td align=right>
					<font size=2>글 개수 : ${listcount }</font>
				</td>
			</tr>
			
			<tr align="center" valign="middle" bordercolor="#333333">
				<td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
					<div align="center">번호</div>
				</td>
				<td style="font-family:Tahoma;font-size:8pt;" width="50%">
					<div align="center">제목</div>
				</td>
				<td style="font-family:Tahoma;font-size:8pt;" width="14%">
					<div align="center">작성자</div>
				</td>
				<td style="font-family:Tahoma;font-size:8pt;" width="17%">
					<div align="center">날짜</div>
				</td>
				<td style="font-family:Tahoma;font-size:8pt;" width="11%">
					<div align="center">조회수</div>
				</td>
			</tr>
			
			<%
				for(int i=0;i<boardList.size();i++){
					Board bl=(Board)boardList.get(i);
			%>
			<tr align="center" valign="middle" bordercolor="#333333"
				onmouseover="this.style.backgroundColor='F8F8F8'"
				onmouseout="this.style.backgroundColor=''">
				<td height="23" style="font-family:Tahoma;font-size:10pt;">
					<%=bl.getBo_no()%>
				</td>
				
				<td style="font-family:Tahoma;font-size:10pt;">
					<div align="left">
					
					<a href="./BoardDetailAction.bo?num=<%=bl.getBo_no()%>">
						<%=bl.getBo_title()%>
					</a>
					</div>
				</td>
				
				<td style="font-family:Tahoma;font-size:10pt;">
					<div align="center"><%=bl.getBo_writer() %></div>
				</td>
				<td style="font-family:Tahoma;font-size:10pt;">
					<div align="center"><%=bl.getBo_date() %></div>
				</td>	
				<td style="font-family:Tahoma;font-size:10pt;">
					<div align="center"><%=bl.getBo_count() %></div>
				</td>
			</tr>
			<%} %>
			<tr align=center height=20>
				<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
					<%if(nowpage<=1){ %>
					[이전]&nbsp;
					<%}else{ %>
					<a href="./BoardList.bo?page=<%=nowpage-1 %>">[이전]</a>&nbsp;
					<%} %>
					
					<%for(int a=startpage;a<=endpage;a++){
						if(a==nowpage){%>
						[<%=a %>]
						<%}else{ %>
						<a href="./BoardList.bo?page=<%=a %>">[<%=a %>]</a>
						&nbsp;
						<%} %>
					<%} %>
					
					<%if(nowpage>=maxpage){ %>
					[다음]
					<%}else{ %>
					<a href="./BoardList.bo?page=<%=nowpage+1 %>">[다음]</a>
					<%} %>
				</td>
			</tr>
			<tr align="right">
				<td colspan="5">
					<%-- <%if(id!=null && id.equals("admin")){%>
						<a href="./MemberListAction.me">[회원관리]</a>
					<%}%> --%>
			   		<a href="./BoardWrite.bo">[글쓰기]</a>
				</td>
			</tr>
		</table>
	</div>
<c:import url="/Include/Footer.jsp" />
</body>
</html>