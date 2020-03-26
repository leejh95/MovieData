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
	margin: auto;
	display: inline-block;
}

.item{
	float: left;
	list-style: none;
	width: 330px;
	margin: 0 0 50px 0;
	
}

.info{
	list-style: none;
	height: 20px;
	margin: 0;
	margin-top: 5px;
	padding: 0;
	float: left;	
}

.info2{
	margin: 0;
	padding: 0;
}

.thumb{
	display: inline-block;
	float: none;
}

img{
	display: inline-block;
	float: none;
}

.title{
	display: inline-block;
	float: none;
	width: 300px;
	font-size: 20px;
	text-decoration: none;
	color: black;
}

.opend{
	margin: 0;
	margin-right: 5px;
	padding: 0;
	background-color: gray;
	border-radius: 3px;
	color: white;
	font-weight: bold;
	width: 60px;
	height: 20px;
	line-height: 21px;
	float: left;
}

</style>
</head>
<body>
	<div id="wrap">
		<c:forEach var="vo" items="${ar }">
			<li class="item">
				<c:if test="${vo.image ne null }">
					<a href="javascript:goView('${vo.movieCd }')" style="height: 300px; width: 187px;" class="thumb">
						<img src="${vo.image }" border="0" alt="" style="height: 300px; width: 187px;" />
					</a>
				</c:if> 
				<c:if test="${vo.image eq null }">
					<a href="javascript:goView('${vo.movieCd }')" style="height: 300px; width: 187px;" class="thumb">
						<img src="resources/images/no-image-png-7.png" border="0" alt="" style="height: 300px; width: 187px;" />
					</a>
				</c:if>
				<div class="cont">
					<strong title="${vo.movieNm }">
						<a class="title" href="javascript:goView('${vo.movieCd }')">${vo.movieNm }</a>
					</strong>
				</div>
			</li>
		</c:forEach>
	</div>
</body>
</html>