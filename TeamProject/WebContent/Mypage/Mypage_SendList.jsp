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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/assets/css/bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/js/gritter/css/jquery.gritter.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/lineicons/style.css">
<link href="<%=request.getContextPath()%>/assets/css/style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/css/style-responsive.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/assets/js/chart-master/Chart.js"></script>

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
<%
	List<Arrow_DTO> mylist=new ArrayList<Arrow_DTO>();
	mylist=(ArrayList<Arrow_DTO>)request.getAttribute("arrowlist");
	
	List<Member> friends=new ArrayList<Member>();
	friends=(ArrayList<Member>)request.getAttribute("friends");
	
	Member member=(Member)session.getAttribute("user");
	String me=member.getId(); 
	
	String totalpagecount=(String)request.getAttribute("total");
	int pagesize=2;
	int totalpagenum=(Integer.parseInt(totalpagecount))/pagesize;
	if((Integer.parseInt(totalpagecount))%pagesize!=0){
		totalpagenum++;
	}
%>

<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	function checkout(sender){
		var sdid={
					s_id:sender,
				    r_id:'<%=me%>'}
		$.ajax({
			url:"delete_arrow.daa",
			data:sdid,
			success : function(data){
				$("#mydiv").html(data);
			}
		});
	}
	
	function toggle(){
		location.href="CheckArrow.daa";
	}
	
	function sendmessage(data){
		console.log(data);
		window.open("Mypage_messagesend.daa?id="+data, "Popup", "width=380, height=300,scrollbars=1, menubar=1, resizable=1"); 
	}
	function deletefriend(sender){
		var sdid={
				s_id:sender,
			    r_id:'<%=me%>'
		}
		$.ajax({
			url : "delete_friend.daa",
			data : sdid,
			success : function(data) {
				$("#mydiv").html(data);
			}
		});
	}
</script>

