<%@page import="Login.DTO.Member"%>
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
<script type="text/javascript">

<%	
	String msg = "";
	String msg1 = "";
	if (request.getAttribute("error") != null) {	
		msg="입력한 정보가 틀렷습니다.";
	}
	if(request.getAttribute("result1") != null){
		msg1="비밀번호를 메일로 전송했습니다.";
	}
%>
</script>
</head>
<body>
	<!-- 회원정보 찾기 시작 { -->
	<div id="find_info" class="new_win mbskin">
		<h1 id="win_title">비밀번호 찾기</h1>

		<form name="checkform" action="PwdSearch.da" method="post">
			<fieldset id="info_fs">
				<p>
					회원가입 시 등록하신 아이디, 이름, 이메일 주소를 입력해 주세요. <br>
					본인 확인 후 정확한 정보를 입력해주세요.<br>
					<h3><span style="color: red; font-size: 13pt"><%=msg%></span></h3>
					<h3><span style="color: blue; font-size: 13pt"><%=msg1%></span></h3>
					
				</p>

				<table>
					<tr>
						<td><label for="name">이름<strong class="sound_only1"></strong></label></td>
						<td><input type="text" name="name" id="name" class=""
							size="30" readonly style="background-color: #EAEAEA;"></td>
						<td><input type="button" id="selfcheck" value="본인확인"
							onclick="window.open('Login_Myself_popup.jsp','zip','width=500 height=200')"><br>
						</td>
					</tr>
					<tr>
						<td><label for="id">아이디<strong class="sound_only1"></strong></label>
						</td>
						<td colspan="2"><input type="text" name="id" id="id" required
							class="" size="30"><br></td>
					</tr>
					<tr>
						<td><label for="email">이메일<strong class="sound_only3"></strong></label>
						</td>
						<td colspan="2"><input type="text" name="email" id="email"
							required class="" size="30"></td>
					</tr>
					<tr>
						<td colspan="3">
							<div class="win_btn">
								<input type="submit" value="확인" class="btn_submit">
								<button type="button" onclick="history.back(-1)">돌아가기</button>
							</div>
						</td>
					</tr>
				</table>
			</fieldset>

		</form>
	</div>
</body>
</html>