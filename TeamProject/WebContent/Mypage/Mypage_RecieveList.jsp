<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="Mypage.DTO.Arrow_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>Insert title here</title>
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
	List<Arrow_DTO> mylist=new ArrayList<Arrow_DTO>();
	mylist=(ArrayList<Arrow_DTO>)request.getAttribute("result");
	
	List<Member> friends=new ArrayList<Member>();
	friends=(ArrayList<Member>)request.getAttribute("friends");
%>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	function checkinfo(sendid){
		window.open("Mypage/Mypage_MemberInfo.jsp?id="+sendid, "Popup", "width=600, height=150,scrollbars=1, menubar=1, resizable=1"); 
	}
	
	function agree(sender){
		var sdid={
					s_id:sender,
				    r_id:'<%=session.getAttribute("user")%>'}

		$.ajax({
			url:"register.daa",
			data:sdid,
			success : function(data){
				alert(data);
				//$("#"+sender).hide();
				location.reload();
			}
		});
	}
	function disagree(sender){
		var sdid={
					s_id:sender,
				    r_id:'<%=session.getAttribute("user")%>'}

		$.ajax({
			url:"delete_arrow.daa",
			data:sdid,
			success : function(data){
				alert(data);
				//$("#"+sender).hide();
				location.reload();
			}
		});
	}
</script>
</head>

<body>
  
<c:import url="/Include/Header.jsp" />
      	 <section id="main-content">
          <section class="wrapper">
           <div class="row">
           	
           	<h3><i class="fa fa-angle-right"></i>BOARD VIEW</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          		<p>게시판 보기</p>
          		</div>
          	</div>
	                <hr>
           	 <div  class="col-lg-9 main-chart" align="center">
			<h3 align="center">친구 등록 요청 LIST</h3>
			user : <%=request.getParameter("user")%><br>
			
			<form>
			<table align="center" border="1">
				
			<%
				for(int i=0; i<friends.size(); i++){
			%>	<tr>
					<td><%=friends.get(i).getId()%></td>
					<td><%=friends.get(i).getName()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
			<%
				}
			%>
			</table>
			
			<table align="center" border="1">
			<%
				for(int i=0; i<mylist.size(); i++){
			%>	<tr>
					<td><%=mylist.get(i).getA_sendid()%></td>
					<td><%=mylist.get(i).getA_date()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><%=mylist.get(i).getA_status()%></td>
					<td><input type="button" value="info" 
					name="<%=mylist.get(i).getA_sendid() %>" onclick="checkinfo(this.name)" /></td>
					<!-- 상세보기 -->
					<td><input type="button" value="agree" id="<%=mylist.get(i).getA_sendid() %>"
					name="<%=mylist.get(i).getA_sendid() %>" onclick="agree(this.name)" /></td>
					<!-- 친구수락 -->
					<td><input type="button" value="disagree" 
					name="<%=mylist.get(i).getA_sendid() %>" onclick="disagree(this.name)" /></td>
					<!-- 거절 -->
				</tr>
			<%
				}
			%>
			</table>
			</form>
			agree->서로 친구 테이블에 등록해주는 테이블 
			<br>
			disagree->화살 테이블에서 해당 화살 삭제 
			<br>
			info->화살 보낸 사람의 정보를 보여주는 쿼리 

	 </div>
	 </div>
	 </section>
	 </section>
	 
<!-- js placed at the end of the document so the pages load faster -->
	<script src="<%=request.getContextPath()%>/assets/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery-1.8.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery.scrollTo.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery.sparkline.js"></script>


	<!--common script for all pages-->
	<script src="<%=request.getContextPath()%>/assets/js/common-scripts.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/gritter/js/jquery.gritter.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/gritter-conf.js"></script>

	<!--script for this page-->
	<script src="<%=request.getContextPath()%>/assets/js/sparkline-chart.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/zabuto_calendar.js"></script>

	  

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

	

</body>
</html>

