<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>main</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/business-casual.css" rel="stylesheet">

<!-- Fonts -->
<link
   href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
   rel="stylesheet" type="text/css">
<link
   href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
   rel="stylesheet" type="text/css">

<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
   <style type="text/css">
   /* 임의 스타일입니다 후에 business-casual.css 에 넣을 것  */
      #tnb {
         float: right;
         margin: 0;
         padding: 0;
         list-style: none;
         zoom: 1
      }
      
      #tnb li {
         float: left;
         margin: 0px
      }
      
      #tnb a {
         display: inline-block;
         padding: 11px 10px;
         color: #a1a1a4;
         letter-spacing: 0em;
         font-size: 10px;
         font-family: tahoma
      }
      
      #tnb a:focus, #tnb a:hover, #tnb a:active {
         text-decoration: none
      }
      
      #hd_wrapper {position:relative;margin:0 auto;padding:0;max-width:1280px;height:35px;zoom:1;overflow:hidden}
      #hd_wrapper:after {display:block;visibility:hidden;clear:both;content:""}
   </style>
</head>
<body>
   <div id="hd_wrapper">   
       <ul id="tnb">
            <li><a href="#">MEMBER</a></li>
            <li><a href="#"><b>LOGIN</b></a></li>
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
                          <li><a href="#">공지사항</a></li>
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
                          <li><a href="<%=request.getContextPath()%>/Partylist.party">파티 </a></li>
                          <li class="divider"></li>
                         
                    </ul>
            </li>
            
            <li class="dropdown">
               <a href="index.html" data-toggle="dropdown" role="button" aria-expanded="false">
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
   
   <!-- jQuery -->
   <script src="js/jquery.js"></script>

   <!-- Bootstrap Core JavaScript -->
   <script src="js/bootstrap.min.js"></script>

   <!-- Script to Activate the Carousel -->
   <script>+
       $('.carousel').carousel({
           interval: 5000 //changes the speed
       })
    </script>
</body>
</html>