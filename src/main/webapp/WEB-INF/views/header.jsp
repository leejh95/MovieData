<%@page import="mybatis.vo.MovieMemberVO"%>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
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
					          <a href="javascript:goMypage('${sessionScope.memVO.m_idx }')" data-toggle="tooltip" data-placement="bottom" title="MyPage"><i class="fas fa-user-circle" ></i></a>
					          <a href="javascript:location.href='signout.inc'" data-toggle="tooltip" data-placement="bottom" title="SignOut"><i class="fas fa-sign-out-alt"></i></a>
						</c:if>	
						<c:if test="${sessionScope.memVO eq null}">
                            <a href="javascript:location.href='signIn.inc'" data-toggle="tooltip" data-placement="bottom" title="Login"><i class="fas fa-sign-in-alt"></i></a>
                            <a href="javascript:location.href='signUp.inc'" data-toggle="tooltip" data-placement="bottom" title="Registry"><i class="fas fa-registered"></i></a>
						</c:if>
						<c:if test="${sessionScope.memVO ne null and sessionScope.memVO.status eq 2}">
                            <a href="#" data-toggle="tooltip" data-placement="bottom" title="Admin"><i class="fas fa-sign-in-alt"></i></a>
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
                        <a href="index.inc" class="original-logo"><img src="resources/images/boxoffice (1).png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Nav Area -->
        <div class="original-nav-area" id="stickyNav">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Classy Menu -->
                    <nav class="classy-navbar justify-content-between">

                        <!-- Subscribe btn -->
                        <div class="subscribe-btn">
                        </div>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
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
                                   
                                    <li><a href="javascript:goBoxOffice()">박스오피스</a></li>
                                    <li><a href="#">게시판</a>
                                        <ul class="dropdown">
                                            <li><a href="javascript:goBoard('free')">자유게시판</a></li>
                                            <li><a href="javascript:goBoard('review')">리뷰게시판</a></li>
                                        </ul>
                                    </li>
                                   
                                    <li><a href="javascript:goContact()">Contact</a></li>
                                </ul>

                    		<!-- Search Form  -->
                                <div id="search-wrapper" style="float:right;">
                                    	<select name="type" style="width:100px; height: 29px; border-width: 0;" id="select_type">
											<option>선택하세요.</option>
											<option value="0">영화이름</option>
											<option value="1">감독이름</option>
											<option value="2">개봉년도</option>
										</select>
                                        <input type="text" id="search" placeholder="Search something...">
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
					goSearch();
				}
			});
			
		})
		
	</script>
</body>
</html>