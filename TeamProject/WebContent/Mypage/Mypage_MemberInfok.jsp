<%@page import="java.io.PrintWriter"%>
<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://www.wedaehan.com/css/default.css">
<link rel="stylesheet"
	href="http://www.wedaehan.com/skin/member/basic/style.css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600"
	rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Stylesheet" href="style/default.css">
<!-- Bootstrap Core CSS -->
 <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>정보확인</title>
<%
	Member member=(Member) request.getAttribute("memberinfo");
	String gender="F";
	if(member.getGender()==1){
		gender="M";
	}
%>
<!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="<%=request.getContextPath()%>/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/css/style-responsive.css" rel="stylesheet">

<!-- Fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">

</head>
<body>
	<table class="table table-bordered table-striped table-condensed">
		<thead>
			<tr>
				<th>이름</th>
				<th>성별</th>
				<th>E-mail</th>
				<th>나이</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=member.getName()%></td>
				<td><%=gender %></td>
				<td><%=member.getEmail() %></td>
				<td><%=member.getAge() %></td>
				<th><%=member.getAddress() %></th>
			</tr>
		</tbody>
	</table>
	<span class="pull-right"> 
			<button type="button" class="btn btn-theme" onclick="window.close()">취소</button>
			</span>

	<!-- js placed at the end of the document so the pages load faster -->
    <script src="<%=request.getContextPath()%>/assets/js/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="<%=request.getContextPath()%>/text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <!-- <script>
        $.backstretch("../assets/img/login-bg.jpg", {speed: 500});
    </script> -->
</body>
</html>
