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
		<table width="400px">
			<c:forEach var="vo" items="${ar }">
				<tr>
					<td colspan="4">${vo.movieNm }</td>
				</tr>
				<tr>
					<td rowspan="3">사진</td>
					<td rowspan="3">${vo.prdtYear }</td>
					<td rowspan="3">${vo.genreAlt }｜${vo.nationAlt }｜${vo.directorNm }</td>
					<td rowspan="3">개봉일 ${vo.openDt }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>