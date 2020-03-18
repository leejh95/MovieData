<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//조회일자
		String targetDt = request.getParameter("targetDt")==null?"20200317":request.getParameter("targetDt");
		//결과 row 수
		String itemPerPage = request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");
		//"Y" : 다양성 영화 "N" : 상업영화 (default : 전체)
		String multiMovieYn = request.getParameter("multiMovieYn")==null?"":request.getParameter("multiMovieYn");
		//"K" : 한국 영화 "F" : 외국 영화 (default : 전체)
		String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");
		//"0105000000"로서 조회된 지역코드
		String wideAreaCd = request.getParameter("wideAreaCd")==null?"":request.getParameter("wideAreaCd");
		
		//발급키
		String key = "597ea93394fe1b75e69c9cf07a1fc1de";
		//KOBIS 오픈 API Rest Client를 통해 호출
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		
		String dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd, wideAreaCd);
		
		System.out.println(dailyResponse);
	
	%>
	
	
</body>
</html>