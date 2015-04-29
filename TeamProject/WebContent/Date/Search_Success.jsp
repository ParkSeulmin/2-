<%@page import="Date.DTO.Search_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	
	
		function dataSend(iddata){
			var id_data = {
					id : iddata,
					sender : "<%=session.getAttribute("user")%>" }
			$.ajax({
				url : "SendArrow.daa",
				data : id_data,
				success : function(data) {
					console.log(data)
					$("#"+iddata).val(data);
				}
			});
		}
	</script>
</head>
<%
	ArrayList<Search_DTO> searMemberSearch = new ArrayList<Search_DTO>();
	searMemberSearch = (ArrayList<Search_DTO>)session.getAttribute("searMemberSearch");
%>
	
<body>
<span id="myspan"></span>

<%
	for(int i=0; i<searMemberSearch.size(); i++){
%>
		<%=searMemberSearch.get(i).getId()%>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="친구맺기" id="<%=searMemberSearch.get(i).getId() %>" name="<%=searMemberSearch.get(i).getId() %>" onclick="dataSend(this.name)" ><br>
<%
	}
%>
</body>
</html>