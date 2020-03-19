<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#wrap{
		width: 1000px;
		height: 600px;
		margin: 0 auto;
		border: 1px solid black;
	}
	#left {
		margin : 150px 60px;
		width : 200px;
		height: 280px;
		float: left;
		border: 1px solid black;
	}
	
	#right {
		margin : 60px 60px 60px 10px;
		width : 600px;
		height: 450px;
		float: left;
		border: 1px solid black;
	}

	.kategorie {
		color: #585858;
		font-weight: bold;
		margin-right: 10px;
		padding-left: 5px;
	}
	.content{
		padding-left: 25px;
	}
	table{
		margin: 40px auto;
		border-collapse: collapse;
	}
	table tr {
		padding-bottom: 10px;
		height: 30px;
	}
	#line{
		border-bottom: 1px solid #585858;
		border-left: 1px solid #585858;
	}
	
	#line>td{
		padding-left: 5px;
		font-size: 1.2em;
		font-weight: 500;
		font-style: italic;
	}
	
</style>
	<jsp:include page="header.jsp"/>
</head>
<body>
	<div id="wrap">
		<div id="left">
			<p> 사진 놓을곳 </p>
		</div>
		<div id="right">
			<table>
				<colgroup>
					<col width="120px"/>
					<col width="400px"/>
				</colgroup>
				<tr id="line">
					<td >개요</td>
					<td ></td>
				</tr>
				<tr>
					<td class="kategorie">제목</td>
					<td class="content">${vo.movieNm }&nbsp;&nbsp;&nbsp;&nbsp;(${vo.movieNmEn })</td>
				</tr>
				<tr>
					<td class="kategorie">요약정보</td>
					<td class="content">${vo.typeNm } / ${vo.genreNm } / ${vo.showTm }분 / ${vo.watchGradeNm } / ${vo.nationNm }</td>
				</tr>
				<tr>
					<td class="kategorie">제작년도</td>
					<td class="content">${vo.prdtYear }년</td>
				</tr>
			</table>
			<table>
				<colgroup>
					<col width="120px"/>
					<col width="400px"/>
				</colgroup>
				<tr id="line">
					<td >만든사람들</td>
					<td ></td>
				</tr>
				<tr>
					<td class="kategorie">감독</td>
					<td class="content">${vo.directorNm }</td>
				</tr>
				<tr>
					<td class="kategorie">배우 및 배역</td>
					<td class="content">${vo.actorNm1 }(${vo.cast1 }) / ${vo.actorNm2 }(${vo.cast2 }) / ${vo.actorNm3 }(${vo.cast3 })</td>
				</tr>
			</table>
			<table>
				<colgroup>
					<col width="120px"/>
					<col width="400px"/>
				</colgroup>
				<tr id="line">
					<td >영화사</td>
					<td ></td>
				</tr>
				<tr>
					<td class="kategorie">제작사</td>
					<td class="content">${vo.companyNm }</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>