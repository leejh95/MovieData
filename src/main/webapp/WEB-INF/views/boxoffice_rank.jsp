<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.tab_ul{
  width: 100%;
  list-style:none;
  margin: 0 auto; 
  padding: 0;
  position:relative; 
}
.tabmenu{ 
  max-width:100%; 
  margin: 0 auto; 
  padding: 0;
}
#div_li{
  width: 1000px;
  margin: 0 auto;
}
.tabmenu>ul li{
  display:  inline-block;
  width:499px; 
  float:left;  
  text-align:center; 
  background :#f1f1f1;
}
.tabmenu ul li a{
  display:block;
  line-height:45px;
  height:60px;
  text-decoration:none; 
  color: #000;
}
.tabCon{
  display:none; 
  width: 100%;
  text-align:left; 
  position:absolute; 
  top:60px; 
  left:0;
  box-sizing: border-box;
}
.btnCon:target  {
  background : #ccc;
}
.btnCon:target .tabCon{
  display: block;
}
</style>
</head>
<body>

<div id="include_header" ></div>

<div id='include_calendar' ></div><br><br>

<div style="height: 5000px;">
	<div class='tabmenu'>
		<ul class='tab_ul'>
			<div id='div_li'>
				<li id='tab1' class='btnCon'>
					<a class='btn first' href='#tab1'>일간박스오피스</a>
					<div class='tabCon'>
						<div id='include_daily_rank' align="center">
							<br><br><br><br><br><br><br><br>
							<h4>불러오는 중입니다...</h4><br>
							<img src="resources/images/loading.gif"/>
						</div>
					</div>
				</li>
				<li id='tab2' class='btnCon'>
					<a class='btn' href='#tab2'>주간박스오피스</a>
					<div class='tabCon'>
						<div id='include_weekly_rank' align="center">
							<br><br><br><br><br><br><br><br>
							<h4>불러오는 중입니다...</h4><br>
							<img src="resources/images/loading.gif"/>
						</div>
					</div>
				</li>
			</div>
		</ul>
	</div>
</div>

<div id="include_footer"></div>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="//www.amcharts.com/lib/4/core.js"></script>
<script src="//www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<script type="text/javascript">
var sDate = "";

$(document).ready(function(){
	$("#include_header").load("header.inc");
	$("#include_calendar").load("calendar.inc");
	$("#include_daily_rank").load("dailyRank.inc");
	$("#include_weekly_rank").load("weekly_rank.inc");
	$("#include_footer").load("footer.inc");
	location.href = "#tab1";
});

function goCal(year, month){
	$("#include_calendar").load("calendar.inc?year="+year+"&month="+month+"&sDate="+sDate);
}

function goDate(sd){
	
	sDate = sd;
	
	var year = String(sd).substring(0,4);
	var month = String(sd).substring(4,6);
	
	if(month == 1)
		month = 1;
	
	month = month - 1;
	
	$("#include_calendar").load("calendar.inc?year="+year+"&month="+month+"&sDate="+sDate);
	$("#include_daily_rank").html("<br><br><br><br><br><br><br><br><h4>불러오는 중입니다...</h4><br><img src='resources/images/loading.gif'/>");
	$("#include_weekly_rank").html("<br><br><br><br><br><br><br><br><h4>불러오는 중입니다...</h4><br><img src='resources/images/loading.gif'/>");
	$("#include_daily_rank").load("dailyRank.inc?dTime="+sDate);
	$("#include_weekly_rank").load("weekly_rank.inc?dTime="+sDate);
}
</script>
</body>
</html>