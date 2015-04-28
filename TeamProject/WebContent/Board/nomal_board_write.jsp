
<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%

// session
		Member user = null;
		String id = "";
		if(session.getAttribute("user") != null){
			user = (Member)session.getAttribute("user");
			id = user.getId();
		}		
		
		System.out.println("session id check: "+ id);

	int boardtype = Integer.parseInt(request.getParameter("boardtype"));
	System.out.println("write boardtype: "+boardtype);
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>게시판 보기</title>
	  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	
	
	<script type="text/javascript" 
	src="<%=request.getContextPath()%>/Board/ckeditor/ckeditor.js">
	</script>
	<script language="javascript">
		function addboard(){
			
			if (!boardform.bo_title.value) {
				alert("제목을 입력하세요");
				boardform.bo_title.focus();
				return false;
			}
			
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
	
		<!-- 게시판 등록 -->
		<form action="./BoardAddAction.bo?boardtype=<%=boardtype %>" method="post" 
			enctype="multipart/form-data" name="boardform">
		<input type="hidden" name="BOARD_ID" value="<%=user.getId() %>">
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
						value="<%=user.getId() %>" readonly/>
					
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

<c:import url="/Include/Footer.jsp" />
</body>
</html>
