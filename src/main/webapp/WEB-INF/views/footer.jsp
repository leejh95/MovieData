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
</head>
<body>
<!-- ##### Footer Area Start ##### -->
	        
<div style="width: 100%; height: 1px; background-color: #d2d2d2"></div>
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
        
    <footer class="footer-area text-center">
        <div class="container">
            <div class="row">
                <div class="col-12">
                   
                    <!-- Footer Nav Area -->
                    <div class="classy-nav-container breakpoint-off">
                        <!-- Classy Menu -->
                        <nav class="classy-navbar justify-content-center">
                            <!-- Menu -->
                            <div class="classy-menu">

                                <!-- close btn -->
                                <div class="classycloseIcon">
                                    <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                                </div>
                            </div>
                        </nav>
                    </div>
                    
                    <!-- Footer Social Area -->
                    <div class="footer-social-area mt-30">
                        <a href="https://www.facebook.com/" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a>
                        <a href="https://twitter.com/?lang=ko" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a>
                        <a href="https://www.instagram.com/?hl=ko" data-toggle="tooltip" data-placement="top" title="Instargram"><i class="fab fa-instagram"></i></i></a>
                        <a href="https://www.google.co.kr/" data-toggle="tooltip" data-placement="top" title="Google"><i class="fab fa-google"></i></a>
                    </div>
                </div>
            </div>
        </div>

   <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;2020 All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

    </footer>
	
	<!-- Popper js -->
    <script src="resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>
</body>
</html>