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
	width: 1500px;
	position: absolute;
	top: 25%;
	left: 10%;

}

.item{
	float: left;
	list-style: none;
	width: 550px;
	margin-bottom: 50px;
	
}
.info{
	float: left;
	list-style: none;
	margin-left: 10px;
}

.info2{
	margin-left: 10px;
	list-style: none;
	display: inline-block;
}

.thumb{
	display: inline-block;
	float: left;
}

.title{
	font-size: 20px;
	margin-left: 10px;
}

</style>
</head>
<body>
	<div id="wrap">
			<c:forEach var="rvo" items="${ar }">
					<li class="item">
                    	<a href=""  style="height:274px;width:187px;" class="thumb" ><img src="resources/images/test.jpg" border="0" alt=""></a> 
                        <div class="cont">
                        	<strong class="title" title="${rvo.movieNm }">
                        	<a href="#none" style="text-decoration: underline;">${rvo.movieNm }</a></strong>
                            <ul>
                            	<li class="info">${rvo.genreAlt }</li>
                            	<li class="info">｜	${rvo.nationAlt }</li>
                            	<li class="info">｜	${rvo.director }</li>
                            </ul>
                            <span class="info2">개봉일 ${rvo.openDt }</span>
                        </div>
                     </li>
			</c:forEach>
	</div>
</body>
</html>