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
			action="<%=request.getContextPath()%>/Editadd.edit"
			>
			<!--  -->
			<h4 class="mb">
				<i class="fa fa-angle-right"></i> 추가정보수정
			</h4>
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">연봉</label> <select
						name="sal" id="sal">
						<option value="1000">2000이하</option>
						<option value="3000">2000~4000이하</option>
						<option value="5000">4000~6000이하</option>
						<option value="7000">6000~8000이하</option>
						<option value="8000">8000이상</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">키</label> <input
						type="text" name="cm" id="cm" size="20" maxlength="20">
					<span id="cm3"></span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">몸무게</label> <input
						type="text" name="weight2" id="weight2" size="20" maxlength="20">
					<span id="weight3"></span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">직종</label> <select
						name="job">
						<option value="">직업선택</option>
						<option value="관리">관리</option>
						<option value="건설">건설</option>
						<option value="경비">경비</option>
						<option value="경영">경영/회계,사무</option>
						<option value="교육">교육/연구</option>
						<option value="금융">금융/보험</option>
						<option value="군인">군인</option>
						<option value="기계">기계</option>
						<option value="농림어업">농림어업</option>
						<option value="문화">문화/예술/방송</option>
						<option value="미용">미용,숙박,여행</option>
						<option value="법률">법률/경찰/소방/교도</option>
						<option value="보건">보건/의료</option>
						<option value="사회복지">사회복지/종교</option>
						<option value="섬유">섬유/의복</option>
						<option value="식품가공">식품가공</option>
						<option value="영업">영업/판매</option>
						<option value="운전">운전/운송</option>
						<option value="전기">전기/전자</option>
						<option value="인쇄">인쇄/목재/가구</option>
						<option value="화학">화학</option>
						<option value="학생">학생</option>
						<option value="대학생">대학(원)생</option>
						<option value="기타">기타</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">최종 학력</label> <input
						type="radio" id="school" name="school" value="대학원">대학원졸업 <input
						type="radio" id="school" name="school" value="대학">대학졸업 <input
						type="radio" id="school" name="school" value="고등">고등학교졸업 <input
						type="radio" id="school" name="school" value="중등">중학교졸업 <br>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<label class="col-sm-2 col-sm-2 control-label">소개글</label>
					<textarea id="content" name="content" cols="50px" rows="5px"></textarea>
				</div>
			</div>


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
		//유효성 체크 함수
		function check(){
			if($('#sal').val()=='') {
				alert('연봉을 선택하세요');
				return false;
			}else if($('#cm').val()==''){
				alert('키를 입력하세요.');
				return false;
			}else if($('#weight2').val()==''){
				alert('몸무게를 입력하세요.');
				return false;
			}else if($('#job').val()==''){
				alert('직업을 선택하세요.');
				return false;
			}else if($('#school').val()==''){
				alert('학력을 선택하세요.');
				return false;
			}else if($('#content').val()==''){
				alert('소개글을 입력하세요');
			}else{
				//수정완료 호출
				alert('수정 완료');
				return true;
			}
		}
	</script>
	
	<script type="text/javascript">
	$('#mb_birth').keyup(
			function() {
				var birth = $('#mb_birth').val().substring(0,2);
				console.log(birth);
				if(parseInt(birth) < 50){
					$("#jumin").html(
							"<font color='red'> ※잘못된 형식의 주민번호를 입력하셨습니다.</font>");
				}else{
					$("#jumin").html('');					
				}
			});
	
	$('#cm').keyup(
			function() {
				if($('#cm').val().length>3 || $('#cm').val().substring(0,1) != '1' &&  $('#cm').val().substring(0,1) != '2'){
					$("#cm3").html(
							"<font color='red'> ※잘못된 키를 입력하셨습니다.</font>");
						}else{
							$("#cm3")
							.html('');
						}
					$('#cm').focus();
					return false;
				}
			);
	$('#weight2').keyup(
			function() {
				if($('#weight2').val().length>3){
					$("#weight3")
					.html(
							"<font color='red'> ※잘못된 몸무게를 입력하셨습니다.</font>");
						}else{
							$("#weight3").html('');							
						}
					$('#weight2').focus();
					return false;
				}
			);
	
	$('#mb_birth2').keyup(
			function() {
				if($('#mb_birth2').val().substring(0,1) != '1' && 
						$('#mb_birth2').val().substring(0,1) != '2'){
					$("#jumin").html(
					"<font color='red'> ※잘못된 형식의 주민번호를 입력하셨습니다.</font>");
					
				}else{
					$("#jumin").html('');
				}
			});
                          
     </script>

	
</body>
</html>