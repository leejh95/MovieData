<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
border: 1px solid red;
width: 1000px;
}
table td{
border: 1px solid blue;
}
table th{
border: 1px solid orange;
}
</style>
</head>
<body>
	<div id="wrap">
		<table width="400px">
			<c:forEach var="rvo" items="${ar }">
				<tr>
					<td colspan="4">${rvo.openDt }</td>
				</tr>
				<tr>
					<td rowspan="3">사진</td>
					<td rowspan="3">${rvo.movieNm }</td>
					<td rowspan="3">${rvo.genreAlt }｜${rvo.nationAlt }｜${rvo.director }</td>
					<td rowspan="3">개봉일 ${rvo.openDt }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
</body>
</html>