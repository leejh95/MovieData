<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    #list_tr:hover{
    	background-color: #ededed;
    }
    </style>
</head>
<body>
	<div class="hero-area" style="width: 100%; margin: 0 auto; background-color: #151515;">
        <!-- Hero Slides Area -->
        <div class="hero-slides owl-carousel"  style="width: 1400px; margin: 0 auto;">
            <!-- Single Slide -->
            <c:forEach var="vo" items="${dar }">
            <div class="single-hero-slide bg-img" style="background-image: url(${vo.image }); width: 300px; height:500px; margin:70px auto;" >
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="slide-content text-center">
                                <div class="post-tag">
                                    <a href="javascript:goView('${vo.movieCd }')" data-animation="fadeInUp">${vo.rank}위</a>
                                </div>
                                <h2 data-animation="fadeInUp" data-delay="250ms"><a href="javascript:goView('${vo.movieCd }')">${vo.movieNm }</a></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>  
        </div>
    </div>
    <div style="bmargin-bottom: 10px; margin-top: 150px;">
    
    <!-- 컨텐츠 구분선 -->
    <table style="width:1100px; margin:20px auto;">
    	<colgroup>
    		<col width="*"/>
    		<col width="570px"/>
    		<col width="*"/>
    	</colgroup>
    	<tr>
    		<td style="border-bottom:1px solid #b2b2b2; height:13px"></td>
    		<td rowspan="2" align="center"><h3><font color="#2d2d2d">일별 박스오피스 순위 (${date })</font></h3></td>
    		<td style="border-bottom:1px solid #b2b2b2"></td>
    	</tr>
    	<tr><td></td><td></td></tr>
    </table>
    <!-- 컨텐츠 구분선 끝 -->
    
    <table style="width: 1000px; height:50px; margin: 0 auto; padding: 5px;">
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
    	
    	<c:forEach var="rvo" items="${dar }">
	    	<tr style="border-bottom:1px solid #b2b2b2; height:45px;" id="list_tr">
	    		<td style="padding: 5px;  text-align: center;">
			        <div class="author-thumbnail">
			            ${rvo.rank}위
			        </div>
			    </td>
			    <td style="padding: 5px;">    
			        <div class="author-info">
			            <a href="javascript:goView('${vo.movieCd }')" style="font-size: 18px; font-weight: bold;">${rvo.movieNm }</a>
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
    
    <!-- 컨텐츠 구분선 -->
    <table style="width:1600px; margin:200px auto 20px auto;">
    	<colgroup>
    		<col width="*"/>
    		<col width="610px"/>
    		<col width="*"/>
    	</colgroup>
    	<tr>
    		<td style="border-bottom:1px solid #b2b2b2; height:13px"></td>
    		<td rowspan="2" align="center"><h3><font color="#2d2d2d">1위부터 10위 누적관객수 (${date })</font></h3></td>
    		<td style="border-bottom:1px solid #b2b2b2"></td>
    	</tr>
    	<tr><td></td><td></td></tr>
    </table>
    <!-- 컨텐츠 구분선 끝 -->
    
    <div id="chart_div" style="width: 1600px; height:500px; margin: 50px auto; padding: 5px; color:white;"></div>
     
	<!-- Popper js -->
    <script src="resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
	$.ajax({
        url: "http://192.168.0.117:5000/dailyGraph.inc?dTime=${yesterday}",
        type: 'post',
        dataType: "json"
     }).done(function(data){
        //console.log("확인")
        viewChart(data);
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

	function viewChart(data){
		
		am4core.useTheme(am4themes_animated);
		
		var chart = am4core.create(
				"chart_div", am4charts.XYChart);

		chart.data = data;
		
		// x축 만들기
		var categoryAxis = 
		chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "movieNm";
		
		categoryAxis.renderer.labels.template.fontSize = 12;
		categoryAxis.renderer.minGridDistance = 30;
		
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
		var series = chart.series.push(
				new am4charts.ColumnSeries());
		series.dataFields.categoryX = "movieNm";
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
</script>
</body>
</html>