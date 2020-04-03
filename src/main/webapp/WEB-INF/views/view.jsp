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
		margin-bottom: 100px;
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
	#comment_div{
		width: 1000px;
		margin: 100px auto;
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
	</div>
	
	<!-- 컨텐츠 구분선 -->
    <table style="width:1100px; margin:0 auto;">
    	<colgroup>
    		<col width="*"/>
    		<col width="270px"/>
    		<col width="*"/>
    	</colgroup>
    	<tr>
    		<td style="border-bottom:1px solid #b2b2b2; height:13px"></td>
    		<td rowspan="2" align="center"><h3><font color="#2d2d2d">누적관객수</font></h3></td>
    		<td style="border-bottom:1px solid #b2b2b2"></td>
    	</tr>
    	<tr><td></td><td></td></tr>
    </table>
    <!-- 컨텐츠 구분선 끝 -->
	
	<div id="view_audi_chart_div" style="width: 1000px; height:500px; margin: 0 auto; padding: 5px;"></div>
		
	<!-- 컨텐츠 구분선 -->
    <table style="width:1100px; margin:100px auto 50px auto;">
    	<colgroup>
    		<col width="*"/>
    		<col width="270px"/>
    		<col width="*"/>
    	</colgroup>
    	<tr>
    		<td style="border-bottom:1px solid #b2b2b2; height:13px"></td>
    		<td rowspan="2" align="center"><h3><font color="#2d2d2d">누적매출액</font></h3></td>
    		<td style="border-bottom:1px solid #b2b2b2"></td>
    	</tr>
    	<tr><td></td><td></td></tr>
    </table>
    <!-- 컨텐츠 구분선 끝 -->
		
	<div id="view_sales_chart_div" style="width: 1000px; height:500px; margin: 0 auto; padding: 5px;"></div>
	
	<div id="comment_div">
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
							${cvo.mvo.name }
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
	</div>
	
		
    <!-- Popper js -->
    <script src="resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>
