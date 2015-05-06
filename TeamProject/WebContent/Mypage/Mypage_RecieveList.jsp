<%@page import="javax.naming.Context"%>
<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="Mypage.DTO.Arrow_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
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

<%
	List<Arrow_DTO> mylist = new ArrayList<Arrow_DTO>();
	mylist = (ArrayList<Arrow_DTO>) request.getAttribute("result");

	List<Member> friends = new ArrayList<Member>();
	friends = (ArrayList<Member>) request.getAttribute("friends");

	Member member = (Member) session.getAttribute("user");
	String me = member.getId();
%>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	function checkinfo(sendid){	//info 회원 상세보기 눌렀을 때 뜨는 팝업창 
		window.open("Mypage/Mypage_MemberInfo.jsp?id="+sendid, "Popup", "width=600, height=150,scrollbars=1, menubar=1, resizable=1"); 
	}
	
	function agree(sender){	//친구 수락 버튼
		var sdid={
					s_id:sender,
				    r_id:'<%=me%>'} 
		$.ajax({
			url:"register.daa",
			data:sdid,
			success : function(data){
				alert(data);
			}
		});
		$.ajax({		//친구목록 다시 불러오는 코드
			url:"CheckArrow_query.daa",
			data:sdid,
			success : function(data){
				$("#mydata").html(data);
			}
		});
	}
	
	
	function disagree(sender){	//친구 거절 버튼
		 var sdid={
					s_id:sender,
				    r_id:'<%=me%>'
		}
		$.ajax({
			url : "disagree_arrow.daa",
			data : sdid,
			success : function(data) {
				alert(data);
			}
		});
		$.ajax({ 
			url : "CheckArrow_query.daa",
			data : sdid,
			success : function(data) {
				$("#mydata").html(data);
			}
		});
	}

	function toggle() {	//친구등록 신청한 페이지 보기 
		location.href = "CheckSendArrow.daa";
	}
	
	function sendmessage(data){
		console.log(data);
		window.open("Mypage_messagesend.daa?id="+data, "Popup", "width=380, height=300,scrollbars=1, menubar=1, resizable=1"); 
	}
</script>
</head>
<%
		String totalpagecount=(String)request.getAttribute("total");
		int pagesize=2;
		int totalpagenum=(Integer.parseInt(totalpagecount))/pagesize;
		if((Integer.parseInt(totalpagecount))%pagesize!=0){
			totalpagenum++;
		}//친구 페이징
		
		 String r_totalpagecount=(String)request.getAttribute("totalrecieve");
		int r_pagesize=2;
		int r_totalpagenum=(Integer.parseInt(r_totalpagecount))/r_pagesize;
		if((Integer.parseInt(r_totalpagecount))%r_pagesize!=0){
			r_totalpagenum++;
		}//받은거 페이징 
%>
<body>
	<c:import url="/Include/Header.jsp" />
	<section id="main-content"> <section class="wrapper">
	<div class="row">
		<h3>
			<i class="fa fa-angle-right">친구 신청 리스트</i>
		</h3>
		<input type="button" id="tog_btn" value="내가 신청한 친구 보기"
			onclick="toggle()">
		<div class="col-lg-9 main-chart" align="center">
			<h3 align="center">현재 친구</h3>
			<div id=mydata>
			<c:set var="fcount" value="<%=totalpagecount%>"/>
			<c:choose>
				<c:when test="${fcount!=0}">
				
				<table align="center" border="1">
					<c:set var="friendlist" value="<%=friends%>" />
					<c:forEach var="friendlist" items="${friendlist}">
						<tr>
							<td><a name="${friendlist.id}" onclick="sendmessage(this.name)">${friendlist.id}</a></td>
							<td>${friendlist.name}</td>
						</tr>
					</c:forEach>
				</table>
				
				<br>
				<c:set var="total" value="<%=totalpagenum%>" />
				
				totalpage: ${total}
				<br>
				<c:choose>
					<c:when test="${param.rp>1 }">
						<a
							href="CheckArrow.daa?rp=<%=Integer.parseInt(request.getParameter("rp")) - 1%>">이전</a>
					</c:when>
				</c:choose>
				<c:forEach var="i" begin="1" end="<%=totalpagenum%>">
					<a href="CheckArrow.daa?rp=${i}">[${i}]</a>
				</c:forEach>
				<c:choose>
					<c:when test="${empty param.rp}">
						<a href="CheckArrow.daa?rp=2">다음</a>
					</c:when>
					<c:when test="${total>param.rp}">
						<a
							href="CheckArrow.daa?rp=<%=Integer.parseInt(request.getParameter("rp"))+1%>">다음</a>
					</c:when>
				</c:choose>
				</c:when>
				<c:otherwise>
				<br>
				친구가 없네요 ^^ 
				</c:otherwise>
			</c:choose>
				
				<c:set var="rcount" value="<%=r_totalpagecount%>"/>
			<c:choose>
				<c:when test="${rcount!=0}">

				<h3 align="center">친구등록 요청 리스트</h3>
				<table id="recieve_table" align="center" border="1">
				<c:set var="recievelist" value="<%=mylist%>"/>
				<c:forEach var="recievelist" items="${recievelist}">
						<tr>
							<td>${recievelist.a_sendid }</td>
							<td>${recievelist.a_date }</td>
							<td>대기중</td>
							<td><input type="button" value="info" name="${recievelist.a_sendid}" onclick="checkinfo(this.name)" /></td>
						<!-- 상세보기 -->
							<td><input type="button" value="agree" id="${recievelist.a_sendid}" name="${recievelist.a_sendid}" onclick="agree(this.name)" /></td>
						<!-- 친구수락 -->
							<td><input type="button" value="disagree" name="${recievelist.a_sendid}" onclick="disagree(this.name)" /></td>
						<!-- 거절 -->
						</tr>
				
				</c:forEach>
				</table>
				
				<br>
				<c:set var="rtotal" value="<%=r_totalpagenum%>" />
				
				r_totalpage: ${rtotal}
				<br>
				<c:choose>
					<c:when test="${param.ap>1 }">
						<a href="CheckArrow.daa?ap=<%=Integer.parseInt(request.getParameter("ap")) - 1%>">이전</a>
					</c:when>
				</c:choose>
				<c:forEach var="i" begin="1" end="<%=r_totalpagenum%>">
					<a href="CheckArrow.daa?ap=${i}">[${i}]</a>
				</c:forEach>
				<c:choose>
					<c:when test="${empty param.ap}">
						<a href="CheckArrow.daa?ap=2">다음</a>
					</c:when>
					<c:when test="${rtotal>param.ap}">
						<a href="CheckArrow.daa?ap=<%=Integer.parseInt(request.getParameter("ap"))+1%>">다음</a>
					</c:when>
				</c:choose>
				</c:when>
				<c:otherwise>
				<br>
				<h3 align="center">친구등록 요청 리스트</h3>
				<br>
				요청들어온게 없네요 ^^
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
	</section> </section>
	<!--script for this page-->
	<!--common script for all pages-->
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
	<script rc="<%=request.getContextPath()%>/assets/js/sparkline-chart.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/zabuto_calendar.js"></script>
	<script type="application/javascript">//header부분 관련 스크립트
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
</body>
</html>
