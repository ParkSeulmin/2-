<%@page import="Meeting.DAO.Party_DAO"%>
<%@page import="Meeting.DTO.Party_DTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	/* 	String userid = null;
	 if (session.getAttribute("userid") != null) {
	 userid = (String) session.getAttribute("userid");
	 } */
	//list get해서 가져오기
	List partylist = (List) request.getAttribute("partylist");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="http://www.wedaehan.com/css/default.css">
<link rel="stylesheet" href="http://www.wedaehan.com/css/board.css">
<link rel="stylesheet"
	href="http://www.wedaehan.com/skin/board/speeddate/style.css">
<link rel="canonical"
	href="http://www.wedaehan.com/bbs/board.php?bo_table=speeddate&amp;sca=%EC%84%9C%EC%9A%B8%2F%EC%88%98%EB%8F%84%EA%B6%8C">
<link rel="stylesheet" type="text/css"
	href="http://www.wedaehan.com/css/sub.css">
<link rel="stylesheet" type="text/css"
	href="http://www.wedaehan.com/css/all_menu.css">

<!-- google font link-->
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600"
	rel="stylesheet" type="text/css">
<!-- //google font link-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>party</title>
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
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<style type="text/css">

#container_sub {
	position: relative;
}

#content_list {
	margin: 0;
	padding: 5em 2em 5em 2em;
	max-width: 1280px;
	min-height: 540px;
	background: #fff;
}

#right_btn {
	position: absolute;
	top: 160px;
	right: 0;
	z-index: 9;
	background: #c1454a
}

}
.speed_comment a {
	font-size: 18px;
	color: #ed1e40;
}

.speed_comment a:hover {
	font-size: 18px;
	color: black;
	padding: 1px 0 0 4px;
	text-decoration: none;
	font-weight: bold;
}
#tnb {
	float: right;
	margin: 0;
	padding: 0;
	list-style: none;
	zoom: 1
}

#tnb li {
	float: left;
	margin: 0px
}

#tnb a {
	display: inline-block;
	padding: 11px 10px;
	color: #a1a1a4;
	letter-spacing: 0em;
	font-size: 10px;
	font-family: tahoma
}

#tnb a:focus, #tnb a:hover, #tnb a:active {
	text-decoration: none
}

#hd_wrapper {
	position: relative;
	margin: 0 auto;
	padding: 0;
	max-width: 1280px;
	height: 35px;
	zoom: 1;
	overflow: hidden
}

#hd_wrapper:after {
	display: block;
	visibility: hidden;
	clear: both;
	content: ""
}
</style>
</head>
<body>
	<c:import url="/Include/Header.jsp" />

	<!-- //Wrapper -->
	<!-- <div id="wrapper"
		style="background: url(http://www.wedaehan.com/image/overlays/01.png) 50% 0% repeat transparent;"> -->


	<!-- Contenter_Sub -->
	<div id="container_sub">

		<!-- Content_List -->
		<!-- Sub Page Background -->

		<div id="content_list">

			<div class="title">
				<!-- sub_menu-->
			</div>

			<!-- 게시판 목록 시작 { -->
			<div id="bo_list">

				<!-- 게시판 페이지 정보 및 버튼 시작 { -->
				<div class="bo_fx">
					<div id="bo_list_total">
						<span>Total 10건</span> 1 페이지
					</div>

				</div>
				<!-- } 게시판 페이지 정보 및 버튼 끝 -->

				<form name="fboardlist" id="fboardlist"
					action="./board_list_update.php"
					onsubmit="return fboardlist_submit(this);" method="post">
					<input type="hidden" name="bo_table" value="speeddate"> <input
						type="hidden" name="sfl" value=""> <input type="hidden"
						name="stx" value=""> <input type="hidden" name="spt"
						value="-13"> <input type="hidden" name="sca"
						value="서울/수도권"> <input type="hidden" name="page" value="1">
					<input type="hidden" name="sw" value="">

					<div class="tbl_head01 tbl_wrap">
						<table>
							<caption>스피드데이트 목록</caption>

							<tbody>
								<%
										for (int i = 0; i < partylist.size(); i++) {
											Party_DTO pl = (Party_DTO) partylist.get(i);
									%>
								<tr>
									<td class="td_num"><%=pl.getP_ID()%></td>
									<td class="td_img2"><a
										href="http://www.wedaehan.com/bbs/board.php?bo_table=speeddate&amp;wr_id=16&amp;sca=%EC%84%9C%EC%9A%B8%2F%EC%88%98%EB%8F%84%EA%B6%8C">
											<img src="Images/party.jpg" alt="" title="">
									</a></td>

									<td class="td_subject" valign="top">
										<!--표전체묶기  --> <span class="speed_comment"><a href="">♥<%=pl.getP_TITLE()%>♥
										</a></span> <br>
										<div class="sd_list">
											<li><div>
													<img src="Images/icon/date.gif">
												</div>: <a href=""><%=pl.getP_DATE()%></a></li>
											<li><div>
													<img src="Images/icon/place.gif">
												</div>: <a href=""><%=pl.getP_AREA()%></a></li>
										</div>
										<div class="sd_list">
											<li><div>
													<img src="Images/icon/end.gif">
												</div> <a href="">:<%=pl.getP_STATUS()%></a></li>
											<li class="end"><div>
													<img src="Images/icon/man.gif">
												</div> <a href="">: <%=pl.getP_MAXPEOPLE()%></a></li>
										</div>
									</td>
								</tr>
								<%
										}
									%>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>

	<!-- 게시판 목록 시작 { -->
	<c:import url="/Include/Footer.jsp" />

</body>
</html>
