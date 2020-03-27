<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#week_wrap{
	width: 1000px;
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
	<div id="week_wrap">
			<c:forEach var="vo" items="${ar }">
					<li class="item">
                    		<a href="javascript:goView('${vo.movieCd }')"  style="height:300px;width:187px;" class="thumb" ><img src="${vo.image }" border="0" alt="" style="height:300px;width:187px;"></a> 
                        <div class="cont">
                       		 <strong title="${rvo.movieNm }">
                        	<a class="title" href="javascript:goView('${vo.movieCd }')">${vo.rank}위 ${vo.movieNm }</a>
                        	</strong>
                            <ul class="info">
                            	<li class="info2"><pre class="opend"> 개봉일 </pre>${vo.openDt }</li>
                            </ul>
                        </div>
                     </li>
			</c:forEach>
			<c:if test="${fn:length(ar)} ">
				해당 날짜에 박스오피스 정보가 없습니다.
			</c:if>
	</div> 
</body>
</html>