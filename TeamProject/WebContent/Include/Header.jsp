
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// login session
		String id = (String)session.getAttribute("userid");
		System.out.println("session id check: "+ id);

%>
<c:set var="userid" value="<%=id%>" /><!-- id값 -->

	<div id="hd_wrapper">	
       <ul id="tnb">
       <c:choose>
       		<c:when test="${userid != null}">
       			<li><div id='#welcomeuser'>[${userid}] 님 환영합니다.</div></li>
       		</c:when>
       		<c:otherwise>
       			<li><a href="#">MEMBER</a></li>
				<li><a href="<%=request.getContextPath()%>/Login/Login.jsp"><b>LOGIN</b></a></li>
       		</c:otherwise>
       </c:choose>
				<li><a href="#">SITE MAP</a></li>
				<li><a href="#">CONTACT US</a></li>
		</ul>   
    </div>
	
	<div class="brand">위대한 만남</div>
	<div class="address-bar">품격이 다른 소개팅</div>

	<!-- Navigation -->
	<nav class="navbar navbar-default" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
			<a class="navbar-brand" href="index.html">Business Casual</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			
			
			<ul class="nav navbar-nav">
				<li class="dropdown">
					<a href="index.html" data-toggle="dropdown" role="button" aria-expanded="false">
						만남의 품격
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
                          <li><a href="#">about 만남의 품격</a></li>
                          <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=10">공지사항</a></li>
                          <li><a href="#">Contact Us</a></li>
                          <li class="divider"></li>
                         
                    </ul>
				</li>
				
				<li class="dropdown">
					<a href="index.html" data-toggle="dropdown" role="button" aria-expanded="false">
						데이트
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
                          <li><a href="#">데이트 하기</a></li>
                          <li><a href="#">이상형 찾기</a></li>
                          <li><a href="#">파티 </a></li>
                          <li class="divider"></li>
                         
                    </ul>
				</li>
				
				<li class="dropdown">
					<a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=20" data-toggle="dropdown" role="button" aria-expanded="false">
						게시판
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
                          <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=20">후기 게시판</a></li>
                          <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=30">남자 게시판</a></li>
                          <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=40">여자 게시판 </a></li>
                          <li class="divider"></li>
                          <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=50">1:1 문의 게시판 </a></li>
                         
                    </ul>
				</li>
				
				
				<li class="dropdown">
					<a href="index.html" data-toggle="dropdown" role="button" aria-expanded="false">
						My Page
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
                          <li><a href="#">정보수정하기</a></li>
                           <li class="divider"></li>
                          <li><a href="#">나의 데이트 신청</a></li>
                          <li><a href="#">나의 파티 신청</a></li>
                          <li class="divider"></li>
                          <li><a href="#">나의 쪽지 보기</a></li>
                    </ul>
				</li>
				
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	
	<!-- /.container --> </nav>
	

