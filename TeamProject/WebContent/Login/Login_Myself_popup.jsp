
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

    <title>본인인증</title>

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
<%	String name = "";
String msg = "";
if ((String) request.getAttribute("result") != null) {
	msg = (String) request.getAttribute("result");
		if (msg == "본인 인증에 성공했습니다.") {
			name = (String) request.getAttribute("name1");
			}
		else{
			msg="본인 인증에 실패했습니다.";
		}
	}
	
%>

<script type="text/javascript">
function insert(){
	window.close();
	opener.document.getElementById("name").value='<%=name%>';
	window.close();
}
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
		 <form class="form-login" action ="MySelf.check" method="post"	>
		        <div class="login-wrap">
		        	<input type="text" class="form-control"  name="name" id="popname" placeholder="이름을 입력 하세요.">
		            <br>
		            <input type="text" class="form-control"  name="birthdate" id="birthdate" placeholder="생년 월일을 입력 하세요." >
		            <br>
		                <span class="pull-right" style="color: red;"><%=msg%>
		               	<input type="submit" class="btn btn-theme" id="selfcheck" value="본인 인증"">
		                </span>
		            <br><br>
		            <input type="text" class="form-control" value="<%=name%>" name="name1" id="name1" readonly>
		            
		            <label class="checkbox">
		                <span class="pull-right"> 
		                <input type="button" class="btn btn-theme " value="확인"	onclick="insert()">
		            	<input type="button" class="btn btn-theme04" value="취소" onclick="window.close();">
		                </span>
		            </label>
		            </div>
       
		  </form>         

		        </div>
			
			 	  




	 
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
