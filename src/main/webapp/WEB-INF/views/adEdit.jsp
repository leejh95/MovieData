<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
    <section class="contact-area " style="background-color: #ededed;">
        <div class="container" style="background-color: white; box-shadow: 0px 5px 5px 1px gray;">
            <div class="row justify-content-center">
                <!-- Contact Form Area -->
                <div class="col-12 col-md-10 col-lg-9">
                    <div class="contact-form">
                    	
                        <h5 style="margin-top: 50px;">광고 수정 / 삭제</h5>
                        <!-- Contact Form -->
                        <form method="post" action="adEdit.inc" enctype="multipart/form-data">
                            <div class="row">
	                            <div class="col-12">
                                    <div class="group">
                                    	<input type="hidden" name="a_idx" value="${advo.a_idx }">
                                        <input type="text" name="ad_name" id="ad_name" value="${advo.ad_name }" required>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label id="label_name">광고명<font></font></label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="group">
                                        <input type="text" name="host_name" id="host_name" value="${advo.host_name }" required>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label id="label_host_name">광고주<font></font></label>
                                    </div>
                                </div>
                                <div class="col-12">
                                	<div class="group">
                                		<label id="label_image">광고이미지 <font></font></label>
                                	</div>
                                    <div class="group">
                                        <input type="file" name="upload" id="upload"  required>
                                        ${advo.image }
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="group">
                                        <input type="text" name="href" id="href" value="${advo.href }" required>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label id="label_href">경로 <font></font></label>
                                    </div>
                                </div>
                                <br/><br/><br/><br/><br/>
                                <div class="col-12">
                                    <div class="group">
                                    	<br>
                                        <input type="email" name="email" id="host_email" value="${advo.email }" required>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label id="label_host_email">이메일 <font></font></label>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="group">
                                        <input type="number" name="host_phone" id="host_phone1" maxlength="3" oninput="maxLengthCheck(this)" value="${advo.host_phone.split(',')[0] }" required>                                                              
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label id="label_host_phone">광고전번 <font></font></label>
                                    </div>
                                </div>-
                                <div class="col-12 col-md-3">
                                    <div class="group">
                                        <input type="number" name="host_phone" id="host_phone2" maxlength="4" oninput="maxLengthCheck(this)" value="${advo.host_phone.split(',')[1] }" required>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                    </div>
                                </div>-
                                <div class="col-12 col-md-3">
                                    <div class="group">
                                        <input type="number" name="host_phone" id="host_phone3" maxlength="4" oninput="maxLengthCheck(this)" value="${advo.host_phone.split(',')[2] }" required>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                    </div>
                                </div>
                                <div class="col-12">
                                	<div class="group">
                                		<label id="label_slotNum">배너넘버 <font></font></label>
                                	</div>
                                    <div class="group">
                                        <select name="slotNum" id="slotNum" required>
                                        	<option value="1">1번</option>
                                        	<option value="2">2번</option>
                                        </select>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        현재 넘버 : ${advo.slotNum }
                                    </div>
                                </div>
                                 <div class="col-12">
                                	<div class="group">
                                		<label id="label_status">Status <font></font></label>
                                	</div>
                                    <div class="group">
                                        <select name="status" id="status" required>
                                        	<option value="0">활성화</option>
                                        	<option value="1">비활성화</option>
                                        </select>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        현재 상태 : 
                                        <c:if test="${advo.status eq 0 }">
                                        	<font color="green">활성화 중</font>
                                        </c:if>
                                        <c:if test="${advo.status eq 1 }">
                                        	<font color="red">비활성화 중</font>
                                        </c:if>
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                	<div class="group">
                                		 <label id="label_begin_dt">시작일<font></font></label>
                                	</div>
                                    <div class="group">
                                        <input type="date" name="begin_dt" id="begin_dt" value="${advo.begin_dt.substring(0,10) }" required>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                    </div>
                                </div>
                                <div class="col-12">
                                	<div class="group">
                                		 <label id="label_end_dt">종료일<font></font></label>
                                	</div>
                                    <div class="group">
                                        <input type="date" name="end_dt" id="end_dt" value="${advo.end_dt.substring(0,10) }" required>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn original-btn">광고 수정</button>
                                </div>
                                
                                <br><br><br><br>
								<div align="center">
                        			<a href="index.inc" style="color: #2f2f2f; font-weight: bold; margin: 10px;">홈으로가기</a>
                        		</div>
                        		<br><br><br><br>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->
    
	
	<script type="text/javascript">
	
	function maxLengthCheck(object) {
		if (object.value.length > object.maxLength) {
			object.value = object.value.slice(0, object.maxLength);
		}
	}

	</script>
</body>
</html>