<%@page import="javax.naming.Context"%>
<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="Mypage.DTO.Arrow_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String Test = request.getContextPath();
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
		window.open("Mypage/Mypage_MemberInfo.jsp?id="+sendid,
				"Popup", "width=600, height=150,scrollbars=1, menubar=1, resizable=1"); 
	}
	
	function agree(sender){	//친구 수락 버튼
		var sdid={
					s_id:sender,
				    r_id:'<%=me%>'} 
		$.ajax({
			url:"register.daa",
			data:sdid,
			success : function(data1){
				$.ajax({		//친구목록 다시 불러오는 코드
				url:"CheckArrow_query.daa",
				data:sdid,
				success : function(data){
					$("#mydata").html(data);
				}
			});
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
			success : function(data1) {
				$.ajax({
					url : "CheckArrow_query.daa",
					data : sdid,
					success : function(data) {
						$("#mydata").html(data);
					}
				});
			}
		});

	}

	function toggle() { //친구등록 신청한 페이지 보기 
		location.href = "CheckSendArrow.daa";
	}

	function sendmessage(data) {
		console.log(data);
		window.open("Mypage_messagesend.daa?id=" + data, "Popup",
				"width=380, height=300,scrollbars=1, menubar=1, resizable=1");
	}
	function deletefriend(sender) {
		var sdid = {
			s_id : sender,
			r_id : '<%=me%>'
		}
		$.ajax({
			url : "delete_friend2.daa",
			data : sdid,
			success : function(data) {
				$("#mydata").html(data);
			}
		});
	}
</script>
</head>
<%
	String totalpagecount=(String)request.getAttribute("total");
		int pagesize=10;
		int totalpagenum=(Integer.parseInt(totalpagecount))/pagesize;
		if((Integer.parseInt(totalpagecount))%pagesize!=0){
	totalpagenum++;
		}//친구 페이징
		
		 String r_totalpagecount=(String)request.getAttribute("totalrecieve");
		int r_pagesize=10;
		int r_totalpagenum=(Integer.parseInt(r_totalpagecount))/r_pagesize;
		if((Integer.parseInt(r_totalpagecount))%r_pagesize!=0){
	r_totalpagenum++;
		}//받은거 페이징
%>
<body>
	<c:import url="/Include/Header.jsp" />

	<section id="main-content">
	<section class="wrapper">

	

		<div id=mydata>
		<div class="row">
			<div class="col-lg-9 main-chart">
			<h3>
				<i class="fa fa-angle-right">친구등록 요청 리스트</i>
			</h3>
			<hr>
				<c:set var="rcount" value="<%=r_totalpagecount %>" />
				<c:choose>
					<c:when test="${rcount>0}">
						
						<table class="table table-striped table-advance table-hover"
							id="recieve_table" align="center">
							<c:set var="recievelist" value="<%=mylist%>" />

							<thead>
								<tr>
									<th><i class="fa fa-bullhorn"></i> ID</th>
									<th class="hidden-phone"><i class="fa fa-question-circle"></i>날짜</th>
									<th><i class=" fa fa-edit"></i>상태</th>
									<th>수락</th>
									<th>거절</th>
									<th>상세보기</th>
								</tr>
							</thead>

							<c:forEach var="recievelist" items="${recievelist}">
								<tbody>
									<tr>
										<td><a href="basic_table.html#">${recievelist.a_sendid }</a></td>
										<td class="hidden-phone">${recievelist.a_date }</td>
										<td><span class="label label-info label-mini">대기중</span></td>
										<td>
											<button class="btn btn-success btn-xs"
												id="${recievelist.a_sendid}" name="${recievelist.a_sendid}"
												onclick="agree(this.name)">
												<i class="fa fa-check"></i>
											</button>
										</td>
										<td>
											<button class="btn btn-danger btn-xs"
												name="${recievelist.a_sendid}" onclick="disagree(this.name)">
												<i class="fa fa-trash-o "></i>
											</button>
										</td>
										<td>
											<button class="btn btn-primary btn-xs"
												name="${recievelist.a_sendid}"
												onclick="checkinfo(this.name)">
												<i class="fa fa-pencil"></i>
											</button>
										</td>
									</tr>
								</tbody>

							</c:forEach>
						</table>

						<c:set var="rtotal" value="<%=r_totalpagenum%>" />
						<div align="center">
						<c:choose>
							<c:when test="${param.ap>1 }">
								<a
									href="CheckArrow.daa?ap=<%=Integer.parseInt(request.getParameter("ap")) - 1%>">이전</a>
							</c:when>
						</c:choose>
						<c:forEach var="i" begin="1" end="<%=r_totalpagenum%>">
							<a href="CheckArrow.daa?ap=${i}">[${i}]</a>
						</c:forEach>
						<c:choose>
							<c:when test="${empty param.ap && rtotal!=1}">
								<a href="CheckArrow.daa?ap=2">다음</a>
							</c:when>
							<c:when test="${rtotal>param.ap}">
								<a
									href="CheckArrow.daa?ap=<%=Integer.parseInt(request.getParameter("ap"))+1%>">다음</a>
							</c:when>
						</c:choose>
						</div>
					</c:when>
					<c:otherwise>
					<br>
						<div align="center"><h4><b><font color="#6F6F6F">현재 친구 요청이 없습니다.</font></b></h4></div>
						<table border="0" cellspacing="0" width="100%" >
					<br><br>
					<tbody>			
						<tr>
							<td align="center">
								<img src="/TeamProject/Images/34.jpg" width="60%" height="250px">
							</td>

						</tr>
					</tbody>
				</table>
				
					</c:otherwise>
				</c:choose>
				<br>
				<div align="right">
					<button type="button" class="btn btn-primary btn-xs" id="tog_btn"
						onclick="toggle()">내가 요청한 친구 보기</button>
				</div>
			</div>

			
			<!-- 친구 리스트  -->
			<br>
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
                     height="35px" >
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


       

	<script type="application/javascript">
		//header부분 관련 스크립트
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
