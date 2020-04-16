<%@page import="mybatis.vo.MovieMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>게시글 작성</title>

    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link rel="stylesheet" href="resources/style.css">
    <link rel="stylesheet" href="resources/css/summernote-lite.css"/>
</head>
<body>
<c:if test="${sessionScope.memVO ne null }">
<!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center" >
                <!-- Contact Form Area -->
                <div class="col-12 col-md-10 col-lg-18" style="border: 2px solid #c2c2c2; padding:60px;">
                    <div class="contact-form" >
                        <!-- Contact Form -->
                        <form action="write.inc" method="post" enctype="multipart/form-data">
	                        <input type="hidden" name="category" value="${param.category }"/>
	                        <input type="hidden" name="m_idx" value="${sessionScope.memVO.m_idx }"/>
	                            <div class="row">
	                                <div class="col-12 col-md-6">
	                                    <div class="group" style="margin-top: 15px;">
	                                        <input type="text" name="subject" id="subject" required>
	                                        <span class="highlight"></span>
	                                        <span class="bar"></span>
	                                        <label>제목</label>
	                                    </div>
	                                </div>
	                                <div class="col-12 col-md-6">
	                                    <div class="group" style="margin-top: 15px;">
	                                        <input type="file" name="upload" id="upload">
	                                        <span class="highlight"></span>
	                                        <span class="bar"></span>
	                                    </div>
	                                </div>
	                                <div id="summernote_div">
	                                <textarea name="content" id="content" style="margin-left:20px;"></textarea>
	                                </div>
	                                <div class="col-12" style="margin-top:50px;">
	                                    <button type="submit" class="btn original-btn" style="margin-top:10px; margin-bottom: 20px;">글쓰기</button>
	                                </div>
	                                <div class="col-12">
	                                    <a href="list.inc?category=${param.category }">돌아가기</a>
	                                </div>
	                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
	<div id="include_footer"></div>
</c:if>


	<!-- Popper js -->
    <script src="resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>
    
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/summernote-lite.js"></script>
<script src="resources/js/lang/summernote-ko-KR.min.js"></script>
    
    <script>
    
    $(function(){
    	$("#include_footer").load("footer.inc");
    	
		$("#content").summernote({
			height: 300,
			width: 850,
			lang: "ko-KR",
			  toolbar: [
                  // [groupName, [list of button]]
                  ['Font Style', ['fontname']],
                  ['style', ['bold', 'italic', 'underline']],
                  ['font', ['strikethrough']],
                  ['fontsize', ['fontsize']],
                  ['color', ['color']],
                  ['para', ['paragraph']],
                  ['height', ['height']],
                  ['Insert', ['picture']],
                  ['Insert', ['link']],
                  ['Misc', ['fullscreen']]
              ],

			callbacks:{
				onImageUpload: function(files, editor){
					for(var i=0; i<files.length; i++){
						sendFile(files[i], editor);
					}
				},
			}
		});
		
		$("#content").summernote("lineHeight", 1.0);
		$('#content').summernote('fontName', 'Arial');
		$('#content').summernote('foreColor', '#000000');
	});
    
	function sendFile(file, editor){
		
		var frm = new FormData();
		
		frm.append("upload", file);
		
		//비동기식 통신
		$.ajax({
			url: "saveImage.inc",
			type: "post",
			dataType: "json",
			contentType: false,
			processData: false,
			data: frm
			
		}).done(function(data){
			//console.log("asdsadsadasdsdasadsd:" + data.url);
			$("#content").summernote("editor.insertImage", data.url);
		}).fail(function(err){
			console.log(err);
		});
	}
    </script>
    
<c:if test="${sessionScope.memVO eq null }">
	<script type="text/javascript">
		
		$(function(){
		    alert("잘못된 접근입니다.");
		    document.location.href="index.inc";
		})
			
	</script>
</c:if>

</body>
</html>