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
				<h4 class="mb">
					<i class="fa fa-angle-right"></i> 회원정보입력
				</h4>
				<form class="form-horizontal style-form" method="get">
				<div class="mbskin">

			<script src="http://www.wedaehan.com/js/jquery.register_form.js"></script>
			<script src="http://www.wedaehan.com/js/certify.js"></script>

			<form id="fregisterform" name="fregisterform"
				action="JoinController.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="w" value=""> <input type="hidden"
					name="cert_value" id="cert_value" value=""> <input
					type="hidden" name="url"
					value="%2Fbbs%2Fregi0
    
    ster_form.php"> <input
					type="hidden" name="agree" value="1"> <input type="hidden"
					name="agree2" value="1"> <input type="hidden"
					name="cert_type" value=""> <input type="hidden"
					name="mb_sex" value="">
				<div class="tbl_frm01 tbl_wrap">
					<table>
						<colgroup>
							<col class="grid_4">
							<col>
						</colgroup>
						<!-- <tbody> -->
						<tr>
							<th scope="row"><label for="reg_mb_name">이름<span>＊</span><strong
									class="sound_only">필수</strong></label></th>
							<td><input type="text" id="reg_mb_name" name="mb_name"
								value="" required="" class="frm_input nospace required "
								size="10"></td>
						</tr>
						<tr>
							<th scope="row">주민번호</th>
							<td><input class="text" type="text" name="mb_birth"
								id="mb_birth" size="15" maxlength="6" minlength="6" required=""
								numeric="" title="주민번호" value=""> - <input class="text"
								type="password" name="mb_birth2" id="mb_birth2" size="15"
								maxlength="7" minlength="7" required="" numeric="" title="주민번호"
								value="">
								<div id="message1"></div></td>
						</tr>
						<tr>
							<th scope="row"><label for="reg_mb_id">아이디<strong
									class="sound_only">필수</strong></label></th>
							<td><span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소
									3자이상 입력하세요.</span> <input type="text" name="mb_id" value=""
								id="reg_mb_id" required=""
								class="frm_input eng minlength_3 required " maxlength="20">
								<input type="button" id="idcheck" name="idcheck"
								value="아이디 중복확인"> <span id="msg_mb_id"></span></td>
						</tr>
						<tr>
							<th scope="row"><label for="reg_mb_password">비밀번호<strong
									class="sound_only">필수</strong></label></th>
							<td><input type="password" name="mb_password"
								id="reg_mb_password" required=""
								class="frm_input minlength_6 required" maxlength="20">
								※영문,숫자포함된 6글자 이상의 비밀번호</td>
						</tr>
						<tr>
							<th scope="row"><label for="reg_mb_password_re">비밀번호
									확인<strong class="sound_only">필수</strong>
							</label></th>
							<td><input type="password" name="mb_password_re"
								id="reg_mb_password_re" required=""
								class="frm_input minlength_6 required" maxlength="20"> <span
								id="message"></span></td>

						</tr>
						<!--암호 맞는지 메시지 출력  -->

						<!-- </tbody> -->
					</table>
				</div>

				<div class="tbl_frm01 tbl_wrap">
					<table>
						<caption>개인정보 입력</caption>
						<colgroup>
							<col class="grid_4">
							<col>
						</colgroup>
						<!-- <tbody> -->
						<tr>
							<th scope="row"><label for="reg_mb_nick">닉네임<strong
									class="sound_only">필수</strong></label></th>
							<td><span class="frm_info"> 공백없이 한글,영문,숫자만 입력 가능
									(한글2자, 영문4자 이상) </span> <input type="hidden" name="mb_nick_default"
								value=""> <input type="text" name="mb_nick" id="mb_nick"
								value=""> <input type="button" value="중복확인"
								id="nickcheck" name="nickcheck"> <span id="msg_mb_nick"></span>
							</td>
						</tr>

						<tr>
							<th scope="row"><label for="post">우편번호<strong
									class="sound_only">필수</strong></label></th>
							<td><input type="text" name="post1" value="" id="post1">-
								<input type="text" name="post2" value="" id="post2"> <input
								type="button" onclick="openDaumPostcode()" value="우편번호 찾기">
								<span id="msg_mb_post"></span></td>
						</tr>
						<tr>
							<th scope="row"><label for="address">주소<strong
									class="sound_only">필수</strong></label></th>
							<td><input type="text" name="address" value="" id="address">
								<span id="msg_mb_post"></span></td>
						</tr>
						<tr>
							<th scope="row"><label for="address">상세주소<strong
									class="sound_only">필수</strong></label></th>
							<td><input type="text" name="address2" value=""
								id="address2"> <span id="msg_mb_post"></span></td>
						</tr>



						<tr>
							<th scope="row"><label for="reg_mb_email">E-mail<strong
									class="sound_only">필수</strong></label></th>
							<td><input type="hidden" name="old_email" value="">
								<input type="hidden" name="mb_email" value="" id="reg_mb_email">
								<input type="text" name="mb_email1" id="reg_mb_email1" value=""
								class="frm_input required email1" maxlength="100"> @ <input
								type="text" name="mb_email2" id="reg_mb_email2" value=""
								class="frm_input required email1" maxlength="100"> <select
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
							</select> <span id="msg_mb_email"></span></td>
						</tr>


						<tr>
							<th scope="row"><label for="reg_mb_hp">휴대폰번호</label></th>
							<td><select name="mb_hp1" id="mb_hp1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select> - <input type="text" name="mb_hp2" id="mb_hp2" value=""
								class="frm_input hp nextFocus" title="휴대폰번호" maxlength="4"
								size="5"> - <input type="text" name="mb_hp3" id="mb_hp3"
								value="" class="frm_input hp" title="휴대폰번호" maxlength="4"
								size="5"> <input type="hidden" name="mb_hp" value=""
								id="reg_mb_hp"> <input type="hidden" name="old_mb_hp"
								value=""> <br> <span id="msg_mb_hp"></span></td>
						</tr>





						<tr>
							<th scope="row">성별</th>
							<td><input type="radio" id="mb_sex" name="gender" value="2">
								여자 <input type="radio" id="mb_sex" name="gender" value="1">
								남자</td>
						</tr>
						<tr>
							<th scope="row">프로필 사진</th>
							<td><input id="u_mypicture" name="u_mypicture" type="file" /></td>
						</tr>
						<!-- </tbody> -->
					</table>
				</div>


				<div class="tbl_frm01 tbl_wrap">
					<table>
						<caption>추가정보 입력</caption>
						<colgroup>
							<col class="grid_4">
							<col>
						</colgroup>
						<!-- <tbody> -->
						<tr>
							<th scope="row"><label for="sal">연봉</label></th>
							<td><select name="sal" id="sal">
									<option value="1000">2000이하</option>
									<option value="3000">2000~4000이하</option>
									<option value="5000">4000~6000이하</option>
									<option value="7000">6000~8000이하</option>
									<option value="8000">8000이상</option>
							</select> <br></td>
						</tr>

						<tr>
							<th scope="row"><label for="cm">키<strong
									class="sound_only"></strong></label></th>
							<td><input type="text" name="cm" id="cm" size="20"
								maxlength="20"></td>
						</tr>

						<tr>
							<th scope="row"><label for="weight">몸무게<strong
									class="sound_only"></strong></label></th>
							<td><input type="text" name="weight2" id="weight2" size="20"
								maxlength="20"></td>
						</tr>
						<tr>
							<th scope="row"><label for="job">직종</label></th>
							<td><select name="job">
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
							</select> <br></td>
						</tr>

						<tr>
							<th scope="row">최종 학력</th>
							<td><input type="radio" id="school" name="school"
								value="대학원">대학원졸업 <input type="radio" id="school"
								name="school" value="대학">대학졸업 <input type="radio"
								id="school" name="school" value="고등">고등학교졸업 <input
								type="radio" id="school" name="school" value="중등">중학교졸업
								<br></td>
						</tr>

						<tr>
							<th scope="row">소개글</th>
							<td><textarea id="content" name="content"></textarea></td>
						</tr>
						<!-- </tbody> -->
					</table>
				</div>

				<div class="btn_confirm">
					<input type="submit" value="회원가입 완료" id="btn_submit"
						class="btn_submit" accesskey="s" onclick="showalert();"> <a
						href="http://www.wedaehan.com" class="btn_cancel">취소</a>
				</div>
			</form>
			<div id="blank">&nbsp;</div>
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
	<script src="<%=request.getContextPath()%>/assets/js/common-scripts.js"></script>
</body>