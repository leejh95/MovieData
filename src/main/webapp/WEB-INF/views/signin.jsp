<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<head>
    <meta name = "google-signin-client_id"content = "887841589622-j1dblm1i54bkud8gji6a2nm4dv6k778f.apps.googleusercontent.com">
	<meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
   	<!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <link rel="icon" href="Favicon.png">
    <!-- Style CSS -->
    <link rel="stylesheet" href="resources/style.css">
    <title>로그인</title>
    
    <!-- Required meta tags -->

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    
</head>
<body>
	<!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100" style="background-color: #ededed;">
        <div class="container" style="background-color: white; padding: 100px; box-shadow: 0px 5px 5px 1px gray;">
            <div class="row justify-content-center">
                <!-- Contact Form Area -->
                <div class="col-12 col-md-10 col-lg-9">
                    <div class="contact-form">
                        <p align="center"><font size="5" color="#2f2f2f">로그인</font></p>
                        <!-- Contact Form -->
                        <form action="signInForm.inc" method="post">
                            <div class="row">
                                <div class="col-12">
                                    <div class="group">
                                        <input type="text" name="id" id="id" required>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>ID</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="group">
                                        <input type="password" name="pw" id="pw" required>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>Password</label>
                                    </div>
                                </div><br><br><br><br>
                                <div style="width: 175px; margin:auto;">
                                    <button type="submit" class="btn original-btn">로그인</button>
                                </div>
                                <br>
		                        
                            </div>
                        </form>
                        <c:if test="${isFailed }">
                        	<br/><br/>
                        	<div align="center">
                        		<font color="#ff6363">ID 또는 비밀번호가 맞지 않습니다.</font>
                        	</div>
                        </c:if>
                        <br><br>
						<div align="center">
                        	<a href="index.inc" style="color: #2f2f2f; font-weight: bold; margin: 10px;">홈으로가기</a>
                        </div>
                    </div>
                    
                    <br><br><br><br><br>
                    
                    <div>
                        <p align="center"><font size="5px" color="#2f2f2f">외부 계정으로 로그인</font></p>
                        <br><br>
	                    <div align="center">
	                        <a href="${apiURL }"><img width="120" height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
	                    </div>
	                    
	                    <br>
	                    
	                    <div align="center">
		                    <form action="googlelogin.inc" method="post" name="googleform" id="googleform">
								<div class="g-signin2" data-onsuccess="onSignIn"></div>
								<input type="hidden" name="name" id="name"/>
								<input type="hidden" name="email" id="email"/>
								<input type="hidden" name="sns_id" id="sns_id"/>
								<input type="hidden" name="sns_type" id="sns_type"/>
							</form>
						</div>
					</div>
					
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->
    
    <!-- ##### Footer Area Start ##### -->
	<div style="width: 100%; height: 1px; background-color: #d2d2d2"></div>
    <footer class="footer-area text-center">
        <div class="container">
            <div class="row">
                <div class="col-12">
                   
                    <!-- Footer Nav Area -->
                    <div class="classy-nav-container breakpoint-off">
                        <!-- Classy Menu -->
                        <nav class="classy-navbar justify-content-center">

                            <!-- Navbar Toggler -->
                            <div class="classy-navbar-toggler">
                                <span class="navbarToggler"><span></span><span></span><span></span></span>
                            </div>

                            <!-- Menu -->
                            <div class="classy-menu">

                                <!-- close btn -->
                                <div class="classycloseIcon">
                                    <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                                </div>

                                <!-- Nav Start -->
                                <div class="classynav">
                                    <ul>
                                        <li><a href="#">여기</a></li>
                                        <li><a href="#">뭐라고</a></li>
                                        <li><a href="#">써둘까</a></li>
                                        <li><a href="#">얘들아?</a></li>
                                        <li><a href="#">의견좀</a></li>
                                        <li><a href="#">주세요 ㅎㅎ</a></li>
                                    </ul>
                                </div>
                                <!-- Nav End -->
                            </div>
                        </nav>
                    </div>
                    
                    <!-- Footer Social Area -->
                    <div class="footer-social-area mt-30">
                        <a href="https://www.facebook.com/" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        <a href="https://twitter.com/?lang=ko" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a>
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
    <!-- Google Map js -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwuyLRa1uKNtbgx6xAJVmWy-zADgegA2s"></script>
    <script src="resources/js/map-active.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="resources/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
	    var isButtonClicked = false;
		document.querySelector('.g-signin2').addEventListener('click', function(){
			isButtonClicked = true;
		});
		function onSignIn(googleUser) {
			if(isButtonClicked){
		
		  var profile = googleUser.getBasicProfile();
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		  
		  $("#sns_id").val(profile.getId());
		  $("#name").val(profile.getName());
		  $("#email").val(profile.getEmail());
		  $("#sns_type").val("google");
		  
		  $("#googleform").submit();
			}
		}
    </script>

</body>
</html>