<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Member user = (Member) session.getAttribute("user");//로그인아이디가져옴
	if (session.getAttribute("user") != null) {
		user = (Member) session.getAttribute("user");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>회원정보수정</title>

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
	<section id="main-content"> <section class="wrapper">
	<div class="row mt">
		<div class="col-lg-6 col-md-6 col-sm-12">
<div class="showback" style="width: 500px; height: 300px;  background-image: url('<%=request.getContextPath()%>/Images/b.jpg');">
		<!-- <div class="showback" style="width: 500px; height: 300px;"> -->
				<h4>
					<i class="fa fa-angle-right"></i>비밀번호변경
				</h4>
				<div align="right">
					<a href="Mypage_PwdEdit.jsp">
						<button type="button" class="btn btn-round btn-success">Go</button>
					</a>
				</div>
			</div>
		</div>
		<!-- --/col-lg-6 ---->

		<!-- 개인정보변경 -->
		<div class="col-lg-6 col-md-6 col-sm-12">
			<div class="showback" style="width: 500px; height: 300px; background-image: url('<%=request.getContextPath()%>/Images/aa.jpg');">
				<h4>
					<i class="fa fa-angle-right"></i>개인정보변경
				</h4>
			<div class="project-wrapper"  style="width: 350px; height: 50px;">
				<div class="project">
					<div class="photo-wrapper">
						<div class="photo">
							
						</div>
					</div>
				</div>
			</div>
				<div align="right" align="">
					<a href="Mypage_PersonalEdit.jsp">
						<button type="button" class="btn btn-round btn-primary">Go</button>
					</a>
				</div>
			</div>
		</div>
		<!-- /col-lg-6 -->


		<!-- 추가정보수정 -->
		<div class="col-lg-6 col-md-6 col-sm-12">
			<div class="showback" style="width: 500px; height: 300px; background-image: url('<%=request.getContextPath()%>/Images/hhhhh.jpg');">
				<h4>
					<i class="fa fa-angle-right"></i>추가정보수정
				</h4>
				<div align="right">
					<a href="Mypage_PersonaladdInfo.jsp">
						<button type="button" class="btn btn-round btn-warning">GO</button>
					</a>
				</div>
			</div>
		</div>
		<!-- /col-lg-6 -->

		<div class="col-lg-6 col-md-6 col-sm-12">
			<div class="showback" style="width: 500px; height: 300px;  background-image: url('<%=request.getContextPath()%>/Images/ggggggg.jpg');">
				<h4>
					<i class="fa fa-angle-right"></i>회원탈퇴
				</h4>
				<div align="right">
					<a href="Mypage_PersonalDelete.jsp">
						<button type="button" class="btn btn-round btn-danger">GO</button>
					</a>
				</div>
			</div>
		</div>
		<!-- /col-lg-6 -->

	</div>
	</section> </section>

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

</body>
</html>