<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>제목 : ${vo.movieNm }(${vo.movieNmEn })</h1>
	<h1>러닝타임 : ${vo.showTm }분</h1>
	<h1>제작년도 : ${vo.prdtYear }년</h1>
	<h1>개봉일 : ${vo.openDt }</h1>
	<h1>제작상태 : ${vo.prdtStatNm }</h1>
	<h1>국가 : ${vo.nationNm }</h1>
	<h1>장르 : ${vo.genreNm } / ${vo.typeNm }</h1>
	<h1>감독 : ${vo.directorNm }</h1>
	<h1>배우 및 배역 : ${vo.actorNm1 }(${vo.cast1 }),  ${vo.actorNm2 }(${vo.cast2 }),  ${vo.actorNm3 }(${vo.cast3 })</h1>
	<h1>제작사 : ${vo.companyNm }</h1>
	<h1>관람등급 : ${vo.watchGradeNm }</h1>
</body>
</html>