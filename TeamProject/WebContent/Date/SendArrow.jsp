<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
 <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>이상형 찾기</title>

	<script src="<%=request.getContextPath() %>/js/jquery.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>

<!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/css/business-casual.css" rel="stylesheet">

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
</head>
<body>
	<c:import url="/Include/Header.jsp" />
	<div align="center">
		<form action="" style="" >
			<select>
				<option class="지역">지역 선택</option>
				<option class="서울">서울</option>
				<option class="경기도">경기도</option>
				<option class="강원도">강원도</option>
				<option class="경상도">경상도</option>
				<option class="전라도">전라도</option>
				<option class="제주도">제주도</option>
				<option class="충청도">충청도</option>
				<option class="그외">그외</option>
			</select>
			
			<select>
				<option class="나이">나이 선택</option>
				<option class="001">25세 이하</option>
				<option class="002">26세 ~ 30세</option>
				<option class="003">31세 ~ 35세</option>
				<option class="004">36세 ~ 40세</option>
				<option class="005">40세 이상</option>
			</select>
			
			<select>
				<option class="연봉">연봉 선택</option>
				<option class="011">2000만원 이하</option>
				<option class="012">2100만원 ~ 2500만원</option>
				<option class="013">2600만원 ~ 3000만원</option>
				<option class="014">3100만원 ~ 3500만원</option>
				<option class="015">3600만원 ~ 4000만원</option>
				<option class="016">4000만원 이상</option>
			</select>
			
			<select>
				<option class="키">키 선택</option>
				<option class="111">160cm 이하</option>
				<option class="112">161cm ~ 165cm</option>
				<option class="113">166cm ~ 170cm</option>
				<option class="114">171cm ~ 175cm</option>
				<option class="115">176cm ~ 180cm</option>
				<option class="116">181cm ~ 185cm</option>
				<option class="117">186cm ~ 190cm</option>
				<option class="118">190cm이상</option>
			</select>
			<input type="button" value="검색">
			
		</form>
		
		<table border="1">
			<tr>
				<td>사진</td>
				<td>사는곳</td>
				<td>나이</td>
				<td>연봉</td>
				<td>신장</td>
				<td>신청하기</td>
			</tr>
			<tr> 
				<td><img alt="" src="../Images/111.JPG" height="100" width="150"></td>
				<td>경기도 성남</td>
				<td>30</td>
				<td>2000</td>
				<td>170</td>
				<td><input type="button" value="신청"></td>
			</tr>
		</table>
	 	</div>
 	
	<c:import url="/Include/Footer.jsp" />
</body>
</html>