</head>
<body>
	<c:import url="/Include/Header.jsp" />
	<section id="main-content"> <section class="wrapper">

	<h3>
		<i class="fa fa-angle-right">내가 친구 요청한 사람 리스트</i>
	</h3>
	<hr>

	<div class="row">


		<div id="mydiv">
			<div class="col-lg-9 main-chart">
				<c:set var="mysendlist" value="<%=mylist%>" />
				<c:choose>

					<c:when test="${not empty mysendlist }">
						<h3 align="center">내가 요청한 친구 리스트</h3>
						<table class="table table-striped table-advance table-hover"
							align="center">

							<thead>
								<tr>
									<th><i class="fa fa-bullhorn"></i> ID</th>
									<th class="hidden-phone"><i class="fa fa-question-circle"></i>날짜</th>
									<th><i class=" fa fa-edit"></i>상태</th>
									<th>확인</th>
								</tr>
							</thead>

							<c:forEach var="sendlist" items="${mysendlist}">
								<tbody>
									<tr>
										<td><a href="basic_table.html#">${sendlist.a_sendid}</a></td>
										<td class="hidden-phone">${sendlist.a_date}</td>
										<td><span class="label label-info label-mini">${sendlist.a_status}</span></td>
										<td>
											<button class="btn btn-success btn-xs"
												id="${sendlist.a_sendid }" name="${sendlist.a_sendid }"
												onclick="checkout(this.name)">
												<i class="fa fa-check">확인</i>
											</button>
										</td>
									</tr>
								</tbody>

								<%-- <tr>
									<td>${sendlist.a_date}</td>
									<td>${sendlist.a_status}</td>
									<td>${sendlist.a_sendid}</td>
									<td><input type="button" name="${sendlist.a_sendid }" value="확인"
										onclick="checkout(this.name)"> </td>
		
								</tr> --%>
							</c:forEach>
						</table>
						<div align="right">
							<button type="button" class="btn btn-primary btn-xs" id="tog_btn"
								onclick="toggle()">받은 화살 보기</button>
						</div>
					</c:when>

					<c:otherwise>
						<br>
						<h3 align="center">친구등록 요청 리스트</h3>
						<br>
						<hr>
						<h4 align="center">요청 하신 게 없네요 ^^</h4>
						<hr>
						</c:otherwise>

				</c:choose>
				<div align="right">
					<button type="button" class="btn btn-primary btn-xs" id="tog_btn" onclick="toggle()">내가 신청한 친구 보기</button>
				</div>
			</div>
			
			
			<div class="col-lg-3 ds">


         <!-- USERS ONLINE SECTION -->
         <h3>MY FRIENDS LIST</h3>
         <!-- First Member -->
         <div>


            <% if(friends != null && friends.size()>0){ 
                         for(int i=0; i<friends.size(); i++){
                            Member ssome = friends.get(i);
                      %>
            <c:set var="pimg" value="<%=ssome.getU_mypicture()%>" />
            <c:set var="gender" value="<%=ssome.getGender() %>" />
            <%
               String originimg = request.getContextPath()+ "/boardupload/" + ssome.getU_mypicture();
               String default_male = request.getContextPath()+"/Images/defaultimg/default_male.png";
               String default_female = request.getContextPath()+"/Images/defaultimg/default_female.PNG";
            %>
            <c:choose>
               <c:when test="${pimg != null}">
                  <c:set var="imgsrc" value="<%=originimg%>" />
               </c:when>
               <c:otherwise>
                  <c:choose>
                     <c:when test="${gender == 1}">
                        <c:set var="imgsrc" value="<%=default_male%>" />
                     </c:when>
                     <c:when test="${gender == 2}">
                        <c:set var="imgsrc" value="<%=default_female%>" />
                     </c:when>
                  </c:choose>
               </c:otherwise>
            </c:choose>

            <div class="desc">
               <div class="thumb">
                  <img class="img-circle" src="${imgsrc}" width="35px" height="35px"
                     align="">
               </div>
               <div class="details">
                  <p>
                     <a href="#"><%=ssome.getId()%></a><br>
                     <muted><%=ssome.getName() %></muted>
                  </p>
               </div>
            </div>

            <%
                         }
                       } else{
                      %>
            <div class="desc">
               <div class="thumb">
                  <img class="img-circle" src="assets/img/ui-divya.jpg" width="35px"
                     height="35px" align="">
               </div>
               <div class="details">
                  <p>
                     <muted>친구가 없습니다.</muted>
                  </p>
               </div>
            </div>
            <%
                      }%>
            <%--  <c:set var="fcount" value="<%=ssomelist.size()%>"/>
         <c:choose>
            <c:when test="${fcount!=0}">
               <c:set var="friendlist" value="<%=ssomelist%>" />
               <c:forEach var="friendlist" items="${friendlist}">
                    <div class="desc">
                            <div class="thumb">
                               <img class="img-circle" src="assets/img/ui-divya.jpg" width="35px" height="35px" align="">
                            </div>
                            <div class="details">
                               <p><a name="${friendlist.id}">DIVYA MANIAN</a><br>
                                  <muted>${friendlist.name}</muted>
                               </p>
                            </div>
                         </div>
               </c:forEach>
             
            
             
            </c:when>
            <c:otherwise>
            <br>
            친구가 없네요 ^^ 
            </c:otherwise>
         </c:choose> --%>

         </div>


         <!-- CALENDAR-->
         <div id="calendar" class="mb">
            <div class="panel green-panel no-margin">
               <div class="panel-body">
                  <div id="date-popover" class="popover top"
                     style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                     <div class="arrow"></div>
                     <h3 class="popover-title" style="disadding: none;"></h3>
                     <div id="date-popover-content" class="popover-content"></div>
                  </div>
                  <div id="my-calendar"></div>
               </div>
            </div>
         </div>

      </div>



			<div></div>

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
	<script
		src="<%=request.getContextPath()%>/assets/js/sparkline-chart.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/zabuto_calendar.js"></script>
	<script type="application/javascript">
		//header에 속성 주는 스크립트
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
