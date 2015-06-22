
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

    <title>pwsearch</title>

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
 
    <script>+
	    $('.carousel').carousel({
	        interval: 5000 //changes the speed
	    })
    </script>
<script type="text/javascript">

<%	
	String msg = "";
	String msg1 = "";
	if (request.getAttribute("error") != null) {	
		msg="입력한 정보가 틀렷습니다.";
	}
	if(request.getAttribute("result1") != null){
		msg1="비밀번호를 메일로 전송했습니다.";
	}
%>
</script>
</head>
<body>
 
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
		type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$("#id").focus();
		});
	</script>

	 <div id="login-page" class="container">
		 <form class="form-login" action ="PwdSearch.da" method="post"	>
		 
		        <h2 class="form-login-heading">비밀번호 찾기</h2>
		        <div class="login-wrap">
		        <p>
		        <h3><span style="color: red; font-size: 13pt"><%=msg%></span></h3>
				<h3><span style="color: blue; font-size: 13pt"><%=msg1%></span></h3>
				</p>
		        	<input type="text" class="form-control"  name="name" id="name" placeholder="본인확인 버튼을 누르세요." readonly>
		            <br>
		                <span class="pull-right"> 
		               	<input type="button" class="btn btn-theme" id="selfcheck" value="본인확인" onclick="window.open('Login_Myself_popup.jsp','zip','width=450 height=500')">
		                </span>
		            <br><br>
		            <input type="text" class="form-control"  name="id" id="id" placeholder="ID를 입력 하세요." >
		            <br>
		            <input type="text" class="form-control" name="email" id="email" placeholder="E-mail을 입력 하세요." >
		            <label class="checkbox">
		                <span class="pull-right"> 
		                <input type="submit" class="btn btn-theme " value="확인">
		            	<input type="button" class="btn btn-theme04" value="취소" onclick="history.back(-1)">
		                </span>
		            </label>
       
		  </form>         

		        </div>
			
			 	  

	</div>


	 
 	<!-- js placed at the end of the document so the pages load faster -->
    <script src="<%=request.getContextPath()%>/assets/js/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("../assets/img/login-bg3.jpg", {speed: 500});
    </script>


</body>
</html>
