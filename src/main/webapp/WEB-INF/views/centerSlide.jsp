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
	<div class="hero-area">
        <!-- Hero Slides Area -->
        <div class="hero-slides owl-carousel"  style="width: 1400px; margin: 10px auto">
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
    <h4 style="text-align: center">DailyBoxOffice (${date })</h4>
    <table style="width: 1000px; height:50px; margin: 0 auto; padding: 5px;">
    	<colgroup>
    		<col width="50px;" />
    		<col width="*;" />
    		<col width="180px;" />
    		<col width="130px;" />
    		<col width="130px;" />
    	</colgroup>
    	<tr style="text-align: center">
    		<td style="padding: 0; height:50px;">순위</td>
    		<td style="padding: 0; height:50px;">제목</td>
    		<td style="padding: 0; height:50px;">매출액</td>
    		<td style="padding: 0; height:50px;">관객수</td>
    		<td style="padding: 0; height:50px;">증감률</td>
    	</tr>
    </table>
    <c:forEach var="rvo" items="${dar }">
    <div class="blog-post-author mt-100 d-flex" style="width: 1000px; height:50px; margin: 0 auto; padding: 5px;">
    <table style="width: 1000px; height:50px;">
    	<colgroup>
    		<col width="50px;" />
    		<col width="*;" />
    		<col width="180px;" />
    		<col width="130px;" />
    		<col width="130px;" />
    	</colgroup>
    	<tr >
    		<td style="padding: 0; height:50px;">
		        <div class="author-thumbnail" style="padding: 0; height:50px; margin: 10px auto;">
		            ${rvo.rank}위
		        </div>
		    </td>
		    <td style="padding: 0; height:50px;">    
		        <div class="author-info" style="padding: 0; height:50px; margin: 10px auto;">
		            <h4><a href="javascript:goView('${vo.movieCd }')" class="author-name">${rvo.movieNm }</a></h4>
		        </div>
		    </td>
		    <td style="padding: 0; height:50px; text-align: center;">
		        <div class="author-info" style="padding: 0; height:50px; margin: 10px auto;">
		            <span class="author-role" style="height:50px;">${rvo.salesAcc }원</span>
		        </div>
		    </td>    
		    <td style="padding: 0; height:50px; text-align: center;">    
		        <div class="author-info" style="padding: 0; height:50px; margin: 10px auto;">
		            <span class="author-role" >${rvo.audiAcc }명</span>
		        </div>
		    </td>    
		    <td style="padding: 0; height:50px; text-align: center;">    
		        <div class="author-info" style="padding: 0; height:50px;">
		        <c:if test="${rvo.rankInten > 0}">
		            <span class="author-role" style="color:blue; margin: 10px auto;">↑${rvo.rankInten }</span>
		        </c:if>
		        <c:if test="${rvo.rankInten < 0}">
		            <span class="author-role" style="color:red; margin: 10px auto;">↓${rvo.rankInten }</span>
		        </c:if>
		        <c:if test="${rvo.rankInten eq 0}">
		            <span class="author-role" style="color:black; margin: 10px auto;">-</span>
		        </c:if>
		        </div>
		    </td>    
        </tr>
    </table>
    </div>
    </c:forEach> 
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
$(document).ready(function () {
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
</script>
</body>
</html>