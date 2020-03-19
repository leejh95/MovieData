<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="include_header"></div>
<div id="include_calendar"></div>
<div id="include_rank"></div>
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
		$("#include_rank").load("rank.inc?dTime"+dTime);
	}
	
	function goCal(year, month){
		$("#include_calendar").load("calendar.inc?year="+year+"&month="+month);
	}
</script>
</body>
</html>