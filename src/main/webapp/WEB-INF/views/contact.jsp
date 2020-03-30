<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">
    <!-- Style CSS -->
    <link rel="stylesheet" href="resources/style.css">
<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<style>
	.kmap{
		width: 100%;
	}
	.kmap2{
		width: 1100px;
		margin: 0 auto;
	}
</style>
</head>
<body>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
	<div class="container">
		<div class="panel panel-default">
	        <div class="panel-heading">
	            <h3 class="panel-title">자주 질문하는 FAQ입니다.</h3>
	        </div>   
	        <ul class="list-group">
	            <li class="list-group-item">
	                <div class="row toggle" id="dropdown-detail-1" data-toggle="detail-1">
	                    <div class="col-xs-10">
	                        Q. 회원 정보 수정 절차
	                    </div>
	                    <div class="col-xs-2"><i class="fa fa-chevron-down pull-right"></i></div>
	                </div>
	                <div id="detail-1">
	                    <hr></hr>
	                    <div class="container">
	                        <div class="fluid-row">
	                            <div class="col-xs-1">
	                                A.
	                            </div>
	                            <div class="col-xs-10">
									로그인 사용자는 마이페이지 > 회원 프로필 메뉴에서 관련 정보를 수정할 수 있습니다.
	                            </div>
	                </div>
	            </li>
	            <li class="list-group-item">
	                <div class="row toggle" id="dropdown-detail-2" data-toggle="detail-2">
	                    <div class="col-xs-10">
	                        Q. 권장 브라우저에 대한 안내
	                    </div>
	                    <div class="col-xs-2"><i class="fa fa-chevron-down pull-right"></i></div>
	                </div>
	                <div id="detail-2">
	                    <hr></hr>
	                    <div class="container">
	                        <div class="fluid-row">
	                            <div class="col-xs-1">
	                                A.
	                            </div>
	                            <div class="col-xs-10">
	                                IE7, Firefox , Chrome , Sapari 이상의 모든 브라우저를 지원합니다.<br/>
	                            	IE8의 버그로 인해 사이트 이용 장애가 있으신 분은 F12 키를 누르신 후 브라우저 모드를 IE7로 변환하시면 됩니다.
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </li>
	            <li class="list-group-item">
	                <div class="row toggle" id="dropdown-detail-3" data-toggle="detail-3">
	                    <div class="col-xs-10">
	                        Q. 개봉작과 상영작의 정의와 집계기준
	                    </div>
	                    <div class="col-xs-2"><i class="fa fa-chevron-down pull-right"></i></div>
	                </div>
	                <div id="detail-3">
	                    <hr></hr>
	                    <div class="container">
	                        <div class="fluid-row">
	                            <div class="col-xs-1">
	                                A.
	                            </div>
	                            <div class="col-xs-10">
	                                1) 개봉작
									제작상태가 '개봉', '개봉예정'이며, 개봉일이 있는 영화 중 관객이 집계되는 영화를 '개봉작'으로 분류합니다.<br/>
									2) 상영작
									제작상태, 영화형태 등과 상관없이 조회기간에 관객이 집계되는 영화 전체를 '상영작'으로 분류합니다. 따라서 상영작은 개봉작 전체를 포함합니다.
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </li>
	            <li class="list-group-item">
	                <div class="row toggle" id="dropdown-detail-4" data-toggle="detail-4">
	                    <div class="col-xs-10">
	                        Q. 공식 통계와 자료의 차이에 대한 설명
	                    </div>
	                    <div class="col-xs-2"><i class="fa fa-chevron-down pull-right"></i></div>
	                </div>
	                <div id="detail-4">
	                    <hr></hr>
	                    <div class="container">
	                        <div class="fluid-row">
	                            <div class="col-xs-1">
	                                A.
	                            </div>
	                            <div class="col-xs-10">
	                                공식통계는 영진위에서 매년 발표하는 “한국영화연감”의 영화별 흥행기록을 참고한 것입니다. 동 수치는 확정치로서 변동하지 않습니다.<br/>
									통합전산망 통계는 통합전산망에 가입한 전국영화상영관들로부터 입수한 실시간 발권데이터를 집계한 수치로 동 수치는 조회조건에 따라 변동됩니다.
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </li>
	        </ul>
		</div>
	</div>
	<div class="kmap">
		<div class="kmap2">
			<h4><strong>오시는 길</strong></h4>
			<div id="map" style="width:500px;height:400px;"></div>
				<b>지하철 이용시 정보</b><br/>
				- 2호선 센텀시티역에서 6번출구, 도보로 10분<br/>
				<b>지하철 이용시 정보</b><br/>
				- SK텔레콤 정류장, 시청자미디어센터 정류장 : 307번, 181번(배차간격 18분)<br/>
				- 시청자미디어센터 정류장 : 115번<br/>
				- 센텀시티역 벡스코점 : 115번, 63번, 40번, 5-1번, 155번, 141번, 181번, 39번, 1001번(급행), 1007번(급행), 1002번(급행)<br/>
				<b>부산역에서 이용시</b><br/>
				- 부산역 버스정류장 40, 1001(급행)이용 , 센텀시티역 벡스코점에서 하차 (소요시간 40~50분)<br/>
				- 부산역 지하철 2호선 이용, 센텀시티역 6번출구 이용(소요시간 40분)<br/>
				<b>기차이용시</b><br/>
				- 서울역에서 부산역까지 KTX로 2시간 40분 소요<br/>
				<b>항공/리무진 이용시</b><br/>
				- 김포공항에서 김해공항 국내선, 50분 소요<br/>
				- 김해공항 리무진에서 센텀신세계백화점까지 50분 소요
		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a079f1d5c767f5ae2c08726bfaeb62d9"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a079f1d5c767f5ae2c08726bfaeb62d9&libraries=LIBRARY"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a079f1d5c767f5ae2c08726bfaeb62d9&libraries=drawing"></script>
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
	
<script>
	$(document).ready(function() {
	    $('[id^=detail-]').hide();
	    $('.toggle').click(function() {
	        $input = $( this );
	        $target = $('#'+$input.attr('data-toggle'));
	        $target.slideToggle();
	    });
	    
	    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	    var options = { //지도를 생성할 때 필요한 기본 옵션
	    	center: new kakao.maps.LatLng(35.173160, 129.127625), //지도의 중심좌표.
	    	level: 3 //지도의 레벨(확대, 축소 정도)
	    };
	
	    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	});
</script>
</body>
</html>