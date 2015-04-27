
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://www.wedaehan.com/css/default.css">
<link rel="stylesheet"
	href="http://www.wedaehan.com/skin/member/basic/style.css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600"
	rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Stylesheet" href="style/default.css">
<title>Login</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/business-casual.css" rel="stylesheet">

<!-- Fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<script>
		$(document).ready(function() {
			$("#login_id").focus();
		});
	</script>



	<div class="box">

		<form name="flogin" action="Login.login?cmd=logincheck"
			onsubmit="return flogin_submit(this);" method="post">
			<table align="center">

				<tr>
					<td>
						<div class="form-group col-lg-4" align="center">
							<label>아이디</label> <input type="text" name="mb_id" id="login_id"
								size="20" maxlength="20">
						</div>

						<div class="form-group col-lg-4" align="center">
							<label>비밀번호</label> <input type="password" name="mb_password"
								maxlength="20">
						</div>
					</td>

					<td><input type="submit" value="로그인"></td>

				</tr>
			</table>



			<div id="login_info" align="center">
				<div>

					<a href="Login_Find_Id.html" id="login_password_lost" class="btn02">아이디
						찾기 </a> <a href="PwdSearch.jsp" id="login_password_lost" class="btn02">비밀번호
						찾기 </a> <a href="./register.php" class="btn01">회원 가입</a>
				</div>
			</div>

		</form>

	</div>





	<!-- 	<div class="col-lg-12">
		<hr>
		<h2 class="intro-text text-center">
		</h2>
		<hr>

		<form name="flogin" action="Login.login?cmd=logincheck"
			onsubmit="return flogin_submit(this);" method="post">
			<div class="box">
			<div class="row">
				<div class="form-group col-lg-4" align="center">
					<label>아이디</label> 
					  <input type="text" name="mb_id" id="login_id"
						required=""  style="ime-mode: disabled"
						size="20" maxlength="20">
				</div>
				<div class="form-group col-lg-4" align="center">
					<label>비밀번호</label> 
					 <input type="password" name="mb_password"
						id="login_pw" required="" size="20"
						maxlength="20">
				</div>


				<div class="form-group col-lg-12" align="center">
					<input type="submit" class="btn btn-default" value="로그인"
						class="btn_submit">
				</div>
			</div>


			<aside id="login_info" align="center">
			<h2>회원로그인 안내</h2>
			<p>
			
				회원아이디 및 비밀번호가 기억 안나실 때는 아이디/비밀번호 찾기를 이용하십시오.<br> 아직 회원이 아니시라면
				회원으로 가입 후 이용해 주십시오.
				
			</p>
			<div>

				<a href="Login_Find_Id.html" id="login_password_lost" class="btn02">아이디
					찾기 </a> <a href="PwdSearch.jsp" id="login_password_lost" class="btn02">비밀번호
					찾기 </a> <a href="./register.php" class="btn01">회원 가입</a>
			</div>
			</aside>
</div>

		</form>
	</div>
 -->
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
</body>
</html>