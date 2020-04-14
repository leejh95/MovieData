<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE html>
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
                        <h4>아이디, 이메일로 비밀번호 찾기</h4><br/><br/>
                        <!-- Contact Form -->
                            <div class="row">
                                
                                <div class="col-12">
                                    <div class="group">
                                        <input type="text" name="id" id="searchPW_id" required>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label id="label_id">ID <font></font></label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="group">
                                    	<br>
                                        <input type="email" name="email" id="searchPW_email" required>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label id="label_email">Email <font></font></label>
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <button type="button" class="btn original-btn" onclick="searchPW()">비밀번호찾기</button>
                                </div>
                                
                                <br><br><br><br>
                                <div align="center">
                        			<a href="signIn.inc" style="color: #2f2f2f; font-weight: bold; margin: 10px;">돌아가기</a>
                        		</div><br>
								<div align="center">
                        			<a href="index.inc" style="color: #2f2f2f; font-weight: bold; margin: 10px;">홈으로가기</a>
                        		</div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->
    
    <div id="include_footer"></div>
	
	<!-- Popper js -->
    <script src="resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>
    <script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	
		$(function() {
			$("#include_footer").load("footer.inc");
			
			$("#searchPW_email").keyup(function(key) {

				var email = $("#searchPW_email").val().trim();

				if (email.length > 0) {
					
					var i = email.indexOf("@");
					
					if(i < 0){
						$("#label_email").html("Email <font color='#ff5656'>이메일 형식이 올바르지 않습니다.</font>");
						return;
					}
					
					var fe = email.substring(0, i);
					var be = email.substring(i+1);
					
					if(fe.length < 1 || be.length < 1){
						$("#label_email").html("Email <font color='#ff5656'>이메일 형식이 올바르지 않습니다.</font>");
						return;
					}
					
					$("#label_email").html("Email <font></font>");
					
				} else {
					$("#label_email").html("Email <font></font>");
				}

			});
		});

		function searchPW() {
			var id = $("#searchPW_id").val();
			var email = $("#label_email>font").text();
			
			if (id.length < 1) {
				$("#searchPW_id").focus();
				return;
			}
			if (email.length > 0) {
				$("#searchPW_email").focus();
				return;
			}
			
			location.href="searchPwForm.inc?email="+$("#searchPW_email").val()+"&id="+id;
			
		}
	</script>
</body>
</html>