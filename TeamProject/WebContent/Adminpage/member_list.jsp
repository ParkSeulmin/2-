<%@page import="Login.DTO.Member"%>
 
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
// session
		Member user = null;
		String id = null;
		if(session.getAttribute("user") != null){			
			user = (Member)session.getAttribute("user");
			id = user.getId();
		}		
		
		System.out.println("session id check: "+ id);
		
		
	List MemberList=(List)request.getAttribute("memberlist");
	 
 	int membercount=((Integer)request.getAttribute("membercount")).intValue();
	int nowpage=((Integer)request.getAttribute("mpage")).intValue();
	int maxpage=((Integer)request.getAttribute("mmaxpage")).intValue();
	int startpage=((Integer)request.getAttribute("mstartpage")).intValue();
	int endpage=((Integer)request.getAttribute("mendpage")).intValue();
	  
	 
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>관리자-회원관리</title>
	  
	  
	  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>board</title>
   
	  <!--  -->
 
    <script src="<%=request.getContextPath() %>/js/jquery.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

   
	<style type="text/css">
	
		#tnb {float:right;margin:0;padding:0;list-style:none;zoom:1}
		#tnb li {float:left;margin:0px}
		#tnb a {display:inline-block;padding:11px 10px;color:#a1a1a4;letter-spacing:0em;font-size:10px;font-family:tahoma}
		#tnb #welcomeuser {display:inline-block;padding:11px 10px;color:#a1a1a4;letter-spacing:0em;font-size:10px;font-family:tahoma}
		#tnb a:focus, #tnb a:hover, #tnb a:active {text-decoration:none}
	
	</style>
  	<script>+
	    $('.carousel').carousel({
	        interval: 5000 //changes the speed
	    })
    </script>
   
</head>

<body>
 <c:import url="/Include/Header.jsp" />

	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
	  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>	
	<div> 
	 
		<!-- 회원 리스트 -->
		<div>회원목록</div>
		 <div class="bo_list">
		<div class="tbl_head01 tbl_wrap">
	        <table>
				
		       <tr>
				<td align=left colspan="4">
					<font size=2>Member Total : ${membercount}
								| ${page} 페이지	
					</font>
				</td>
				</tr>
		        <tr>
		        	<th class="th_column">프로필사진</th>
		            <th class="th_column">ID</th>
		            <th class="th_column">이름</th>
		            <th class="th_column sv_use">닉네임</th>
		            <th class="th_column">성별</th>
		            <th class="th_column">나이</th>
		            <th class="th_column">핸드폰</th>
		            <th class="th_column">이메일</th>
		            <th class="th_column">주소</th>
		            <th class="th_column">가입일자</th>
		        </tr>
		       
	        	<tbody>
	        	<%
				for(int i=0;i<MemberList.size();i++){
					Member ml=(Member)MemberList.get(i);
					 				
				%>
				 <c:set var="gender" value="<%=ml.getGender()%>"/>
	             <tr class="" align="center" valign="middle" bordercolor="#333333"
						onmouseover="this.style.backgroundColor='#FFEBFF'"
						onmouseout="this.style.backgroundColor=''">
					<td>
						<c:set var="pimg" value="<%=ml.getU_mypicture()%>"/>
						<c:choose>
							<c:when test="${pimg != null}">
								<img alt="<%=ml.getId()%>님 프로필사진" 
								src="<%=request.getContextPath()+"/boardupload/"+ml.getU_mypicture()%>"
								width="103px" height="132px">
							</c:when>
							<c:otherwise>
									<c:choose>
										<c:when test="${gender == 1}">
					            			<img alt="default_male" 
												src="<%=request.getContextPath()%>/Images/defaultimg/default_male.png"
												width="103px" height="132px">
					            		</c:when>
					            		<c:when test="${gender == 2}">
					            			<img alt="default_female" 
												src="<%=request.getContextPath()%>/Images/defaultimg/default_female.PNG"
												width="103px" height="132px">
					            		</c:when>
									</c:choose>
							</c:otherwise>
						</c:choose>
						
					</td>	
		            <td class="td_num"> <%=ml.getId()%> </td>
		            <td class="td_subject"><%=ml.getName()%></td>
		            <td class="td_name sv_use"><span class="sv_member"><%=ml.getNick()%></span></td>
		            
		            <c:choose>
		            	<c:when test="${gender == 1}">
		            		<c:set var="u_gender" value="남자"/>
		            	</c:when>
		            	<c:when test="${gender == 2}">
		            		<c:set var="u_gender" value="여자"/>
		            	</c:when>
		            	<c:otherwise>
		            		<c:set var="u_gender" value="-"/>
		            	</c:otherwise>
		            </c:choose>
		            <td class="td_num">${u_gender}</td>
		            <td class="td_num"><%=ml.getAge() %></td>
		            <td class="td_num"><%=ml.getPhone() %></td>
		            <td class="td_num"><%=ml.getEmail() %></td>
		            <td class="td_num"><%=ml.getAddress() %></td>
		            <td class="td_date"><%=ml.getU_joindate()%></td>
	       		 </tr>
	               <%		} 
				
			%>
			<tr align=center height=20>
				<td colspan=10 style=font-family:Tahoma;font-size:10pt;>
					<%if(nowpage<=1){ %>
					[이전]&nbsp;
					<%}else{ %>
					<a href="./MemberList.admin?mpage=<%=nowpage-1 %>">[이전]</a>&nbsp;
					<%} %>
					
					<%for(int a=startpage;a<=endpage;a++){
						if(a==nowpage){%>
						[<%=a %>]
						<%}else{ %>
						<a href="./MemberList.admin?mpage=<%=a %>">[<%=a %>]</a>
						&nbsp;
						<%} %>
					<%} %>
					
					<%if(nowpage>=maxpage){ %>
					[다음]
					<%}else{ %>
					<a href="./MemberList.admin?mpage=<%=nowpage+1 %>">[다음]</a>
					<%} %>
				</td>
			</tr>
			
	            </tbody>
	        </table>
	    </div>
	   </div>
  	
	 </div>
	 
	 
	 
	 
	
 <c:import url="/Include/Footer.jsp" /> 

</body>
</html>