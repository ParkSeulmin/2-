<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Date.DTO.Search_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<!-- <link rel="stylesheet" href="http://www.wedaehan.com/css/default.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

<script type="text/javascript">
<%
	request.setCharacterEncoding("UTF-8");
  
	Member user = null;
	String id = null;
	if(session.getAttribute("user") != null){
		user = (Member)session.getAttribute("user");
		id = user.getId();
	}		

	
%>
  $(function(){
	  $('#submit').click(function(){
		  
		  var imgpath = "/TeamProject/boardupload/";
		   var seardata= {
				  search_area : $('#search_area').val(),
				  search_age1 : $('#search_age1').val(),
				  search_age2 : $('#search_age2').val(),
				  search_stature1 : $('#search_stature1').val(),
				  search_stature2 : $('#search_stature2').val(),
				  search_pay : $('#search_pay').val(),
				  job : $('#job').val()
				  
				}; 
		   
		   $.ajax({
              type: "POST", //전송 타입
              url: "Search_Controller.sear", //Ex10_login_ok.jsp
         		//{user_id:kglim , user_pwd:1004}
              data : seardata,
              dataType: "html", //서버가 보내는 데이터 타입 : dataType 명시 (xml, json, script, or html )
		   
   			success: function(responseData) { //response (서버에서 보낸 데이터 )
   			//System.out.println("성공해서 일로 넘어왔다");
   			var output = "";
   			var seardata = JSON.parse(responseData);
   			//System.out.println(seardata);
   				$.each(seardata,function(index,items){
   					
   					var imgoutput = "";
   					console.log(items.id+" / "+items.u_mypicture);
   					console.log("if 전");
   					console.log(items.u_mypicture);
   					if(items.u_mypicture == ""){
   					console.log("if 후");
   						if(items.gender == 1){
   							imgoutput = "<img alt='default_male'"
   							+" src='/TeamProject/Images/defaultimg/default_male.png'"
							+"	width='103px' height='132px'>";
   						} else if(items.gender == 2){
   							imgoutput = "<img alt='default_female'"
   	   							+" src='/TeamProject/Images/defaultimg/default_female.PNG'"
   								+"	width='103px' height='132px'>";
   						}
   						
   					}else{
   						imgoutput = "<img alt='profilepic' width='103px' height='132px' src='"+imgpath+items.u_mypicture+"'>"
   					}
   					
					output+= "<tr><td>"+imgoutput+"</td>"
							+"<td><span class='label label-info label-mini'>"+items.id +"</span></td><td>"
							+"<span class='label label-info label-mini'>"+items.admin+"</span></td>"
							+"<td><span class='label label-info label-mini'>"+items.jumin+"</span></td>"
							+"<td><span class='label label-info label-mini'>"+items.phone+"</span></td>"
							+"<td><input type='button' name='"+items.id+"' id='"+items.id+"' value='화살쏘기'"
							+"onclick=dataSend('"+items.id+"')></td></tr>"
					
				
				});
   			
   			
                $("#searlist").append(output);
                
              },
              error :function(Data){alert("error발생");}
        });
     return false; 
	  });
    
  
  });
 
  function dataSend(iddata){
		var id_data = {
				id : iddata,
				sender : "<%=session.getAttribute("user")%>" }
		$.ajax({
			url : "SendArrow.daa",
			data : id_data,
			success : function(data) {
				var options = {};
				//$("#"+iddata).val(data);
				$("#"+iddata).hide(function(){
					if(data == "success!"){
						$(this).replaceWith('<span style="color: blue">'+data+'</span>');
					}else{
						$(this).replaceWith('<span style="color: red">'+data+'</span>');
					}
				});
			}
		});
	}

 </script>

 
    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="<%=request.getContextPath()%>/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
        
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="<%=request.getContextPath()%>/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/js/gritter/css/jquery.gritter.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/css/style-responsive.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/assets/js/chart-master/Chart.js"></script>
 
<style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	display: block;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	padding: 5px 5px 8px 5px;
	font: 10px arial, san serif;
	text-align: left;
}
</style>

</head>
<body>
<c:import url="/Include/Header.jsp"/>
 <section id="main-content">
          <section class="wrapper">
