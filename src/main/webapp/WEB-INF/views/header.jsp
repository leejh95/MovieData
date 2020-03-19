<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a{
		margin:0 50px;
		float: left;
	}
	#search_wrap {
		padding-top: 15px; 
		height: 79px;
	}
</style>
</head>
<body>
	<a href="#"><img alt="메인으로" src="resources/images/boxOffice.png"/></a>
	<div id="search_wrap">
		<form action="search.inc" method="post" name="searchFrm">
			<select name="type">
				<option>선택하세요.</option>
				<option value="0">영화이름</option>
				<option value="1">감독이름</option>
				<option value="2">개봉년도</option>
			</select>
			<input type="text" name="searchValue" />
			<input type="button" onclick="goSearch(this.form)" value="검색"/>
		</form>
	</div>
</body>
</html>