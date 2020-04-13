<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">
    <!-- Style CSS -->
    <link rel="stylesheet" href="resources/style.css">
    <style type="text/css">
    #box_card:hover{
	    background-color: #ededed;
	    cursor: pointer;
    }
    </style>
</head>
<body>
		<div id="include_header" ></div>
		
	    <div class="blog-wrapper section-padding-100 clearfix">
        <div class="container" >
            <div class="row align-items-end">
            
            	<!-- 컨텐츠 구분선 -->
			    <table style="width:1100px; margin:100px auto;">
			    	<colgroup>
			    		<col width="*"/>
			    		<col width="350px"/>
			    		<col width="*"/>
			    	</colgroup>
			    	<tr>
			    		<td style="border-bottom:1px solid #b2b2b2; height:28px"></td>
			    		<td rowspan="2" align="center">
			    		<h3><font color="#2d2d2d">
				    	<c:if test="${searchType eq 0 }">영화이름 : </c:if>
				    	<c:if test="${searchType eq 1 }">감독이름 : </c:if>
				    	<c:if test="${searchType eq 2 }">개봉년도 : </c:if>
				    	"${searchValue }"<br>
				    	결과 건수 : ${fn:length(ar)}
			    		</font></h3>
			    		</td>
			    		<td style="border-bottom:1px solid #b2b2b2"></td>
			    	</tr>
			    	<tr><td></td><td></td></tr>
			    </table>
			    <hr>
			    <!-- 컨텐츠 구분선 끝 -->
			    
                <c:forEach var="vo" items="${ar }">
                <!-- Single Blog Area -->
                <div class="col-12 col-lg-4">
                    <div class="single-blog-area clearfix mb-100" id="box_card" onclick="location.href='view.inc?movieCd=${vo.movieCd }'" style="padding: 30px 0;">
                        <!-- Blog Content -->
                        <div class="single-blog-content" style="text-align:center;">
                            <a style="height: 300px; width: 187px; margin: 0 auto;" class="thumb">
                            	<img src="${vo.image }" border="0" alt="" style="height: 300px; width: 187px;">
                           	</a>
                           	<br><br>
                           	<h5><b>${vo.movieNm }</b></h5>
                           	<c:if test="${fn:length(vo.openDt) <= 7 }">
                           		<h5><a>개봉일 정보 없음</a></h5>
                           	</c:if>
                           	<c:if test="${fn:length(vo.openDt) > 7  }">
                           		<h5><a>개봉일 ${vo.openDt.substring(0,4) }년 ${vo.openDt.substring(4,6)}월 ${vo.openDt.substring(6)}일</a></h5>                           		
                           	</c:if>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <c:if test="${fn:length(ar) < 1}">
			    	검색결과가 없습니다.
			    </c:if>
            </div>
    </div>
    </div>
    <div id="include_footer"></div>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>
    <script type="text/javascript">
		$(document).ready(function(){
			$("#include_header").load("header.inc");
			$("#include_footer").load("footer.inc");
		});
    </script>
</body>
</html>