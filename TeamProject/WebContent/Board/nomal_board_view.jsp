<%@page import="java.util.List"%>
<%@page import="Board.DTO.Reply"%>
<%@page import="Board.DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Board board = (Board)request.getAttribute("boarddata");
	List replyList=(List)request.getAttribute("replylist");

	System.out.println("board_view bo_no: "+board.getBo_no());

	String userid=null;
	if(session.getAttribute("userid")!=null){
		userid=(String)session.getAttribute("userid");
	} 
%>

<html>
<head>
	<title>MVC 게시판</title>
	
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
   
	  <!--  -->
 
    <script src="<%=request.getContextPath() %>/js/jquery.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style type="text/css">
	
		#tnb {float:right;margin:0;padding:0;list-style:none;zoom:1}
		#tnb li {float:left;margin:0px}
		#tnb a {display:inline-block;padding:11px 10px;color:#a1a1a4;letter-spacing:0em;font-size:10px;font-family:tahoma}
		#tnb a:focus, #tnb a:hover, #tnb a:active {text-decoration:none}
	
	</style>
  	<script>+
	    $('.carousel').carousel({
	        interval: 5000 //changes the speed
	    })
    </script>
	
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
				<%if(!(board.getBo_file()==null)){ %>
					<%-- <a href="./boardupload/<%=board.getBo_file()%>"> --%>
					<a href="Board/filedownlaod.jsp?file_name=<%=board.getBo_file()%>">
						<%=board.getBo_file()%>
					</a>
				<%} %>
				</td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height:1px;"></td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr align="center" valign="middle">
				<td colspan="5">
					<font size=2>
					<%-- <a href="./BoardReplyAction.bo?num=<%=board.getBo_no() %>">
					[답변]
					</a>&nbsp;&nbsp; --%>
					<a href="./BoardModify.bo?num=<%=board.getBo_no()%>">
					[수정]
					</a>&nbsp;&nbsp;
					<a href="./BoardDeleteAction.bo?num=<%=board.getBo_no()%>&boardtype=<%=board.getBo_id()%>"
								id="deletemenu">
					[삭제]
					</a>&nbsp;&nbsp;
					<a href="./BoardList.bo?boardtype=<%=board.getBo_id() %>">[목록]</a>&nbsp;&nbsp;
					</font>
				</td>
			</tr>
		</table>
		<p>
		
		</p>

<!-- 게시판 수정 -->
		<!--  꼬리글 달기 테이블 -->
		<form name="reply" action="ReplyWrite.bo" method="POST">
			<input type="hidden" name="bo_no" name="bo_id" value="<%=board.getBo_no()%>">
			<input type="hidden" name="re_writer" id="re_writer" value="${userid}"> <!-- 임의 아이디 -->
			<!-- hidden data -->
			<table>
				<tr bgcolor="cccccc" >
					<td  colspan="2" style="height:1px;" width=500>
					</td>
				</tr>
				<tr>
					<th  colspan="2" style="font-family:돋음; font-size:12; font-align: center;" height="20"  width=500>
						댓글 달기
					</th>
				</tr>
				<tr bgcolor="cccccc" >
					<td   colspan="2" style="height:1px;" width=500>
					</td>
				</tr>
				<tr>
					<td align="left" style="font-family:돋음; font-size:12; font-align: center;">
						내&nbsp;&nbsp;용 : <textarea name="re_content" rows="1" cols="50"></textarea>
					</td>
					<td>
						<input type="submit" value="등록">
					</td>
				</tr>
				<tr bgcolor="cccccc" >
					<td   colspan="2" style="height:1px;" width=500>
					</td>
				</tr>
			</table>
		</form>
		 <br>
 		<!-- 꼬리글 목록 테이블 -->
 		<table>
				<tr bgcolor="cccccc" >
					<td  colspan="2" style="height:1px;" width=500>
					</td>
				</tr>
				<tr>
					<th  colspan="2" style="font-family:돋음; font-size:12; font-align: center;" height="20"  width=500>
						댓글 
					</th>
				</tr>
				<tr bgcolor="cccccc" >
					<td   colspan="2" style="height:1px;" width=500>
					</td>
				</tr>
				<%if(replyList.size() > 0){	
						for(int i=0; i<replyList.size(); i++){
							Reply reply=(Reply)replyList.get(i); 
				%>
				<tr align="left" style="font-family:돋음; font-size:12; font-weight: bold;">
					<td><%= reply.getRe_writer() %>:</td>
					<td align="right">
						<a href="./ReplyDeleteAction.bo?replynum=<%=reply.getR_no()%>&bo_no=<%=board.getBo_no()%>">[삭제]</a>
					</td>
				</tr>
				<tr align="left" style="font-family:돋음; font-size:12;">
					<td >
						&nbsp;&nbsp;&nbsp;&nbsp;<%=reply.getRe_content() %> 
					</td>
					<td align="right"><%=reply.getRe_date() %></td>
				</tr>
				<%		}
				   }else{ 
				%>	
					<tr bgcolor="cccccc" >
					<td   colspan="2" style="height:1px;" width=500>
					</td>
					</tr>
					<tr>
					<td  colspan="2" style="font-family:돋음; font-size:12;" align="center" height="20"  width=500>
						댓글이 존재하지 않습니다. 
					</td>
					</tr>
				<%
					}
				%>
				<tr bgcolor="cccccc" >
					<td   colspan="2" style="height:1px;" width=500>
					</td>
				</tr>
			</table>
	</div>
<c:import url="/Include/Footer.jsp" />
</body>

</html>
