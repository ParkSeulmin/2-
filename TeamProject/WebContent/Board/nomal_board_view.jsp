<%@page import="Login.DTO.Member"%>
<%@page import="java.util.List"%>
<%@page import="Board.DTO.Reply"%>
<%@page import="Board.DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Board board = (Board)request.getAttribute("boarddata");
	List replyList=(List)request.getAttribute("replylist");

	System.out.println("board_view bo_no: "+board.getBo_no());

	// login session
			Member user = null;
			String id = "";
			if(session.getAttribute("user") != null){
				user = (Member)session.getAttribute("user");
				id = user.getId();
			}		
			
			System.out.println("session id check: "+ id);
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
           	 		
       	<div class="content-panel">
       	 <div class="alert alert-warning"><b>BOARD VIEW</b></div>
	         	 		
        <table class="table" >
			 
				
				<tr>
					<th style="font-family:돋음; font-size:12" height="20">
						<div align="center"><b>&nbsp;제 목&nbsp;</b>&nbsp;&nbsp;</div>
					</th>
					
					<td style="font-family:돋음; font-size:12">
					<%=board.getBo_title()%>
					</td>
					
				</tr>
				<tr>
					<th style="font-family:돋음; font-size:12" height="20">
						<div align="center"><b>작성자</b>&nbsp;&nbsp;</div>
					</th>
					
					<td style="font-family:돋음; font-size:12">
					<%=board.getBo_writer()%>
					</td>
					
				</tr>
				<tr>
					<th style="font-family:돋음; font-size:12" height="20">
						<div align="center"><b>&nbsp;조 회&nbsp;</b>&nbsp;&nbsp;</div>
					</th>
					
					<td style="font-family:돋음; font-size:12">
						<%=board.getBo_count()%>
					</td>
	
				</tr>
				<tr>
					<th style="font-family:돋음; font-size:12" height="20">
						<div align="center"><b>작성일</b>&nbsp;&nbsp;</div>
					</th>
					
					<td style="font-family:돋음; font-size:12">
						<%=board.getBo_date()%>
					</td>
	
				</tr>
				<tr >
					<td colspan="2" style="height:1px;">
					</td>
				</tr>
				
				<tr>
				<th style="font-family:돋음; font-size:12">
					<div align="center"><b>&nbsp;내 용&nbsp;</b></div>
				</th>
				<td style="font-family:돋음; font-size:12">
					<table border=0 width=490 height=250 style="table-layout:fixed">
						<tr>
							<td valign=top style="font-family:돋음; font-size:12">
							<%=board.getBo_content() %>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<th style="font-family:돋음; font-size:12">
					<div align="center"><b>첨부파일</b></div>
				</th>
				<td style="font-family:돋음; font-size:12">
				<%if(!(board.getBo_file()==null)){ %>
					<%-- <a href="./boardupload/<%=board.getBo_file()%>"> --%>
					<a href="Board/filedownlaod.jsp?file_name=<%=board.getBo_file()%>">
						<%=board.getBo_file()%>
					</a>
				<%} %>
				</td>
			</tr>
			 
			<tr align="center" valign="middle">
				<td colspan="5" align="right">
					<font size=2>
					
					<a href="./BoardModify.bo?num=<%=board.getBo_no()%>">
						 <button type="button" class="btn btn-success">
					 	수정</button>
					</a>&nbsp;&nbsp;
					<a href="./BoardDeleteAction.bo?num=<%=board.getBo_no()%>&boardtype=<%=board.getBo_id()%>"
								id="deletemenu">
						<button type="button" class="btn btn-danger">삭제</button>
					</a>&nbsp;&nbsp;
					<a href="./BoardList.bo?boardtype=<%=board.getBo_id() %>"> 
						<button type="button" class="btn btn-warning">목록</button>
					</a>&nbsp;&nbsp;
					</font>
				</td>
			</tr>
		                      </table>
		                      
		                   </div>   
		                    	<p>
		
		</p>

<!-- 게시판 수정 -->
		<!--  꼬리글 달기 테이블 -->
		<div class="content-panel">
		<form name="reply" action="ReplyWrite.bo" method="POST">
			<input type="hidden" name="bo_no" name="bo_id" value="<%=board.getBo_no()%>">
			<input type="hidden" name="re_writer" id="re_writer" value="<%=id%>"> <!-- 임의 아이디 -->
			<!-- hidden data -->
			<table class="table">
				 
				<tr>
					<th colspan="2" style="font-family:돋음; font-size:12; font-align: center;" height="20"  width=500>
						<b>댓글 달기</b>
					</th>
				</tr>
				 
				<tr>
					<td align="left" style="font-family:돋음; font-size:12; font-align: center;">
						<b>내&nbsp;&nbsp;용</b> : <textarea name="re_content" rows="1" cols="100" style="resize: none;"></textarea>
					</td>
					<td>
						<a href="javascript:addreply()">
							<button type="button" class="btn btn-primary btn-xs">댓글등록</button>
						</a>
						<script type="text/javascript">
						function addreply(){	
							
							if (!reply.re_content.value) {
								alert("내용을 입력하세요");
								reply.re_content.focus();
								return false;
							}
							
							reply.submit();
						}
						</script>
					</td>
				</tr>
				<tr   >
					<td   colspan="2" style="height:1px;" width=500>
					</td>
				</tr>
			</table>
		</form>
		</div>
		 <br>
 		<!-- 꼬리글 목록 테이블 -->
 		<div class="content-panel">
 		<table class="table">
				 
				<tr>
					<th align="center" colspan="2" style="font-family:돋음; font-size:12; font-align: center;" height="20"  width=500>
						<b>댓 글</b>
					</th>
				</tr>
				 
				<%if(replyList.size() > 0){	
						for(int i=0; i<replyList.size(); i++){
							Reply reply=(Reply)replyList.get(i); 
				%>
				<tr align="left" style="border:0; font-family:돋음; font-size:12; font-weight: bold;">
					<td><%= reply.getRe_writer() %>:</td>
					<td align="right">
						<a href="./ReplyDeleteAction.bo?replynum=<%=reply.getR_no()%>&bo_no=<%=board.getBo_no()%>">[삭제]</a>
					</td>
				</tr>
				<tr align="left" style="font-family:돋음; font-size:12;">
					<td >
						&nbsp;&nbsp;&nbsp;&nbsp;<%=reply.getRe_content() %> 
					</td>
					<td align="right"><%=reply.getRe_date() %></td>
				</tr>
				<%		}
				   }else{ 
				%>	
					<tr  >
					<td   colspan="2" style="height:1px;" width=500>
					</td>
					</tr>
					<tr>
					<td  colspan="2" style="font-family:돋음; font-size:12;" align="center" height="20"  width=500>
						댓글이 존재하지 않습니다. 
					</td>
					</tr>
				<%
					}
				%>
				<tr   >
					<td   colspan="2" style="height:1px;" width=500>
					</td>
				</tr>
			</table>  
           	 </div>		
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
 
