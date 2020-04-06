<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


	<!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100" style="background-color: #ededed;">
        <div class="container" style="background-color: white; padding: 100px; box-shadow: 0px 5px 5px 1px gray;">
            <div class="row justify-content-center">
                <!-- Contact Form Area -->
                <div class="col-12 col-md-10 col-lg-9">
                    <div class="contact-form">
                        <h5>회원가입</h5>
                        <!-- Contact Form -->
                        <form method="post"  name="signup" id="signup" action="signUpForm.inc">
                            <div class="row">
                                <div class="col-12">
                                    <div class="group">
                                        <input type="text" name="id" id="signup_id" required>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label id="label_id">ID * <font></font></label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="group">
                                        <input type="text" name="pw" id="signup_pw" required>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label id="label_pw">Password * <font></font></label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="group">
                                        <input type="text" name="name" id="signup_name" required>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label id="label_name">Name * <font></font></label>
                                    </div>
                                </div><br/><br/><br/><br/><br/>
                                <div class="col-12">
                                    <div class="group">
                                    	<br>
                                        <input type="email" name="email" id="signup_email">
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label id="label_email">Email <font></font></label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="group">
                                        <input type="number" name="phone" id="signup_phone1" maxlength="3" oninput="maxLengthCheck(this)">
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label id="label_phone">Phone <font></font></label>
                                    </div>
                                </div>-
                                <div class="col-12 col-md-3">
                                    <div class="group">
                                        <input type="number" name="phone" id="signup_phone2" maxlength="4" oninput="maxLengthCheck(this)">
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                    </div>
                                </div>-
                                <div class="col-12 col-md-3">
                                    <div class="group">
                                        <input type="number" name="phone" id="signup_phone3" maxlength="4" oninput="maxLengthCheck(this)">
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="button" class="btn original-btn" onclick="signUp(this.form)">회원가입</button>
                                </div>
                                
                                <br><br><br><br>
								<div align="center">
                        			<a href="index.inc" style="color: #2f2f2f; font-weight: bold; margin: 10px;">홈으로가기</a>
                        		</div>
                            </div>
                        </form>
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
    <script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	
		$(function() {
			$("#signup_id").keyup(function(key) {

				var id = $("#signup_id").val().trim();

				if (id.length > 0) {

					var param = "id=" + encodeURIComponent(id);

					$.ajax({
						url : "signUpKey.inc",
						type : "post",
						data : param,
						dataType : "json"
						
					}).done(function(data) {
						if (data.chk) {
							$("#label_id").html("ID * <font color='#ff5656'>이미 사용중인 아이디입니다.</font>");
						} else {
							$("#label_id").html("ID * <font color='green'>사용하실 수 있는 아이디입니다.</font>");
						}
						
					}).fail(function(err) {
							console.log(err);
					});
					
				} else {
					$("#label_id").html("ID * <font></font>");
				}

			});

			$("#signup_pw").keyup(function(key) {

				var pw = $("#signup_pw").val().trim();
	
				if (pw.length > 0) {
					if (pw.length > 3 && pw.length < 21) {
						$("#label_pw").html("Password * <font color='green'>사용하실 수 있는 패스워드입니다.</font>");
					} else {
						$("#label_pw").html("Password * <font color='#ff5656'>패스워드는 4~20자 입니다.</font>");
					}
				} else {
					$("#label_pw").html("Password * <font></font>");
				}
			});
			
			$("#signup_name").keyup(function(key) {

				var name = $("#signup_name").val().trim();
	
				if (name.length > 0) 
					$("#label_name").html("Name * <font></font>");
				
			});
			
			$("#signup_email").keyup(function(key) {

				var email = $("#signup_email").val().trim();

				if (email.length > 0) {

					var param = "email=" + encodeURIComponent(id);

					$.ajax({
						url : "signUpKey.inc",
						type : "post",
						data : param,
						dataType : "json"
						
					}).done(function(data) {
						if (data.chk) {
							$("#label_id").html("ID * <font color='#ff5656'>이미 사용중인 아이디입니다.</font>");
						} else {
							$("#label_id").html("ID * <font color='green'>사용하실 수 있는 아이디입니다.</font>");
						}
						
					}).fail(function(err) {
							console.log(err);
					});
					
				} else {
					$("#label_id").html("ID * <font></font>");
				}

			});
		});

		function signUp(frm) {
			var id = $("#label_id>font").text();
			var pw = $("#label_pw>font").text();
			var name = $("#signup_name");
			var phone1 = $("#signup_phone1").val();
			var phone2 = $("#signup_phone2").val();
			var phone3 = $("#signup_phone3").val();
			
			
			if (id != "사용하실 수 있는 아이디입니다.") {
				frm.id.focus();
				return;
			}

			if (pw != "사용하실 수 있는 패스워드입니다.") {
				frm.pw.focus();
				return;
			}
			
			if(name.val().trim().length <= 0){
				frm.name.focus();
				$("#label_name").html("Name * <font color='#ff5656'>필수 입력사항입니다.</font>");
				return;
			}
			
			if(phone1.trim().length > 0 || phone2.trim().length > 0 || phone3.trim().length > 0 ){
				if(phone1.trim().length != 3){
					$("#label_phone").html("Phone <font color='#ff5656'>형식에 문제가 있습니다.</font>");
					$("#signup_phone1").focus();
					return;
				}
				if(phone2.trim().length < 1){
					$("#label_phone").html("Phone <font color='#ff5656'>형식에 문제가 있습니다.</font>");
					$("#signup_phone2").focus();
					return;
				}
				if(phone3.trim().length < 1){
					$("#label_phone").html("Phone <font color='#ff5656'>형식에 문제가 있습니다.</font>");
					$("#signup_phone3").focus();
					return;
				}
			}

			var b = confirm("가입하시겠습니까?");
			if (b) {
				frm.submit();
			}
		}

		function maxLengthCheck(object) {
			if (object.value.length > object.maxLength) {
				object.value = object.value.slice(0, object.maxLength);
			}
		}
	</script>
</body>
</html>