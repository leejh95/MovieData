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
    <link rel="stylesheet" href="resources/css/jquery-ui.min.css">
    <script src="resources/js/jquery-ui.js"></script>
    <style type="text/css">
    #list_tr:hover{
    	background-color: #ededed;
    }
    
  #slide_ul,#slide_ul li{list-style:none;}
  #slide{position:relative;overflow:hidden;}
  #slide ul{width:400%;height:100%;transition:2s;}
  #slide ul:after{content:"";display:block;clear:both;}
  #slide li{float:left;width:25%;height:100%;}
  #slide input{display:none;}
  #slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
  #slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;}
  #pos1:checked~ul{margin-left:0%;}
  #pos2:checked~ul{margin-left:-100%;}
  #pos3:checked~ul{margin-left:-200%;}
  #pos4:checked~ul{margin-left:-300%;}
  #pos1:checked~.pos>label:nth-child(1){background:#666;}
  #pos2:checked~.pos>label:nth-child(2){background:#666;}
  #pos3:checked~.pos>label:nth-child(3){background:#666;}
  #pos4:checked~.pos>label:nth-child(4){background:#666;}
  #slide_contents{height:600px; width: 1180px; margin: auto; position: relative;}
  #slide_contents>div{display: inline-block;}
  #slide_contents>div:nth-child(1){position: absolute; top: 20px; left: 30px;}
  #slide_contents>div:nth-child(2){position: absolute; left: 450px;}
    </style>
