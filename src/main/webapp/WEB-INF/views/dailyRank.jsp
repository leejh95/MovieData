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
    #chart_div{
		width: 1000px;
		height: 300px;
	}
    </style>
</head>
<body>
    <div class="blog-wrapper section-padding-100 clearfix">
        <div class="container">
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
    <div id="chart_div"></div>
	
	<!-- Popper js -->
    <script src="resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>
    <script src="resources/js/jquery-3.4.1.min.js"></script>
    
    <script>
    $(function(){
		
		$.ajax({
			url: "http://192.168.0.117:5000/dailyGraph.inc?dTime=${dTime}",
			type: 'post',
			dataType: "json"
		}).done(function(data){
			viewChart(data);
		});
		
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
		var valueAxis = 
		chart.yAxes.push(new am4charts.ValueAxis());
		
		//Series 만들기
		var series = chart.series.push(
				new am4charts.ColumnSeries());
		series.dataFields.categoryX = "movieNm";
		series.dataFields.valueY = "audiAcc";
		
		series.columns.template.tooltipText = 
			"[bold]{valueY}[/]";
		series.columns.template.fill = 
			am4core.color('#6e6eff');
		series.columns.template.fillOpacity = 0.7;
		series.columns.template.stroke = 
			am4core.color('#ff0000');
		
		var columnTemplate = series.columns.template;
		columnTemplate.strokeWidth = 1;
		columnTemplate.strokeOpacity = 0.7;
	}
    </script>
</body>
</html>