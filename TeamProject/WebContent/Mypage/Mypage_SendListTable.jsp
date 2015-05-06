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
	List<Arrow_DTO> mylist = new ArrayList<Arrow_DTO>();
	mylist = (ArrayList<Arrow_DTO>) request.getAttribute("arrowlist");

	List<Member> friends = new ArrayList<Member>();
	friends = (ArrayList<Member>) request.getAttribute("friends");
	
	String totalpagecount=(String)request.getAttribute("total");
	int pagesize=2;
	int totalpagenum=(Integer.parseInt(totalpagecount))/pagesize;
%>
</head>
<body>
	Jquery로 update된 페이징 입니다~
	<c:set var="fcount" value="<%=totalpagecount%>" />
	<c:choose>
		<c:when test="${fcount!=0}">

			<table align="center" border="1">
				<c:set var="friendlist" value="<%=friends%>" />
				<c:forEach var="friendlist" items="${friendlist}">
					<tr>
						<td>${friendlist.id}</td>
						<td>${friendlist.name}</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<br>
				친구가 없네요 ^^ 
				</c:otherwise>
	</c:choose>

	<h3 align="center">내가 요청한 친구 리스트</h3>
<table align="center" border="1">
<c:set var="mysendlist" value="<%=mylist%>"/>
	<c:forEach var="sendlist" items="${mysendlist}">
		<tr>
			<td>${sendlist.a_date}</td>
			<td>${sendlist.a_status}</td>
			<td><a onclick="sendmessage(this.name)">${sendlist.a_sendid}</a></td>
			<td><input type="button" value="확인" name="${sendlist.a_sendid}" onclick="checkout(this.name)" /></td>
		</tr>
	</c:forEach>
</table>
<br>

<c:set var="total" value="<%=totalpagenum %>"/>
현재 totalpagenum: ${total}<br>
<c:choose>
	<c:when test="${param.rp>1 }">
		<a href="CheckArrow.daa?rp=<%=Integer.parseInt(request.getParameter("rp"))-1%>">이전</a>
	</c:when>
</c:choose>
<c:forEach var="i" begin="1" end="<%=totalpagenum%>">
	<a href="CheckArrow.daa?rp=${i}">[${i}]</a>
</c:forEach>
<c:choose>
	<c:when test="${empty param.rp}">
		<a href="CheckArrow.daa?rp=2">다음</a>
	</c:when>
	<c:when test="${total>param.rp}">
		<a href="CheckArrow.daa?rp=<%=Integer.parseInt(request.getParameter("rp"))+1%>">다음</a>
	</c:when>
</c:choose>

</body>
</html>
