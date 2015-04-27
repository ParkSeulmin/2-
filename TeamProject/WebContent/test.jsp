<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	String userid=null;
	if(session.getAttribute("userid")!=null){
		userid=(String)session.getAttribute("userid");
	} 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>  	
</head>
<body>
<jsp:include page="/Include/Header.jsp"/>
<div style="padding: 200px;">
		<script>
  	$(function(){
		//var sessionid = $('#sessionid').val();
		
		$("#dialog-message").dialog({
				 autoOpen: false,
				 modal: true,
				 buttons: {
					Ok: function() {
						
						$( this ).dialog( "close" );
					
					}
			     }
			});
		
	   	$('#writeboard').click(function(){
	   		//if(sessionid == null){	
	   			$("#dialog-message").dialog( "open" );
	   			
	   			
	   	 	//}
 		});
	});
  </script>
		<input type="hidden" id="sessionid" value="<%=userid%>">	
		<div  id="dialog-message" title="글쓰기">
		  <p>
		    <span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
		    	회원만 게시물 등록이 가능합니다^ ^
		  </p>
		  <p>
		     <b>로그인 해주세요^ ^</b>.
		  </p>
		</div>
		
		<a href="#" id="writeboard">
			   			[글쓰기]
			  </a>
 </div>
<jsp:include page="/Include/Footer.jsp"/>

</body>
</html>