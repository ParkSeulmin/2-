<%@page import="Login.DTO.Member"%>
<%@page import="Mypage.DTO.Message_DTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	Member user = null;
	String userid = null;
	if(session.getAttribute("user") != null){
		user = (Member)session.getAttribute("user");
		userid = user.getId();
	}		
	
	System.out.println("Send session id check: "+ userid);
	//int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
	int rcount = ((Integer)request.getAttribute("sendcount")).intValue();//받은 메시지 갯수
	ArrayList<Message_DTO> rmsg = (ArrayList<Message_DTO>)request.getAttribute("sendlist");//받은 메시지리스트
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
<link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="<%=request.getContextPath()%>/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/js/gritter/css/jquery.gritter.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/css/style-responsive.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/assets/js/chart-master/Chart.js"></script>

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
	<h3>
		<i class="fa fa-angle-right"></i> 보낸 메시지함
	</h3>
	<div class="row mt">
		<div class="col-lg-12">
			<p>보낸 메시지함</p>
		</div>
	</div>

	<div class="col-md-12 mt">
		<div class="content-panel">

			<input type="hidden" id="sessionid" value="<%=userid %>">
			<!-- 게시판 리스트 -->
			<table width=570 border="0" cellpadding="0" cellspacing="0"  class="table table-bordered table-striped table-condensed">
				<tr align="center" valign="middle">
					<td colspan="4">보낸 쪽지함</td>
					<td colspan="2" align="middle"><font size=2>보낸 메시지 수:<%=rcount %></font></td>
				</tr>

				<tr align="center" valign="middle" bordercolor="#333333">
					<td style="font-family: Tahoma; font-size: 8pt;" width="8%"
						height="26">
						<div align="center">
							<input type="checkbox" id="check" name="check">
						</div>
					</td>
					<td style="font-family: Tahoma; font-size: 8pt;" width="14%">
						<div align="center">받은 사람</div>
					</td>
					<td style="font-family: Tahoma; font-size: 8pt;" width="14%">
						<div align="center">제목</div>
					</td>
					<td style="font-family: Tahoma; font-size: 8pt;" width="18%">
						<div align="center">내용</div>
					</td>
					<td style="font-family: Tahoma; font-size: 8pt;" width="11%">
						<div align="center">날짜</div>
					</td>
					<td style="font-family: Tahoma; font-size: 8pt;" width="11%">
						<div align="center">상세보기</div>
					</td>
				</tr>
				

				<%
			//for문 돌려서 받은 메시지 리스트 뽑기
				for(int i=0;i<rmsg.size();i++){
					Message_DTO rl = (Message_DTO)rmsg.get(i);
			%>
				<tr align="center" valign="middle" bordercolor="#333333"
					onmouseover="this.style.backgroundColor='F8F8F8'"
					onmouseout="this.style.backgroundColor=''">
					<td height="23" style="font-family: Tahoma; font-size: 10pt;">
						<input type="checkbox" />
					<td style="font-family: Tahoma; font-size: 10pt;">
						<div align="center"><%=rl.getM_RECIEVEID() %></div>
						</td>
					<td style="font-family: Tahoma; font-size: 10pt;">
						<div align="center"><%=rl.getM_TITLE() %></div>

					</td>

					<td style="font-family: Tahoma; font-size: 10pt;">
						<div align="center"><%=rl.getM_CONTENT() %></div>
					</td>
					<td style="font-family: Tahoma; font-size: 10pt;">
						<div align="center"><%=rl.getM_DATE() %></div>
					</td>
					<td style="font-family: Tahoma; font-size: 10pt;">
						<div align="center">
						
						<input type="button" value="상세보기" width="10" height="10" class="btn btn-primary btn-xs btn-round btn-danger"
						onclick="window.open('<%=request.getContextPath()%>/Detailsendmsg.msg?m_id=<%=rl.getM_ID()%>','zip','width=500','height=200')">
						
						</div>
					</td>
				</tr>
				<%		} 
				
			%>
				<tr align=center height=20>
					<td colspan=7 style="font-family: Tahoma; font-size: 10pt;">
						<%if(nowpage<=1){ %> [이전]&nbsp; <%}else{ %> <a
						href="./Sendmsg.msg?page=<%=nowpage-1 %>">[이전]</a>&nbsp; <%} %> 
						<%for(int a=startpage;a<=endpage;a++){
						if(a==nowpage){%> [<%=a %>] <%}else{ %> <a
						href="./Sendmsg.msg?page=<%=a %>">[<%=a %>]
					</a> &nbsp; <%} %> <%} %> <%if(nowpage>=maxpage){ %> [다음] <%}else{ %> <a
						href="./Sendmsg.msg?page=<%=nowpage+1 %>">[다음]</a> <%} %>
					</td>
				</tr>
				
			</table>




		</div>
		<!--/content-panel -->
	</div>
	<!-- /col-md-12 --> </section><!--/wrapper --> </section>
	<!-- /MAIN CONTENT -->





	<!-- <div style="padding: 200px;"> 임의임의임의  -->

	<c:import url="/Include/Footer.jsp" />
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
 