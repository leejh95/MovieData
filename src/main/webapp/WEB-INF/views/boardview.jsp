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
    <title>글제목</title>

    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link rel="stylesheet" href="resources/style.css">
    
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    
</head>
<body>

    <!-- ##### Single Blog Area Start ##### -->
    <div class="single-blog-wrapper section-padding-0-100">

        <!-- Single Blog Area
        <div class="single-blog-area blog-style-2 mb-50">
            <div class="single-blog-thumbnail">
                <img src="resources/img/bg-img/b5.jpg" alt="">
            </div>
        </div>
		-->
		
        <div class="container">
            <div class="row">
                <!-- ##### Post Content Area ##### -->
                <div class="col-12 col-lg-9">
                    <!-- Single Blog Area  -->
                    <div class="single-blog-area blog-style-2 mb-50">
                        <!-- Blog Content -->
                        <div class="single-blog-content">
                            <div class="line"></div>
                            <h4><a href="#" class="post-headline mb-0">${vo.subject }</a></h4>
                            <div>
                                <p>작성자: ${vo.mvo.name }</p>
                                <p>작성일: ${vo.write_date }</p>
                            </div>
                            <hr/>
                            <p>${vo.content }</p>
                        </div>
                    </div>
                    <c:if test="${sessionScope.memVO.m_idx eq vo.m_idx}">
                    	<div class="single-blog-content">
                    	<div class="btn-toolbar">
					    	<button class="btn" onclick="">삭제</button>
					    	<button class="btn" onClick="">수정</button>
					    	<button class="btn" onClick="javascript:goBoard('${vo.category}', '${nowPage }')">목록</button>
						</div>
                        </div>
                    </c:if>
                    <hr/>
                    <!-- 자유게시판 답글 -->
                    <c:if test="${vo.category eq 'free'}">
                    <div class="col-12">
                       <button onclick="commSave()" class="btn original-btn">답글</button>
                    </div>
                    <!-- 리뷰게시판 댓글 -->
                    </c:if>
                    <c:if test="${vo.category eq 'review'}">
                    <!-- Comment Area Start -->
                    <div class="comment_area clearfix mt-70">
                        <h5 class="title">Comments</h5>

                        <ol id="commOl">
                            <!-- Single Comment Area -->
                            <c:if test="${vo.c_list eq null }">
                            	<li class="single_comment_area">
                                <!-- Comment Content -->
                                <div class="comment-content d-flex">
                                    <!-- Comment Meta -->
                                    <div class="comment-meta">
                                        <p>댓글이 없습니다.</p>
                                    </div>
                                </div>
                            </li>
                            </c:if>
                            <c:forEach var="cvo" items="${vo.c_list }">
	                            <li class="single_comment_area">
	                                <!-- Comment Content -->
	                                <div class="comment-content d-flex">
	                                    <!-- Comment Meta -->
	                                    <div class="comment-meta">
	                                        <p class="post-date">작성일 : ${cvo.write_date }</p>
	                                        <p>작성자 : ${cvo.mvo.name }</p>
	                                        <p>${cvo.content }</p>
	                                        <c:if test="${cvo.mvo.m_idx eq sessionScope.memVO.m_idx}">
	                                        <button class='btn' onclick="javascript:boardCommDel('${cvo.c_idx}')">삭제</button>
	                                        </c:if>
	                                    </div>
	                                </div>
	                            </li>
	                       </c:forEach>     
                        </ol>
                    </div>
					<c:if test="${sessionScope.memVO ne null}"> 
	                    <div class="post-a-comment-area mt-70">
	                        <!-- Reply Form -->
	                            <div class="row">
	                                <div class="col-12">
	                                    <div class="group">
	                                        <textarea name="message" id="message" required></textarea>
	                                        <span class="highlight"></span>
	                                        <span class="bar"></span>
	                                        <label>댓글</label>
	                                        <input type="hidden" name="m_idx" id="m_idx" value="${sessionScope.memVO.m_idx }">
	                                        <input type="hidden" name="b_idx" id="b_idx" value="${vo.b_idx }">
	                                    </div>
	                                </div>
	                                <div class="col-12">
	                                    <button onclick="commSave()" class="btn original-btn">등록</button>
	                                </div>
	                            </div>
	                    </div>
                    </c:if>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <form action="boardCommDel.inc" method="post" name="comm_form">
    	<input type="hidden" id="comm_idx" name="c_idx"/>
    </form>
    
    <!-- ##### Single Blog Area End ##### -->
    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<!-- Popper js -->
    <script src="resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>
    
    <script>
    	function commSave(){
    		var content = $("#message").val();
    		var m_idx = $("#m_idx").val();
    		var b_idx = $("#b_idx").val();
    		console.log(content);
    		
    		var param = "content="+encodeURIComponent(content)+
    		"&m_idx="+encodeURIComponent(m_idx)+
    		"&b_idx="+encodeURIComponent(b_idx);
    		
    		$.ajax({
    			url: "boardCommSave.inc",
    			type: "post",
    			data: param,
    			dataType: "json"
    		}).done(function(data){
    			
    			if(data.chk){
    				alert("작성 완료");
    				if(data.mar != undefined){
    					var code = "";
    					for(var i = 0; i<data.mar.length; i++){
    						code += "<li class='single_comment_area'>";
    						code += "<div class='comment-content d-flex'>";
    						code += "<div class='comment-meta'>";
    						code += "<p class='post-date'>작성일 :"; 
    						code += data.mar[i].write_date; 
    						code += "</p>"; 
    						code += "<p>작성자 :"; 
    						code += data.mar[i].mvo.name; 
    						code += "</p>"; 
    						code += "<p>"; 
    						code += data.mar[i].content;
    						code += "</p>"; 
    						if(data.mar[i].m_idx == m_idx){
    							code += "<p>";
    					    	code += "<button class='btn' onclick='boardCommDel('"+data.mar[i].c_idx+"')'>삭제</button>";
    							code += "</p>";
    						}else{
    							code += "<p></p>"
    						}
    						
    						code += "</div></div></li>"; 
    					}
    					//위에서 작업된 html코드를 tbody에 html로 적용한다.
    					$("#commOl").html(code);
    				}
    			}else{
    				alert("작성 실패");
    			}
    			
    			$("#message").val("");	
    		}).fail(function(err){
    			
    		});
    	}
    	
    	function boardCommDel(c_idx){
    		$("#comm_idx").attr("value",c_idx);
    		comm_form.submit();
    	}
    
    </script>
</body>
</html>