<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
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
<!-- 	<script type="text/javascript">
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
										$("#message")
												.html(
														"<font color='red'> ※비밀번호가 일치합니다.</font>");
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
											&& $('#mb_birth2').val().substr(0,
													1) != "2") {
										$("#message1")
												.html(
														"<font color='red'> ※올바른 주민번호를 입력해주세요.</font>");
									} else {
										$("#message1").html("");
									}
								});

			});
		</script> -->
</head>
<body style>
	<c:import url="/Include/Header.jsp" />
		<section id="main-content">
		<section class="wrapper">
	
		<!-- 회원정보 입력/수정 시작 { -->
	<div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> 회원정보입력</h4>
                      <form class="form-horizontal style-form" method="get">
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">이름</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" width="160px" height="34px">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Help text</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control">
                                  <span class="help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Rounder</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control round-form">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Input focus</label>
                              <div class="col-sm-10">
                                  <input class="form-control" id="focusedInput" type="text" value="This is focused...">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Disabled</label>
                              <div class="col-sm-10">
                                  <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled="">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Placeholder</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" placeholder="placeholder">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Password</label>
                              <div class="col-sm-10">
                                  <input type="password" class="form-control" placeholder="">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-lg-2 col-sm-2 control-label">Static control</label>
                              <div class="col-lg-10">
                                  <p class="form-control-static">email@example.com</p>
                              </div>
                          </div>
                      </form>
                  </div>
	
	</section>
	</section>






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
		<script
			src="<%=request.getContextPath()%>/assets/js/common-scripts.js"></script>
</body>
