
<%@page import="Login.DTO.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Mypage.DTO.Arrow_DTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% request.setCharacterEncoding("UTF-8"); 



	 

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
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/style-responsive.css" rel="stylesheet">

<script src="assets/js/chart-master/Chart.js"></script>

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
 
 <style type="text/css">

	div.start {
	  float: left;
	  width: 320px;
	  height: 320px;
	  margin: 0;
	  overflow: hidden;
	  background: url('http://www.wedaehan.com/image/main/box01_img.png') center no-repeat;
	}
	
</style>
 
</head>
<body style>
<!-- <section id="container" > -->
	 <c:import url="/Include/Header.jsp"/>
	  <section id="main-content">
          <section class="wrapper">
           
              <div class="row">
                  <div class="col-lg-9 main-chart">

					 
					 <div class="start" style="position: absolute; z-index: 20; left: 0px; top: 160px;">
								<style type="text/css">
						#clock {
							width: 320px;
							height: 320px;
							margin:0;
							padding:0;
							position: relative;
							top: 80px;
							left: 110px;
						}
						
						.rotatingHands {
							position: absolute;
							width: 320px;
							height: 320px;
							top: 0px;
							left: 0px;
						}
						
						#hours, #minutes, #seconds {
							position: absolute;
							display: block;
						}
						
						.glass {
							position: absolute;
							width: 320px;
							height: 320px;
							top: 0px;
							left: 0px;
						}
						</style>
						
						
						
						<div id="clock">
							<div class="rotatingHands"><img id="hours" src="http://www.wedaehan.com/css/images/hours.png" style="-webkit-transform: rotate(80.5deg);"></div>
							<div class="rotatingHands"><img id="minutes" src="http://www.wedaehan.com/css/images/minutes.png" style="-webkit-transform: rotate(246deg);"></div>
							<div class="rotatingHands"><img id="seconds" src="http://www.wedaehan.com/css/images/seconds.png" style="-webkit-transform: rotate(18deg);"></div>
							<!-- <div class="glass"><img src="images/glass.png" /></div> -->
							<img src="http://www.wedaehan.com/css/images/clock.png">
						</div>		
							</div>
					 
					 
					 
                      	

                    </div><!-- /row -->
                    
                    				
					 <!-- jQuery Rotate -->
						<!-- <!-- <script src="http://www.wedaehan.com/js/jquery-1.8.3.min.js"></script>
						<script type="text/javascript" src="http://www.wedaehan.com/js/clock/jQueryRotate.2.2.js"></script>
						Functions
						<script type="text/javascript" src="http://www.wedaehan.com/js/clock/functions.js"></script> --> -->
						
					 
                  
                  
      <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
                  
                  <div class="col-lg-3 ds">
                     

                       <!-- USERS ONLINE SECTION -->
						<h3>MEMBERS</h3>
                      <!-- First Member -->
                      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="assets/img/ui-divya.jpg" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p><a href="#">DIVYA MANIAN</a><br>
                      		   <muted>Available</muted>
                      		</p>
                      	</div>
                      </div>
                      
               
                      
                      
                      
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
                      
                  </div><!-- /col-lg-3 -->
              </div>
               <!--    </div>      -->
                    
	  	</section><!--/wrapper -->
     </section><!-- /MAIN CONTENT -->
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
