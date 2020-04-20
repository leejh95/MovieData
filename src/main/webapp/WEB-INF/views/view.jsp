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

<title>Insert title here</title>
    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">
    
<style type="text/css">

	#view_wrap{
		width: 1000px;
		margin: 0 auto;
	}
	#left {
		margin-right: 100px;
		margin-left: 20px;
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
	#commentList{
		border-bottom: 2px solid #373737;
		border-top: 2px solid #373737;
	}
	#commTable{
		border-collapse: collapse;
		width: 1000px;
	}
	#commTable tr{
		border-bottom: 1px solid #dedede;
		height: 40px;
		padding: 10px;
		margin-bottom: 5px;
	}
	#commTable td{
		padding: 5px;
		font-size: 14px;
	}
	#commTable tr td:nth-child(3){
		word-break:break-all;
	}
	
	#comment_div ul{
		height: 50px;
		padding: 10px;
		text-align: center;
		margin: 0 auto;
	}
	#comment_div li{
		margin: 0 10px 0 10px;
		display: inline-block;
	}
	
	.star-rating{position: relative;}
	.star-rating,.star-rating span{width:152px; height:28px; overflow:hidden; background:url(resources/images/star.png)no-repeat; }
	.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; position: absolute; top: 0px; left: 0px;}
	.star-rating div{width:10%; height:28px; position: absolute; top: 0px; left: 0px;}
	.star-rating div:hover{cursor: pointer;}
/* Modified from: https://github.com/mukulkant/Star-rating-using-pure-css */


