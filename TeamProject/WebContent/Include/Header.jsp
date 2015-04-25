
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Header</title>
   <link rel="stylesheet" href="http://www.wedaehan.com/css/default.css">
   <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
   <script>
      // 자바스크립트에서 사용하는 전역변수 선언
      var g5_url = "http://www.wedaehan.com";
      var g5_bbs_url = "http://www.wedaehan.com/bbs";
      var g5_is_member = "";
      var g5_is_admin = "";
      var g5_is_mobile = "";
      var g5_bo_table = "";
      var g5_sca = "";
      var g5_editor = "ckeditor43";
      var g5_cookie_domain = "";
   </script>
</head>
<body>
<!-- Header { -->
   <div id="hd">
      <h1 id="hd_h1">♡품격이 다른 소개팅 위대한 만남 입니다♡</h1>


      <div id="skip_to_container">
         <a href="#container">본문 바로가기</a>
      </div>
      <div id="hd_wrapper">

         <div id="logo2">3
            <a href="http://www.wedaehan.com"><img
               src="http://www.wedaehan.com/img/logo2.png"
               alt="품 / 격 / 이 / 다 / 른 / 소 / 개 / 팅"></a>
         </div>

         <ul id="tnb">
            <li><a href="http://www.wedaehan.com/bbs/register.php">MEMBER</a></li>
            <li><a href="<%=request.getContextPath()%>/Login/Login.jsp"><b>LOGIN</b></a></li>
            <li><a href="http://www.wedaehan.com/sub/sitemap.php">SITE
                  MAP</a></li>
            <li><a href="http://www.wedaehan.com/sub/sub01_05.php">CONTACT
                  US</a></li>
         </ul>
      </div>

      <hr>

      <nav id="gnb">
         <div id="logo">
            <a href="/"><img src="http://www.wedaehan.com/image/all/logo.png" width="172"
               height="42" title="위대한 만남"></a>
         </div>
         <div id="gnb_1">
            <link rel="stylesheet" type="text/css" href="http://www.wedaehan.com/css/menu.css"
               media="screen">
            <!-- <script type="text/javascript" src="http://www.wedaehan.com/js/jquery.easing-sooper.js"></script> -->
            <script type="text/javascript" src="http://www.wedaehan.com/js/jquery.sooperfish.js"></script>


            <script type="text/javascript">
               $(document).ready(function() {
                  $('ul.sf-menu').sooperfish({
                     animationShow : {
                        width : 'show'
                     },
                     speedShow : 400,
                     animationHide : {
                        width : 'hide'
                     },
                     speedHide : 100,
                     autoArrows : true
                  });
               });
            </script>

            <script type="text/javascript">
               $(document).ready(function() {

                  $('.menu').hover(function() {
                     $(this).stop().animate({
                        scrollTop : 26
                     }, 400);
                  }, function() {
                     $(this).stop().animate({
                        scrollTop : 0
                     }, 400);
                  });

               });
            </script>

            <ul class="sf-menu" id="nav">
               <li><a href="/sub/sub01_01.php">
                     <div class="menu"
                        style="border: 0px; height: 21px; overflow: hidden;">
                        위대한 만남<br> Company
                     </div>
               </a>
                  <ul>
                     <li><a href="http://www.wedaehan.com/sub/sub01_01.php">왜 위대한인가?</a></li>
                     <li><a href="http://www.wedaehan.com/sub/sub01_02.php">Storytelling</a></li>
                     <li><a href="http://www.wedaehan.com/bbs/board.php?bo_table=news">공지사항</a></li>
                     <li><a href="http://www.wedaehan.com/bbs/board.php?bo_table=event">이벤트</a></li>
                     <li class="end"><a href="http://www.wedaehan.com/sub/sub01_05.php">Contact us</a></li>
                  </ul></li>

               <li><a href="/sub/sub02_01.php">
                     <div class="menu"
                        style="border: 0px; height: 21px; overflow: hidden;">
                        1:1소개팅<br> <span style="letter-spacing: -0.07em">Great
                           Dating</span>
                     </div>
               </a>
                  <ul>
                     <li><a href="http://www.wedaehan.com/sub/sub02_01.php">Great Dating</a></li>
                     <li><a href="http://www.wedaehan.com/sub/sub02_02.php">진행 안내</a></li>
                     <li class="end"><a href="http://www.wedaehan.com/sub/sub02_03.php">가격 안내</a></li>
                  </ul></li>

               <li><a
                  href="http://www.wedaehan.com/bbs/board.php?bo_table=speeddate&sca=%EC%84%9C%EC%9A%B8%2F%EC%88%98%EB%8F%84%EA%B6%8C">
                     <div class="new_icon">
                        <img src="http://www.wedaehan.com/image/all/new_icon.png">
                     </div>
                     <div class="menu"
                        style="border: 0px; height: 21px; overflow: hidden;">
                        스피드 데이트<br> Speed Date
                     </div>
               </a>
                  <ul>
                     <li><a
                        href="http://www.wedaehan.com/bbs/board.php?bo_table=speeddate&sca=%EC%84%9C%EC%9A%B8%2F%EC%88%98%EB%8F%84%EA%B6%8C">서울
                           / 수도권</a></li>
                     <li><a
                        href="http://www.wedaehan.com/bbs/board.php?bo_table=speeddate&sca=%EA%B4%91%EC%97%AD">광역시</a></li>
                     <li class="end"><a href="http://www.wedaehan.com/sub/sub03_03.php">스피드 데이트 is</a></li>
                  </ul></li>

               <li><a href="BoardList.bo?boardtype=20">
                     <div class="menu"
                        style="border: 0px; height: 21px; overflow: hidden;">
                        후기&문의<br> Epilogue
                     </div>
               </a>
                  <ul>
                     <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=20">Real 후기</a></li>
                     <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=30">남자 게시판</a></li>
                     <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=40">여자 게시판</a></li>
                     <li class="end"><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=50">1:1문의하기</a></li>
                  </ul></li>

               <li><a href="http://www.wedaehan.com/bbs/wishlist.php">
                     <div class="menu"
                        style="border: 0px; height: 21px; overflow: hidden;">
                        마이페이지<br> Mypage
                     </div>
               </a>
                  <ul>
                     <li><a href="http://www.wedaehan.com/bbs/wishlist.php">My 미팅 현황</a></li>
                     <li><a href="http://www.wedaehan.com/bbs/mypage.php">My 티켓내역</a></li>
                     <li class="end"><a
                        href="http://www.wedaehan.com/bbs/member_confirm.php?url=/bbs/register_profile.php">My
                           프로필 수정</a></li>
                  </ul></li>
            </ul>
         </div>
      </nav>

      <nav id="gnb2">
         <div id="gnb_2">
            <link rel="stylesheet" href="http://www.wedaehan.com/css/slicknav.css">
            <script
               src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.2/modernizr.min.js"></script>

            <ul id="moblie_menu">
               <li class="frst">위대한 회원
                  <ul>
                     <li><a href="http://www.wedaehan.com/bbs/register.php">회원가입</a></li>
                     <li><a href="http://www.wedaehan.com/bbs/login.php?url=%2F">로그인</a></li>
                  </ul>
               </li>
               <li class="frst">위대한 만남
                  <ul>
                     <li><a href="http://www.wedaehan.com/sub/sub01_01.php">왜 위대한인가?</a></li>
                     <li><a href="http://www.wedaehan.com/sub/sub01_02.php">Storytelling</a></li>
                     <li><a href="http://www.wedaehan.com/bbs/board.php?bo_table=news">공지사항</a></li>
                     <li><a href="http://www.wedaehan.com/bbs/board.php?bo_table=event">이벤트</a></li>
                     <li><a href="http://www.wedaehan.com/sub/sub01_05.php">Contact us</a></li>
                  </ul>
               </li>
               <li>1:1소개팅
                  <ul>
                     <li><a href="http://www.wedaehan.com/sub/sub02_01.php">Personal Dating</a></li>
                     <li><a href="http://www.wedaehan.com/sub/sub02_02.php">진행 안내</a></li>
                     <li><a href="http://www.wedaehan.com/sub/sub02_03.php">가격 안내</a></li>
                  </ul>
               </li>
               <li>스피드 데이트
                  <ul>
                     <li><a
                        href="http://www.wedaehan.com/bbs/board.php?bo_table=speeddate&sca=%EC%84%9C%EC%9A%B8%2F%EC%88%98%EB%8F%84%EA%B6%8C">서울
                           / 수도권</a></li>
                     <li><a
                        href="http://www.wedaehan.com/bbs/board.php?bo_table=speeddate&sca=%EA%B4%91%EC%97%AD">광역시</a></li>
                     <li><a href="/sub/sub03_03.php">스피드 데이트 is</a></li>
                  </ul>
               </li>
               <li>후기&문의
                  <ul>
                     <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=20">Real 후기</a></li>
                     <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=30">남자 게시판</a></li>
                     <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=40">여자 게시판</a></li>
                     <li><a href="<%=request.getContextPath()%>/BoardList.bo?boardtype=50">1:1문의하기</a></li>
                  </ul>
               </li>
               <li>마이페이지
                  <ul>
                     <li><a href="http://www.wedaehan.com/bbs/wishlist.php">My 미팅 현황</a></li>
                     <li><a href="http://www.wedaehan.com/bbs/mypage.php">My 티켓내역</a></li>
                     <li><a href="http://www.wedaehan.com/bbs/wishlist.php">My 프로필 수정</a></li>
                  </ul>
               </li>
            </ul>

            <script src="http://www.wedaehan.com/js/jquery.slicknav.js"></script>
            <script type="text/javascript">
               $(document).ready(function() {
                  $('#moblie_menu').slicknav();
               });
            </script>
         </div>
      </nav>

   </div>

   <!-- } Header End -->
</body>
</html>
