<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="Mypage.DTO.Arrow_DTO"%>
<%@page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("UTF-8"); 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<%
	List<Arrow_DTO> mylist=new ArrayList<Arrow_DTO>();
	mylist=(ArrayList<Arrow_DTO>)request.getAttribute("result");
%>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	function checkinfo(sendid){
		window.open("Mypage_MemberInfo.jsp?id="+sendid, "Popup", "width=450, height=550,scrollbars=1, menubar=1, resizable=1"); 
	}
	
	function agree(sender){
		var sdid={
					s_id:sender,
				    r_id:'<%=session.getAttribute("user")%>'}

		$.ajax({
			url:"register.daa",
			data:sdid,
			success : function(data){
				alert(data);
				//$("#"+sender).hide();
			}
		});
	}
</script>
</head>
<body>
<h3 align="center">친구 등록 요청 LIST</h3>
user : <%=request.getParameter("user")%><br>

<form>
<table align="center" border="1">
	
<%
	for(int i=0; i<mylist.size(); i++){
%>	<tr>
		<td><%=mylist.get(i).getA_sendid()%></td>
		<td><%=mylist.get(i).getA_date()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><%=mylist.get(i).getA_status()%></td>
		<td><input type="button" value="info" 
		name="<%=mylist.get(i).getA_sendid() %>" onclick="checkinfo(this.name)" /></td>
		<!-- 상세보기 -->
		<td><input type="button" value="agree" id="<%=mylist.get(i).getA_sendid() %>"
		name="<%=mylist.get(i).getA_sendid() %>" onclick="agree(this.name)" /></td>
		<!-- 친구수락 -->
		<td><input type="button" value="disagree" 
		name="<%=mylist.get(i).getA_sendid() %>" onclick="dataSend(this.name)" /></td>
		<!-- 거절 -->
	</tr>
<%
	}
%>
</table>
</form>
agree->서로 친구 테이블에 등록해주는 테이블 
<br>
disagree->화살 테이블에서 해당 화살 삭제 
<br>
info->화살 보낸 사람의 정보를 보여주는 쿼리 

</body>
</html>