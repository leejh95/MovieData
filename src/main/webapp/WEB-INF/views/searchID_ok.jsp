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
                        <h4>이메일로 아이디 찾기</h4><br/><br/>
                        <!-- Contact Form -->
                        <form method="post"  name="searchID" id="searchID" action="searchIdForm.inc">
                            <div class="row">
                            
								<c:if test="${id ne null }">
                                	<div class="col-12" style="background-color: #e0ffd4; padding: 10px; margin-bottom: 50px;">
                                    	<h3>아이디는 "${id }" 입니다.</h3>
                                    </div>
                                </c:if>
                                <c:if test="${id eq null }">
                                    <div class="col-12" style="background-color: #ffd4d4; padding: 10px; margin-bottom: 50px;">
                                    	<h3>일치하는 이메일이 없습니다.</h3>
                                    </div>
                                </c:if>
                                
                                <br><br>
                                <div align="center">
                        			<a href="searchID.inc" style="color: #2f2f2f; font-weight: bold; margin: 10px;">다시찾기</a>
                        		</div><br>
                        		<div align="center">
                        			<a href="searchPW.inc" style="color: #2f2f2f; font-weight: bold; margin: 10px;">비밀번호찾기</a>
                        		</div><br>
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
		});
	</script>
</body>
</html>