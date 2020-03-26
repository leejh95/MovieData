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
	
</script>
</body>
</html>