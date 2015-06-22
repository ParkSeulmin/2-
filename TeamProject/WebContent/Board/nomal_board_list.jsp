<%@page import="Login.DTO.Member"%>
<%@page import="Board.DTO.Reply"%>
<%@page import="Board.DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
// session
		Member user = null;
		String id = null;
		int adminnum = 0;
		if(session.getAttribute("user") != null){
			user = (Member)session.getAttribute("user");
			id = user.getId();
			adminnum = user.getAdmin();
		}		
		
		System.out.println("session id check: "+ id);
		
		
	List boardList=(List)request.getAttribute("boardlist");
	List replylistnum = (List)request.getAttribute("replylistnum");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
	int boardtype = ((Integer)request.getAttribute("boardtype")).intValue();
	
	String boardname = (String)request.getAttribute("boardname");
	System.out.println("nomal_board_list.jsp: "+boardtype);
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
  <c:import url="/Include/Header.jsp"/>

 
	
	<%-- <input type="hidden" id="sessionid" value="<%=user.getId() %>"> --%>
		<!-- 게시판 리스트 -->
	 <section id="main-content">
          <section class="wrapper">
           <div class="row">
  			<h3><i class="fa fa-angle-right"></i>BOARD</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          		<p>BOARD LIST</p>
          		</div>
          	</div>
	             
	  
	         <div  class="col-lg-9 main-chart">
	          
	         	<h4><i class="fa fa-angle-right"></i>${boardname}</h4>
	          	<hr>
		          <div>
						<font size=2> TOTAL : ${listcount}
									&nbsp;&nbsp;|&nbsp;&nbsp; ${page} 페이지	
						</font>
					  
	            	</div>
	         
	         
	         <div class="row mt">
	              <%
				for(int i=0;i<boardList.size();i++){
					Board bl=(Board)boardList.get(i);
					int rl=(Integer)replylistnum.get(i);					
				%>
			<!-- Blog Panel -->
			<!-- <div class="col-lg-4 col-md-4 col-sm-4 mb"> -->
				<div class = "col-md-4 mb">
				<div class="content-panel pn">
					 
					 <c:set var="boardtype" value="<%=boardtype%>"/>
					 <c:choose>
					 <c:when test="${boardtype == 10}">
					 		<div id="blog-bg">
								<div class="badge badge-popular"><%=bl.getBo_no()%></div>
								<div class="blog-title"><%=bl.getBo_title()%>&nbsp;[<%=rl%>]</div>
							</div>
						<div class="blog-text">
						<b><%=bl.getBo_writer()%>&nbsp;(<%=bl.getBo_date() %>) &nbsp; 조회: &nbsp;<%=bl.getBo_count() %></b>
							<p> <%
								String bo_content = "";
									if(bl.getBo_content().length() >= 10){
									 	bo_content = bl.getBo_content().substring(0, 10)+"......";	
									} else{
										bo_content = bl.getBo_content();
									}
								%>
								<%=bo_content%>
							    &nbsp;&nbsp;
							<a href="./BoardDetailAction.bo?num=<%=bl.getBo_no()%>&boardtype=<%=boardtype%>">
							Read More</a></p>
						</div>
					 	</c:when>
					 	 <c:when test="${boardtype == 20}">
					 		<div id="blog-bg2">
								<div class="badge badge-popular"><%=bl.getBo_no()%></div>
								<div class="blog-title"><%=bl.getBo_title()%>&nbsp;[<%=rl%>]</div>
							</div>
						<div class="blog-text">
						<b><%=bl.getBo_writer()%>&nbsp;(<%=bl.getBo_date() %>) &nbsp; 조회: &nbsp;<%=bl.getBo_count() %></b>
							<p> <%
								String bo_content = "";
									if(bl.getBo_content().length() >= 10){
									 	bo_content = bl.getBo_content().substring(0, 10)+"......";	
									} else{
										bo_content = bl.getBo_content();
									}
								%>
								<%=bo_content%>
							    &nbsp;&nbsp;
							<a href="./BoardDetailAction.bo?num=<%=bl.getBo_no()%>&boardtype=<%=boardtype%>">
							Read More</a></p>
						</div>
					 	</c:when>
					 	<c:when test="${boardtype == 30}">
					 		<div id="blog-bg3">
								<div class="badge badge-popular"><%=bl.getBo_no()%></div>
								<div class="blog-title"><%=bl.getBo_title()%>&nbsp;[<%=rl%>]</div>
							</div>
						<div class="blog-text">
						<b><%=bl.getBo_writer()%>&nbsp;(<%=bl.getBo_date() %>) &nbsp; 조회: &nbsp;<%=bl.getBo_count() %></b>
							<p> <%
								String bo_content = "";
									if(bl.getBo_content().length() >= 10){
									 	bo_content = bl.getBo_content().substring(0, 10)+"......";	
									} else{
										bo_content = bl.getBo_content();
									}
								%>
								<%=bo_content%>
							    &nbsp;&nbsp;
							<a href="./BoardDetailAction.bo?num=<%=bl.getBo_no()%>&boardtype=<%=boardtype%>">
							Read More</a></p>
						</div>
					 	</c:when>
					 	<c:when test="${boardtype == 40}">
					 		<div id="blog-bg4">
								<div class="badge badge-popular"><%=bl.getBo_no()%></div>
								<div class="blog-title"><%=bl.getBo_title()%>&nbsp;[<%=rl%>]</div>
							</div>
						<div class="blog-text">
						<b><%=bl.getBo_writer()%>&nbsp;(<%=bl.getBo_date() %>) &nbsp; 조회: &nbsp;<%=bl.getBo_count() %></b>
							<p> <%
								String bo_content = "";
									if(bl.getBo_content().length() >= 10){
									 	bo_content = bl.getBo_content().substring(0, 10)+"......";	
									} else{
										bo_content = bl.getBo_content();
									}
								%>
								<%=bo_content%>
							    &nbsp;&nbsp;
							<a href="./BoardDetailAction.bo?num=<%=bl.getBo_no()%>&boardtype=<%=boardtype%>">
							Read More</a></p>
						</div>
					 	</c:when>
					 	<c:when test="${boardtype == 50}">
					 		<div id="blog-bg5">
								<div class="badge badge-popular"><%=bl.getBo_no()%></div>
								<div class="blog-title"><%=bl.getBo_title()%>&nbsp;[<%=rl%>]</div>
							</div>
						<div class="blog-text">
						<b><%=bl.getBo_writer()%>&nbsp;(<%=bl.getBo_date() %>) &nbsp; 조회: &nbsp;<%=bl.getBo_count() %></b>
							<p> <%
								String bo_content = "";
									if(bl.getBo_content().length() >= 10){
									 	bo_content = bl.getBo_content().substring(0, 10)+"......";	
									} else{
										bo_content = bl.getBo_content();
									}
								%>
								<%=bo_content%>
							    &nbsp;&nbsp;
							<a href="./BoardDetailAction.bo?num=<%=bl.getBo_no()%>&boardtype=<%=boardtype%>">
							Read More</a></p>
						</div>
					 	</c:when>
					 	<c:otherwise>
					 		<div id="blog-bg">
								<div class="badge badge-popular"><%=bl.getBo_no()%></div>
								<div class="blog-title"><%=bl.getBo_title()%>&nbsp;[<%=rl%>]</div>
								</div>
							<div class="blog-text">
							<b><%=bl.getBo_writer()%>&nbsp;(<%=bl.getBo_date() %>) &nbsp; 조회: &nbsp;<%=bl.getBo_count() %></b>
								<p> <%
									String bo_content = "";
										if(bl.getBo_content().length() >= 10){
										 	bo_content = bl.getBo_content().substring(0, 10)+"......";	
										} else{
											bo_content = bl.getBo_content();
										}
									%>
									<%=bo_content%>
								    &nbsp;&nbsp;
								<a href="./BoardDetailAction.bo?num=<%=bl.getBo_no()%>&boardtype=<%=boardtype%>">
								Read More</a></p>
							</div>
					 	
					 	</c:otherwise>
					 </c:choose>
					
					
				</div>
			</div><!-- /col-md-4-->
	 	 <%		
	 	 	} 	
			%>
	         	</div>
	         	 <div align="center">
	         		 <%if(nowpage<=1){ %>
					<span class="badge">이전</span>&nbsp;
					<%}else{ %>
					<a href="./BoardList.bo?page=<%=nowpage-1 %>&boardtype=<%=boardtype%>" ><span class="badge bg-warning">이전</span></a>&nbsp;
					<%} %>
					
					<%for(int a=startpage;a<=endpage;a++){
						if(a==nowpage){%>
						<span class="badge bg-important"><%=a %></span>
						<%}else{ %>
						<a href="./BoardList.bo?page=<%=a %>&boardtype=<%=boardtype%>"><span class="badge bg-inverse"><%=a %></span></a>
						
						<%} %>
					<%} %>
					
					<%if(nowpage>=maxpage){ %>
					<span class="badge">다음</span>
					<%}else{ %>
					<a href="./BoardList.bo?page=<%=nowpage+1 %>&boardtype=<%=boardtype%>"><span class="badge bg-warning">다음</span></a>
					<%} %>
	         	</div>
	         	<c:set var="user" value="<%=user%>"></c:set>
	         	<c:set var="useradmin" value="<%=adminnum %>"/>
	         	<c:choose>
	         		<c:when test="${boardtype == 10}">
	         			<c:choose>
	         				<c:when test="${user == null}">
	         					<div align="right"> 
	         					</div>
	         				</c:when>	
	         				<c:when test="${useradmin == 0}">
	         					<div align="right"> 
	         					</div>
	         				</c:when>
	         				<c:otherwise>
		         			<div align="right"> 
		         			<a href="<%=request.getContextPath()%>/BoardWrite.bo?boardtype=<%=boardtype%>" id="writeboard">
								<button type="button" class="btn btn-theme04">
									<i class="fa fa-heart"></i> 
										글쓰기
								</button>
							</a>
		         			</div> 
		         			</c:otherwise>
	         			</c:choose>
	         		</c:when>
	         		<c:otherwise>
		         			<div align="right"> 
		         			<a href="<%=request.getContextPath()%>/BoardWrite.bo?boardtype=<%=boardtype%>" id="writeboard">
								<button type="button" class="btn btn-theme04">
									<i class="fa fa-heart"></i> 
										글쓰기
								</button>
							</a>
		         			</div> 
		         			</c:otherwise>
	         	</c:choose>
	         	 
	         </div>
	                        
		 
	                        
	                  	  
			
				<div class="col-lg-3 ds">
                    
						
					 <!-- CALENDAR-->
                        <div id="calendar" class="mb">
                            <div class="panel green-panel no-margin">
                                <div class="panel-body">
                                    <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                        <div class="arrow"></div>
                                        <h3 class="popover-title" style="disadding: none;"></h3>
                                        <div id="date-popover-content" class="popover-content"></div>
                                    </div>
                                    <div id="my-calendar"></div>
                                </div>
                            </div>
                        </div> 
                  </div>
		
			</div>
	 	</section><!--/wrapper -->
      </section><!-- /MAIN CONTENT -->
	 
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
 