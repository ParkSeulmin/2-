<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
// login session
		Member user = null;
		String id = null;
		int admin = 0;		// 관리자(1) 일반회원(0) 
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>Main</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>main</title>


    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
    
    <!-- templete CSS and Script  -->
    
    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath() %>/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="<%=request.getContextPath() %>/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath() %>/assets/css/style.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/css/style-responsive.css" rel="stylesheet">
    
</head>
<body>
<c:set var="id" value="<%=id%>" /><!-- id값 -->
<c:set var="admin" value="<%=admin%>" /><!-- id값 -->

 <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="profile.html"><img src="assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered">Marcel Newman</h5>
              	  	
                 <!--  <li class="mt">
                      <a href="index.html">
                          <i class="fa fa-dashboard"></i>
                          <span>만남의 품격</span>
                      </a>
                  </li> -->

                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-desktop"></i>
                          <span>만남의 품격</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="#">about 만남의 품격</a></li>
                          <li><a  href="<%=request.getContextPath()%>/BoardList.bo?boardtype=10">공지사항</a></li>
                          <li><a  href="#">Contact Us</a></li>
                      </ul>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-cogs"></i>
                          <span>데이트</span>
                      </a>
                      <ul class="sub">
                          <li><a href="#">데이트 하기</a></li>
                          <li><a href="#">이상형 찾기</a></li>
                          <li><a href="#">파티 </a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-book"></i>
                          <span>게시판</span>
                      </a>
                      <ul class="sub">
                          <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=20">후기 게시판</a></li>
                          <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=30">남자 게시판</a></li>
                          <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=40">여자 게시판 </a></li>
                  
                          <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=50">1:1 문의 게시판 </a></li>
                      </ul>
                  </li>
                  
                  
                  <c:choose>
					<c:when test="${admin == 1}">
						  <li class="sub-menu">
		                      <a href="javascript:;" >
		                          <i class="fa fa-tasks"></i>
		                          <span>관리자 페이지</span>
		                      </a>
		                      <ul class="sub">
		                         <li><a href="#">관리자 정보</a></li>
			                           <li class="divider"></li>
			                          <li><a href="<%=request.getContextPath()%>/MemberList.admin">회원관리정보</a></li>
			                           <li class="divider"></li>
		                      </ul>
		                  </li>
					</c:when>
					<c:otherwise>
						  <li class="sub-menu">
		                      <a href="javascript:;" >
		                          <i class="fa fa-th"></i>
		                          <span>My Page</span>
		                      </a>
		                      <ul class="sub">
		                           <li><a href="#">정보수정하기</a></li>
				                           
				                          <li><a href="<%=request.getContextPath()%>/Mypage/Mypage_ListCtr.jsp">데이트 신청 리스트</a></li>
				                          <li><a href="#">파티 신청 리스트</a></li>
				                          <li><a href="#">보낸 쪽지함</a></li>
				                          <li><a href="#">받은 쪽지함</a></li>
		                      </ul>
		                  </li>
					</c:otherwise>
				
				</c:choose>

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->

  
  
   <!-- js placed at the end of the document so the pages load faster -->
    <script src="<%=request.getContextPath() %>/assets/js/jquery.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/jquery.scrollTo.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="<%=request.getContextPath() %>/assets/js/common-scripts.js"></script>

    <!--script for this page-->
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>
</body>
</html>