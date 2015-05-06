<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Mypage.DTO.Arrow_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%

	String totalpagecount=(String)request.getAttribute("total");
	int pagesize=2;
	int totalpagenum=(Integer.parseInt(totalpagecount))/pagesize;
	
	
	String r_totalpagecount=(String)request.getAttribute("totalrecieve");
	int r_pagesize=2;
	int r_totalpagenum=(Integer.parseInt(r_totalpagecount))/r_pagesize;
	if((Integer.parseInt(r_totalpagecount))%r_pagesize!=0){
		r_totalpagenum++;
	}//받은거 페이징 
	
	List<Arrow_DTO> mylist = new ArrayList<Arrow_DTO>();
	mylist = (ArrayList<Arrow_DTO>) request.getAttribute("result");

	List<Member> friends = new ArrayList<Member>();
	friends = (ArrayList<Member>) request.getAttribute("friends");

%>
</head>
<body>
Jquery 이용해서 새로 받아옴.
		<c:set var="fcount" value="<%=totalpagecount%>"/>
				<c:choose>
					<c:when test="${fcount>0}">
						<table align="center" border="1">
							<c:set var="friendlist" value="<%=friends%>" />
							<c:forEach var="friendlist2" items="${friendlist}">
								<tr>
									<td><a name="${friendlist2.id}" onclick="sendmessage(this.name)">${friendlist2.id}</a></td>
									<td>${friendlist2.name}</td>
								</tr>
							</c:forEach>
						</table>

						<br>
						<c:set var="total" value="<%=totalpagenum%>" />
						<br>
						<c:choose>
							<c:when test="${param.rp>1 }">
								<a
									href="CheckArrow.daa?rp=<%=Integer.parseInt(request
									.getParameter("rp")) - 1%>">이전</a>
							</c:when>
						</c:choose>
						<c:forEach var="i" begin="1" end="<%=totalpagenum%>">
							<a href="CheckArrow.daa?rp=${i}">[${i}]</a>
						</c:forEach>
						<c:choose>
							<c:when test="${ empty param.rp && total!=1}">
								<a href="CheckArrow.daa?rp=2">다음</a>
							</c:when>
							<c:when test="${total>param.rp}">
								<a
									href="CheckArrow.daa?rp=<%=Integer.parseInt(request
									.getParameter("rp")) + 1%>">다음</a>
							</c:when>
						</c:choose>
					</c:when>
					<c:otherwise>
					<br>친구가 없네요 ^^ 
				</c:otherwise>
				</c:choose>

				<c:set var="rcount" value="<%=r_totalpagecount%>"/>
			<c:choose>
				<c:when test="${rcount>0}">

				<h3 align="center">친구등록 요청 리스트</h3>
				<table id="recieve_table" align="center" border="1">
				<c:set var="recievelist" value="<%=mylist%>"/>
				<c:forEach var="recievelist" items="${recievelist}">
						<tr>
							<td>${recievelist.a_sendid }</td>
							<td>${recievelist.a_date }</td>
							<td>대기중</td>
							<td><input type="button" value="info" name="${recievelist.a_sendid}" onclick="checkinfo(this.name)" /></td>
						<!-- 상세보기 -->
							<td><input type="button" value="agree" id="${recievelist.a_sendid}" name="${recievelist.a_sendid}" onclick="agree(this.name)" /></td>
						<!-- 친구수락 -->
							<td><input type="button" value="disagree" name="${recievelist.a_sendid}" onclick="disagree(this.name)" /></td>
						<!-- 거절 -->
						</tr>
				
				</c:forEach>
				</table>
				
				<br>
				<c:set var="rtotal" value="<%=r_totalpagenum%>" />
				
				<br>
				<c:choose>
					<c:when test="${param.ap>1 }">
						<a href="CheckArrow.daa?ap=<%=Integer.parseInt(request.getParameter("ap")) - 1%>">이전</a>
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
						<a href="CheckArrow.daa?ap=<%=Integer.parseInt(request.getParameter("ap"))+1%>">다음</a>
					</c:when>
				</c:choose>
				</c:when>
				<c:otherwise>
				<br>
				<h3 align="center">친구등록 요청 리스트</h3>
				<br>
				요청들어온게 없네요 ^^
				</c:otherwise>
			</c:choose>
</body>
</html>
