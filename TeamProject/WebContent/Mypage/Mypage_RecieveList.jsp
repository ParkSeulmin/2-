<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="Mypage.DTO.Arrow_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8"); 

%>
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
<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/assets/css/bootstrap.css"
	rel="stylesheet">
<!--external css-->
<link
	href="<%=request.getContextPath()%>/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/js/gritter/css/jquery.gritter.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/assets/css/style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/css/style-responsive.css"
	rel="stylesheet">

<script
	src="<%=request.getContextPath()%>/assets/js/chart-master/Chart.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
	mylist=(ArrayList<Arrow_DTO>)request.getAttribute("result");
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
				$("#"+sender).hide();
			}
		});
	}
</script>
</head>
<body>
<%-- <c:import url="<%=request.getContextPath()%>/Include/Header.jsp" /> --%>
	<h3>
		<i class="fa fa-angle-right"></i> My Partylist
	</h3>

<form>
<table align="center" border="1">
	
<%
	for(int i=0; i<mylist.size(); i++){
%>	<tr>
		<td><%=mylist.get(i).getA_sendid()%></td>
		<td><%=mylist.get(i).getA_date()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><%=mylist.get(i).getA_status()%></td>
		<td><input type="button" value="info" 
		name="<%=mylist.get(i).getA_sendid() %>" onclick="checkinfo(this.name)" /></td>
		<!-- 상세보기 -->
		<td><input type="button" value="agree" id="<%=mylist.get(i).getA_sendid() %>"
		name="<%=mylist.get(i).getA_sendid() %>" onclick="agree(this.name)" /></td>
		<!-- 친구수락 -->
		<td><input type="button" value="disagree" 
		name="<%=mylist.get(i).getA_sendid() %>" onclick="dataSend(this.name)" /></td>
		<!-- 거절 -->
	</tr>
<%
	}
%>
</table>
</form>
agree->서로 친구 테이블에 등록해주는 테이블 
<br>
disagree->화살 테이블에서 해당 화살 삭제 
<br>
info->화살 보낸 사람의 정보를 보여주는 쿼리 

</body>
</html>