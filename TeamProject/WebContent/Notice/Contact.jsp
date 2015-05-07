<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<body style>
	<c:import url="/Include/Header.jsp" />
	<section id="main-content"> <section
		class="wrapper site-min-height">
	<h3>
		<i class="fa fa-angle-right"></i> Contact Us
	</h3>
	<!-- row  한줄 -->
	<div class="row">
		<div class="col-lg-4 col-md-4 col-sm-4 mb">
			<div class="white-panel pn">
				<div class="white-header">
					<h5>MEMBER</h5>
				</div>
				<p>
					<img
						src="<%=request.getContextPath()%>/assets/img/friends/psm1.jpg"
						class="img-circle" width="50">
				</p>
				<p>
					<b>PARK SEULMIN</b>
				</p>
				<div class="row">
					<div class="col-md-6">
						<p class="small mt">BIRTH</p>
						<p>89.07.21</p>
					</div>
					<div class="col-md-6">
						<p class="small mt">PHONE</p>
						<p>010.2433.2053</p>
					</div>
				</div>
			</div>
		</div>
		<!-- /col-md-4 -->
		<div class="col-lg-4 col-md-4 col-sm-4 mb">
			<div class="white-panel pn">
				<div class="white-header">
					<h5>MEMBER</h5>
				</div>
				<p>
					<img src="<%=request.getContextPath()%>/assets/img/friends/hj.jpg"
						class="img-circle" width="50">
				</p>
				<p>
					<b>JANG HYEJUNG</b>
				</p>
				<div class="row">
					<div class="col-md-6">
						<p class="small mt">BIRTH</p>
						<p>92.04.30</p>
					</div>
					<div class="col-md-6">
						<p class="small mt">PHONE</p>
						<p>010.3431.5431</p>
					</div>
				</div>
			</div>
		</div>
		<!-- 행 끝 -->
		<div class="col-lg-4 col-md-4 col-sm-4 mb">
			<div class="white-panel pn">
				<div class="white-header">
					<h5>MEMBER</h5>
				</div>
				<p>
					<img src="<%=request.getContextPath()%>/assets/img/friends/jh.jpg"
						class="img-circle" width="50">
				</p>
				<p>
					<b>KIM JIHYUN</b>
				</p>
				<div class="row">
					<div class="col-md-6">
						<p class="small mt">BIRTH</p>
						<p>93.11.26</p>
					</div>
					<div class="col-md-6">
						<p class="small mt">PHONE</p>
						<p>010.6858.3067</p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- row  두줄 -->
	<div class="row">
		<div class="col-lg-4 col-md-4 col-sm-4 mb">
			<div class="white-panel pn">
				<div class="white-header">
					<h5>MEMBER</h5>
				</div>
				<p>
					<img src="<%=request.getContextPath()%>/assets/img/friends/kjh.jpg"
						class="img-circle" width="50">
				</p>
				<p>
					<b>KIM JUNGHYUN</b>
				</p>
				<div class="row">
					<div class="col-md-6">
						<p class="small mt">BIRTH</p>
						<p>84.01.07</p>
					</div>
					<div class="col-md-6">
						<p class="small mt">PHONE</p>
						<p>010.7444.5874</p>
					</div>
				</div>
			</div>
		</div>
		<!-- /col-md-4 -->
		<div class="col-lg-4 col-md-4 col-sm-4 mb">
			<div class="white-panel pn">
				<div class="white-header">
					<h5>MEMBER</h5>
				</div>
				<p>
					<img src="<%=request.getContextPath()%>/assets/img/friends/mj.jpg"
						class="img-circle" width="50">
				</p>
				<p>
					<b>KIM MYUNGJAE</b>
				</p>
				<div class="row">
					<div class="col-md-6">
						<p class="small mt">BIRTH</p>
						<p>84.04.10</p>
					</div>
					<div class="col-md-6">
						<p class="small mt">PHONE</p>
						<p>010.3688.0719</p>
					</div>
				</div>
			</div>
		</div>
		<!-- 행 끝 -->
		<div class="col-lg-4 col-md-4 col-sm-4 mb">
			<div class="white-panel pn">
				<div class="white-header">
					<h5>MEMBER</h5>
				</div>
				<p>
					<img src="<%=request.getContextPath()%>/assets/img/friends/sh.jpg"
						class="img-circle" width="50">
				</p>
				<p>
					<b>MUN SUNGHYUN</b>
				</p>
				<div class="row">
					<div class="col-md-6">
						<p class="small mt">BIRTH</p>
						<p>84.04.10</p>
					</div>
					<div class="col-md-6">
						<p class="small mt">PHONE</p>
						<p>010.3688.0719</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>

	<h3>
		<i class="fa fa-angle-right"></i> 정보
	</h3>
	<!--위대한만남정보  -->
	<div class="content-panel">
		<hr>
		<table class="table table-striped table-advance table-hover">
			<thead>
				<tr>
					<th><i class="fa fa-bullhorn"></i>주소</th>
					<th class="hidden-phone"><i class="fa fa-question-circle"></i>전화</th>
					<th><i class="fa fa-bookmark"></i>이메일</th>
					<th><i class=" fa fa-edit"></i> 카카오톡</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<td>경기도 성남시 분당구 삼평동 대왕판교로 670길 유스페이스2 B동 8층</td>
					<td class="hidden-phone">TEL : 070-7090-4972 / FAX : 02) 408-2599</td>
					<td>qualityofmeeting @ naver.com</td>
					<td>ID : qualityofmeeting</td>
				</tr>
			</tbody>
		</table>
				<hr>
		
		<div align="center">
			<span class="label label-danger" style="font-size: medium;">THE
				GREATMEETING</span>
		</div>
		<div>
			<br>
		</div>
	</div>



	<h3>
		<i class="fa fa-angle-right"></i> Location
	</h3>
	<div class="showback">

		<!-- 지도api 시작 -->
		<div id="map" style="width: 100%; height: 400px;" align="center">
		</div>
	</div>






	<div style="padding: 5px;" align="center"></div>

	</section> </section>

	<!--section 끝 스크립트  -->
	<!-- js placed at the end of the document so the pages load faster -->
	<script src="<%=request.getContextPath()%>/assets/js/jquery.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/jquery-1.8.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/jquery.dcjqaccordion.2.7.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/jquery.scrollTo.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/jquery.nicescroll.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/jquery.sparkline.js"></script>


	<!--common script for all pages-->
	<script src="<%=request.getContextPath()%>/assets/js/common-scripts.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/gritter/js/jquery.gritter.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/gritter-conf.js"></script>

	<!--script for this page-->
	<script
		src="<%=request.getContextPath()%>/assets/js/sparkline-chart.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/zabuto_calendar.js"></script>


	<!--지도api  -->
	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=ad805ca7d0ae628142425b56ee9203f6"></script>



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

	<script>
		//custom select box

		$(function() {
			$('select.styled').customSelect();
		});
	</script>

	<!--지도api  -->
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.402119, 127.107018), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption); 

		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(37.402119, 127.107018), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});

		// 마커 위에 표시할 인포윈도우를 생성한다
		var infowindow = new daum.maps.InfoWindow({
		    content : '<div style="padding:5px;" align="center">THE GREAT MEETING♥</div>' // 인포윈도우에 표시할 내용
		});

		// 인포윈도우를 지도에 표시한다
		infowindow.open(map, marker);

	</script>
</body>
</html>