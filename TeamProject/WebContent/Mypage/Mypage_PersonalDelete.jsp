<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Member user = null;
	String userid = null;
	if (session.getAttribute("user") != null) {
		user = (Member) session.getAttribute("user");
		userid = user.getId();
	}
%>
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
<body style>
	<c:import url="/Include/Header.jsp" />
	<section id="main-content"> <section class="wrapper">
	<div class="form-panel">
		<form class="form-horizontal style-form" id="fregisterform"
			name="fregisterform" method="post"
			action="<%=request.getContextPath()%>/DeleteProfile.edit"
			enctype="multipart/form-data">
			<h4 class="mb">
				<i class="fa fa-angle-right"></i> 회원탈퇴
			</h4>
			<%-- 			<div class="form-group">
				<div class="col-sm-10">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</div>
				<div class="col-sm-10">
					사용하고 계신 아이디(<%=userid%>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
				</div>
				<div class="col-sm-10">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게
					선택하시기 바랍니다.</div>
				<div class="col-sm-10">
				<br>
				</div>	 --%>


			<div class="form-group">
				<div class="col-sm-10">
					<div class="alert alert-danger">
						<b>주의</b><br>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요. <br>사용하고 계신
						아이디(<%=userid%>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다. <br>탈퇴한 아이디는 본인과
						타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.
					</div>
				</div>
				<div class="col-sm-10" align="center">
					<input type="submit" id="btn" name="btn" class="btn btn-theme04"
						value="회원탈퇴" onclick="showalert();">
				</div>
			</div>
		</form>
	</div>
	</section> </section>

</body>

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
<script src="<%=request.getContextPath()%>/assets/js/sparkline-chart.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/zabuto_calendar.js"></script>



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
	//회원가입 완료메시지 띄우기
	function showalert() {
		alert('회원 탈퇴 완료');
	}
</script>
</html>