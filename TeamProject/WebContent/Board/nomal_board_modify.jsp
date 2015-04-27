<%@page import="Board.DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String userid=(String)session.getAttribute("userid");
	//String id ="HYEJUNG22";
	Board board = (Board)request.getAttribute("boarddata");
	System.out.println(board.getBo_no());
%>

<html>
<head>
	<title>MVC 게시판</title>
	
	
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
		#tnb a:focus, #tnb a:hover, #tnb a:active {text-decoration:none}
	
	</style>
  	<script>+
	    $('.carousel').carousel({
	        interval: 5000 //changes the speed
	    })
    </script>
	
	
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

		<!-- 게시판 수정 -->
		<form action="BoardModifyAction.bo" method="post" name="modifyform">
		<input type="hidden" name="BOARD_NUM" value="<%=board.getBo_no() %>">
		<input type="hidden" name="BOARD_ID" value="<%=userid %>">
		
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

<c:import url="/Include/Footer.jsp" />
</body>
</html>