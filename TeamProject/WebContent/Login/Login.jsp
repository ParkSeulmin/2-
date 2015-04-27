<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://www.wedaehan.com/css/default.css">
<link rel="stylesheet"
	href="http://www.wedaehan.com/skin/member/basic/style.css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600"
	rel="stylesheet" type="text/css">
</head>
<body>
<c:import url="/Include/Header.jsp" />
		
	<div style="padding: 200px;"> <!-- 임의임의임의  -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
		type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$("#login_id").focus();
		});
	</script>

	<!-- 로그인 시작 { -->
	<div id="mb_login" class="mbskin">
		<h1>로그인</h1>
		
		<form name="flogin"
			action="Login.login?cmd=logincheck"
			onsubmit="return flogin_submit(this);" method="post">
			

			<fieldset id="login_fs">
				<legend>회원로그인</legend>

				<label for="login_id" class="login_id">회원아이디<strong
					class="sound_only"> 필수</strong></label> 
					
					<input type="text" name="mb_id"
					id="login_id" required="" class="frm_input required"
					style="ime-mode: disabled" size="20" maxlength="20"> 
					
					<label
					for="login_pw" class="login_pw">비밀번호<strong
					class="sound_only"> 필수</strong></label> 
					
					<input type="password"
					name="mb_password" id="login_pw" required=""
					class="frm_input required" size="20" maxlength="20"> 
					
					<input
					type="submit" value="로그인" class="btn_submit"> 
					
					<input
					type="checkbox" name="auto_login" id="login_auto_login">
					
					 <label
					for="login_auto_login">자동로그인</label>


			</fieldset>

			<aside id="login_info">
				<h2>회원로그인 안내</h2>
				<p>
					회원아이디 및 비밀번호가 기억 안나실 때는 아이디/비밀번호 찾기를 이용하십시오.<br> 아직 회원이 아니시라면
					회원으로 가입 후 이용해 주십시오.
				</p>
				<div>
				
					<a href="Login_Find_Id.html" id="login_password_lost" class="btn02">아이디 찾기
					</a>
					<a href="PwdSearch.jsp" id="login_password_lost" class="btn02">비밀번호 찾기
						</a> 
						<a href="./register.php" class="btn01">회원 가입</a>
				</div>
			</aside>

			<div class="btn_confirm">
				<a href="http://www.wedaehan.com/">메인으로 돌아가기</a>
			</div>

		</form>

	</div>

	<script>
		$(function() {
			$("#login_auto_login")
					.click(
							function() {
								if (this.checked) {
									this.checked = confirm("자동로그인을 사용하시면 다음부터 회원아이디와 비밀번호를 입력하실 필요가 없습니다.\n\n공공장소에서는 개인정보가 유출될 수 있으니 사용을 자제하여 주십시오.\n\n자동로그인을 사용하시겠습니까?");
								}
							});
		});

		function flogin_submit(f) {
			return true;
		}
	</script>
	<!-- } 로그인 끝 -->

	<!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
	<!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->

	<!-- AceCounter Log Gathering Script V.71.2013012101 -->
	<!-- <script language="javascript">
		if (typeof EL_GUL == 'undefined') {
			var EL_GUL = 'dgc11.acecounter.com';
			var EL_GPT = '8080';
			var _AIMG = new Image();
			var _bn = navigator.appName;
			var _PR = location.protocol == "https:" ? "https://" + EL_GUL
					: "http://" + EL_GUL + ":" + EL_GPT;
			if (_bn.indexOf("Netscape") > -1 || _bn == "Mozilla") {
				setTimeout("_AIMG.src = _PR+'/?cookie';", 1);
			} else {
				_AIMG.src = _PR + '/?cookie';
			}
			;
			document
					.writeln("<scr"+"ipt language='javascript' src='/acecounter/acecounter_V70.js'></scr"+"ipt>");
		}
	</script>
	<script language="javascript" src="/acecounter/acecounter_V70.js"></script> -->

	<!-- <noscript>&lt;img
		src='http://dgc11.acecounter.com:8080/?uid=BR3A39255312990&amp;je=n&amp;'
		border=0 width=0 height=0&gt;</noscript>
	AceCounter Log Gathering Script End

	Google Code for &#47532;&#47560;&#52992;&#54021;
	Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. For instructions on adding this tag and more information on the above requirements, read the setup guide: google.com/ads/remarketingsetup
	<script type="text/javascript">
		/* <![CDATA[ */
		var google_conversion_id = 967057890;
		var google_conversion_label = "A9o3CIaS9wcQ4sOQzQM";
		var google_custom_params = window.google_tag_params;
		var google_remarketing_only = true;
		/* ]]> */
	</script>
	<script type="text/javascript"
		src="//www.googleadservices.com/pagead/conversion.js">
		
	</script> -->
	<!-- <iframe name="google_conversion_frame" title="Google conversion frame"
		width="300" height="13"
		src="http://googleads.g.doubleclick.net/pagead/viewthroughconversion/967057890/?random=1429260328550&amp;cv=7&amp;fst=1429260328550&amp;num=1&amp;fmt=1&amp;label=A9o3CIaS9wcQ4sOQzQM&amp;guid=ON&amp;u_h=768&amp;u_w=1366&amp;u_ah=728&amp;u_aw=1366&amp;u_cd=24&amp;u_his=7&amp;u_tz=540&amp;u_java=true&amp;u_nplug=6&amp;u_nmime=8&amp;frm=0&amp;url=http%3A//www.wedaehan.com/bbs/login.php&amp;ref=http%3A//www.wedaehan.com/bbs/board.php%3Fbo_table%3Dspeeddate%26sca%3D%25EC%2584%259C%25EC%259A%25B8%252F%25EC%2588%2598%25EB%258F%2584%25EA%25B6%258C&amp;vis=2"
		frameborder="0" marginwidth="0" marginheight="0" vspace="0" hspace="0"
		allowtransparency="true" scrolling="no">&lt;img height="1"
		width="1" border="0" alt=""
		src="http://googleads.g.doubleclick.net/pagead/viewthroughconversion/967057890/?frame=0&amp;random=1429260328550&amp;cv=7&amp;fst=1429260328550&amp;num=1&amp;fmt=1&amp;label=A9o3CIaS9wcQ4sOQzQM&amp;guid=ON&amp;u_h=768&amp;u_w=1366&amp;u_ah=728&amp;u_aw=1366&amp;u_cd=24&amp;u_his=7&amp;u_tz=540&amp;u_java=true&amp;u_nplug=6&amp;u_nmime=8&amp;frm=0&amp;url=http%3A//www.wedaehan.com/bbs/login.php&amp;ref=http%3A//www.wedaehan.com/bbs/board.php%3Fbo_table%3Dspeeddate%26sca%3D%25EC%2584%259C%25EC%259A%25B8%252F%25EC%2588%2598%25EB%258F%2584%25EA%25B6%258C&amp;vis=2"
		/&gt;</iframe>
	<noscript>&lt;div style="display:inline;"&gt; &lt;img
		height="1" width="1" style="border-style:none;" alt=""
		src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/967057890/?value=0&amp;amp;label=A9o3CIaS9wcQ4sOQzQM&amp;amp;guid=ON&amp;amp;script=0"/&gt;
		&lt;/div&gt;</noscript>
 -->


		</div>
<c:import url="/Include/Footer.jsp" />
</body>
</html>
