<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="Mypage.DTO.Arrow_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/assets/css/bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/js/gritter/css/jquery.gritter.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/lineicons/style.css">

<link href="<%=request.getContextPath()%>/assets/css/style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/css/style-responsive.css"
	rel="stylesheet">

<script
	src="<%=request.getContextPath()%>/assets/js/chart-master/Chart.js"></script>

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

<%
	List<Arrow_DTO> mylist=new ArrayList<Arrow_DTO>();
	mylist=(ArrayList<Arrow_DTO>)request.getAttribute("arrowlist");
	
	List<Member> friends=new ArrayList<Member>();
	friends=(ArrayList<Member>)request.getAttribute("friends");
%>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
  <script type="text/javascript">
	function checkinfo(sendid){
		window.open("Mypage_MemberInfo.jsp?id="+sendid, "Popup", "width=600, height=150,scrollbars=1, menubar=1, resizable=1"); 
	}
	
	function agree(sender){
		var sdid={
					s_id:sender,
				    r_id:'<%=session.getAttribute("user")%>'}

		$.ajax({
			url:"register.daa",
			data:sdid,
			success : function(data){
				alert(data);
				//$("#"+sender).hide();
				location.reload();
			}
		});
	}
	function disagree(sender){
		var sdid={
					s_id:sender,
				    r_id:'<%=session.getAttribute("user")%>'}

		$.ajax({
			url:"delete_arrow.daa",
			data:sdid,
			success : function(data){
				alert(data);
				//$("#"+sender).hide();
				location.reload();
			}
		});
	}
</script>
</head>
<body>
<h3 align="center">현재 친구  LIST</h3>
user : <%=request.getParameter("user")%><br>
<table align="center" border="1">
<%
	for(int i=0; i<friends.size(); i++){
%>	<tr>
		<td><%=friends.get(i).getId()%></td>
		<td><%=friends.get(i).getName()%></td>
	</tr>
<%
	}
%>
</table>
<h3 align="center">내가 요청한 친구 LIST</h3>
<table align="center" border="1">
<%
	for(int i=0; i<mylist.size(); i++){
%>	<tr>
		<td><%=mylist.get(i).getA_sendid()%></td>
		<td><%=mylist.get(i).getA_date()%></td>
		<td><%=mylist.get(i).getA_status()%></td>
	</tr>
<%
	}
%>
</table>

</body>
</html>
