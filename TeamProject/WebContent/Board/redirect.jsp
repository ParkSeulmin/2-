<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("board_msg");
	String url = (String)request.getAttribute("board_url");
	
	if(msg != null && url != null){
		System.out.println("url"+url);
%>
		<script>
			alert('<%= msg %>');
			location.href='<%= url %>';	
		</script>				
<%
	}
%>
