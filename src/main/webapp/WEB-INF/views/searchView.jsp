<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#wrap{
	width: 800px;
	margin: 0 auto;
}

.item{
	float: left;
	list-style: none;
	width: 400px;
	margin-bottom: 50px;
	
}
.info{
	float: left;
	list-style: none;
	margin-left: 10px;
}

.info2{
	list-style: none;
	margin-left: 10px;
}

.thumb{
	display: inline-block;
	float: left;
}

.title{
	display: inline-block;
	font-size: 20px;
	margin-left: 10px;
}

</style>
</head>
<body>
	<div id="wrap">
			<c:forEach var="vo" items="${ar }">
					<li class="item">
                    	<a href=""  style="height:274px;width:187px;" class="thumb" ><img src="resources/images/test.jpg" border="0" alt=""></a> 
                        <div class="cont">
                        	<strong class="title" title="${vo.movieNm }">
                        	<a href="view.inc?movieCd=${vo.movieCd }" style="text-decoration: underline;">${vo.movieNm }</a></strong>
                            <ul>
                            	<li class="info">${vo.genreAlt }</li>
                            	<li class="info">｜	${vo.nationAlt }</li>
                            	<li class="info">｜	${vo.directorNm }</li>
                            </ul>
                            <span class="info2">개봉일 ${vo.openDt }</span>
                        </div>
                     </li>
			</c:forEach>
	</div>
</body>
</html>