<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>

<script type="text/javascript" src="http://www.antisingle.com/js_new/jquery.selectbox-0.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form name="search" action="Search.sear" method="post">
			<ul>
				<li>지역 <select name="search_area">
						<option value="0.U_ADDR">무관</option>
						<option value="전국.U_ADDR">전국</option>
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
				</select>
				</li>
				<li>나이 <select name="search_age1">
						<option value="0.U_AGE">무관</option>
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
				</select> ~ <select name="search_age2">
						<option value="0.U_AGE">무관</option>
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
				</select>
				</li>
				<li>신장 <select name="search_stature1">
						<option value="0.HEIGHT">무관</option>
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
				</select> ~ <select name="search_stature2">
						<option value="0.HEIGHT">무관</option>
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
				</select>
				</li>
				
				<li>연봉 <select name="search_pay">
						<option value="0.SAL">무관</option>
						<option value="1000.SAL">1000</option>
						<option value="2000.SAL">2000</option>
						<option value="3000.SAL">3000</option>
						<option value="4000.SAL">4000</option>
						<option value="5000.SAL">5000</option>
				</select>
				</li>
				
				<li><select name="job">
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
					
					
				</select></li>
			</ul>
			<input type="submit" value="검색" class="btn_submit">
		</form>
	</div>

</body></html>