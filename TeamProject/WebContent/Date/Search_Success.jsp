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
     /*  function dataSend(data){
         var data = data;
         document.getElementsByName(data);
      }
       */
      $(function(){
    	 $('#btn').click(function(){
    		 var id_data= {
						id : $(this.name)
					};
				$.ajax({
					type:"POST",
					url:"SendArrow.daa",//보낼 주소
					data: id_data,
					dataType : "html",
					success: function(responseData) {//서버에서 보낸 데이터
					var result = JSON.parse(responseData);
					}
				});
    	 });
    	 });
   
   </script>
</head>
<%
   ArrayList<Search_DTO> searMemberSearch = new ArrayList<Search_DTO>();
   searMemberSearch = (ArrayList<Search_DTO>)session.getAttribute("searMemberSearch");
   int arrsize=searMemberSearch.size();
%>
   
<body>
<%
   for(int i=0; i<searMemberSearch.size(); i++){
%>
	<form action="SendArrow.daa" method="post">
      <%=searMemberSearch.get(i).getId()%>&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" value="친구맺기" id="btn" name="<%=searMemberSearch.get(i).getId() %>" ><br>
    </form>
    
<%
   }
%>
</body>
</html>