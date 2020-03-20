<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#all_wrap{
width: 1000px;
padding: 0;
margin: auto;
}
</style>
</head>
<body>

<div id="include_header"></div>
<div id="all_wrap">
	<div id="include_calendar"></div>
	<br><br>
	<div id="include_rank"></div>
</div>
<div id="include_footer"></div>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#include_header").load("header.inc");
		$("#include_calendar").load("calendar.inc");
		$("#include_rank").load("rank.inc");
		//$("#include_footer").load("footer.inc");
		
		
 	});
	
	function goRank(dTime){
		$("#include_rank").load("rank.inc?dTime="+dTime);
	}
	
	function goCal(year, month){
		$("#include_calendar").load("calendar.inc?year="+year+"&month="+month);
	}
	
	function goSearch(){
		var type = document.getElementById("select_type").value;
		var value = document.getElementById("search_text").value;
		console.log(type);
		console.log(value);
		$("#include_rank").load("search.inc?type="+type+"&value="+value);
		
		return false;
	}
	
	function goView(movieCd){
		$("#include_rank").load("view.inc?movieCd="+movieCd);
	}
	
	
</script>
</body>
</html>