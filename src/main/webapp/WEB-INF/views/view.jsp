<%@page import="mybatis.vo.MovieCommentVO"%>
<%@page import="mybatis.vo.MovieMemberVO"%>
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
		border-bottom: 1px solid black;
		height: 20px;
		margin-bottom: 5px;
	}
	
	.rate {
	    float: left;
	    height: 46px;
	    padding: 0 10px;
	}
	.rate:not(:checked) > input {
	    position:absolute;
	    top:-9999px;
	}
	.rate:not(:checked) > label {
	    float:right;
	    width:1em;
	    overflow:hidden;
	    white-space:nowrap;
	    cursor:pointer;
	    font-size:30px;
	    color:#ccc;
	}
	.rate:not(:checked) > label:before {
	    content: '★ ';
	}
	.rate > input:checked ~ label {
	    color: #ffc700;    
	}
	.rate:not(:checked) > label:hover,
	.rate:not(:checked) > label:hover ~ label {
	    color: #deb217;  
	}
	.rate > input:checked + label:hover,
	.rate > input:checked + label:hover ~ label,
	.rate > input:checked ~ label:hover,
	.rate > input:checked ~ label:hover ~ label,
	.rate > label:hover ~ input:checked ~ label {
	    color: #c59b08;
	}

/* Modified from: https://github.com/mukulkant/Star-rating-using-pure-css */
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

		<c:if test="${sessionScope.memVO ne null}"> 
		<div id="comment">
			<form action="commSave.inc" method="post">
				<div class="rate">
				    <input type="radio" id="star5" name="rate" value="5" />
				    <label for="star5" title="text">5 stars</label>
				    <input type="radio" id="star4" name="rate" value="4" />
				    <label for="star4" title="text">4 stars</label>
				    <input type="radio" id="star3" name="rate" value="3" />
				    <label for="star3" title="text">3 stars</label>
				    <input type="radio" id="star2" name="rate" value="2" />
				    <label for="star2" title="text">2 stars</label>
				    <input type="radio" id="star1" name="rate" value="1" />
				    <label for="star1" title="text">1 star</label>
				</div>
				<textarea rows="3" cols="120" name="content" id="content"></textarea>
				<input type="hidden" name="m_idx" id="m_idx" value="${sessionScope.memVO.m_idx }">
				<%-- <input type="hidden" name="m_idx" id="m_idx" value="1"> --%>
				<input type="hidden" name="movieCd" id="movieCd" value="${movieCd }">
				<input type="button" value="저장" onclick="commSave(this.form)"/>
			</form>
		</div>
		</c:if> 

		<div id="commentList">
			<table id="commTable">
				<tbody>
					<c:if test="${vo.comms eq null }">
						<tr>
							<td>
								없다 댓글
							</td>
						</tr>
					</c:if> 
					<c:forEach var="cvo" items="${vo.comms }">
					<tr>
						<td style="width: 70px">
							${cvo.mvo.id }
						</td>
						<td class="comment">
							${cvo.content } 
						</td>
						<c:if test="${cvo.rate ne null}">
						<td>
							평점 ${cvo.rate } 점
						</td>
						</c:if>
						<c:if test="${cvo.rate eq null}">
						<td>
							평가하지 않았습니다.
						</td>
						</c:if>
						<c:if test="${cvo.m_idx eq sessionScope.memVO.m_idx}">
						<td>
							<input type="button" value="삭제" onclick="commDel('${cvo.c_idx}')"/>
						</td>
						</c:if>
						<c:if test="${cvo.m_idx ne sessionScope.memVO.m_idx}">
						<td>
							
						</td>
						 </c:if>
					</tr>
					</c:forEach>
				</tbody>	
			</table>
		</div>
		<br><br><br><br>
		<div id="chart_div"></div>
	</div>
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
    <script src="//www.amcharts.com/lib/4/core.js"></script>
	<script src="//www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<script>
	$(function(){
		
		$.ajax({
			url: "http://192.168.0.117:5000/audiAcc?movieCd=20200329",
			type: 'post',
			dataType: "json"
		}).done(function(data){
			viewChart(data);
		});
		
	});
	
	function viewChart(json_data){
		
		$("#chart_div").text(json_data);
		
		/*
		
		am4core.useTheme(am4themes_animated);
		
		var chart = am4core.create(
				"chart_div", am4charts.XYChart);
		
		chart.data = json_data;
		
		// x축 만들기
		var categoryAxis = 
		chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "city";
		
		categoryAxis.renderer.labels.template.fontSize = 12;
		categoryAxis.renderer.minGridDistance = 30;
		
		// y축 만들기
		var valueAxis = 
		chart.yAxes.push(new am4charts.ValueAxis());
		
		//Series 만들기
		var series = chart.series.push(
				new am4charts.ColumnSeries());
		series.dataFields.categoryX = "city";
		series.dataFields.valueY = "counts";
		
		series.columns.template.tooltipText = 
			"[bold]{valueY}[/]";
		series.columns.template.fill = 
			am4core.color('#6e6eff');
		series.columns.template.fillOpacity = 0.7;
		series.columns.template.stroke = 
			am4core.color('#ff0000');
		
		var columnTemplate = series.columns.template;
		columnTemplate.strokeWidth = 1;
		columnTemplate.strokeOpacity = .7
		*/
	}

	function commSave(frm) {
		var content = $("#content").val();
		var m_idx = $("#m_idx").val();
		var movieCd = $("#movieCd").val();
		var rate = $('input[name="rate"]:checked').val();
		
		if(rate == null){
			alert("평가를 매겨주세요");
			return;
		}
		
		if(content.length < 1){
			alert("내용을 매겨주세요");
			return;
		}
		
		var param = "content="+encodeURIComponent(content)+
		"&m_idx="+encodeURIComponent(m_idx)+
		"&movieCd="+encodeURIComponent(movieCd)+
		"&rate="+encodeURIComponent(rate);
		
		$.ajax({
			url: "commSave.inc",
			type: "post",
			data: param,
			dataType: "json"
		}).done(function(data){
			
			if(data.chk){
				alert("댓글달기 성공");
				if(data.mar != undefined){
					var code = "";
					for(var i = 0; i<data.mar.length; i++){
						code += "<tr><td style='width: 70px'>";
						code += data.mar[i].mvo.id;
						code += "</td><td>";
						code += data.mar[i].content;
						code += "</td>";
						if(data.mar[i].rate != null){
							code += "<td>평점 ";
							code += data.mar[i].rate;
							code += " 점</td>";
						}else{
							code += "<td>평가하지 않았습니다. </td>";
						}
						if(data.mar[i].m_idx == m_idx){
							code += "<td><input type=\"button\" value=\"삭제\" onclick=\"commDel("+data.mar[i].c_idx+")\"/></td>";
						}else
							code += "<td></td>"
						code += "</tr>";
					}
					//위에서 작업된 html코드를 tbody에 html로 적용한다.
					$("#commTable tbody").html(code);
				}
			}else{
				alert("댓글달기 실패");
			}
			
			$("#content").val("");	
		}).fail(function(err){
			
		});
	}
    
	function commDel(c_idx) {
		var movieCd = $("#movieCd").val();
		var m_idx = $("#m_idx").val();
		var param = "c_idx="+encodeURIComponent(c_idx)+
		"&movieCd="+encodeURIComponent(movieCd);
		
		$.ajax({
			url: "commDel.inc",
			type: "post",
			data: param,
			dataType: "json"
		}).done(function(data){
			
			if(data.chk){
				alert("삭제 성공");
				if(data.mar != undefined){
					var code = "";
					for(var i = 0; i<data.mar.length; i++){
						code += "<tr><td style='width: 70px'>";
						code += data.mar[i].mvo.id;
						code += "</td><td>";
						code += data.mar[i].content;
						code += "</td>";
						if(data.mar[i].rate != null){
							code += "<td>평점 ";
							code += data.mar[i].rate;
							code += " 점</td>";
						}else{
							code += "<td>평가하지 않았습니다. </td>";
						}
						if(data.mar[i].m_idx == m_idx){
							code += "<td><input type=\"button\" value=\"삭제\" onclick=\"commDel("+data.mar[i].c_idx+")\"/></td>";
						}else
							code += "<td></td>"
						code += "</tr>";
					}
					//위에서 작업된 html코드를 tbody에 html로 적용한다.
					$("#commTable tbody").html(code);
				}
			}else{
				alert("삭제 실패");
			}
			
		}).fail(function(err){
			
		});
	}
</script>	
</body>
</html>