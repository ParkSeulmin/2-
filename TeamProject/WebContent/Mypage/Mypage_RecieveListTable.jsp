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
	String totalpagecount = (String) request.getAttribute("total");

	int pagesize = 10;
	int totalpagenum = (Integer.parseInt(totalpagecount)) / pagesize;
	if ((Integer.parseInt(totalpagecount)) % pagesize != 0) {
		totalpagenum++;
	}

	String r_totalpagecount = (String) request
			.getAttribute("totalrecieve");
	int r_pagesize = 10;
	int r_totalpagenum = (Integer.parseInt(r_totalpagecount))
			/ r_pagesize;
	if ((Integer.parseInt(r_totalpagecount)) % r_pagesize != 0) {
		r_totalpagenum++;
	}//받은거 페이징 

	List<Arrow_DTO> mylist = new ArrayList<Arrow_DTO>();
	mylist = (ArrayList<Arrow_DTO>) request.getAttribute("result");

	List<Member> friends = new ArrayList<Member>();
	friends = (ArrayList<Member>) request.getAttribute("friends");

	Member member = (Member) session.getAttribute("user");
	String me = member.getId();
%>
</head>
<body>
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
            <%}%>
         </div>
         </div>
      </div>
</body>
</html>