</head>
<body>

	<div id="include_header"></div>

	<div id="slide" style="background-image: url('resources/images/spotlight-background.png'); background-repeat: no-repeat; background-size : cover; padding-top:100px;">
	<div style="width:1600px; margin:auto; position: relative;">
		<input type="radio" name="pos" id="pos1" checked>
		<input type="radio" name="pos" id="pos2">
		<input type="radio" name="pos" id="pos3">
		<input type="radio" name="pos" id="pos4">
		<ul id="slide_ul">
			<!-- 일간 랭크 -->
			<li>
				<div>
				
					 <!-- 컨텐츠 구분선 -->
				    <table style="width:1100px; margin:20px auto;">
				    	<colgroup>
				    		<col width="*"/>
				    		<col width="570px"/>
				    		<col width="*"/>
				    	</colgroup>
				    	<tr>
				    		<td style="border-bottom:1px solid #b2b2b2; height:13px"></td>
				    		<td rowspan="2" align="center"><h3><font color="#2d2d2d">어제의 박스오피스 순위 (${date })</font></h3></td>
				    		<td style="border-bottom:1px solid #b2b2b2"></td>
				    	</tr>
				    	<tr><td></td><td></td></tr>
				    </table>
				    <!-- 컨텐츠 구분선 끝 -->
				    
				    <div id="slide_contents">
					    <div>
							<img id="poster" src="${dar[0].image }" width="350px" height="450px">
						</div>
						
						<div>
						    <table style="width: 700px; height:50px; padding: 5px;">
						    	<colgroup>
						    		<col width="50px;" />
						    		<col width="*;" />
						    		<col width="180px;" />
						    		<col width="130px;" />
						    		<col width="130px;" />
						    	</colgroup>
						    	<tr style="text-align: center; height:50px; color:#2d2d2d; font-size:18px; font-weight: bold; border-bottom: 2px solid #2d2d2d;">
						    		<td>순위</td>
						    		<td>제목</td>
						    		<td>매출액</td>
						    		<td>관객수</td>
						    		<td>증감률</td>
						    	</tr>
						    	
						    	<c:forEach var="rvo" items="${dar }" varStatus="st">
						    		
							    	<tr style="border-bottom:1px solid #b2b2b2; height:45px;" id="list_tr" class="list_tr">
							    		<input type="hidden" value="${rvo.image }" name="imgSrc"/>
							    		
							    		<td style="padding: 5px;  text-align: center;">
									        <div class="author-thumbnail">
									            ${rvo.rank}위
									        </div>
									    </td>
									    <td style="padding: 5px; overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">    
									        <div class="author-info">
									            <a href="javascript:location.href='view.inc?movieCd=${rvo.movieCd }&dTime=${yesterday }'" style="font-size: 18px; font-weight: bold;">${rvo.movieNm }</a>
									        </div>
									    </td>
									    <td style="padding: 5px; text-align: center;">
									        <div class="author-info">
									            <span class="author-role" style="height:50px;">${rvo.salesAcc }원</span>
									        </div>
									    </td>    
									    <td style="padding: 5px; text-align: center;">    
									        <div class="author-info">
									            <span class="author-role" >${rvo.audiAcc }명</span>
									        </div>
									    </td>    
									    <td style="padding: 5px; text-align: center;">    
									        <div class="author-info">
									        <c:if test="${rvo.rankOldAndNew eq 'NEW'}">
									            <span class="author-role" style="margin: 10px auto;"><img src="resources/images/new_icon.png" width="40px"></span>
									        </c:if>
									        <c:if test="${rvo.rankOldAndNew ne 'NEW' && rvo.rankInten > 0}">
									            <span class="author-role" style="color:#ff6666; font-weight:bold; margin: 10px auto;">↑${rvo.rankInten }</span>
									        </c:if>
									        <c:if test="${rvo.rankOldAndNew ne 'NEW' && rvo.rankInten < 0}">
									            <span class="author-role" style="color:#6666ff; font-weight:bold; margin: 10px auto;">↓${rvo.rankInten * -1 }</span>
									        </c:if>
									        <c:if test="${rvo.rankOldAndNew ne 'NEW' && rvo.rankInten eq 0}">
									            <span class="author-role" style="color:#2d2d2d; font-weight:bold; margin: 10px auto;">-</span>
									        </c:if>
									        </div>
									    </td>    
							        </tr>
						    	</c:forEach>
							</table>
					    </div>
					</div>
					
				</div>
			</li>
			
			<!-- 주간 랭크 -->
			<li>
				<div>
						 <!-- 컨텐츠 구분선 -->
					    <table style="width:1100px; margin:20px auto;">
					    	<colgroup>
					    		<col width="*"/>
					    		<col width="570px"/>
					    		<col width="*"/>
					    	</colgroup>
					    	<tr>
					    		<td style="border-bottom:1px solid #b2b2b2; height:25px"></td>
					    		<td rowspan="2" align="center">
					    		<h3><font color="#2d2d2d">
					    		지난 주 박스오피스 순위<br>
					    		(${beginWeekDay } ~ ${endWeekDay })
					    		</font></h3>
					    		</td>
					    		<td style="border-bottom:1px solid #b2b2b2"></td>
					    	</tr>
					    	<tr><td></td><td></td></tr>
					    </table>
					    <!-- 컨텐츠 구분선 끝 -->
					    
					    <div id="slide_contents">
						    <div>
								<img id="poster" src="${war[0].image }" width="350px" height="450px">
							</div>
							
							<div>
							    <table style="width: 700px; height:50px; padding: 5px;">
							    	<colgroup>
							    		<col width="50px;" />
							    		<col width="*;" />
							    		<col width="180px;" />
							    		<col width="130px;" />
							    		<col width="130px;" />
							    	</colgroup>
							    	<tr style="text-align: center; height:50px; color:#2d2d2d; font-size:18px; font-weight: bold; border-bottom: 2px solid #2d2d2d;">
							    		<td>순위</td>
							    		<td>제목</td>
							    		<td>매출액</td>
							    		<td>관객수</td>
							    		<td>증감률</td>
							    	</tr>
							    	
							    	<c:forEach var="wvo" items="${war }" varStatus="st">
							    		
								    	<tr style="border-bottom:1px solid #b2b2b2; height:45px;" id="list_tr" class="list_tr">
								    		<input type="hidden" value="${wvo.image }" name="imgSrc2"/>
								    		
								    		<td style="padding: 5px;  text-align: center;">
										        <div class="author-thumbnail">
										            ${wvo.rank}위
										        </div>
										    </td>
										    <td style="padding: 5px; overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">    
										        <div class="author-info">
										            <a href="javascript:location.href='view.inc?movieCd=${wvo.movieCd }&dTime=${lastweek }'" style="font-size: 18px; font-weight: bold;">${wvo.movieNm }</a>
										        </div>
										    </td>
										    <td style="padding: 5px; text-align: center;">
										        <div class="author-info">
										            <span class="author-role" style="height:50px;">${wvo.salesAcc }원</span>
										        </div>
										    </td>    
										    <td style="padding: 5px; text-align: center;">    
										        <div class="author-info">
										            <span class="author-role" >${wvo.audiAcc }명</span>
										        </div>
										    </td>    
										    <td style="padding: 5px; text-align: center;">    
										        <div class="author-info">
										        <c:if test="${wvo.rankOldAndNew eq 'NEW'}">
										            <span class="author-role" style="margin: 10px auto;"><img src="resources/images/new_icon.png" width="40px"></span>
										        </c:if>
										        <c:if test="${wvo.rankOldAndNew ne 'NEW' && wvo.rankInten > 0}">
										            <span class="author-role" style="color:#ff6666; font-weight:bold; margin: 10px auto;">↑${wvo.rankInten }</span>
										        </c:if>
										        <c:if test="${wvo.rankOldAndNew ne 'NEW' && wvo.rankInten < 0}">
										            <span class="author-role" style="color:#6666ff; font-weight:bold; margin: 10px auto;">↓${wvo.rankInten * -1 }</span>
										        </c:if>
										        <c:if test="${wvo.rankOldAndNew ne 'NEW' && wvo.rankInten eq 0}">
										            <span class="author-role" style="color:#2d2d2d; font-weight:bold; margin: 10px auto;">-</span>
										        </c:if>
										        </div>
										    </td>    
								        </tr>
							    	</c:forEach>
								</table>
						    </div>
						</div>
						
					</div>
				</li>
				
				<!-- 전일 대비 매출액 증감률 -->
				<li>
					<div>
					
						<!-- 컨텐츠 구분선 -->
					    <table style="width:1100px; margin:20px auto;">
					    	<colgroup>
					    		<col width="*"/>
					    		<col width="570px"/>
					    		<col width="*"/>
					    	</colgroup>
					    	<tr>
					    		<td style="border-bottom:1px solid #b2b2b2; height:13px"></td>
					    		<td rowspan="2" align="center">
					    		<h3><font color="#2d2d2d">
					    		전일 대비 매출액 증감률(${date })
					    		</font></h3>
					    		</td>
					    		<td style="border-bottom:1px solid #b2b2b2"></td>
					    	</tr>
					    	<tr><td></td><td></td></tr>
					    </table>
					    <!-- 컨텐츠 구분선 끝 -->
					    
					    <div id="slide_contents">
						    <div>
								<img id="poster" src="${dar[0].image }" width="350px" height="450px">
							</div>
							
							<div>
							    <table style="width: 700px; height:50px; padding: 5px;">
							    	<colgroup>
							    		<col width="55px;" />
							    		<col width="*;" />
							    		<col width="130px;" />
							    		<col width="150px;" />
							    		<col width="170px;" />
							    	</colgroup>
							    	<tr style="text-align: center; height:50px; color:#2d2d2d; font-size:18px; font-weight: bold; border-bottom: 2px solid #2d2d2d;">
							    		<td>순위</td>
							    		<td>제목</td>
							    		<td>매출액</td>
							    		<td>전일대비증감분</td>
							    		<td>누적매출액</td>
							    	</tr>
							    	
							    	<c:forEach var="dvo" items="${dar }" varStatus="st">
							    		
								    	<tr style="border-bottom:1px solid #b2b2b2; height:45px;" id="list_tr" class="list_tr">
								    		<input type="hidden" value="${dvo.image }" name="imgSrc"/>
								    		
								    		<td style="padding: 5px;  text-align: center;">
										        <div class="author-thumbnail">
										            ${dvo.rank}위
										        </div>
										    </td>
										    <td style="padding: 5px; overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">    
										        <div class="author-info">
										            <a href="javascript:location.href='view.inc?movieCd=${dvo.movieCd }&dTime=${yesterday }'" style="font-size: 18px; font-weight: bold;">${dvo.movieNm }</a>
										        </div>
										    </td>
										    <td style="padding: 5px; text-align: center;">
										        <div class="author-info">
										            <span class="author-role" style="height:50px;">${dvo.salesAmt }원</span>
										        </div>
										    </td>    
										    <td style="padding: 5px; text-align: center;">    
										        <div class="author-info">
										        	<c:if test="${dvo.salesInten.substring(0,1) ne '-'}">
										            	<span class="author-role" style="color:#6666ff; font-weight:bold; margin: 10px auto;">${dvo.salesInten }원</span>
										            </c:if>
										            <c:if test="${dvo.salesInten.substring(0,1) eq '-'}">
										            	<span class="author-role" style="color:#ff6666; font-weight:bold; margin: 10px auto;">${dvo.salesInten }원</span>
										            </c:if>
										        </div>
										    </td>    
										    <td style="padding: 5px; text-align: center;">    
										        <div class="author-info">
										           <span class="author-role" style="font-size: 15px;">${dvo.salesAcc }원</span>
										        </div>
										    </td>    
								        </tr>
							    	</c:forEach>
								</table>
						    </div>
						</div>
					</div>
				</li>
				
				<!-- 전일 대비 관객수 증감률 -->
				<li>
					<div>
					
						<!-- 컨텐츠 구분선 -->
					    <table style="width:1100px; margin:20px auto;">
					    	<colgroup>
					    		<col width="*"/>
					    		<col width="570px"/>
					    		<col width="*"/>
					    	</colgroup>
					    	<tr>
					    		<td style="border-bottom:1px solid #b2b2b2; height:13px"></td>
					    		<td rowspan="2" align="center">
					    		<h3><font color="#2d2d2d">
					    		전일 대비 관객수 증감률(${date })
					    		</font></h3>
					    		</td>
					    		<td style="border-bottom:1px solid #b2b2b2"></td>
					    	</tr>
					    	<tr><td></td><td></td></tr>
					    </table>
					    <!-- 컨텐츠 구분선 끝 -->
					    
					    <div id="slide_contents">
						    <div>
								<img id="poster" src="${dar[0].image }" width="350px" height="450px">
							</div>
							
							<div>
							    <table style="width: 700px; height:50px; padding: 5px;">
							    	<colgroup>
							    		<col width="55px;" />
							    		<col width="*;" />
							    		<col width="130px;" />
							    		<col width="150px;" />
							    		<col width="170px;" />
							    	</colgroup>
							    	<tr style="text-align: center; height:50px; color:#2d2d2d; font-size:18px; font-weight: bold; border-bottom: 2px solid #2d2d2d;">
							    		<td>순위</td>
							    		<td>제목</td>
							    		<td>관객수</td>
							    		<td>전일대비증감분</td>
							    		<td>누적관객수</td>
							    	</tr>
							    	
							    	<c:forEach var="dvo" items="${dar }" varStatus="st">
							    		
								    	<tr style="border-bottom:1px solid #b2b2b2; height:45px;" id="list_tr" class="list_tr">
								    		<input type="hidden" value="${dvo.image }" name="imgSrc"/>
								    		
								    		<td style="padding: 5px;  text-align: center;">
										        <div class="author-thumbnail">
										            ${dvo.rank}위
										        </div>
										    </td>
										    <td style="padding: 5px; overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">    
										        <div class="author-info">
										            <a href="javascript:location.href='view.inc?movieCd=${dvo.movieCd }&dTime=${yesterday }'" style="font-size: 18px; font-weight: bold;">${dvo.movieNm }</a>
										        </div>
										    </td>
										    <td style="padding: 5px; text-align: center;">
										        <div class="author-info">
										            <span class="author-role" style="height:50px;">${dvo.audiCnt }명</span>
										        </div>
										    </td>    
										    <td style="padding: 5px; text-align: center;">    
										        <div class="author-info">
										        	<c:if test="${dvo.audiInten.substring(0,1) ne '-'}">
										            	<span class="author-role" style="color:#6666ff; font-weight:bold; margin: 10px auto;">${dvo.salesInten }명</span>
										            </c:if>
										            <c:if test="${dvo.audiInten.substring(0,1) eq '-'}">
										            	<span class="author-role" style="color:#ff6666; font-weight:bold; margin: 10px auto;">${dvo.salesInten }명</span>
										            </c:if>
										        </div>
										    </td>    
										    <td style="padding: 5px; text-align: center;">    
										        <div class="author-info">
										           <span class="author-role">${dvo.audiAcc }명</span>
										        </div>
										    </td>    
								        </tr>
							    	</c:forEach>
								</table>
						    </div>
						</div>
					</div>
				</li>
				
			</ul>
			
		<p class="pos">
			<label for="pos1"></label>
			<label for="pos2"></label> 
			<label for="pos3"></label> 
			<label for="pos4"></label> 
		</p>
		
		<a href="javascript:changeSlide(0)" id="left_arrow" style="display: block; position: absolute; top: 270px; left: 110px;">
			<img alt="left_arrow" src="resources/images/left_arrow.png" width="120px;"/>
		</a>
		<a href="javascript:changeSlide(1)" id="right_arrow" style="display: block; position: absolute; top: 270px; right: 110px">
			<img alt="right_arrow" src="resources/images/right_arrow.png" width="120px;"/>
		</a>
	</div>
	</div>

	
    
    <!-- 컨텐츠 구분선 -->
    <table style="width:1600px; margin:200px auto 20px auto;">
    	<colgroup>
    		<col width="*"/>
    		<col width="610px"/>
    		<col width="*"/>
    	</colgroup>
    	<tr>
    		<td style="border-bottom:1px solid #b2b2b2; height:13px"></td>
    		<td rowspan="2" align="center"><h3><font color="#2d2d2d">TOP10 누적관객수 (${date })</font></h3></td>
    		<td style="border-bottom:1px solid #b2b2b2"></td>
    	</tr>
    	<tr><td></td><td></td></tr>
    </table>
    <!-- 컨텐츠 구분선 끝 -->
    
    <div id="chart_div_audi" style="width: 1200px; height:500px; margin: 50px auto; padding: 5px; color:white;" align="center">
    	<h4>불러오는 중입니다...</h4><br>
		<img src="resources/images/loading.gif"/>
    </div>
    
    <!-- 컨텐츠 구분선 -->
    <table style="width:1600px; margin:200px auto 20px auto;">
    	<colgroup>
    		<col width="*"/>
    		<col width="610px"/>
    		<col width="*"/>
    	</colgroup>
    	<tr>
    		<td style="border-bottom:1px solid #b2b2b2; height:13px"></td>
    		<td rowspan="2" align="center"><h3><font color="#2d2d2d">TOP10 누적매출액 (${date })</font></h3></td>
    		<td style="border-bottom:1px solid #b2b2b2"></td>
    	</tr>
    	<tr><td></td><td></td></tr>
    </table>
    <!-- 컨텐츠 구분선 끝 -->
	
	<div id="chart_div_sales" style="width: 1200px; height:500px; margin: 50px auto; padding: 5px; color:white;" align="center">
    	<h4>불러오는 중입니다...</h4><br>
		<img src="resources/images/loading.gif"/>
    </div>
	<br><br><br><br><br><br>
	<div id="include_footer"></div> 
	   
     <!-- 다이아로그 팝업창 
    <div id="d1" title="공지사항">
    	<p id="ppp">뿌웅</p>
	</div>	
	-->
	
	<script src="resources/js/jquery-3.4.1.min.js"></script>
    <script src="//www.amcharts.com/lib/4/core.js"></script>
	<script src="//www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
	
