<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="resources/css/bootstrap.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">


</style>
</head>
<body>

		<div class='row'>
			<div class='col-lg-4 col-md-6 col-sm-12 p-3'>
				<c:forEach var="vo" items="${dar }">
						<div class='card-body'>
							<li class="item"><a
								href="javascript:goView('${vo.movieCd }')"
								style="height: 300px; width: 187px;" class="thumb"><img
									src="${vo.image }" border="0" alt=""
									style="height: 300px; width: 187px;"></a>
								<div class="cont">
									<strong title="${rvo.movieNm }"> <a class="title"
										href="javascript:goView('${vo.movieCd }')">${vo.rank}위
											${vo.movieNm }</a>
									</strong>
									<ul class="info">
										<li class="info2"><pre class="opend"> 개봉일 </pre>${vo.openDt }</li>
									</ul>
								</div></li>
						</div>
				</c:forEach>
			</div>
		</div>

</body>
</html>