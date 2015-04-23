<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기 | ♡품격이 다른 소개팅 만남의 품격 입니다♡</title>
<link rel="stylesheet" href="http://www.wedaehan.com/css/default.css">
<link rel="stylesheet" href="http://www.wedaehan.com/skin/member/basic/style.css">
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://www.wedaehan.com/js/wrest.js"></script>

</head>
<body>
	<!-- 회원정보 찾기 시작 { -->
	<div id="find_info" class="new_win mbskin">
		<h1 id="win_title">비밀번호 찾기</h1>

		<form name="checkform" action="PwdSearch.da"  method="post">
			<fieldset id="info_fs">
				<p>
					회원가입 시 등록하신 아이디, 이름, 이메일 주소를 입력해 주세요.<br> 본인 확인 후 정확한 정보를 입력해 주세요.
				</p>
				<label for="name">이름<strong class="sound_only1"></strong></label> 
				<input type="text" name="name" id="name" required class="required frm_input" size="30" ><br>
				<!-- <input type="button" value="본인확인" onclick="window.open('PwdCheckName.html', 'zip', 'width=500 height=250')"><br> -->
				<label for="id">아이디<strong class="sound_only1"></strong></label>
				<input type="text" name="id" id="id" required class="required frm_input"size="30"><br>  
				<label for="email">이메일<strong class="sound_only3"></strong></label> 
				<input type="text" name="email" id="email" required class="required frm_input email" size="30">
			</fieldset>
			<div class="win_btn">
				<input type="submit" value="확인" class="btn_submit">
				<button type="button" onclick="window.close();">창닫기</button>
			</div>
		</form>
	</div>
</body>
</html>