<script type="text/javascript">

$(document).ready(function () {
	
	$("#include_header").load("header.inc");
	$("#include_footer").load("footer.inc");
	
	$.ajax({
        url: "http://192.168.0.117:5000/dailyGraph.inc?dTime=${yesterday}",
        type: 'post',
        dataType: "json"
     }).done(function(data){
        viewChart(data);
       	viewChart2(data);
     });
	
	$(".list_tr").mouseover(function(){
		var imgSrc = $(this).children("input").val();
		$(this).parent().parent().parent().parent().find("#poster").attr("src", imgSrc);
	});

});

	function viewChart(data){
		
		am4core.ready(function() {
		
		am4core.useTheme(am4themes_animated);
		// Themes end

		// Create chart instance
		var chart = am4core.create("chart_div_audi", am4charts.XYChart);

		// Add data
		chart.data = data;

		// Create axes

		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "movieNm";
		categoryAxis.renderer.grid.template.location = 0;
		categoryAxis.renderer.minGridDistance = 30;
		categoryAxis.renderer.labels.template.fontSize = 12;

		categoryAxis.renderer.labels.template.adapter.add("dy", function(dy, target) {
		  if (target.dataItem && target.dataItem.index & 2 == 2) {
		    return dy + 25;
		  }
		  return dy;
		});

		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

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
		
		
		// Create series
		var series = chart.series.push(new am4charts.ColumnSeries());
		series.dataFields.valueY = "audiAcc";
		series.dataFields.categoryX = "movieNm";
		series.name = "누적관객수";
		series.columns.template.tooltipText = "{categoryX}: [bold]{valueY}[/]";
		series.columns.template.fillOpacity = .8;
		series.columns.template.fill = am4core.color('#B4B4DC');
		series.columns.template.stroke = am4core.color('#B4B4DC');
		

		var columnTemplate = series.columns.template;
		columnTemplate.strokeWidth = 2;
		columnTemplate.strokeOpacity = 0;

		}); // end am4core.ready()
	}
	
	function viewChart2(data){
		
		am4core.ready(function() {
		
		am4core.useTheme(am4themes_animated);
		// Themes end

		// Create chart instance
		var chart = am4core.create("chart_div_sales", am4charts.XYChart);

		// Add data
		chart.data = data;

		// Create axes

		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "movieNm";
		categoryAxis.renderer.grid.template.location = 0;
		categoryAxis.renderer.minGridDistance = 30;
		categoryAxis.renderer.labels.template.fontSize = 12;

		categoryAxis.renderer.labels.template.adapter.add("dy", function(dy, target) {
		  if (target.dataItem && target.dataItem.index & 2 == 2) {
		    return dy + 25;
		  }
		  return dy;
		});

		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

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
		
		
		// Create series
		var series = chart.series.push(new am4charts.ColumnSeries());
		series.dataFields.valueY = "salesAcc";
		series.dataFields.categoryX = "movieNm";
		series.name = "누적매출액";
		series.columns.template.tooltipText = "{categoryX}: [bold]{valueY}[/]";
		series.columns.template.fillOpacity = .8;
		series.columns.template.fill = am4core.color('#B4B4DC');
		series.columns.template.stroke = am4core.color('#B4B4DC');
		

		var columnTemplate = series.columns.template;
		columnTemplate.strokeWidth = 2;
		columnTemplate.strokeOpacity = 0;

		}); // end am4core.ready()
	}
	
	function changeSlide(num){
		var index = -1;
		var length = $("input[name=pos]").length;
		for(var i=0; i<$("input[name=pos]").length; i++){
			if($("input[name=pos]").eq(i).prop('checked')){
				index = i;
				break;
			}
		}
		
		if(num == 0){
			if(index < 1){
				console.log("0,0");
				$("input[name=pos]").eq(length-1).prop("checked", true);
			}else{
				console.log("0,1");
				$("input[name=pos]").eq(index-1).prop("checked", true);
			}
		}else{
			if(index < length-1){
				$("input[name=pos]").eq(index+1).prop("checked", true);
			}else{
				$("input[name=pos]").eq(0).prop("checked", true);
			}
		}
	}
	
	setInterval(function() {
		
		changeSlide(1);
	
	},8000);
</script>
</body>
</html>