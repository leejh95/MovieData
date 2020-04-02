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
</head>
<body>
    <div class="blog-wrapper section-padding-100 clearfix">
        <div class="container" >
            <div class="row align-items-end">
            	<div class="col-12 col-lg-12" align="center">
            		<h3>${dTime.substring(0,4) }년 ${dTime.substring(4,6)}월 ${dTime.substring(6)}일</h3>
            		<br>
            	</div>
                <c:forEach var="vo" items="${dar }">
                <!-- Single Blog Area -->
                  <div class="col-12 col-lg-4">
                    <div class="single-blog-area clearfix mb-100">
                        <!-- Blog Content -->
                        <div class="single-blog-content" style="text-align:center;">
                        	<h4><a href="javascript:goView('${vo.movieCd }')" class="post-headline" >${vo.rank}위</a></h4>
                            <a href="javascript:goView('${vo.movieCd }')" style="height: 300px; width: 187px; margin: 0 auto;" class="thumb">
                            	<img src="${vo.image }" border="0" alt="" style="height: 300px; width: 187px;">
                           	</a>
                           	<h5><a href="javascript:goView('${vo.movieCd }')" class="post-headline">${vo.movieNm }</a></h5>
                           	<h5>개봉일 ${vo.openDt }</a></h5>
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
    
    
    <div id="chart_div" style="width: 1600px; height:500px; margin: 0 auto; padding: 5px;"></div>
	
	
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
			url: "http://192.168.0.117:5000/dailyGraph.inc?dTime=${dTime}",
			type: 'post',
			dataType: "json"
		}).done(function(data){
			if(data.length > 0){
				viewChart(data);
			}else{
				$("#chart_div").css("display", "none");
			}
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