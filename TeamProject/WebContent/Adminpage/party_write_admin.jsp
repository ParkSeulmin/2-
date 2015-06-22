
<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%

// session
		Member user = null;
		String id = "";
		if(session.getAttribute("user") != null){
			user = (Member)session.getAttribute("user");
			id = user.getId();
		}		
		
		System.out.println("session id check: "+ id);
 
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

		<script type="text/javascript" 
	src="<%=request.getContextPath()%>/Board/ckeditor/ckeditor.js">
	</script>
	<script language="javascript">
		function addparty(){
			
			if (!partyform.p_title.value) {
				alert("파티이름을 입력하세요");
				boardform.bo_title.focus();
				return false;
			}
			
			if (!partyform.p_area.value) {
				alert("파티 지역을 입력하세요");
				boardform.bo_title.focus();
				return false;
			}
			
			if (!partyform.p_maxpeople.value) {
				alert("파티의 최대인원을 입력하세요");
				boardform.bo_title.focus();
				return false;
			}
			 
			if (!partyform.p_img.value) {
				alert("파티의 이미지를 첨부하세요");
				boardform.bo_title.focus();
				return false;
			}
			
			partyform.submit();
		}
	
		
	</script>
</head>
<body style>	
	

 
<c:import url="/Include/Header.jsp" />
 
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<section id="main-content">
          <section class="wrapper">
           <div class="row">
           	
           	<h3><i class="fa fa-angle-right"></i>PARTY WRITE</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          		<p>파티 만들기</p>
          		</div>
          	</div>
	                <hr>
           	 <div  class="col-lg-9 main-chart" align="center">
           	 
           	 
           	 <form action="<%=request.getContextPath()%>/PartyAddAction.admin" method="post" 
			enctype="multipart/form-data" name="partyform">
		 
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr align="center" valign="middle">
				<td colspan="5"><div class="alert alert-warning"><b>PARTY WRITE</b></div>
				 </td>
			</tr>
			 
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center"><span class="badge bg-warning">파티이름</span></div>
				</td>
				<td>
				
					 <p> </p>
						<input id="p_title" name="p_title" type="text" class="form-control">
					<p> </p>
					
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
					<div align="center"><span class="badge bg-warning">파티날짜</span></div>
				</td>
				<td>

						
				
				<p> </p>
					<p>  <input type="text" id="p_date" class="form-control"></p>
				<p> </p>
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12">
					<div align="center"><span class="badge bg-warning">파티지역</span></div>
				</td>
				<td>
				<p> </p>
					<input id="p_area" name="p_area" type="text" class="form-control">
				<p> </p>	 
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12" height="16">
				<p> </p>
					<div align="center"><span class="badge bg-warning">최대인원</span></div>
				</td>
				<td>
				<p> </p>
					<!-- <input id="bo_title" name="bo_title" type="text" size="50" maxlength="100" 
						value=""/> -->
						<input id="p_maxpeople" name="p_maxpeople" type="text" class="form-control">
				<p> </p>
				</td>
				
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12">
					<div align="center"><span class="badge bg-warning">이미지첨부</span></div>
				</td>
				<td>
				<p> </p>
					<input id="p_img" name="p_img" type="file"/>
				<p> </p></td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height:1px;">
				</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr align="center" valign="middle">
				<td colspan="5">
					<a href="javascript:addparty()"><span class="label label-primary">파티등록</span></a>&nbsp;&nbsp;
					<a href="javascript:history.back()"><span class="label label-danger">뒤로</span></a>
				</td>
			</tr>
		</table>
		</form>
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
            
               $("#p_date").datepicker({ minDate: -20, maxDate: "+1M +10D" });   
        });
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
        
        
    </script>

	
	<!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
 
	 <script>
  $(function() {
    $( "#p_date" ).datepicker({ minDate: -20, maxDate: "+1M +10D", dateFormat: "yy-mm-dd" });
  });
  </script>		 -->			 	
 
</body>
</html>	 
