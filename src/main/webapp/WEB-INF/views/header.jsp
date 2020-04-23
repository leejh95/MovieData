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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style type="text/css">
#stickyNav{
background-color: #7D8084;
height: 60px;
}

#stickyNav *{
color: white;
}
#stickyNav li{
width: 150px;
margin:0;
text-align: center;
}
#stickyNav li span{
display: none;
}
#stickyNav li a{
font-weight: bold;
font-size: 18px;
width: 100%;
height: 60px;
line-height: 60px;
}
#stickyNav li:hover{
background-color: white;
}
#stickyNav li:hover a{
color: #343434;
}
#search-wrapper *{
color: #343434;
}

</style>
</head>
<body>
    <!--  
    <div id="preloader">
        <div class="preload-content">
            <div id="original-load"></div>
        </div>
    </div>
	-->
    <!-- Subscribe Modal -->
    

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Top Header Area -->
        <div class="top-header">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <!-- Breaking News Area -->
                    <div class="col-12 col-sm-8">
                        <div class="breaking-news-area">
                            <div id="breakingNewsTicker" class="ticker">
                            </div>
                        </div>
                    </div>
                    <!-- Top Social Area -->
                    <div class="col-12 col-sm-4">
                        <div class="top-social-area">
                        <c:if test="${sessionScope.memVO ne null}">
							  <span>${sessionScope.memVO.name }님 환영합니다!</span>
							  <c:if test="${sessionScope.memVO.sns_type eq null}">
					          	<a href="javascript:location.href='profile.inc?m_idx=${sessionScope.memVO.m_idx }'" data-toggle="tooltip" data-placement="bottom" title="MyPage"><i class="fas fa-user-circle" ></i></a>
					          </c:if>
					          <c:if test="${sessionScope.memVO.sns_type eq 'naver'}">
					          	<a href="http://naver.com" data-toggle="tooltip" data-placement="bottom" title="NAVER"><i class="fas fa-user-circle" ></i></a>
					          </c:if>
					          <c:if test="${sessionScope.memVO.sns_type eq 'google'}">
					          	<a href="http://google.com" data-toggle="tooltip" data-placement="bottom" title="GOOGLE"><i class="fas fa-user-circle" ></i></a>
					          </c:if>			
					          <a href="javascript:location.href='signout.inc'" data-toggle="tooltip" data-placement="bottom" title="SignOut"><i class="fas fa-sign-out-alt"></i></a>
						</c:if>	
						<c:if test="${sessionScope.memVO eq null}">
                            <a href="javascript:location.href='signIn.inc'" data-toggle="tooltip" data-placement="bottom" title="Login"><i class="fas fa-sign-in-alt"></i></a>
                            <a href="javascript:location.href='signUp.inc'" data-toggle="tooltip" data-placement="bottom" title="Registry"><i class="fas fa-registered"></i></a>
						</c:if>
						<c:if test="${sessionScope.memVO ne null and sessionScope.memVO.status eq 2}">
                            <a href="javascript:location.href='adminPage.inc'" data-toggle="tooltip" data-placement="bottom" title="Admin"><i class="fas fa-user-cog"></i></a>
						</c:if>
						
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Logo Area -->
        <div class="logo-area text-center">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                        <a href="index.inc" class="original-logo"><img src="resources/images/header_klogo (1).png" alt="" style="height: 167px;"></a>
                    </div>
                </div>
            </div>
        </div>
        <br>
        
        <!-- 광고 영역 -->
        <c:if test="${fn:length(header_ad) < 1 }">
        <div style="text-align: center; border: 1px black solid;  width:1080px; height: 211px; margin:auto;">
            <div style="height: 211px;">
                <h1><a href="" class="original-logo">광고구함</a></h1>
            </div>
        </div>
        </c:if> 
        <c:if test="${fn:length(header_ad) > 0 }">
        <div style="text-align: center;  width:1080px; height: 211px; margin:auto;">
            <div style="height: 211px; background-image: url('resources/upload/${header_ad[0].image}'); background-repeat: no-repeat;">
                <a href="${header_ad[0].href }" class="original-logo" style="display: block; width: 100%; height: 100%;"></a>
            </div>
        </div>
        </c:if>
	    <br>
	    
        <!-- Nav Area -->
        <div class="original-nav-area" id="stickyNav">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Classy Menu -->
                    <nav class="classy-navbar justify-content-between" style="height: 60px;">

                        <!-- Subscribe btn -->
                        <div class="subscribe-btn">
                        </div>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"/>
                        </div>

						
                        <!-- Menu -->
                        <div class="classy-menu" id="originalNav" style="float:right; display: inline-block;">
                            <!-- close btn -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="index.inc">Home</a></li>
                                    <li><a href="javascript:location.href='boxofficeRank.inc'">박스오피스</a></li>
                                   
                                    <li><a href="javascript:location.href='list.inc?category=review'">리뷰게시판</a></li>
                                     <li><a href="#">Contact</a>
                                        <ul class="dropdown" id="dropdown">
                                            <li><a href="javascript:location.href='list.inc?category=qna'">Q&A</a></li>
                                            <li><a href="javascript:location.href='contact.inc'">FAQ</a></li>
                                        </ul>
                                    </li>
                                </ul>

                    		<!-- Search Form  -->
                                <div id="search-wrapper" style="float:right;">
                                    	<select name="type" style="width:70px; height: 25px; border-radius: 3px; font-size: 13px;" id="select_type">
											<option value="0">제목</option>
											<option value="1">감독명</option>
											<option value="2">개봉년도</option>
										</select>
                                        <input type="text" id="search" placeholder="Search something..." style="background-color: white;">
                                        <div id="close-icon"></div>
                                        <input class="d-none" type="submit" value="">
                                </div>
                                
                            </div>
                            <!-- Nav End -->
                            
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
 
	
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
		$(function(){
			
			$("#search").keydown(function(key) {
				if (key.keyCode == 13) {
					var type = document.getElementById("select_type").value;
					var value = document.getElementById("search").value;
					location.href="search.inc?type="+type+"&value="+value;
				}
			});
			
		});
		
	</script>
</body>
</html>