<center>
	<div>
		<form name="search" action="Search.sear" method="post" >
			<div class="styled-select">
				 <select name="search_area" id="search_area">
						<option value="0.U_ADDR">지역</option>
						<option value="서울.U_ADDR">서울</option>
						<option value="경기.U_ADDR">경기</option>
						<option value="수원.U_ADDR">수원</option>
						<option value="인천.U_ADDR">인천</option>
						<option value="강원.U_ADDR">강원</option>
						<option value="충북.U_ADDR">충북</option>
						<option value="충남.U_ADDR">충남</option>
						<option value="대전.U_ADDR">대전</option>
						<option value="경북.U_ADDR">경북</option>
						<option value="대구.U_ADDR">대구</option>
						<option value="경남.U_ADDR">경남</option>
						<option value="부산.U_ADDR">부산</option>
						<option value="울산.U_ADDR">울산</option>
						<option value="전남.U_ADDR">전남</option>
						<option value="광주.U_ADDR">광주</option>
						<option value="전북.U_ADDR">전북</option>
						<option value="제주.U_ADDR">제주</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;
				
				 <select name="search_age1" id="search_age1">
						<option value="0.U_AGE">나이(부터)</option>
						<option value="20.U_AGE">20</option>
						<option value="21.U_AGE">21</option>
						<option value="22.U_AGE">22</option>
						<option value="23.U_AGE">23</option>
						<option value="24.U_AGE">24</option>
						<option value="25.U_AGE">25</option>
						<option value="26.U_AGE">26</option>
						<option value="27.U_AGE">27</option>
						<option value="28.U_AGE">28</option>
						<option value="29.U_AGE">29</option>
						<option value="30.U_AGE">30</option>
						<option value="31.U_AGE">31</option>
						<option value="32.U_AGE">32</option>
						<option value="33.U_AGE">33</option>
						<option value="34.U_AGE">34</option>
						<option value="35.U_AGE">35</option>
						<option value="36.U_AGE">36</option>
						<option value="37.U_AGE">37</option>
						<option value="38.U_AGE">38</option>
						<option value="39.U_AGE">39</option>
						<option value="40.U_AGE">40</option>
						<option value="41.U_AGE">41</option>
						<option value="42.U_AGE">42</option>
						<option value="43.U_AGE">43</option>
						<option value="44.U_AGE">44</option>
						<option value="45.U_AGE">45</option>
						<option value="46.U_AGE">46</option>
						<option value="47.U_AGE">47</option>
						<option value="48.U_AGE">48</option>
						<option value="49.U_AGE">49</option>
						<option value="50.U_AGE">50</option>
						<option value="51.U_AGE">51</option>
						<option value="52.U_AGE">52</option>
						<option value="53.U_AGE">53</option>
						<option value="54.U_AGE">54</option>
						<option value="55.U_AGE">55</option>
						<option value="56.U_AGE">56</option>
						<option value="57.U_AGE">57</option>
						<option value="58.U_AGE">58</option>
						<option value="59.U_AGE">59</option>
						<option value="60.U_AGE">60</option>
						<option value="61.U_AGE">61</option>
						<option value="62.U_AGE">62</option>
						<option value="63.U_AGE">63</option>
						<option value="64.U_AGE">64</option>
						<option value="65.U_AGE">65</option>
						<option value="66.U_AGE">66</option>
						<option value="67.U_AGE">67</option>
						<option value="68.U_AGE">68</option>
						<option value="69.U_AGE">69</option>
						<option value="70.U_AGE">70</option>
				</select>&nbsp; ~ &nbsp;<select name="search_age2" id="search_age2">
						<option value="0.U_AGE">나이(까지)</option>
						<option value="20.U_AGE">20</option>
						<option value="21.U_AGE">21</option>
						<option value="22.U_AGE">22</option>
						<option value="23.U_AGE">23</option>
						<option value="24.U_AGE">24</option>
						<option value="25.U_AGE">25</option>
						<option value="26.U_AGE">26</option>
						<option value="27.U_AGE">27</option>
						<option value="28.U_AGE">28</option>
						<option value="29.U_AGE">29</option>
						<option value="30.U_AGE">30</option>
						<option value="31.U_AGE">31</option>
						<option value="32.U_AGE">32</option>
						<option value="33.U_AGE">33</option>
						<option value="34.U_AGE">34</option>
						<option value="35.U_AGE">35</option>
						<option value="36.U_AGE">36</option>
						<option value="37.U_AGE">37</option>
						<option value="38.U_AGE">38</option>
						<option value="39.U_AGE">39</option>
						<option value="40.U_AGE">40</option>
						<option value="41.U_AGE">41</option>
						<option value="42.U_AGE">42</option>
						<option value="43.U_AGE">43</option>
						<option value="44.U_AGE">44</option>
						<option value="45.U_AGE">45</option>
						<option value="46.U_AGE">46</option>
						<option value="47.U_AGE">47</option>
						<option value="48.U_AGE">48</option>
						<option value="49.U_AGE">49</option>
						<option value="50.U_AGE">50</option>
						<option value="51.U_AGE">51</option>
						<option value="52.U_AGE">52</option>
						<option value="53.U_AGE">53</option>
						<option value="54.U_AGE">54</option>
						<option value="55.U_AGE">55</option>
						<option value="56.U_AGE">56</option>
						<option value="57.U_AGE">57</option>
						<option value="58.U_AGE">58</option>
						<option value="59.U_AGE">59</option>
						<option value="60.U_AGE">60</option>
						<option value="61.U_AGE">61</option>
						<option value="62.U_AGE">62</option>
						<option value="63.U_AGE">63</option>
						<option value="64.U_AGE">64</option>
						<option value="65.U_AGE">65</option>
						<option value="66.U_AGE">66</option>
						<option value="67.U_AGE">67</option>
						<option value="68.U_AGE">68</option>
						<option value="69.U_AGE">69</option>
						<option value="70.U_AGE">70</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;
				
				 <select name="search_stature1" id="search_stature1">
						<option value="0.HEIGHT">신장(부터)</option>
						<option value="145.HEIGHT">145</option>
						<option value="150.HEIGHT">150</option>
						<option value="155.HEIGHT">155</option>
						<option value="160.HEIGHT">160</option>
						<option value="165.HEIGHT">165</option>
						<option value="170.HEIGHT">170</option>
						<option value="175.HEIGHT">175</option>
						<option value="180.HEIGHT">180</option>
						<option value="185.HEIGHT">185</option>
						<option value="190.HEIGHT">190</option>
						<option value="195.HEIGHT">195</option>
						<option value="200.HEIGHT">200</option>
				</select>&nbsp; ~ &nbsp;<select name="search_stature2" id="search_stature2">
						<option value="0.HEIGHT">신장(까지)</option>
						<option value="145.HEIGHT">145</option>
						<option value="150.HEIGHT">150</option>
						<option value="155.HEIGHT">155</option>
						<option value="160.HEIGHT">160</option>
						<option value="165.HEIGHT">165</option>
						<option value="170.HEIGHT">170</option>
						<option value="175.HEIGHT">175</option>
						<option value="180.HEIGHT">180</option>
						<option value="185.HEIGHT">185</option>
						<option value="190.HEIGHT">190</option>
						<option value="195.HEIGHT">195</option>
						<option value="200.HEIGHT">200</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;
			
				
				 <select name="search_pay" id="search_pay">
						<option value="0.SAL">연봉(이상)</option>
						<option value="1000.SAL">1000(이상)</option>
						<option value="2000.SAL">2000(이상)</option>
						<option value="3000.SAL">3000(이상)</option>
						<option value="4000.SAL">4000(이상)</option>
						<option value="5000.SAL">5000(이상)</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;
				
				
				<select name="job" id="job">
					<option value="0.JOB">직업선택</option>
					<option value="관리.JOB">관리</option> 
					<option value="건설.JOB">건설</option>
					<option value="경비.JOB">경비</option>
					<option value="경영.JOB">경영/회계,사무</option>
					<option value="교육.JOB">교육/연구</option>
					<option value="금융.JOB">금융/보험</option>
					<option value="군인.JOB">군인</option>
					<option value="기계.JOB">기계</option>
					<option value="농림어업.JOB">농림어업</option>
					<option value="문화.JOB">문화/예술/방송</option>
					<option value="미용.JOB">미용,숙박,여행</option>
					<option value="법률.JOB">법률/경찰/소방/교도</option>
					<option value="보건.JOB">보건/의료</option>
					<option value="사회복지.JOB">사회복지/종교</option>
					<option value="섬유.JOB">섬유/의복</option>
					<option value="식품가공.JOB">식품가공</option>
					<option value="영업.JOB">영업/판매</option>
					<option value="운전.JOB">운전/운송</option>
					<option value="전기.JOB">전기/전자</option>
					<option value="인쇄.JOB">인쇄/목재/가구</option>
					<option value="화학.JOB">화학</option>
					<option value="학생.JOB">학생</option>
					<option value="대학생.JOB">대학(원)생</option>
					<option value="기타.JOB">기타</option>
					
					
				</select>&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			<input type="button" name='submit' id='submit' value="비동기">
			</div>
		</form>
	</div>
	</center>
