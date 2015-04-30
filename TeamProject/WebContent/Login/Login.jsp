
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
<title>Login</title>
<!-- Bootstrap Core CSS -->
 <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>DASHGUM - Bootstrap Admin Template</title>

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
</head>
<body>
 
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
		type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$("#login_id").focus();
		});
	</script>

	

	
	 <div id="login-page">
	  	<div class="container">

		 <form class="form-login" 
		      		name="flogin"  action ="Login.login?cmd=logincheck"
					onsubmit="return flogin_submit(this);" method="post"	
		      >
		        <h2 class="form-login-heading">sign in now</h2>
		        <div class="login-wrap">
		            <input type="text" class="form-control"  name="mb_id" id="login_id" placeholder="User ID" autofocus>
		            <br>
		            <input type="password" class="form-control" name="mb_password" placeholder="Password">
		            <label class="checkbox">
		                <span class="pull-right">
		                <a data-toggle="modal" href="<%=request.getContextPath()%>/Login/Login_Find_Id.jsp"> Forgot Id?</a>
		                    <a data-toggle="modal" href="<%=request.getContextPath()%>/Login/PwdSearch.jsp"> Forgot Password?</a>
		
		                </span>
		            </label>
		            <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
		  </form>         
		            <hr>
		            
		             
		            <div class="registration">
		                Don't have an account yet?<br/>
		                <a class="" href="<%=request.getContextPath()%>/Login/Terms.jsp">
		                    Create an account
		                </a>
		            </div>
		
		        </div>
			
			 	  

	</div>
	  </div>

	<script>
		$(function() {
			$("#login_auto_login")
					.click(
							function() {
								if (this.checked) {
									this.checked = confirm("자동로그인을 사용하시면 다음부터 회원아이디와 비밀번호를 입력하실 필요가 없습니다.\n\n공공장소에서는 개인정보가 유출될 수 있으니 사용을 자제하여 주십시오.\n\n자동로그인을 사용하시겠습니까?");
								}
							});
		});

		function flogin_submit(f) {
			return true;
		}
	</script>
	 
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
