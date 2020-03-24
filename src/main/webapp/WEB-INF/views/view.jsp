<%@page import="mybatis.vo.MovieMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	
	body{
	}

	#view_wrap{
		width: 1000px;
		height: 1500px;
		margin: 0 auto;
	}
	#left {
		margin-right: 100px;
		margin-left: 20px;
		margin-top: 50px;
		float: left;
		height:300px;
		width:187px;
	}
	
	#right {
		margin-left:90px;
		width : 600px;
		height: 450px;
		float: left;
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
	.view_table{
		margin: 40px auto;
		border-collapse: collapse;
	}
	.view_table tr {
		padding-bottom: 10px;
		height: 30px;
	}
	.line{
		border-bottom: 1px solid #585858;
		border-left: 3px solid #585858;
	}
	
	.line>td{
		padding-left: 5px;
		font-size: 1.2em;
		font-weight: 500;
		font-style: italic;
	}
	#commTable{
		border-collapse: collapse;
		width: 1000px;
		
	}
	#commTable tr{
		border-top: 1px solid black;
		height: 20px;
		margin-bottom: 5px;
	}
</style>
	 <%-- <jsp:include page="header.jsp"/>  --%>   
</head>
<body>
	<div id="view_wrap">
		<div id="left">
			<c:if test="${vo.image ne null }">
           		<img src="${vo.image }" border="0" alt="" width="250px" />
           	</c:if>
           	<c:if test="${vo.image eq null }">
           		<img src="resources/images/no-image-png-7.png" border="0" alt="" width="250px"/>
           	</c:if>
		</div>
		<div id="right">
			<table class="view_table">
				<colgroup>
					<col width="120px"/>
					<col width="400px"/>
				</colgroup>
				<tr class="line">
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
			<table class="view_table">
				<colgroup>
					<col width="120px"/>
					<col width="400px"/>
				</colgroup>
				<tr class="line">
					<td >만든사람들</td>
					<td ></td>
				</tr>
				<tr>
					<td class="kategorie">감독</td>
					<td class="content">${vo.directorNm }</td>
				</tr>
				<tr>
					<td class="kategorie">배우 및 배역</td>
					<td class="content">
					<c:forEach var="avo" items="${vo.actors }">
						${avo.actorNm }(${avo.castNm }) /
					</c:forEach>
					</td>
				</tr>
			</table>
			<table class="view_table">
				<colgroup>
					<col width="120px"/>
					<col width="400px"/>
				</colgroup>
				<tr class="line">
					<td >영화사</td>
					<td ></td>
				</tr>
				<tr>
					<td class="kategorie">제작사</td>
					<td class="content">${vo.companyNm }</td>
				</tr>
			</table>
		</div>
<% 
	  	Object obj = session.getAttribute("memVO");
		MovieMemberVO mvo = null;
	
	  	if(obj != null) {
	  		mvo = (MovieMemberVO)obj;  		
%>
		<div id="comment">
			<form action="commSave.inc" method="post">
				<textarea rows="3" cols="120" name="content" id="content"></textarea>
				<input type="hidden" name="m_idx" id="m_idx" value="<%=mvo.getM_idx() %>">
				<%-- <input type="hidden" name="m_idx" id="m_idx" value="1"> --%>
				<input type="hidden" name="movieCd" id="movieCd" value="${movieCd }">
				<input type="button" value="저장" onclick="commSave(this.form)"/>
			</form>
		</div>
<%
  	}
%>		
		<div id="commentList">
			<table id="commTable">
				<c:forEach var="cvo" items="${vo.comms }">
				<tr>
					<td style="width: 70px">
						${cvo.mvo.id }
					</td>
					<td class="comment">
						${cvo.content } 
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
<script src="resources/js/jquery-3.4.1.min.js"></script>	
<script>
function commSave(frm) {
	var content = $("#content").val();
	var m_idx = $("#m_idx").val();
	var movieCd = $("#movieCd").val();
	var param = "content="+encodeURIComponent(content)+
	"&m_idx="+encodeURIComponent(m_idx)+
	"&movieCd="+encodeURIComponent(movieCd);
	
	$.ajax({
		url: "commSave.inc",
		type: "post",
		data: param,
		dataType: "json"
	}).done(function(data){
		
		if(data.chk){
			alert("댓글달기 성공");
			location.href = "view.inc?movieCd=${movieCd}";
		}else{
			alert("댓글달기 실패");
		}
	}).fail(function(err){
		
	});
	
	
}
    
</script>	
</body>
</html>