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
<%
	List<Arrow_DTO> mylist=new ArrayList<Arrow_DTO>();
	mylist=(ArrayList<Arrow_DTO>)request.getAttribute("arrowlist");
	
	List<Member> friends=new ArrayList<Member>();
	friends=(ArrayList<Member>)request.getAttribute("friends");

	String totalpagecount=(String)request.getAttribute("total");
	int pagesize=2;
	int totalpagenum=(Integer.parseInt(totalpagecount))/pagesize;
	if((Integer.parseInt(totalpagecount))%pagesize!=0){
		pagesize++;
	}
%>
</head>
<body>

<div id="mydiv">
	<div class="col-lg-9 main-chart">
			<h3>
				<i class="fa fa-angle-right">내가 요청한 친구 리스트</i>
			</h3>
			<hr>

				<c:set var="mysendlist" value="<%=mylist%>" />
				<c:choose>

					<c:when test="${not empty mysendlist }">

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
						
					</c:when>

					<c:otherwise>
						<br>

							신청하신게 없네요^^
							
						</c:otherwise>

				</c:choose>

				<div align="right">
							<button type="button" class="btn btn-primary btn-xs" id="tog_btn"
								onclick="toggle()">받은 화살 보기</button>
						</div>
			</div>
			
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
      </div>
</body>
</html>
