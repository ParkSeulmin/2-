<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 회원가입 기본정보 페이지 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://www.wedaehan.com/css/default.css">
<link rel="stylesheet" href="http://www.wedaehan.com/skin/member/basic/style.css">
<link rel="stylesheet" type="text/css" href="/css/main.css">
<link rel="stylesheet" type="text/css" href="/css/sub.css">
<link rel="stylesheet" type="text/css" href="/css/all_menu.css">
</head>
<body>
<div id="content_list">

			<div class="title">
						<div class="sub_title"><li>회원정보입력</li><li class="stitle">정확한 회원정보를 입력해 주세요.</li></div><div class="navig"><li class="frst"> <a href="/">HOME</a></li><li>위대한 만남</li><li>회원정보입력</li></div>
		<!-- sub_menu-->
					</div>

	
		
<link type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.4/themes/base/jquery-ui.css" rel="stylesheet">
<style>
.ui-datepicker { font:12px dotum; }
.ui-datepicker select.ui-datepicker-month,
.ui-datepicker select.ui-datepicker-year { width: 70px;}
.ui-datepicker-trigger { margin:0 0 -5px 2px; }
</style>
<script type="text/javascript" src="http://www.wedaehan.com/js/jquery-1.8.4.ui.min.js"></script>
<script>
jQuery(function($){
    $.datepicker.regional["ko"] = {
        closeText: "닫기",
        prevText: "이전달",
        nextText: "다음달",
        currentText: "오늘",
        monthNames: ["1월(JAN)","2월(FEB)","3월(MAR)","4월(APR)","5월(MAY)","6월(JUN)", "7월(JUL)","8월(AUG)","9월(SEP)","10월(OCT)","11월(NOV)","12월(DEC)"],
        monthNamesShort: ["1월","2월","3월","4월","5월","6월", "7월","8월","9월","10월","11월","12월"],
        dayNames: ["일","월","화","수","목","금","토"],
        dayNamesShort: ["일","월","화","수","목","금","토"],
        dayNamesMin: ["일","월","화","수","목","금","토"],
        weekHeader: "Wk",
        dateFormat: "yymmdd",
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: ""
    };
	$.datepicker.setDefaults($.datepicker.regional["ko"]);
});
</script>



