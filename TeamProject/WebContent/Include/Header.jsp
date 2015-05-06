<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Login.DTO.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
      Member user = null;
      String id = null;
      int admin = 0;      // 관리자(1) 일반회원(0) 
      if(session.getAttribute("user") != null){
         user = (Member)session.getAttribute("user");
         id = user.getId();
         if(user.getAdmin() == 1){
             admin = user.getAdmin();
          }
      }      
      
      System.out.println("session id check: "+ id);   
      System.out.println("session admin check:"+admin);

%>

<c:set var="id" value="<%=id%>" /><!-- id값 -->
	 <c:set var="admin"	value="<%=admin%>" /><!-- id값 --> 

	<section id="container"> 
	<header class="header black-bg">
	<div class="sidebar-toggle-box">
		<div class="fa fa-bars tooltips" data-placement="right"
			data-original-title="Toggle Navigation"></div>
	</div>
	<!--logo start--> <a href="" class="logo">Quality of meeting<b></b></a>
	<!--logo end-->
	<div class="nav notify-row" id="top_menu">
		<!--  notification start -->
		<ul class="nav top-menu">
			<!-- settings start -->

			<!-- settings end -->
		</ul>
		<!--  notification end -->
	</div>
	<div class="top-menu">
		<c:choose>
			<c:when test="${id != null}">
				<ul class="nav pull-right top-menu">
				<li><p><h3><%=id%> 님 안녕하세요.&nbsp;&nbsp;&nbsp;</h3></p></li>
				<li><a class="logout" href="<%=request.getContextPath()%>/Login/Logout.jsp">Logout</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="nav pull-right top-menu">
				<li><a class="logout" href="<%=request.getContextPath()%>/Login/Login.jsp">Login</a></li>
				</ul>
			</c:otherwise>
		
		</c:choose>
			
	</div>
	</header> 
	 
	<!--sidebar start--> 
	<aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu" id="nav-accordion">

			<p class="centered">

				<a href="<%=request.getContextPath()%>/Mainpage.main">
					<img src="<%=request.getContextPath()%>/assets/img/hlogo.jpg" class="img-circle" width="60"></a>
			</p>
			<h5 class="centered">Quality of meeting</h5>

			<!--  <li class="mt">
                      <a href="index.html">
                          <i class="fa fa-dashboard"></i>
                          <span>만남의 품격</span>
                      </a>
                  </li> -->

			<li class="sub-menu"><a href="javascript:;"> <i
					class="fa fa-desktop"></i> <span>만남의 품격</span>
			</a>
				<ul class="sub">
					<li><a href="<%=request.getContextPath()%>/Notice/about.jsp">about 만남의 품격</a></li>
					<li><a
						href="<%=request.getContextPath()%>/BoardList.bo?boardtype=10">공지사항</a></li>
					<li><a href="<%=request.getContextPath()%>/Notice/Contact.jsp">Contact Us</a></li>
				</ul></li>

			<li class="sub-menu"><a href="javascript:;"> <i
					class="fa fa-cogs"></i> <span>데이트</span>
			</a>
				<ul class="sub">
					<li><a href="#">데이트 하기</a></li>
					<li><a href="<%=request.getContextPath()%>/Date/Search_Date.jsp">이상형 찾기</a></li>
					<li><a href="<%=request.getContextPath()%>/Partylist.party">파티 참석</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;"> <i
					class="fa fa-book"></i> <span>게시판</span>
			</a>
				<ul class="sub">
					<li><a
						href="<%=request.getContextPath()%>/BoardList.bo?boardtype=20">후기
							게시판</a></li>
					<li><a
						href="<%=request.getContextPath()%>/BoardList.bo?boardtype=30">남자
							게시판</a></li>
					<li><a
						href="<%=request.getContextPath()%>/BoardList.bo?boardtype=40">여자
							게시판 </a></li>

					<li><a
						href="<%=request.getContextPath()%>/BoardList.bo?boardtype=50">1:1
							문의 게시판 </a></li>
				</ul></li>


			<c:choose>
				<c:when test="${admin == 1}">
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-tasks"></i> <span>관리자 페이지</span>
					</a>
						<ul class="sub">
							<li><a href="#">관리자 정보</a></li>
							<li class="divider"></li>
							<li><a href="<%=request.getContextPath()%>/MemberList.admin">회원 관리</a></li>
							<li class="divider"></li>
							<li><a href="<%=request.getContextPath()%>/BoardListadmin.admin">게시물 관리</a></li>
 
							<li><a href="<%=request.getContextPath()%>/PartyListadmin.admin">파티 관리</a></li>
 
						</ul></li>
				</c:when>
				<c:otherwise>
					<c:if test="${id != null}">
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-th"></i> <span>My Page</span>
					</a>
						<ul class="sub">
							<li><a href="<%=request.getContextPath()%>/Mypage/Mypage_Edit.jsp">개인정보 수정</a></li>
							<li><a href="<%=request.getContextPath()%>/Sendmsg.msg">보낸 쪽지함</a></li>
                     		<li><a href="<%=request.getContextPath()%>/Receivemsg.msg">받은 쪽지함</a></li>
							<li><a href="<%=request.getContextPath()%>/CheckArrow.daa">데이트 신청 리스트</a></li>
							<li><a href="<%=request.getContextPath()%>/MypageParty.my">파티 신청 리스트</a></li>
						</ul></li>
					</c:if>
				</c:otherwise>

			</c:choose>

		</ul>
		<!-- sidebar menu end-->
	</div>
	</aside> <!--sidebar end--> </section>
