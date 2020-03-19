<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<table>
			<c:forEach var="rvo" items="${ar }">
			<tr>
			<td colspan="6">${rvo.openDt }</td>
			</tr>
			<tr>
			<td rowspan="3">사진</td>
			<td>${rvo.movieNm }</td>
			<td>${rvo.genreAlt }｜${rvo.nationAlt }｜${rvo.director }</td>
			<td>개봉일 ${rvo.openDt }</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	
</body>
</html>