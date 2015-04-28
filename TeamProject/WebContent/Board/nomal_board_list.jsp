<%@page import="Login.DTO.Member"%>
<%@page import="Board.DTO.Reply"%>
<%@page import="Board.DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
// session
		Member user = null;
		String id = null;
		if(session.getAttribute("user") != null){
			user = (Member)session.getAttribute("user");
			id = user.getId();
		}		
		
		System.out.println("session id check: "+ id);
		
		
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
    
    
    
   <!-- 테이블에 쓸려고 CSS -->
    <!-- <link rel="stylesheet" href="http://www.wedaehan.com/css/default.css">
    <link rel="stylesheet" href="http://www.wedaehan.com/css/board.css">
    <link rel="stylesheet" type="text/css" href="http://www.wedaehan.com/css/main.css">
    <link rel="stylesheet" type="text/css" href="http://www.wedaehan.com/css/sub.css">  -->
</head>

<body>
 <c:import url="/Include/Header.jsp" />

	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
	  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>	
	<div> 
	<%-- <input type="hidden" id="sessionid" value="<%=user.getId() %>"> --%>
		<!-- 게시판 리스트 -->
		<div>${boardname}</div>
		 <div class="bo_list">
		<div class="tbl_head01 tbl_wrap">
	        <table>
				
		       <tr>
				<td align=left colspan="4">
					<font size=2>Total : ${listcount}
								| ${page} 페이지	
					</font>
				</td>
			</tr>
		        <tr>
		            <th class="th_column">번호</th>
		            <th class="th_column">제목</th>
		            <th class="th_column sv_use">글쓴이</th>
		            <th class="th_column">날짜</th>
		            <th class="th_column">조회</th>
		        </tr>
		       
	        	<tbody>
	        	<%
				for(int i=0;i<boardList.size();i++){
					Board bl=(Board)boardList.get(i);
					int rl=(Integer)replylistnum.get(i);					
				%>
	                <tr class="" align="center" valign="middle" bordercolor="#333333"
						onmouseover="this.style.backgroundColor='#FFEBFF'"
						onmouseout="this.style.backgroundColor=''">
	            <td class="td_num"> <%=bl.getBo_no()%> </td>
	                        <td class="td_subject">
	                
	               
							<a href="./BoardDetailAction.bo?num=<%=bl.getBo_no()%>">
								<%=bl.getBo_title()%>
							</a>
							&nbsp;[<%=rl%>]
	
	                <img src="http://www.wedaehan.com/skin/board/after/img/icon_hot.gif" alt="인기글">            </td>
	            <td class="td_name sv_use"><span class="sv_member"><%=bl.getBo_writer()%></span></td>
	            <td class="td_date"><%=bl.getBo_date() %></td>
	            <td class="td_num"><%=bl.getBo_count() %></td>
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
					<c:set var="id" value="<%=id%>"/>
					
					<c:choose>
						<c:when test="${id != null}">
						
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
	            </tbody>
	        </table>
	    </div>
	   </div>
  	
	 </div>
	 
	 
	 
	 
	
 <c:import url="/Include/Footer.jsp" /> 

</body>
</html>