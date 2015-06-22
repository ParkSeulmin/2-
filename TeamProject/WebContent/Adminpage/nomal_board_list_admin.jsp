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
		if(session.getAttribute("user") != null){
			user = (Member)session.getAttribute("user");
			id = user.getId();
		}		
		
		System.out.println("session id check: "+ id);
		
		
	List boardList=(List)request.getAttribute("boardlist");
	 
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
	int boardtype = ((Integer)request.getAttribute("boardtype")).intValue();
	
	 
	System.out.println("nomal_board_list_admin.jsp boardtype: "+boardtype);
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
<c:set var="boardtype" value="<%=boardtype%>"></c:set>
<c:choose>
	<c:when test="${boardtype == 10 }">
		<c:set var="boardname" value="Notice Board"/>
	</c:when>
	<c:when test="${boardtype == 20 }">
		<c:set var="boardname" value="Real After"/>
	</c:when>
	<c:when test="${boardtype == 30 }">
		<c:set var="boardname" value="Men's Board"/>
	</c:when>
	<c:when test="${boardtype == 40 }">
		<c:set var="boardname" value="Women's Board"/>
	</c:when>
	<c:when test="${boardtype == 50 }">
		<c:set var="boardname" value="Q&A Board"/>
	</c:when>
</c:choose>
 
	
	<%-- <input type="hidden" id="sessionid" value="<%=user.getId() %>"> --%>
		<!-- 게시판 리스트 -->
	 <section id="main-content">
          <section class="wrapper">
          <!--  <div class="row"> -->
  			<h3><i class="fa fa-angle-right"></i>BOARD ADMIN</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          		<p>관리자 게시판 관리 페이지</p>
          		</div>
          	</div>
	             
	  
	         <div  class="col-lg-9 main-chart">
	          
	         	<h4><i class="fa fa-angle-right"></i>게시물 열람 삭제 가능</h4>
	          	<hr>
		           <div class="showback">
      					<h4><i class="fa fa-angle-right"></i> 게시판 카테고리</h4>
						<div class="btn-group btn-group-justified">
						  <div class="btn-group">
						    <button type="button" class="btn btn-theme"
						    	onclick="location.href='./BoardListadmin.admin?boardtype=<%=10%>'"
						    >Notice</button>
						  </div>
						  <div class="btn-group">
						    <button type="button" class="btn btn-theme"
						    	onclick="location.href='./BoardListadmin.admin?boardtype=<%=20%>'"
						    >Real After</button>
						  </div>
						  <div class="btn-group">
						    <button type="button" class="btn btn-theme"
						    	onclick="location.href='./BoardListadmin.admin?boardtype=<%=30%>'"
						    >Men's Board</button>
						  </div>
						   <div class="btn-group">
						    <button type="button" class="btn btn-theme"
						    	onclick="location.href='./BoardListadmin.admin?boardtype=<%=40%>'"
						    >Women's Board</button>
						  </div>
						   <div class="btn-group">
						    <button type="button" class="btn btn-theme"
						    	onclick="location.href='./BoardListadmin.admin?boardtype=<%=50%>'"
						    >Q&A</button>
						  </div>
						</div>      				
      				</div>
	          <div>
						<font size=2> TOTAL : ${listcount}
									&nbsp;&nbsp;|&nbsp;&nbsp; ${page} 페이지	
						</font>
					  
	            	</div>
	      			<div class="row">
                  <div class="col-md-12">
                      <div class="content-panel">
                          <table class="table table-striped table-advance table-hover">
	                  	  	  <h4><i class="fa fa-angle-right"></i>${boardname} Advanced Table</h4>
	                  	  	  <hr>
	                  	  	  
                              <thead>
                              <tr>
                                  <th><i class="fa fa-bullhorn"></i> 번호</th>
                                  <th class="hidden-phone"><i class="fa fa-bullhorn"></i>제목</th>
                                  <th><i class="fa fa-bookmark"></i> 작성자</th>
                                  <th><i class=" fa fa-edit"></i> 작성일</th>
                                  <th><i class=" fa fa-edit"></i> 조회</th>
                                  <th>관리</th>
                              </tr>
                              </thead>
                              <tbody>
                                 <%
								for(int i=0;i<boardList.size();i++){
									Board bl=(Board)boardList.get(i);
									 				
								%>
                              <tr>
                                  <td><%=bl.getBo_no() %></td>
                                  <td><a href="./BoardDetailAction.bo?num=<%=bl.getBo_no()%>&boardtype=<%=boardtype%>">
                                  		<%=bl.getBo_title() %></a></td>
                                  <td><%=bl.getBo_writer()%></td>
                                  <td><%=bl.getBo_date() %></td>
                                  <td><%=bl.getBo_count() %></td>
                                  <td>
                                    <!--   <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                                      <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button> -->
                                      <button class="btn btn-danger btn-xs"
                                      		  onclick="location.href='./AdminPwdCheckPage.admin?bo_no=<%=bl.getBo_no()%>&boardtype=<%=boardtype%>'">
                                      <i class="fa fa-trash-o "></i></button>
                                  </td>
                              </tr>
                            <%		
					 	 	} 	
							%>
							<tr>
								<td colspan="6">
									<div align="center">
						         		 <%if(nowpage<=1){ %>
										<span class="badge">이전</span>&nbsp;
										<%}else{ %>
										<a href="./BoardListadmin.admin?page=<%=nowpage-1 %>&boardtype=<%=boardtype%>" ><span class="badge bg-warning">이전</span></a>&nbsp;
										<%} %>
										
										<%for(int a=startpage;a<=endpage;a++){
											if(a==nowpage){%>
											<span class="badge bg-important"><%=a %></span>
											<%}else{ %>
											<a href="./BoardListadmin.admin?page=<%=a %>&boardtype=<%=boardtype%>"><span class="badge bg-inverse"><%=a %></span></a>
											
											<%} %>
										<%} %>
										
										<%if(nowpage>=maxpage){ %>
										<span class="badge">다음</span>
										<%}else{ %>
										<a href="./BoardListadmin.admin?page=<%=nowpage+1 %>&boardtype=<%=boardtype%>"><span class="badge bg-warning">다음</span></a>
										<%} %>
						         	</div>
								
								
								</td>
							</tr>
							<c:if test="${boardtype == 10}">
								<tr>
									<td colspan="6">
									<div align="right"> 
				         			<a href="<%=request.getContextPath()%>/BoardWrite.bo?boardtype=<%=boardtype%>" id="writeboard">
										<button type="button" class="btn btn-theme04">
											<i class="fa fa-heart"></i> 
												글쓰기
										</button>
									</a>
			         			</div> 
									
									</td>
								</tr>
							</c:if>
								
                              </tbody>
                          </table>
                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->
	 
	         	</div>
	          
	        <!--  </div> -->
	                        
		 
		 
	                        
	                  	  
			
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
 