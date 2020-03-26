<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#include_center{
	width: 100%;
	margin-top: 50px;
}
#include_header{
}

.tab_ul{
  list-style:none;
  margin: 0; 
}

.tabmenu{ 
  max-width:1500px; 
  height:200px;
  margin: 0 auto; 
  padding: 0;
  position:relative; 
}
#tab1{
left:0;
}
.tabmenu>ul>li{
  display:  inline-block;
  width:33.33%; 
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
  width: 1460px;
  text-align:left; 
  position:absolute; 
  left:40px; top:60px; 
  box-sizing: border-box; 
  padding: 50px;
  border : 1px solid #ff0000;
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
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<div id="include_footer"></div>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#include_header").load("header.inc");
		$("#include_center").load("centerSlide.inc");
		$("#include_footer").load("footer.inc");
		
 	});
	
	function goSearch(){
		var type = document.getElementById("select_type").value;
		var value = document.getElementById("search_text").value;
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
	
	function goBoxOffice(){
		var msg = "<div id='include_calendar' ></div><br><br>";
		msg += "<div class='tabmenu'><ul class='tab_ul'>";
		msg += "<li id='tab1' class='btnCon'>";
		msg += "<a class='btn first' href='#tab1'>일간 박스오피스</a>";
		msg += "<div class='tabCon'><div id='include_daily_rank' ></div></div></li>";
		msg += "<li id='tab2' class='btnCon'>";
		msg += "<a class='btn' href='#tab2'>주간 박스오피스</a>";
		msg += "<div class='tabCon'><div id='include_weekly_rank' ></div></div></li>";
		msg += "<li id='tab3' class='btnCon'><a class='btn' href='#tab3'>개봉예정일</a>";
		msg += "<div class='tabCon'><div id='include_opendt' ></div></div></li>";
		msg += "</ul></div>";
		$("#include_center").html(msg);
		$("#include_calendar").load("calendar.inc");
		$("#include_daily_rank").load("dailyRank.inc");
		$("#include_weekly_rank").load("weekly_rank.inc");
		$("#include_opendt").load("opendt.inc");
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