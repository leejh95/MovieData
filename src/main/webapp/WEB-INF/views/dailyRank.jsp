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
			    		<td style="border-bottom:1px solid #b2b2b2; height:13px"></td>
			    		<td rowspan="2" align="center">
			    		<h3><font color="#2d2d2d">
			    		${dTime.substring(0,4) }년 ${dTime.substring(4,6)}월 ${dTime.substring(6)}일
			    		</font></h3>
			    		</td>
			    		<td style="border-bottom:1px solid #b2b2b2"></td>
			    	</tr>
			    	<tr><td></td><td></td></tr>
			    </table>
			    <!-- 컨텐츠 구분선 끝 -->
			    
                <c:forEach var="vo" items="${dar }">
                <!-- Single Blog Area -->
                <div class="col-12 col-lg-4">
                    <div class="single-blog-area clearfix mb-100" id="box_card" onclick="location.href='view.inc?movieCd=${vo.movieCd }&dTime=${dTime }'">
                        <!-- Blog Content -->
                        <div class="single-blog-content" style="text-align:center;">
                        	<h4><a class="post-headline" >${vo.rank}위</a></h4>
                            <a style="height: 300px; width: 187px; margin: 0 auto;" class="thumb">
                            	<img src="${vo.image }" border="0" alt="" style="height: 300px; width: 187px;">
                           	</a>
                           	<br>
                           	<h5><b>${vo.movieNm }</b></h5>
                           	<c:if test="${fn:length(vo.openDt) <= 9 }">
                           		<h5><a>개봉일 정보 없음</a></h5>
                           	</c:if>
                           	<c:if test="${fn:length(vo.openDt) > 9  }">
                           		<h5><a>개봉일 ${vo.openDt.substring(0,4) }년 ${vo.openDt.substring(5,7)}월 ${vo.openDt.substring(8)}일</a></h5>                           		
                           	</c:if>
                           	<div class="author-info">
					        <c:if test="${vo.rankOldAndNew eq 'NEW'}">
					            <span class="author-role" style="margin: 10px auto;"><img src="resources/images/new_icon.png" width="40px"></span>
					        </c:if>
					        <c:if test="${vo.rankOldAndNew ne 'NEW' && vo.rankInten > 0}">
					            <span class="author-role" style="color:#ff6666; font-weight:bold; margin: 10px auto;">↑${vo.rankInten }</span>
					        </c:if>
					        <c:if test="${vo.rankOldAndNew ne 'NEW' && vo.rankInten < 0}">
					            <span class="author-role" style="color:#6666ff; font-weight:bold; margin: 10px auto;">↓${vo.rankInten * -1 }</span>
					        </c:if>
					        <c:if test="${vo.rankOldAndNew ne 'NEW' && vo.rankInten eq 0}">
					            <span class="author-role" style="color:#2d2d2d; font-weight:bold; margin: 10px auto;">-</span>
					        </c:if>
					        </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
                <c:if test="${empty dar }">
                <div class="col-12 col-lg-30">
                    <div class="single-blog-area clearfix mb-100">
                        <!-- Blog Content -->
                        <div class="single-blog-content" style="text-align:center;">
                        	<h4>현재 날짜에 박스오피스 정보가 없습니다.</h4>
                        </div>
                    </div>
                </div>
                </c:if>
            </div>
    	</div>
    </div>
    
    <!-- 컨텐츠 구분선 -->
    <table style="width:1600px; margin:50px auto;">
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
    
    <div id="daily_audi_chart_div" style="width: 1200px; height:500px; margin: 0 auto; padding: 5px;" align="center">
    	<h4>불러오는 중입니다...</h4><br>
		<img src="resources/images/loading.gif"/>
    </div>
    
    <!-- 컨텐츠 구분선 -->
    <table style="width:1600px; margin:200px auto 50px auto;">
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
    
    <div id="daily_sales_chart_div" style="width: 1200px; height:500px; margin: 0 auto; padding: 5px;" align="center">
    	<h4>불러오는 중입니다...</h4><br>
		<img src="resources/images/loading.gif"/>
    </div>
    
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
			url: "http://192.168.0.117:5000/dailyGraph.inc?dTime=${dTime}",
			type: 'post',
			dataType: "json"
		}).done(function(data){
			
			$("#daily_audi_chart_div").css("display", "");
			$("#daily_sales_chart_div").css("display", "");
			if(data.length <= 0){
				$("#daily_audi_chart_div").css("display", "none");
				$("#daily_sales_chart_div").css("display", "none");
			}
			dailyAudiChart(data);
			dailySalesChart(data);
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
	
	function dailyAudiChart(data){
		
		am4core.ready(function() {
		
		am4core.useTheme(am4themes_animated);
		
		var chart = am4core.create(
				"daily_audi_chart_div", am4charts.XYChart);

		chart.data = data;
		
		// x축 만들기
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
		
		// y축 만들기
		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.renderer.minGridDistance = 10;
		valueAxis.title.text = "누적 관객수";
		
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
		var series = chart.series.push(new am4charts.ColumnSeries());
		series.dataFields.categoryX = "movieNm";
		series.dataFields.valueY = "audiAcc";
		
		series.columns.template.tooltipText = "[bold]{valueY}[/]";
		series.columns.template.fillOpacity = .8;
		series.columns.template.fill = am4core.color('#B4B4DC');
		series.columns.template.stroke = am4core.color('#B4B4DC');
		
		var columnTemplate = series.columns.template;
		columnTemplate.strokeWidth = 2;
		columnTemplate.strokeOpacity = 0;
		
		});
	}
	
	function dailySalesChart(data){
		
		am4core.ready(function() {
		
		am4core.useTheme(am4themes_animated);
		
		var chart = am4core.create("daily_sales_chart_div", am4charts.XYChart);
		
		chart.data = data;
		
		// x축 만들기
		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "movieNm";
		categoryAxis.renderer.grid.template.location = 0;
		categoryAxis.renderer.labels.template.fontSize = 12;
		categoryAxis.renderer.minGridDistance = 30;
		
		categoryAxis.renderer.labels.template.adapter.add("dy", function(dy, target) {
			  if (target.dataItem && target.dataItem.index & 2 == 2) {
			    return dy + 25;
			  }
			  return dy;
			});
		
		// y축 만들기
		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.renderer.minGridDistance = 10;
		valueAxis.title.text = "누적 매출액";
		
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
		var series = chart.series.push(new am4charts.ColumnSeries());
		series.dataFields.categoryX = "movieNm";
		series.dataFields.valueY = "salesAcc";
		
		series.columns.template.tooltipText = "[bold]{valueY}[/]";
		series.columns.template.fillOpacity = .8;
		series.columns.template.fill = am4core.color('#B4B4DC');
		series.columns.template.stroke = am4core.color('#B4B4DC');
		
		var columnTemplate = series.columns.template;
		columnTemplate.strokeWidth = 2;
		columnTemplate.strokeOpacity = 0;

		}); // end am4core.ready()
	}
    </script>
</body>
</html>