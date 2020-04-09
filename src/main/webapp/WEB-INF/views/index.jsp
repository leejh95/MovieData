<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a079f1d5c767f5ae2c08726bfaeb62d9"></script>
</head>
<body bgcolor="#343434">

<input type="hidden" value="${chk }" id="chk"/>
<input type="hidden" value="${category }" id="category"/>

<div id="include_header" ></div>
<div id="include_center" ></div>
<div id="include_footer"></div>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="//www.amcharts.com/lib/4/core.js"></script>
<script src="//www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var chk = $("#chk").val();
		var category = $("#category").val();

		if(!chk || chk == ""){
			$("#include_header").load("header.inc");
			$("#include_center").load("centerSlide.inc"); 
			$("#include_footer").load("footer.inc");
		}
				//console.log(chk);
		if(chk){
			//console.log(chk);
			$("#include_header").load("header.inc");
			goBoard(category);
			$("#include_footer").load("footer.inc");
		}
			 
 	});
	
	function goSearch(){
		var type = document.getElementById("select_type").value;
		var value = document.getElementById("search").value;
		$("#include_center").load("search.inc?type="+type+"&value="+value);
		
		return false;
	}
	
	function goView(movieCd, dTime){
		$("#include_center").load("view.inc?movieCd="+movieCd+"&dTime="+dTime);
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
	
	function goBoxOffice(){
		
		var msg = "<div id='include_calendar' ></div><br><br>";
		msg += "<div class='tabmenu'><ul class='tab_ul'>";
		msg += "<div id='div_li'>"
		msg += "<li id='tab1' class='btnCon'>";
		msg += "<a class='btn first' href='#tab1'>일간 박스오피스</a>";
		msg += "<div class='tabCon'><div id='include_daily_rank' ></div></div></li>";
		msg += "<li id='tab2' class='btnCon'>";
		msg += "<a class='btn' href='#tab2'>주간 박스오피스</a>";
		msg += "<div class='tabCon'><div id='include_weekly_rank' ></div></div></li>";
		msg += "</div>"
		msg += "</ul></div>";
		$("#include_center").css("height", "5000px");
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
		$("#include_daily_rank").load("dailyRank.inc?dTime="+sDate);
		$("#include_weekly_rank").load("weekly_rank.inc?dTime="+sDate);
	}
	
	function goBoard(category){
		$("#include_center").css("height", "900px");
		$("#include_center").load("list.inc?category="+category);
	}
	
	function goBoardView(b_idx, nowPage){
		$("#include_center").css("height", "1500px");
		$("#include_center").load("boardview.inc?b_idx="+b_idx+"&nowPage="+nowPage);
	}
	
	function goWrite(nowPage, category){
		$("#include_center").load("writeForm.inc?nowPage="+nowPage+"&category="+category);
	}
	


	
</script>
</body>
</html>