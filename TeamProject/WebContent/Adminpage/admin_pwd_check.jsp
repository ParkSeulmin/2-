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
		
		String bo_no = "";
		if(request.getParameter("bo_no") != null){
			bo_no = request.getParameter("bo_no");
		}
		
		System.out.println("admin_pwd_check.jsp bo_no: "+bo_no);
		
		int boardtype = 20;
		if(request.getParameter("boardtype") != null){
			boardtype = Integer.parseInt(request.getParameter("boardtype"));
		}
		
		System.out.println("admin_pwd_check.jsp bo_no: "+boardtype);
	 
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
          <!--  <div class="row"> -->
  			<h3><i class="fa fa-angle-right"></i>BOARD ADMIN</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          		<p>관리자 게시판 관리 페이지</p>
          		</div>
          	</div>
	             
	  
	         <div  class="col-lg-9 main-chart">
	          
	         	<h4><i class="fa fa-angle-right"></i>게시물 열람/삭제</h4>
	          	<hr>
		          
	         
	         
	      			<div class="row">
                  <div class="col-md-12">
                      <div class="content-panel">
                      
                          <table class="table table-striped table-advance table-hover">
	                  	  	  <h4><i class="fa fa-angle-right"></i>관리자 비밀번호 확인</h4>
	                  	  	  <hr>
                              <thead>
                              <tr>
                                  <th><i class="fa fa-bullhorn"></i> 관리자 비밀번호</th>
                                   
                              </tr>
                              </thead>
                              <tbody>
                                
                              <tr>
                                  
                                  <td  >
                                    <div  class="col-lg-10">
                                    <form id="adminpwd" action="./AdminPwdCheck.admin">
                                    <input type="hidden" id="bo_no" name="bo_no" value="<%=bo_no%>">
                                     <input type="hidden" id="boardtype" name="boardtype" value="<%=boardtype%>">
                                    <input class="form-control" id="adminpwd" name="adminpwd" type="password">
                                  	</form></div><br><br><br>
                                  	<div align="center">
                                  	<button type="submit"  form="adminpwd" class="btn btn-round btn-danger">
                                  	확인</button>
						         	&nbsp; 
                                  	<button type="button" class="btn btn-round btn-primary" onclick="javascirpt:history.back()">취소</button>
                                  	</div>
                                  </td>
                              </tr>
                             
				
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
 