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
<!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100" style="background-color: #ededed;">
        <div class="container" style="background-color: white; padding: 100px; box-shadow: 0px 5px 5px 1px gray;">
            <div class="row justify-content-center">
                <!-- Contact Form Area -->
                <div class="col-12 col-md-10 col-lg-9">
                    <div class="contact-form">
                        <h4>아이디, 이메일로 비밀번호 찾기</h4><br/><br/>
                        
                            <div class="row">
								<c:if test="${chk }">
								<h5>새로운 비밀번호로 변경</h5><br/><br/>
	                                <div class="col-12">
	                                    <div class="group">
	                                        <input type="password" name="pw" id="change_pw" required>
	                                        <span class="highlight"></span>
	                                        <span class="bar"></span>
	                                        <label id="label_pw">새로운 비밀번호 <font></font></label>
	                                    </div>
	                                </div>
	                                <div class="col-12">
	                                    <div class="group">
	                                        <input type="password" name="pw2" id="change_pw2" required>
	                                        <span class="highlight"></span>
	                                        <span class="bar"></span>
	                                        <label id="label_pw2">새로운 비밀번호 확인 <font></font></label>
	                                    </div>
	                                </div>
	                                
	                                <div class="col-12">
                                    	<button type="button" class="btn original-btn" onclick="changePW()">변경하기</button>
                                	</div>
                                </c:if>
                                <c:if test="${!chk }">
                                    <div class="col-12" style="background-color: #ffd4d4; padding: 10px; margin-bottom: 50px;">
                                    	<h3>일치하는 아이디 또는 이메일이 없습니다.</h3>
                                    </div>
                                </c:if>
                                
                                <br><br>
                                <div align="center">
                        			<a href="searchPW.inc" style="color: #2f2f2f; font-weight: bold; margin: 10px;">다시찾기</a>
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
    <!-- Google Map js -->
    <script src="resources/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
	
		$(function() {
			$("#include_footer").load("footer.inc");
			
			$("#change_pw").keyup(function(key) {

				var pw = $("#change_pw").val().trim();
	
				if (pw.length > 0) {
					if (pw.length > 3 && pw.length < 21) {
						$("#label_pw").html("새로운 비밀번호 <font color='green'>사용하실 수 있는 패스워드입니다.</font>");
					} else {
						$("#label_pw").html("새로운 비밀번호 <font color='#ff5656'>패스워드는 4~20자 입니다.</font>");
					}
				} else {
					$("#label_pw").html("새로운 비밀번호 <font></font>");
				}
			});
			
			$("#change_pw2").keyup(function(key) {
				
				var pw = $("#change_pw").val().trim();
				var pw2 = $("#change_pw2").val().trim();
	
				if (pw2.length > 0) {
					if (pw == pw2) {
						$("#label_pw2").html("새로운 비밀번호 확인 <font color='green'>패스워드가 일치합니다.</font>");
					} else {
						$("#label_pw2").html("새로운 비밀번호 확인 <font color='#ff5656'>패스워드가 일치하지 않습니다.</font>");
					}
				} else {
					$("#label_pw2").html("새로운 비밀번호 확인 <font></font>");
				}
			});
		});
		
		function changePW() {
			var pw = $("#label_pw>font").text();
			var pw2 = $("#label_pw2>font").text();
			
			
			if (pw != "사용하실 수 있는 패스워드입니다.") {
				$("#change_pw").focus();
				return;
			}
			if (pw2 != "패스워드가 일치합니다.") {
				$("#change_pw2").focus();
				return;
			}

			var b = confirm("변경하시겠습니까?");
			if (!b) 
				return
			
			$.ajax({
				url : "searchPwOk.inc",
				type : "post",
				data : "pw="+encodeURIComponent($("#change_pw").val().trim())+"&m_idx=${m_idx}",
				
			}).done(function(data) {
				if(data.chk){
					alert("비밀번호 변경완료");
					var bl = confirm("다시 로그인 하시겠습니까?");
					if(bl)
						location.href="signIn.inc";
					else
						location.href="index.inc";
				}else
					alert("비밀번호 변경실패!");
			}).fail(function(err) {
					console.log(err);
			});
		}
	</script>
</body>
</html>