<table class="table table-striped table-advance table-hover" id="searlist" name="searlist">
	                  	  	  
	                  	  	  
                              <thead>
                              <tr>
                              	  <th><i class="fa fa-bullhorn"></i> PROFILE PIC</th>
                                  <th><i class="fa fa-bullhorn"></i> ID</th>
                                  <th class="hidden-phone"><i class="fa fa-question-circle"></i> ADMIN</th>
                                  <th><i class="fa fa-bookmark"></i> JUMIN</th>
                                  <th><i class=" fa fa-edit"></i> PHONE</th>
                                  <th></th>
                              </tr>
                              </thead>
                              <tbody>
                              
                              </tbody>
                          </table>
           
	 	</section><!--/wrapper -->
      </section><!-- /MAIN CONTENT -->
	                
                          
        	   
<!-- js placed at the end of the document so the pages load faster -->
	<script src="<%=request.getContextPath()%>/assets/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery-1.8.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery.scrollTo.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery.sparkline.js"></script>


	<!--common script for all pages-->
	<script src="<%=request.getContextPath()%>/assets/js/common-scripts.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/gritter/js/jquery.gritter.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/gritter-conf.js"></script>

	<!--script for this page-->
	<script src="<%=request.getContextPath()%>/assets/js/sparkline-chart.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/zabuto_calendar.js"></script>
 

	<script type="application/javascript">
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    </script>                  
</body>
</html>
