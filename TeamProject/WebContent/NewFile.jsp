<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
<style type="text/css">

	div.start {
	  float: left;
	  width: 320px;
	  height: 320px;
	  margin: 0;
	  overflow: hidden;
	  background: url('http://www.wedaehan.com/image/main/box01_img.png') center no-repeat;
	}
	
</style>
<script src="http://www.wedaehan.com/js/jquery-1.8.3.min.js"></script> 
 <!-- <script type="text/javascript" src="http://www.wedaehan.com/js/main.js"></script> -->
 
 <div class="start" style="position: absolute; z-index: 20; left: 0px; top: 160px;">
								<style type="text/css">
						#clock {
							width: 320px;
							height: 320px;
							margin:0;
							padding:0;
							position: relative;
							top: 80px;
							left: 110px;
						}
						
						.rotatingHands {
							position: absolute;
							width: 320px;
							height: 320px;
							top: 0px;
							left: 0px;
						}
						
						#hours, #minutes, #seconds {
							position: absolute;
							display: block;
						}
						
						.glass {
							position: absolute;
							width: 320px;
							height: 320px;
							top: 0px;
							left: 0px;
						}
						</style>
						
						
						<!-- jQuery Rotate -->
						<script type="text/javascript" src="http://www.wedaehan.com/js/clock/jQueryRotate.2.2.js"></script>
						<!-- Functions -->
						<script type="text/javascript" src="http://www.wedaehan.com/js/clock/functions.js"></script>
						
						<div id="clock">
							<div class="rotatingHands"><img id="hours" src="http://www.wedaehan.com/css/images/hours.png" style="-webkit-transform: rotate(80.5deg);"></div>
							<div class="rotatingHands"><img id="minutes" src="http://www.wedaehan.com/css/images/minutes.png" style="-webkit-transform: rotate(246deg);"></div>
							<div class="rotatingHands"><img id="seconds" src="http://www.wedaehan.com/css/images/seconds.png" style="-webkit-transform: rotate(18deg);"></div>
							<!-- <div class="glass"><img src="images/glass.png" /></div> -->
							<img src="http://www.wedaehan.com/css/images/clock.png">
						</div>		
	</div>
					 
					 
</body>
</html>