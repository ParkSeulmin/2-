<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>DASHGUM - FREE Bootstrap Admin Template</title>

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/assets/css/bootstrap.css"
	rel="stylesheet">
<!--external css-->
<link
	href="<%=request.getContextPath()%>/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/js/gritter/css/jquery.gritter.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/assets/css/style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/css/style-responsive.css"
	rel="stylesheet">

<script
	src="<%=request.getContextPath()%>/assets/js/chart-master/Chart.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	display: block;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	padding: 5px 5px 8px 5px;
	font: 10px arial, san serif;
	text-align: left;
}
</style>
</head>
<body  style>
	<c:import url="/Include/Header.jsp" />
	 <section id="main-content">
          <section class="wrapper">
	<!-- //Wrapper -->
	<div class="row">
                  <div class="col-lg-9 main-chart">
							</div>
                    </div><!-- /row -->
		<!-- <div class="content_title">
			<h1>
				<span><br>
				<br>데이트 하기</span>
			</h1>
			<p>
				<br>━
			</p>
			<span class="content_title_s"><strong>고품격 만남 서비스</strong><br>
			<br>회원님의 소중한 인연<br>책임감 있게 보답해드리겠습니다.</span>
		</div> -->

		<!-- javascript -->
		<script type="text/javascript"
			src="http://www.wedaehan.com/js/jquery.tools.min.js"></script>
		<!--[if lt IE9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
		<script type="text/javascript">
			$(function() {
				var indicator = $('#indicator'), indicatorHalfWidth = indicator
						.width() / 2, lis = $('#tabs').children('li');
				$("#tabs")
						.tabs(
								"#content_tab section",
								{
									effect : 'fade',
									fadeOutSpeed : 100,
									fadeInSpeed : 800,
									onBeforeClick : function(event, index) {
										var li = lis.eq(index), newPos = li
												.position().left
												+ (li.width() / 2)
												- indicatorHalfWidth;
										indicator.stop(true).animate({
											left : newPos
										}, 800, 'easeInOutExpo');
									}
								});
			});
		</script>

		 <div id="col-lg-3 ds">
			<h2>만남의 품격 1:1 만남은 차별화된 맞춤 서비스를 제공합니다.</h2>
			<p>고객님이 원하는 정보로 접근하여 이성에게 데이트 신청을 할 수 있습니다.</p>

			<p></p> 
			<div id="tab">
				<ul id="tabs">
					<li class="man"><a class="" href="#">만남의 품격?</a></li>
					<li class="woman"><a href="#" class="current">이용 방법</a></li>
				</ul>
				<span id="indicator" style="left: 548.715301513672px;"></span>
			</div>

			<div id="content_tab">

				<!-- 남성회원 -->
				<section style="display: none;">
				<p></p>
				<table class="tbl_type2" border="0" cellspacing="0" summary="여성회원"
					width="100%">
					<caption>여성회원</caption>
					<colgroup>
						<col width="33.33%">
						<col width="33.33%">
						<col width="33.33%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" colspan="3">이상형 검색</th>
						</tr>
						<tr>
							<td colspan="3" style="line-height: 30px;">사용자가 원하는 지역 나이 등을
								검색하여 나의 이상형을 확인할 수 있습니다.<br>
							<br>
							<strong>추천드리는 프로필 횟수에는 제한이 없으며, 이성분과 실제 만남이 이루어지지 않았을
									경우, 횟수에서 차감되지 않습니다.</strong><br>
							<br> <span class="black_bg2"
								style="font-size: 15px; background-color: black; color: #e3c069; font-weight: bold;">높은
									횟수의 티켓으로 갈수록, 프로필 드리는 횟수와 진행속도에 차이가 있습니다. <br>실제로 1회 이상
									만나지 못하셨거나 서비스의 불만족시, 전액 100% 환불해드립니다.
							</span>
							</td>
						</tr>
						<tr>
							<th scope="row" colspan="3">Standard Ticket [34세 미만]</th>
						</tr>
						<tr>
							<td>
								<h1>
									<img src="http://www.wedaehan.com/image/sub/s1.png"
										title="Standard Ticket 1">
								</h1>
								<p>
									소개팅 1회<br> <em>80,000</em> →<br>45,000원
								</p>
							</td>
							<td>
								<h1>
									<img src="http://www.wedaehan.com/image/sub/s2.png"
										title="Standard Ticket 2">
								</h1>
								<p>
									소개팅 3회<br> <em>240,000</em> →<br>110,000원
								</p>
							</td>
							<td>
								<h1>
									<img src="http://www.wedaehan.com/image/sub/s3.png"
										title="Standard Ticket 3">
								</h1>
								<p>
									소개팅 5회<br> <em>400,000</em> →<br>180,000원
								</p>
							</td>


						</tr>
						<tr>
							<th scope="row" colspan="3">Gold Ticket [34세 이상]</th>
						</tr>
						<tr>
							<td>
								<h1>
									<img src="http://www.wedaehan.com/image/sub/g1.png"
										title="Gold Ticket 1">
								</h1>
								<p>
									소개팅 1회<br> <em>100,000</em> →<br>60,000원
								</p>
							</td>
							<td>
								<h1>
									<img src="http://www.wedaehan.com/image/sub/g2.png"
										title="Gold Ticket 2">
								</h1>
								<p>
									소개팅 3회<br> <em>300,000</em> →<br>150,000원
								</p>
							</td>
							<td>
								<h1>
									<img src="http://www.wedaehan.com/image/sub/g3.png"
										title="Gold Ticket 3">
								</h1>
								<p>
									소개팅 5회<br> <em>500,000</em> →<br>240,000원
								</p>
							</td>
						</tr>
					</tbody>
				</table>
				<br>
				<br>
				<br>
				<br>

				<img src="http://www.wedaehan.com/image/sub/1a.jpg" width="100%">
				<table class="tbl_type2" border="0" cellspacing="0" summary="여성회원"
					width="100%">
					<caption>여성회원</caption>
					<colgroup>
						<col width="33.33%">
						<col width="33.33%">
						<col width="33.33%">
					</colgroup>
					<tbody>

					</tbody>
				</table>

				<br>
				</section>

				
				<!--//남성회원-->

				<!-- 여성회원 -->
				<section style="display: block;">
				<p></p>
				<table class="tbl_type2" border="0" cellspacing="0" summary="남성회원"
					width="100%">
					<caption>남성회원</caption>
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" colspan="4">만남의 품격</th>
						</tr>
						<tr>
							<td colspan="1"><img
								src="/TeamProject/Images/Date/Amanda.png" width="100%"></td>


							<td colspan="3"><span class="black_bg2"
								style="font-size: 18px; background-color: black; color: #e3c069; font-weight: bold;">
									만남의 품격은 이상형 찾기와 파티 참석 화살 쏘기 등<span
									style="font-size: 20px; color: #e3c069;"> 다양한 방법으로 이성에게
								</span>다가갈 수 있는 방법을 가지고 있습니다.
							</span><br>
							<span style="font-size: 13px; color: gray;"><br></span></td>
						</tr>
					</tbody>
				</table>
				<br>
				<br>
				<table class="tbl_type2" border="0" cellspacing="0" summary="남성회원"
					width="100%">
					<caption>남성회원</caption>
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" colspan="4">이상형 찾기</th>
						</tr>

						<tr>
							<td colspan="4"><br>
							<br> <span class="black_bg2"
								style="font-size: 15px; background-color: black; color: #e3c069; font-weight: bold;">
									이상형 찾기는 원하는 이성을 여러 항목으로 검색한 후에 마음이 가는 이성에게 화살을 날리는 방식으로 상대방이
									수락하면 친구가 되어 서로 메시지를 주고 받을 수 있습니다. </span></td>
						</tr>
						<tr>
							<td colspan="2"><span
								style="font-size: 18px; font-weight: bold;">화살이 있을 경우</span></td>
							<td colspan="2"><span
								style="font-size: 18px; font-weight: bold;">화살이 없을 경우</span></td>
						</tr>
						<tr>
							<td colspan="2">
								<h1>
									<img src="/TeamProject/Images/Date/love1.png" width="70%"
										title="Standard Ticket 2">
								</h1>
								<p>
									<span style="font-size: 18px; font-weight: bold;">원하는
										이성을 검색 후 화살을 날리자</span><br> 화살은 하루에 3개가 주어진다.<br> 어떤 이성에게
									화살을 날릴지 신중히 생각하자<br>
								</p>
							</td>

							<td colspan="2">
								<h1>
									<img src="/TeamProject/Images/Date/love2.png" width="70%"
										title="Gold Ticket 2">
								</h1>
								<p>
									<span style="font-size: 16px; font-weight: bold;">화살이
										없으면 원하는 이성이 있어도 눈으로만 봐야한다.ㅠㅠ</span><br> 하루가 지나면 다시 초기화되니 그 때까지 잘
									참아보자<br> <em>사랑 고백, 화살 쏘기</em><br>
								</p>
							</td>

						</tr>
					</tbody>
				</table>
				<br>
				<br>
				<table class="tbl_type2" border="0" cellspacing="0" summary="남성회원"
					width="100%">
					<caption>남성회원</caption>
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" colspan="4">파티 참석</th>
						</tr>
						<tr>
							<td colspan="1"><img
								src="/TeamProject/Images/Date/party.png" width="100%"></td>


							<td colspan="3"><span class="black_bg2"
								style="font-size: 18px; background-color: black; color: #e3c069; font-weight: bold;">
									우연적인 만남을 원한다면 !! 파티에 참석해보세요.<span
									style="font-size: 20px; color: #e3c069;"> 처음 만나는 이성과 편하게
								</span> 대화하고 웃을 수 있는 다양한 파티가 준비되어 있습니다.
							</span><br>
							<span style="font-size: 13px; color: gray;"><br></span></td>
						</tr>
					</tbody>
				</table>





				<br>





				<p></p>
				</section>
				<!-- //여성회원 -->
			</div>
			<p></p>

		</div>



		<div id="blank">&nbsp;</div>
	 <!-- </div>  -->
	<!-- //content_list -->
    	
	<!-- //contenter_sub -->
</section>
</section>


<!-- //wrapper -->

<script>
$(document).ready(function(){
  $(window).scroll(function () {
   if ($(this).scrollTop() > 10) { 
        $('#back-top').fadeIn();
   } else {
       $('#back-top').fadeOut();
   }
  });

  $('#back-top').click(function () {
   $('body,html').animate({
        scrollTop: 0
   }, 200);
        return false;
  });
});
</script>
<style>
#back-top {
 position: fixed;
 bottom: 100px; /* 부라우저 밑에서 위로 떨어질 높이설정  */
 left: 90%;
 margin:0px;  /* 부라우저 중앙에서 우측으로 떨어질 거리설정  */
 z-index:999;
 display:none;
}
</style>
<div id="back-top" style="display: none;">
    <a href="#wrap"><img src="http://www.wedaehan.com/image/all/go_top.png" width="60" height="60" alt="위로가기" title=""></a>
</div>
<!-- } 콘텐츠 끝 -->





 <script type="text/javascript">
$(document).ready(function() {
	$('#col-lg-3 ds').css('background', 'url(http://www.wedaehan.com/image/overlays/01.png) repeat center top transparent');
	$.backstretch([
	  'http://www.wedaehan.com/image/main/main01.gif',
	  'http://www.wedaehan.com/image/main/main02.gif',
	  'http://www.wedaehan.com/image/main/main03.gif'
	  ], {
		fade: 750,
		duration: 8000
	});
    // 폰트 리사이즈 쿠키있으면 실행
    font_resize("container", get_cookie("ck_font_resize_rmv_class"), get_cookie("ck_font_resize_add_class"));

});
</script>

<!-- js placed at the end of the document so the pages load faster -->
	<script src="<%=request.getContextPath()%>/assets/js/jquery.js"></script>
	
	
	<script class="include" type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery.scrollTo.min.js"></script>
	


	<!--common script for all pages-->
	<script src="<%=request.getContextPath()%>/assets/js/common-scripts.js"></script>

	<script type="application/javascript">
		
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    
	</script>


</body>
</html>