<script>
	$(function(){
		
		$.ajax({
			url: "http://192.168.0.117:5000/viewGraph.inc?movieCd=${movieCd}&dTime=${dTime}",
			type: 'post',
			dataType: "json"
		}).done(function(data){
			$("#view_audi_chart_div").css("display", "");
			$("#view_sales_chart_div").css("display", "");
			if(data.length <= 0){
				$("#view_audi_chart_div").css("display", "none");
				$("#view_sales_chart_div").css("display", "none");
			}
			viewAudiChart(data);
			viewSalesChart(data);
		});
		
		var itemsMainDiv = ('.MultiCarousel');
	    var itemsDiv = ('.MultiCarousel-inner');
	    var itemWidth = "";

	    $('.leftLst, .rightLst').click(function () {
	        var condition = $(this).hasClass("leftLst");
	        if (condition)
	            click(0, this);
	        else
	            click(1, this)
	    });

	    ResCarouselSize();

	    $(window).resize(function () {
	        ResCarouselSize();
	    });

	    //this function define the size of the items
	    function ResCarouselSize() {
	        var incno = 0;
	        var dataItems = ("data-items");
	        var itemClass = ('.item');
	        var id = 0;
	        var btnParentSb = '';
	        var itemsSplit = '';
	        var sampwidth = $(itemsMainDiv).width();
	        var bodyWidth = $('body').width();
	        $(itemsDiv).each(function () {
	            id = id + 1;
	            var itemNumbers = $(this).find(itemClass).length;
	            btnParentSb = $(this).parent().attr(dataItems);
	            itemsSplit = btnParentSb.split(',');
	            $(this).parent().attr("id", "MultiCarousel" + id);


	            if (bodyWidth >= 1200) {
	                incno = itemsSplit[3];
	                itemWidth = sampwidth / incno;
	            }
	            else if (bodyWidth >= 992) {
	                incno = itemsSplit[2];
	                itemWidth = sampwidth / incno;
	            }
	            else if (bodyWidth >= 768) {
	                incno = itemsSplit[1];
	                itemWidth = sampwidth / incno;
	            }
	            else {
	                incno = itemsSplit[0];
	                itemWidth = sampwidth / incno;
	            }
	            $(this).css({ 'transform': 'translateX(0px)', 'width': itemWidth * itemNumbers });
	            $(this).find(itemClass).each(function () {
	                $(this).outerWidth(itemWidth);
	            });

	            $(".leftLst").addClass("over");
	            $(".rightLst").removeClass("over");

	        });
	    }


	    //this function used to move the items
	    function ResCarousel(e, el, s) {
	        var leftBtn = ('.leftLst');
	        var rightBtn = ('.rightLst');
	        var translateXval = '';
	        var divStyle = $(el + ' ' + itemsDiv).css('transform');
	        var values = divStyle.match(/-?[\d\.]+/g);
	        var xds = Math.abs(values[4]);
	        if (e == 0) {
	            translateXval = parseInt(xds) - parseInt(itemWidth * s);
	            $(el + ' ' + rightBtn).removeClass("over");

	            if (translateXval <= itemWidth / 2) {
	                translateXval = 0;
	                $(el + ' ' + leftBtn).addClass("over");
	            }
	        }
	        else if (e == 1) {
	            var itemsCondition = $(el).find(itemsDiv).width() - $(el).width();
	            translateXval = parseInt(xds) + parseInt(itemWidth * s);
	            $(el + ' ' + leftBtn).removeClass("over");

	            if (translateXval >= itemsCondition - itemWidth / 2) {
	                translateXval = itemsCondition;
	                $(el + ' ' + rightBtn).addClass("over");
	            }
	        }
	        $(el + ' ' + itemsDiv).css('transform', 'translateX(' + -translateXval + 'px)');
	    }

	    //It is used to get some elements from btn
	    function click(ell, ee) {
	        var Parent = "#" + $(ee).parent().attr("id");
	        var slide = $(Parent).attr("data-slide");
	        ResCarousel(ell, Parent, slide);
	    }
		
	});
	
	function viewAudiChart(data){
		
		am4core.useTheme(am4themes_animated);
		
		var chart = am4core.create(
				"view_audi_chart_div", am4charts.XYChart);
		
		
		
		chart.data = data;
		
		// x축 만들기
		var categoryAxis = 
		chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "dTime";
		
		categoryAxis.renderer.labels.template.fontSize = 12;
		categoryAxis.renderer.minGridDistance = 30;
		
		// y축 만들기
		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.renderer.minGridDistance = 30;
		valueAxis.title.text = "관객수";
		
		var axisBreak = valueAxis.axisBreaks.create();
		axisBreak.startValue = 1550000;
		axisBreak.endValue = 16000000;
		axisBreak.breakSize = 0.005;
		
		// make break expand on hover
		var hoverState = axisBreak.states.create("hover");
		hoverState.properties.breakSize = 1;
		hoverState.properties.opacity = 0.1;
		hoverState.transitionDuration = 1500;

		axisBreak.defaultState.transitionDuration = 1000;
		
		// this is exactly the same, but with events
		axisBreak.events.on("over", () => { 
		  axisBreak.animate(
		    [{ property: "breakSize", to: 1 }, { property: "opacity", to: 0.1 }],
		    1500,
		    am4core.ease.sinOut
		  );
		});
		axisBreak.events.on("out", () => {
		  axisBreak.animate(
		    [{ property: "breakSize", to: 0.005 }, { property: "opacity", to: 1 }],
		    1000,
		    am4core.ease.quadOut
		  );
		});
		
		
		//Series 만들기
		var series = chart.series.push(
				new am4charts.ColumnSeries());
		series.dataFields.categoryX = "dTime";
		series.dataFields.valueY = "audiAcc";
		
		series.columns.template.tooltipText = 
			"[bold]{valueY}[/]";
		series.columns.template.fill = am4core.color('#0489B1');
		series.columns.template.fillOpacity = 0.7;
		series.columns.template.stroke = am4core.color('black');
		
		var columnTemplate = series.columns.template;
		columnTemplate.strokeWidth = 1;
		columnTemplate.strokeOpacity = 0.7;
		
	}
	
	function viewSalesChart(data){
		
		am4core.useTheme(am4themes_animated);
		
		var chart = am4core.create(
				"view_sales_chart_div", am4charts.XYChart);
		
		chart.data = data;
		
		// x축 만들기
		var categoryAxis = 
		chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "dTime";
		
		categoryAxis.renderer.labels.template.fontSize = 12;
		categoryAxis.renderer.minGridDistance = 30;
		
		// y축 만들기
		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.renderer.minGridDistance = 30;
		valueAxis.title.text = "매출액";
		
		var axisBreak = valueAxis.axisBreaks.create();
		axisBreak.startValue = 15000000000;
		axisBreak.endValue = 100000000000;
		axisBreak.breakSize = 0.005;
		
		// make break expand on hover
		var hoverState = axisBreak.states.create("hover");
		hoverState.properties.breakSize = 1;
		hoverState.properties.opacity = 0.1;
		hoverState.transitionDuration = 1500;

		axisBreak.defaultState.transitionDuration = 1000;
		
		// this is exactly the same, but with events
		axisBreak.events.on("over", () => { 
		  axisBreak.animate(
		    [{ property: "breakSize", to: 1 }, { property: "opacity", to: 0.1 }],
		    1500,
		    am4core.ease.sinOut
		  );
		});
		axisBreak.events.on("out", () => {
		  axisBreak.animate(
		    [{ property: "breakSize", to: 0.005 }, { property: "opacity", to: 1 }],
		    1000,
		    am4core.ease.quadOut
		  );
		});
		
		
		//Series 만들기
		var series = chart.series.push(
				new am4charts.ColumnSeries());
		series.dataFields.categoryX = "dTime";
		series.dataFields.valueY = "salesAcc";
		
		series.columns.template.tooltipText = 
			"[bold]{valueY}[/]";
		series.columns.template.fill = am4core.color('#0489B1');
		series.columns.template.fillOpacity = 0.7;
		series.columns.template.stroke = am4core.color('black');
		
		var columnTemplate = series.columns.template;
		columnTemplate.strokeWidth = 1;
		columnTemplate.strokeOpacity = 0.7;
		
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
						code += data.mar[i].mvo.name;
						code += "</td><td class='comment'>";
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
						code += data.mar[i].mvo.name;
						code += "</td><td class='comment'>";
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