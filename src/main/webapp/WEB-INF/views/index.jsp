<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a079f1d5c767f5ae2c08726bfaeb62d9"></script>
<style type="text/css">
#include_center{
	width: 100%;
	height: 2000px;
	margin-top: 50px;
}
#include_footer{
}
#include_header{
}
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
.tabmenu>ul>li{
  display:  inline-block;
  width:499px; 
  margin: 
  float:left;  
  text-align:center; 
  background :#f9f9f9;
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
<body bgcolor="#343434">

<div id="include_header" ></div>
<div id="include_center" ></div>
<div id="include_line" style="width: 100%
; height: 5px; background-color: #424242; margin: 0 auto; padding:0;"></div>
<div id="include_footer"></div>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="//www.amcharts.com/lib/4/core.js"></script>
<script src="//www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#include_header").load("header.inc");
		$("#include_center").load("centerSlide.inc"); 
		$("#include_footer").load("footer.inc");
 	});
	
	function goSearch(){
		var type = document.getElementById("select_type").value;
		var value = document.getElementById("search").value;
		console.log(type);
		console.log(value);
		$("#include_center").load("search.inc?type="+type+"&value="+value);
		
		return false;
	}
	
	function goView(movieCd){
		$("#include_center").load("view.inc?movieCd="+movieCd);
	}
	
	function goOpendt(){
		$("#include_center").load("opendt.inc");
	}
	
	function goContact(){
		$("#include_center").load("contact.inc");
		$("#include_center").css("height", "1200px");
	}
	
	function goMypage(m_idx){
		$("#include_center").load("profile.inc?m_idx="+m_idx);
		$("#include_center").css("height", "1200px");
	}
	
	function goSignin() {
		$("#include_center").load("signIn.inc");
		$("#include_center").css("height", "1200px");
		
	}
	
	function goSignup(){
		$("#include_center").load("signUp.inc");
		$("#include_center").css("height", "1200px");
	}
	
	function goBoxOffice(){
		
		var msg = "<div id='include_calendar' ></div><br><br>";
		msg += "<div class='tabmenu'><ul class='tab_ul'>";
		msg += "<li id='tab1' class='btnCon'>";
		msg += "<a class='btn first' href='#tab1'>일간 박스오피스</a>";
		msg += "<div class='tabCon'><div id='include_daily_rank' ></div></div></li>";
		msg += "<li id='tab2' class='btnCon'>";
		msg += "<a class='btn' href='#tab2'>주간 박스오피스</a>";
		msg += "<div class='tabCon'><div id='include_weekly_rank' ></div></div></li>";
		msg += "</ul></div>";
		$("#include_center").css("height", "4500px");
		$("#include_center").html(msg);
		$("#include_calendar").load("calendar.inc");
		$("#include_daily_rank").load("dailyRank.inc");
		$("#include_weekly_rank").load("weekly_rank.inc");
		location.href = "#tab1";
	}
	
	function goCal(year, month){
		$("#include_calendar").load("calendar.inc?year="+year+"&month="+month);
	}
	
	function goDate(sDate){
		console.log(sDate);
		$("#include_daily_rank").load("dailyRank.inc?dTime="+sDate);
		$("#include_weekly_rank").load("weekly_rank.inc?dTime="+sDate);
		$("#include_opendt").load("opendt.inc?dTime="+sDate);
	}
	
</script>
</body>
</html>