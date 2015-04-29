<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	int result = (Integer)request.getAttribute("result");//insert 될 때 result값 증가
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(result>0){

%>
<script type="text/javascript">
	alert('신청이 완료 되었습니다');
	history.go(-2);//파티목록페이지
</script>
<%
	}else{
%>
<script type="text/javascript">
	alert('중복 신청이 불가합니다');
	history.go(-2);
</script>
<%
	}
%>
</body>
</html>