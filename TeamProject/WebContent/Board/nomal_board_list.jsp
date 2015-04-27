<%@page import="Board.DTO.Reply"%>
<%@page import="Board.DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String userid=null;
	if(session.getAttribute("userid")!=null){
		userid=(String)session.getAttribute("userid");
	} 
	List boardList=(List)request.getAttribute("boardlist");
	List replylistnum = (List)request.getAttribute("replylistnum");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
	int boardtype = ((Integer)request.getAttribute("boardtype")).intValue();
	
	String boardname = (String)request.getAttribute("boardname");
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><%= boardname %></title>
	  
	  
	  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>board</title>
   
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
		#tnb #welcomeuser {display:inline-block;padding:11px 10px;color:#a1a1a4;letter-spacing:0em;font-size:10px;font-family:tahoma}
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
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
	  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>	
	<!-- <div style="padding: 200px;"> 임의임의임의  -->
	<input type="hidden" id="sessionid" value="<%=userid %>">	
		<!-- 게시판 리스트 -->
		<table width=570 border="0" cellpadding="0" cellspacing="0">
			<tr align="center" valign="middle">
				<td colspan="4"><%=boardname%></td>
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
					int rl=(Integer)replylistnum.get(i);					
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
							&nbsp;[<%=rl%>]
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
			<%		} 
				
			%>
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
					<c:choose>
						<c:when test="${userid != null}">
							<a href="./BoardWrite.bo?boardtype=<%=boardtype%>" id="writeboard">[글쓰기]</a>
						</c:when>
						<c:otherwise>
						    <a href="#" id="writeboarderror">[글쓰기]</a>
						</c:otherwise>
					</c:choose>
					
					<div  id="dialog-message" title="글쓰기">
					  <p>
					    <span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
					    	회원만 게시물 등록이 가능합니다^ ^
					  </p>
					  <p>
					     <b>로그인 해주세요^ ^</b>.
					  </p>
					</div>
					
					<script>
					  	$(function(){
							
							$("#dialog-message").dialog({
									 autoOpen: false,
									 modal: true,
									 buttons: {
										Ok: function() {
											//$('#writeboard').attr("href", "#");
											$( this ).dialog( "close" );
										
										}
								     }
								});
							
						   	$('#writeboarderror').click(function(){
						   			$("#dialog-message").dialog( "open" );
					 		});
						});
					 </script>
				</td>
			</tr>
		</table>
	<!-- </div> -->
 <c:import url="/Include/Footer.jsp" /> 

</body>
</html>