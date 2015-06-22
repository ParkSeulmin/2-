<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Login.DTO.Member"%>
<%@page import="Mypage.DTO.Message_DTO"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<%

Message_DTO msgdto = (Message_DTO)request.getAttribute("msgdto");

	
%>
<!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="<%=request.getContextPath()%>/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
        
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="<%=request.getContextPath()%>/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/js/gritter/css/jquery.gritter.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/css/style-responsive.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/assets/js/chart-master/Chart.js"></script>
 
<style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	display: block;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	padding: 5px 5px 8px 5px;
	font: 10px arial, san serif;
	text-align: left;
}
</style>

</head>
<body style>


<div class="popup" style="width:388px; height: 250px;">
	<!-- title -->
	<div class="pop_tit_bg"><div class="pop_tit_l"><div class="pop_tit_r">
		<h3 class="pop_tit">받은 쪽지 읽기</h3>
	</div></div></div>
	<!-- title -->
<table class="table table-striped table-advance table-hover">
	<div class="memoread" style="position:relative">
	<tr>
		<div>
		메시지 번호 : <%=msgdto.getM_ID() %>
		</div>
	</tr>
	<tr>
		<div>
		<td colspan="1"><dl class="">
		<dt>보낸 사람</dt>
		<dd><%=msgdto.getM_SENDID()%></dd>
		</dl></td>
		<td colspan="1" align="left">
		<dl class="">
		<dt>보낸 시각</dt>
		<dd><%=msgdto.getM_DATE()%></dd>
		</dl>
		</td>
		</div></tr>
		<tr>
		<div>
		<td colspan="1">
		제목 : <%=msgdto.getM_TITLE() %>
		</td><td colspan="2"></td>
		</div>
		</tr>
		<tr>
		<td colspan="2" rowspan="10">
		내용 : <div id="" class=""><%=msgdto.getM_CONTENT()%></div>
		</td><td colspan="2"  rowspan="10"></td>
		</tr>
		<tr>
		</tr>
		<tr>
		</tr>
		
		
		
        
	</div>


</table>
		
		<ul id="manageBtn" class="">
		<a href="Deletemsg.msg?m_id=<%=msgdto.getM_ID()%>" onclick="deletebtn()">
		<img src="http://www.afreeca.com/images/popup/button/btn_del.gif" alt="삭제"></a>
		</li></ul>
		
</div>
</body>
</html>