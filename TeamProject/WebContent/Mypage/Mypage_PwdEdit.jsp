<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Member user = null;
	String userid = null;
	if (session.getAttribute("user") != null) {
		user = (Member) session.getAttribute("user");
		userid = user.getId();
	}
	String pw = user.getPw();
	System.out.println("가져온 pw값" + pw);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

	<!-- 회원정보 입력/수정 시작 { -->
	<div class="form-panel">
		<form class="form-horizontal style-form" id="fregisterform"
			name="fregisterform" method="post"
			action="<%=request.getContextPath()%>/PwdEdit.edit"
			>
			<input type="hidden" id="pw" name="pw" value="<%=pw%>">
			<!--  -->
			<h4 class="mb">
				<i class="fa fa-angle-right"></i> 비밀번호 변경
			</h4>
			<div class="form-group">
				<div class="col-sm-10">
					<div class="alert alert-danger">
						<b>주의</b><br>다른 사이트에서 사용하지 않는 고유한 비밀번호를 사용하시고, 주기적으로 변경해주세요.
						<br>비밀번호 변경 시 모바일기기와 외부메일 계정이 모두 로그아웃 됩니다. <br>변경한 비밀번호로
						다시 로그인해주세요.
					</div>
				</div>
			</div>
			<!-- 기존 비밀 번호 맞는지 확인 -->
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">현재 비밀번호</label> <input
						type="password" name="mb_pwd" id="mb_pwd"> <input
						type="button" class="btn btn-danger" value="확인" id="pwdcheck"
						name="pwdcheck">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">비밀번호</label> <input
						type="password" name="mb_password" id="mb_password"
						maxlength="20" width="160px" height="34px">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">비밀번호 확인</label> <input
						type="password" name="mb_password_re" id="mb_password_re"
						maxlength="20" width="160px" height="34px"> <span
						id="message"></span>
					<!-- 비밀번호 일치여부 출력하는 곳  -->
				</div>
			</div>
			<!-- 추가정보입력  -->


			<div class="form-group">
				<div class="col-sm-10" align="center">
					<input type="submit" class="btn btn-theme04" value="수정완료"
						id="btn_submit" accesskey="s" onclick="return check();"> <a
						href="Mypage_Edit.jsp" class="btn_cancel"> <input
						type="button" class="btn btn-theme03" value="취소  ">
					</a>
					
				</div>
			</div>
		</form>
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

	<script type="text/javascript">
		$(function() {
			//본인 비밀 번호 맞는지 여부
			$("#pwdcheck").click(function() {
				if($('#mb_pwd').val() == $('#pw').val()){
					alert('비밀번호가 일치합니다');
					$("#mb_password").focus();
				}else{
					alert('비밀번호가 일치 하지않습니다.');
					$("#mb_pwd").focus();
				}

			});



			//비밀번호 중복 체크
			$('#reg_mb_password_re')
					.keyup(
							function() {
								if ($('#reg_mb_password').val() == $(
										'#reg_mb_password_re').val()) {
									$("#message").html(" ");
								} else {
									$("#message")
											.html(
													"<font color='red'> ※비밀번호가 일치하지 않습니다.</font>");
								}
							});
			
		});
	</script>
	<script>
		//유효성 체크 함수
		function check(){
			if($('#mb_password').val()=='' ||$('#mb_password_re').val()==''){
				alert('비밀번호를 입력하세요.');
				return false;
			}else{
				//수정완료 호출
				alert('수정 완료');
				return true;
			}
		}
	</script>

</body>
</html>