<script type="text/javascript">
function openPCCWindow(){ 
	var CBA_window = window.open('', 'PCCWindow', 'width=430, height=560, resizable=1, scrollbars=no, status=0, titlebar=0, toolbar=0, left=300, top=200' );

	if(CBA_window == null){ 
		alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n    화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
	}

	document.reqCBAForm.action = 'https://pcc.siren24.com/pcc_V3/jsp/pcc_V3_j10.jsp';
	document.reqCBAForm.target = 'PCCWindow';
	document.reqCBAForm.submit();
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	$("#reg_zip_find").css("display", "inline-block");
	$("#reg_mb_zip1, #reg_mb_zip2, #reg_mb_addr1").attr("readonly", true);
	$("#mb_birth").datepicker({ changeMonth: true, changeYear: true, dateFormat: "yymmdd", showButtonPanel: true, yearRange: "c-70:c+0", maxDate: "-14Y" }); // datepicker 실행
	$('.tel,.hp,.email1,.eng').css('ime-mode', 'disabled');
	$('.tel,.hp,.money').keydown(function(e){ 
		//alert(e.which);
		if ((e.keyCode > 47 && e.keyCode < 58) || (e.keyCode > 95 && e.keyCode < 106) || e.keyCode == 8 || e.keyCode == 9 || e.keyCode == 46 || e.keyCode == 189 || e.keyCode == 109 || e.keyCode == 39 || e.keyCode == 37 ) { return true; }else{ e.preventDefault(); }
	});
	$('.nextFocus').keyup(function(){if($(this).val().length == $(this).attr('maxlength')) $(this).next().focus()});
	$('.tel').focusout(function(){
		$('#reg_mb_tel').val($('#mb_tel1').val()+'-'+$('#mb_tel2').val()+'-'+$('#mb_tel3').val());
	});
	$('#reg_mb_id').keyup(function() {
		$("#msg_mb_id").html("");
	});
	$('#reg_mb_id').focusout(function() {
		msg = reg_mb_id_check();
		if(!msg) {
			$("#msg_mb_id").css('color', 'blue');
			$("#msg_mb_id").html("사용가능한 아이디입니다.");
		} else {
			$("#msg_mb_id").css('color', 'red');
			$("#msg_mb_id").html(msg);
		}
	});
	$('#reg_mb_nick').keyup(function() {
		$("#msg_mb_nick").html("");
	});
	$('#reg_mb_nick').focusout(function() {
		msg = reg_mb_nick_check();
		if(!msg) {
			$("#msg_mb_nick").css('color', 'blue');
			$("#msg_mb_nick").html("사용가능한 닉네임입니다.");
		} else {
			$("#msg_mb_nick").css('color', 'red');
			$("#msg_mb_nick").html(msg);
		}
	});
	$('.email1').keyup(function() {
		$("#msg_mb_email").html("");
	});
	$('.email1').focusout(function() {
		$('#reg_mb_email').val($('#reg_mb_email1').val()+'@'+$('#reg_mb_email2').val());
		if($('#reg_mb_email1').val() && $('#reg_mb_email2').val()){
			msg = reg_mb_email_check();
			if(!msg) {
				$("#msg_mb_email").css('color', 'blue');
				$("#msg_mb_email").html("사용가능한 이메일입니다.");
			} else {
				$("#msg_mb_email").css('color', 'red');
				$("#msg_mb_email").html(msg);
			}
		}
	});
	$('.hp').keyup(function() {
		$("#msg_mb_hp").html("");
	});
	$('.hp').focusout(function(){
		$('#reg_mb_hp').val($('#mb_hp1').val()+'-'+$('#mb_hp2').val()+'-'+$('#mb_hp3').val());
		if($('#mb_hp2').val() && $('#mb_hp3').val()){
			msg = reg_mb_hp_check();
			if(!msg) {
				$("#msg_mb_hp").css('color', 'blue');
				$("#msg_mb_hp").html("사용가능한 휴대폰입니다.");
			} else {
				$("#msg_mb_hp").css('color', 'red');
				$("#msg_mb_hp").html(msg);
			}
		}
	});
});
</script>