</style>
</head>
<body>
	<div id="include_header" ></div>
	<br><br><br><br>
	
	<div id="view_wrap">
		<div id="left">
			<c:if test="${vo.image ne null }">
           		<img src="${vo.image }" border="0" alt="" style="width:350px; height:502px; max-width: none;"/>
           	</c:if>
           	<c:if test="${vo.image eq null }">
           		<img src="resources/images/no-image-png-7.png" border="0" alt="" style="width:350px; height:502px; max-width: none;"/>
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
						${avo.actorNm }
						<c:if test="${avo.castNm.length() > 0}">
							(${avo.castNm })
						</c:if>
						 /
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
    <table style="width:1100px; margin:100px auto;">
    	<colgroup>
    		<col width="*"/>
    		<col width="270px"/>
    		<col width="*"/>
    	</colgroup>
    	<tr>
    		<td style="border-bottom:1px solid #b2b2b2; height:13px"></td>
    		<td rowspan="2" align="center"><h3><font color="#2d2d2d">관객수 매출액 통계</font></h3></td>
    		<td style="border-bottom:1px solid #b2b2b2"></td>
    	</tr>
    	<tr><td></td><td></td></tr>
    </table>
    <!-- 컨텐츠 구분선 끝 -->
	
	<div id="view_audi_chart_div" style="width: 1000px; height:550px; margin: 0 auto; padding: 5px;" align="center">
		<h4>불러오는 중입니다...</h4><br>
		<img src="resources/images/loading.gif"/>
	</div>
		
	<div id="comment_div">
		<div id="comment">
			<h4>내 평점 등록하기</h4>
			<hr>
			<c:if test="${sessionScope.memVO ne null}"> 
				
				<textarea rows="3" cols="108" id="comm_content" placeholder="내용을 입력해주세요..."></textarea>
				<div class="wrap-star">
    				<div class='star-rating' width="200px" height="40px" style="float: left;">
        				<span style ="width:0px;"></span>
        				<div onclick="rate(1)" onmouseover="changeStars(1)" onmouseout="resetStars()"></div>
        				<div style="left:10%;" onclick="rate(2)" onmouseover="changeStars(2)" onmouseout="resetStars()"></div>
        				<div style="left:20%;" onclick="rate(3)" onmouseover="changeStars(3)" onmouseout="resetStars()"></div>
        				<div style="left:30%;" onclick="rate(4)" onmouseover="changeStars(4)" onmouseout="resetStars()"></div>
        				<div style="left:40%;" onclick="rate(5)" onmouseover="changeStars(5)" onmouseout="resetStars()"></div>
        				<div style="left:50%;" onclick="rate(6)" onmouseover="changeStars(6)" onmouseout="resetStars()"></div>
        				<div style="left:60%;" onclick="rate(7)" onmouseover="changeStars(7)" onmouseout="resetStars()"></div>
        				<div style="left:70%;" onclick="rate(8)" onmouseover="changeStars(8)" onmouseout="resetStars()"></div>
        				<div style="left:80%;" onclick="rate(9)" onmouseover="changeStars(9)" onmouseout="resetStars()"></div>
        				<div style="left:90%;" onclick="rate(10)" onmouseover="changeStars(10)" onmouseout="resetStars()"></div>
				    </div>
				    <div id="star-label" style="float: left; margin-left: 10px; padding: 5px;"><h6>0</h6></div>
				    <br><br>
				    <h5>나의 평가 : <b id="star-value">0</b>점</h5>
				    <br>
				</div>
				<button type="button" class="btn original-btn" onclick="commSave(this.form)">등록하기</button>
				
			</c:if>
			<c:if test="${sessionScope.memVO eq null}">
				<h6>로그인 정보가 필요합니다...</h6>
			</c:if> 
			<hr>
		</div><br><br>

		<div id="commentList">
			<table id="commTable">
				<colgroup>
					<col width="100px"/>
					<col width="*"/>
					<col width="170px"/>
					<col width="220px"/>
				</colgroup>
				<tbody></tbody>	
			</table>
			<ul></ul>
		</div>
	</div>
	<div id="include_footer"></div>
		
	<script src="resources/js/jquery-3.4.1.min.js"></script>
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
	var cPage = 1;
	var isClicked = false;
	var clicked_index = -1;
	
	$(function(){
		
		$("#include_header").load("header.inc");
		$("#include_footer").load("footer.inc");
		
		setCommList(1);
		
		$(document).on("click", "#editBtn", function(){
			var i = $(this).parent().parent().index();
			if(i > clicked_index && isClicked){
				clicked_index = i-1;
			}else
				clicked_index = i;
			isClicked = true;
			setCommList(cPage);
		});
		
		
	
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
		
		//chart.data = data;
		
		// Increase contrast by taking evey second color
		chart.colors.step = 2;

		// Add data
		chart.data = data;

		// Create axes
		var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
		dateAxis.renderer.minGridDistance = 50;

		// Create series
		function createAxisAndSeries(field, name, opposite, bullet) {
		  var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		  if(chart.yAxes.indexOf(valueAxis) != 0){
		  	valueAxis.syncWithAxis = chart.yAxes.getIndex(0);
		  }
		  
		  var series = chart.series.push(new am4charts.LineSeries());
		  series.dataFields.valueY = field;
		  series.dataFields.dateX = "dTime";
		  series.strokeWidth = 2;
		  series.yAxis = valueAxis;
		  series.name = name;
		  series.tooltipText = "{name}: [bold]{valueY}[/]";
		  series.tensionX = 0.8;
		  series.showOnInit = true;
		  
		  var interfaceColors = new am4core.InterfaceColorSet();
		  
		  switch(bullet) {
		    case "triangle":
		      var bullet = series.bullets.push(new am4charts.Bullet());
		      bullet.width = 12;
		      bullet.height = 12;
		      bullet.horizontalCenter = "middle";
		      bullet.verticalCenter = "middle";
		      
		      var triangle = bullet.createChild(am4core.Triangle);
		      triangle.stroke = interfaceColors.getFor("background");
		      triangle.strokeWidth = 2;
		      triangle.direction = "top";
		      triangle.width = 12;
		      triangle.height = 12;
		      break;
		    case "rectangle":
		      var bullet = series.bullets.push(new am4charts.Bullet());
		      bullet.width = 10;
		      bullet.height = 10;
		      bullet.horizontalCenter = "middle";
		      bullet.verticalCenter = "middle";
		      
		      var rectangle = bullet.createChild(am4core.Rectangle);
		      rectangle.stroke = interfaceColors.getFor("background");
		      rectangle.strokeWidth = 2;
		      rectangle.width = 10;
		      rectangle.height = 10;
		      break;
		    default:
		      var bullet = series.bullets.push(new am4charts.CircleBullet());
		      bullet.circle.stroke = interfaceColors.getFor("background");
		      bullet.circle.strokeWidth = 2;
		      break;
		  }
		  
		  valueAxis.renderer.line.strokeOpacity = 1;
		  valueAxis.renderer.line.strokeWidth = 2;
		  valueAxis.renderer.line.stroke = series.stroke;
		  valueAxis.renderer.labels.template.fill = series.stroke;
		  valueAxis.renderer.opposite = opposite;
		}

		createAxisAndSeries("audiAcc", "관객수", false, "circle");
		createAxisAndSeries("salesAcc", "매출액", true, "triangle");

		// Add legend
		chart.legend = new am4charts.Legend();

		// Add cursor
		chart.cursor = new am4charts.XYCursor();

		// generate some random data, quite different range
		function generateChartData() {
		  var chartData = [];
		  var firstDate = new Date();
		  firstDate.setDate(firstDate.getDate() - 100);
		  firstDate.setHours(0, 0, 0, 0);

		  var visits = 1600;
		  var hits = 2900;
		  var views = 8700;

		  for (var i = 0; i < 15; i++) {
		    // we create date objects here. In your data, you can have date strings
		    // and then set format of your dates using chart.dataDateFormat property,
		    // however when possible, use date objects, as this will speed up chart rendering.
		    var newDate = new Date(firstDate);
		    newDate.setDate(newDate.getDate() + i);

		    visits += Math.round((Math.random()<0.5?1:-1)*Math.random()*10);
		    hits += Math.round((Math.random()<0.5?1:-1)*Math.random()*10);
		    views += Math.round((Math.random()<0.5?1:-1)*Math.random()*10);

		    chartData.push({
		      date: newDate,
		      visits: visits,
		      hits: hits,
		      views: views
		    });
		  }
		  return chartData;
		}

		
	}

	function setCommList(nowPage){
		
		cPage = nowPage;
		
		$.ajax({
			url: "postCommList.inc",
			type: "post",
			data: "movieCd=${movieCd}&nowPage="+nowPage,
			dataType: "json"
		}).done(function(data){
			var msg = "";
			
			if(data.ar != undefined){
				
				for(var i=0; i<data.ar.length; i++){
					msg += "<tr><input type='hidden' value='"+data.ar[i].c_idx+"'/>"
					msg += "<td>"+data.ar[i].mvo.name+"</td>";
					msg += "<td>"+data.ar[i].content+"</td>";
					msg += "<td><img src='resources/images/star"+data.ar[i].rate+".png' width='90px'>&nbsp;"+data.ar[i].rate+" 점</td>";
					msg += "<td align='right'>"+data.ar[i].write_date.substring(5, 19)+"&nbsp";
					
					if(data.ar[i].m_idx == "${sessionScope.memVO.m_idx}" || "${sessionScope.memVO.status}" == "2"){
						msg += "<a href='javascript:commDel("+data.ar[i].c_idx+")'>[삭제]</a>&nbsp;";
						msg += "<a href='javascript:' id='editBtn'>[수정]</a>";
					}
					
					msg += "</td></tr>";
				}
				//위에서 작업된 html코드를 tbody에 html로 적용한다.
				$("#commTable tbody").html(msg);
				$("#commentList ul").html("");
				$("#commentList ul").append(data.pageCode);
				
				
				if(isClicked){
					commEdit();
				}
				
			}else{
				msg += "<tr><td>이 영화는 아직 평가가 없습니다...</td></tr>"
				$("#commTable tbody").html(msg);
			}
			
		});
		
		
	}
	
	function commSave() {
		var content = $("#comm_content").val();
		var rate = $('#star-value').text();
		var m_idx = $("#m_idx").val();
		var movieCd = $("#movieCd").val();
		
		if(content.length < 1){
			alert("내용을 입력해주세요");
			$("#comm_content").focus();
			return;
		}
		
		var param = "content="+encodeURIComponent(content)+
		"&m_idx=${sessionScope.memVO.m_idx}&movieCd=${movieCd}&rate="+
		encodeURIComponent(rate);
		
		$.ajax({
			url: "commSave.inc",
			type: "post",
			data: param,
			dataType: "json"
		}).done(function(data){
			setCommList(1);
			$("#comm_content").val("");
			$(".star-rating span").css("width", 0);
			$("#star-label").text(0);
			$("#star-value").text(0);
		});
		
	}
    
	function commDel(c_idx) {
		
		var b = confirm("삭제하시겠습니까?");
		if(!b)
			return;
		
		$.ajax({
			url: "commDel.inc",
			type: "post",
			data: "c_idx="+encodeURIComponent(c_idx),
			dataType: "json"
		}).done(function(){
			setCommList(cPage);
		});
	}
	
	function commEdit(){
		var msg = "";
		msg += '<tr style="background-color:#efefef;">';
		msg += '<td>└</td><td><textarea rows="2" cols="60"></textarea></td>';
		msg += '<td><select>';
		msg += '<option value="0" selected>0</option>'
		msg += '<option value="1">1</option>'
		msg += '<option value="2">2</option>'
		msg += '<option value="3">3</option>'
		msg += '<option value="4">4</option>'
		msg += '<option value="5">5</option>'
		msg += '<option value="6">6</option>'
		msg += '<option value="7">7</option>'
		msg += '<option value="8">8</option>'
		msg += '<option value="9">9</option>'
		msg += '<option value="10">10</option>'
		msg += '</select>평점</td>';
		msg += '<td align="right"><a href="javascript:commEdit_ok()">[저장]</a>&nbsp;'
		msg += '<a href="javascript:resetCommList('+cPage+')">[취소]</a></td>'
		msg += '</tr>'
		
		$("#commTable>tbody>tr:nth-child("+(clicked_index+1)+")").after(msg);
	}
	
	function commEdit_ok(){
		var c_idx = $("#commTable>tbody>tr:nth-child("+(clicked_index+1)+") input").val();
		var content = $("#commTable>tbody>tr:nth-child("+(clicked_index+2)+") textarea").val();
		var rate = $("#commTable>tbody>tr:nth-child("+(clicked_index+2)+") select").val();
		
		if(content.length < 1){
			alert("내용을 입력해주세요");
			$("#commTable>tbody>tr:nth-child("+(clicked_index+1)+") input").focus();
			return
		}
		
		var b = confirm("수정하시겠습니까?");
		if(!b)
			return;
		
		$.ajax({
			url: "commEdit.inc",
			type: "post",
			data: "c_idx="+encodeURIComponent(c_idx)+
				  "&content="+encodeURIComponent(content)+
				  "&rate="+encodeURIComponent(rate),
			dataType: "json"
		}).done(function(){
			resetCommList(cPage);
		});
	}
	
	function resetCommList(page){
		isClicked = false;
		setCommList(page);
	}
	
	function goCommListPage(page){
		isClicked = false;
		clicked_index = -1;
		setCommList(page);
	}
	
	function rate(val){
		var val2 = val + "0%";
		$(".star-rating span").css("width", val2);
		$("#star-value").text(val);
	}
	
	function changeStars(val){
		var val2 = val + "0%";
		$(".star-rating span").css("width", val2);
		$("#star-label").text(val);
	}
	
	function resetStars(){
		var val = $("#star-value").text();
		var val2 = val + "0%";
		$(".star-rating span").css("width", val2);
		$("#star-label").text(val);
	}
</script>	
</body>
</html>