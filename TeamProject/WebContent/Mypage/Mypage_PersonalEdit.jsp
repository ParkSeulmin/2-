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
			name="fregisterform" method="post" action="<%=request.getContextPath()%>/EditProfile.edit"
			enctype="multipart/form-data">
			<!--  -->
			<h4 class="mb">
				<i class="fa fa-angle-right"></i> 개인정보수정
			</h4>
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">닉네임</label> <input
						type="text" name="mb_nick" id="mb_nick"> <input
						type="button" class="btn btn-danger" value="중복확인" id="nickcheck"
						name="nickcheck">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">프로필 사진</label> <input
						id="u_mypicture" name="u_mypicture" type="file" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">우편번호</label> <input
						type="text" name="post1" value="" id="post1"> - <input
						type="text" name="post2" value="" id="post2"> <input
						type="button" onclick="openDaumPostcode()" class="btn btn-theme03"
						value="우편번호 찾기">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">주소</label> <input
						type="text" name="address" value="" id="address">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">상세 주소</label> <input
						type="text" name="address2" value="" id="address2">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">E-mail</label> <input
						type="text" name="mb_email1" id="reg_mb_email1" value=""
						maxlength="100"> @ <input type="text" name="mb_email2"
						id="reg_mb_email2" value="" maxlength="100"> <select
						name="mb_email3"
						onchange="document.fregisterform.mb_email2.value = this.value;document.fregisterform.mb_email2.focus()">
						<option value="">-선택-</option>
						<option value="daum.net">daum.net</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
						<option value="naver.com">naver.com</option>
						<option value="lycons.co.kr">lycons.co.kr</option>
						<option value="netsgo.com">netsgo.com</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">휴대폰 번호</label> <select
						name="mb_hp1" id="mb_hp1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select> - <input type="text" name="mb_hp2" id="mb_hp2" value=""
						class="frm_input hp nextFocus" title="휴대폰번호" maxlength="4"
						size="6"> - <input type="text" name="mb_hp3" id="mb_hp3"
						value="" class="frm_input hp" title="휴대폰번호" maxlength="4" size="6">
				</div>
			</div>
			<!-- 추가정보입력  -->


			<div class="form-group">
				<div class="col-sm-10" align="center">
					<input type="submit" class="btn btn-theme04" value="수정완료"
						id="btn_submit" accesskey="s" onclick="showalert();"> <a
						href="Mypage_Edit.jsp" class="btn_cancel"> <input type="button"
						class="btn btn-theme03" value="취소  ">
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
			//아이디 중복 확인
			$("#idcheck").click(function() {
				var id_data = {
					tag : "1",
					id : $('#reg_mb_id').val()
				};
				$.ajax({
					type : "POST",
					url : "CheckController.ch",//보낼 주소
					data : id_data,
					dataType : "html",
					success : function(responseData) {//서버에서 보낸 데이터
						var result = JSON.parse(responseData);
						//alert('result 값' + result);
						if (result == 1) {
							alert("ID 중복입니다.");
						} else {
							alert("사용가능한 ID 입니다.");
						}

					},
					error : function(e) {
						alert("에러발생");
					}
				});
			});

			//닉네임 중복 확인
			$("#nickcheck").click(function() {
				var nick_data = {
					tag : "2",
					nick : $('#mb_nick').val()
				};
				$.ajax({
					type : "POST",
					url : "CheckController.ch",//보낼 주소
					data : nick_data,
					dataType : "html",
					success : function(responseData) {//서버에서 보낸 데이터
						var result = JSON.parse(responseData);
						if (result == 1) {
							alert("닉네임 중복입니다.");
						} else {
							alert("사용가능한 닉네임 입니다.");
						}

					},
					error : function(e) {
						alert("에러발생");
					}
				});
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

			//주민번호 앞자리체크
			//frm.name.value.substring(i, i+1); 
			//$( 'p' ).text().substring( 0, 40 );
			$('#mb_birth2')
					.keyup(
							function() {

								if ($('#mb_birth2').val().substr(0, 1) != "1"
										&& $('#mb_birth2').val().substr(0, 1) != "2") {
									$("#message1")
											.html(
													"<font color='red'> ※올바른 주민번호를 입력해주세요.</font>");
								} else {
									$("#message1").html("");
								}
							});

			$('.email1').keyup(function() {
				$("#msg_mb_email").html("");
			});
			$('.email1').focusout(
					function() {
						$('#reg_mb_email').val(
								$('#reg_mb_email1').val() + '@'
										+ $('#reg_mb_email2').val());
						if ($('#reg_mb_email1').val()
								&& $('#reg_mb_email2').val()) {
							msg = reg_mb_email_check();
							if (!msg) {
								$("#msg_mb_email").css('color', 'blue');
								$("#msg_mb_email").html("사용가능한 이메일입니다.");
							} else {
								$("#msg_mb_email").css('color', 'red');
								$("#msg_mb_email").html(msg);
							}
						}
					});
		});
	</script>
	<script>
		//회원가입 완료메시지 띄우기
		function showalert() {
			alert('수정 완료');
		}
	</script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		function openDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.getElementById('post1').value = data.postcode1;
							document.getElementById('post2').value = data.postcode2;
							document.getElementById('address').value = data.roadAddress;//도로명주소
							document.getElementById('address2').focus();
						}
					}).open();
		}
	</script>
</body>
</html>