<!-- 회원정보 입력/수정 시작 { -->
<div class="mbskin">

    <script src="http://www.wedaehan.com/js/jquery.register_form.js"></script>
        <script src="http://www.wedaehan.com/js/certify.js"></script>
    
    <form id="fregisterform" name="fregisterform" action="JoinController.do" method="post">
    <input type="hidden" name="w" value="">
	<input type="hidden" name="cert_value" id="cert_value" value="">
    <input type="hidden" name="url" value="%2Fbbs%2Fregi0
    
    ster_form.php">
    <input type="hidden" name="agree" value="1">
    <input type="hidden" name="agree2" value="1">
    <input type="hidden" name="cert_type" value="">
    <input type="hidden" name="mb_sex" value="">    
    <div class="tbl_frm01 tbl_wrap">	
        <table>
        <caption>사이트 이용정보 입력</caption>
		<colgroup>
			<col class="grid_4">
			<col>
		</colgroup>
        <tbody>
        <tr>
            <th scope="row"><label for="reg_mb_name">이름<span>＊</span><strong class="sound_only">필수</strong></label></th>
            <td>
                                <input type="text" id="reg_mb_name" name="mb_name" value="" required="" class="frm_input nospace required " size="10">
				                            </td>
        </tr>
                		<tr>
			<th scope="row">주민번호</th>
			<td>
									<input class="text" type="text" name="mb_birth" id="mb_birth" size="15" maxlength="6" minlength="6" required="" numeric="" title="주민번호" value="">
									-
									<input class="text" type="password" name="mb_birth2" id="mb_birth2" size="15" maxlength="7" minlength="7" required="" numeric="" title="주민번호" value="">
							</td>
        </tr>
        <tr>
            <th scope="row"><label for="reg_mb_id">아이디<strong class="sound_only">필수</strong></label></th>
            <td>
                <span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
                <input type="text" name="mb_id" value="" id="reg_mb_id" required="" class="frm_input eng minlength_3 required " maxlength="20">
                <span id="msg_mb_id"></span>
            </td>
        </tr>
        <tr>
            <th scope="row"><label for="reg_mb_password">비밀번호<strong class="sound_only">필수</strong></label></th>
            <td>
				<input type="password" name="mb_password" id="reg_mb_password" required="" class="frm_input minlength_6 required" maxlength="20">
				※영문,숫자포함된 6글자 이상의 비밀번호
			</td>
        </tr>
        <tr>
            <th scope="row"><label for="reg_mb_password_re">비밀번호 확인<strong class="sound_only">필수</strong></label></th>
            <td><input type="password" name="mb_password_re" id="reg_mb_password_re" required="" class="frm_input minlength_6 required" maxlength="20"></td>
        </tr>
        </tbody>
        </table>
    </div>

    <div class="tbl_frm01 tbl_wrap">
        <table>
        <caption>개인정보 입력</caption>
		<colgroup>
			<col class="grid_4">
			<col>
		</colgroup>
        <tbody>
                <tr>
            <th scope="row"><label for="reg_mb_nick">닉네임<strong class="sound_only">필수</strong></label></th>
            <td>
                <span class="frm_info">
                    공백없이 한글,영문,숫자만 입력 가능 (한글2자, 영문4자 이상)
                </span>
                <input type="hidden" name="mb_nick_default" value="">
                <input type="text" name="mb_nick" value="" id="reg_mb_nick" required="" class="frm_input required nospace" size="20" maxlength="20">
                <span id="msg_mb_nick"></span>
            </td>
        </tr>
        
         <tr>
            <th scope="row"><label for="address">주소<strong class="sound_only">필수</strong></label></th>
            <td>
                <input type="hidden" name="address_default" value="">
                <input type="text" name="address" value="" id="address" required="" class="frm_input required nospace" size="20" maxlength="20">
                <span id="msg_mb_address"></span>
            </td>
        </tr>

        
        <tr>
            <th scope="row"><label for="reg_mb_email">E-mail<strong class="sound_only">필수</strong></label></th>
            <td>
                
                <input type="hidden" name="old_email" value="">
                <input type="hidden" name="mb_email" value="" id="reg_mb_email">
				<input type="text" name="mb_email1" id="reg_mb_email1" value="" class="frm_input required email1" maxlength="100"> @
				<input type="text" name="mb_email2" id="reg_mb_email2" value="" class="frm_input required email1" maxlength="100">
								<select name="mb_email3" onchange="document.fregisterform.mb_email2.value = this.value;document.fregisterform.mb_email2.focus()">
				<option value="">-선택-
								</option><option value="daum.net">daum.net								</option><option value="hanmail.net">hanmail.net								</option><option value="gmail.com">gmail.com								</option><option value="nate.com">nate.com								</option><option value="empas.com">empas.com								</option><option value="lycons.co.kr">lycons.co.kr								</option><option value="netsgo.com">netsgo.com								</option></select>
				<span id="msg_mb_email"></span>
            </td>
        </tr>

        
        <tr>
                    <th scope="row"><label for="reg_mb_hp">휴대폰번호</label></th>
            <td>
				<select name="mb_hp1" id="mb_hp1">
				<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
				</select> - 
				<input type="text" name="mb_hp2" id="mb_hp2" value="" class="frm_input hp nextFocus" title="휴대폰번호" maxlength="4" size="5"> - 
				<input type="text" name="mb_hp3" id="mb_hp3" value="" class="frm_input hp" title="휴대폰번호" maxlength="4" size="5">
                <input type="hidden" name="mb_hp" value="" id="reg_mb_hp">
                                <input type="hidden" name="old_mb_hp" value="">
                				<br><span id="msg_mb_hp"></span>
            </td>
        </tr>
        

                


        <tr>
			<th scope="row">성별</th>
			<td>
									<input type="radio" id = "mb_sex" name="mb_sex" value="2"> 여자
					<input type="radio" id= "mb_sex" name="mb_sex" value="1"> 남자
							</td>
		</tr>

                </tbody>
        </table>
    </div>

    <div class="tbl_frm01 tbl_wrap">
        <table>
        <caption>기타 개인설정</caption>
		<colgroup>
			<col class="grid_4">
			<col>
		</colgroup>
        <tbody>
        
        
		<tr>
            <th scope="row"><label for="reg_mb_mailling">메일링서비스</label></th>
            <td>
                <input type="checkbox" name="mb_mailling" value="1" id="reg_mb_mailling" checked="">
                정보 메일을 받겠습니다.
            </td>
        </tr>

                <tr>
            <th scope="row"><label for="reg_mb_sms">SMS 수신여부</label></th>
            <td>
                <input type="checkbox" name="mb_sms" value="1" id="reg_mb_sms" checked="">
                휴대폰 문자메세지를 받겠습니다.
            </td>
        </tr>

        
        
     
        </tbody>
        </table>
    </div>

    <div class="btn_confirm">
        <input type="submit" value="다음" id="btn_submit" class="btn_submit" accesskey="s">
        <a href="http://www.wedaehan.com" class="btn_cancel">취소</a>
    </div>
    </form>

  <!--   <script type="text/javascript">
    function fregisterform_submit(f)
    {
		f.mb_hp.value = f.mb_hp1.value +"-"+ f.mb_hp2.value +"-"+ f.mb_hp3.value;
		f.mb_tel.value = f.mb_tel1.value +"-"+ f.mb_tel2.value +"-"+ f.mb_tel3.value;
        // 회원아이디 검사
        if (f.w.value == "") {
            var msg = reg_mb_id_check();
            if (msg) {
                alert(msg);
                f.mb_id.select();
                return false;
            }
        }

        if (f.w.value == "") {
            if (f.mb_password.value.length < 3) {
                alert("비밀번호를 3글자 이상 입력하십시오.");
                f.mb_password.focus();
                return false;
            }
        }

        if (f.mb_password.value != f.mb_password_re.value) {
            alert("비밀번호가 같지 않습니다.");
            f.mb_password_re.focus();
            return false;
        }

        if (f.mb_password.value.length > 0) {
            if (f.mb_password_re.value.length < 3) {
                alert("비밀번호를 3글자 이상 입력하십시오.");
                f.mb_password_re.focus();
                return false;
            }
        }

        // 이름 검사

            /*
            var pattern = /([^가-힣\x20])/i;
            if (pattern.test(f.mb_name.value)) {
                alert("이름은 한글로 입력하십시오.");
                f.mb_name.select();
                return false;
            }
            */
        }


        // 닉네임 검사
        if ((f.w.value == "") || (f.w.value == "u" && f.mb_nick.defaultValue != f.mb_nick.value)) {
            var msg = reg_mb_nick_check();
            if (msg) {
                alert(msg);
                f.reg_mb_nick.select();
                return false;
            }
        }

        // E-mail 검사
		f.mb_email.value = f.mb_email1.value +"@"+f.mb_email2.value;
        if ((f.w.value == "") || (f.w.value == "u" && f.mb_email.defaultValue != f.mb_email.value)) {
            var msg = reg_mb_email_check();
            if (msg) {
                alert(msg);
                f.mb_email1.select();
                return false;
            }
        }

        // 휴대폰검사 검사
		f.mb_hp.value = f.mb_hp1.value +"-"+f.mb_hp2.value+"-"+f.mb_hp3.value;
        if ((f.w.value == "") || (f.w.value == "u" && f.mb_hp.defaultValue != f.mb_hp.value)) {
            var msg = reg_mb_hp_check();
            if (msg) {
                alert(msg);
                f.mb_hp2.select();
                return false;
            }
        }

        if (typeof f.mb_icon != "undefined") {
            if (f.mb_icon.value) {
                if (!f.mb_icon.value.toLowerCase().match(/.(gif)$/i)) {
                    alert("회원아이콘이 gif 파일이 아닙니다.");
                    f.mb_icon.focus();
                    return false;
                }
            }
        }

        if (typeof(f.mb_recommend) != "undefined" && f.mb_recommend.value) {
            if (f.mb_id.value == f.mb_recommend.value) {
                alert("본인을 추천할 수 없습니다.");
                f.mb_recommend.focus();
                return false;
            }

            var msg = reg_mb_recommend_check();
            if (msg) {
                alert(msg);
                f.mb_recommend.select();
                return false;
            }
        } 

        if (!chk_captcha()) return false;

        document.getElementById("btn_submit").disabled = "disabled";

        return true;
    }
    </script>-->

</div>
<!-- } 회원정보 입력/수정 끝 -->		
		<div id="blank">&nbsp;</div>
		</div>
</body>
</html>