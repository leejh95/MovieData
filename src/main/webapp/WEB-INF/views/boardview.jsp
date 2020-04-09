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
    
    <style type="text/css">
    	#boardCommTable tbody tr td:nth-child(3) div{
    		
    		word-break:break-all;
    	}
    	#boardCommTable {
    	}
    </style>
</head>
<body>

	<div id="include_header" ></div>

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
                    <div class="single-blog-content">
                    <div class="btn-toolbar">
                    <c:if test="${sessionScope.memVO.m_idx eq vo.m_idx}">
					    	<button class="btn" onclick="">삭제</button>
					    	<button class="btn" onClick="">수정</button>
                    </c:if>
                    	<button class="btn" onClick="javascript:goBoard('${vo.category}', '${nowPage }')">목록</button>
						</div>
                        </div>
                    <hr/>
                    <!-- 자유게시판 답글 -->
                    <c:if test="${vo.category eq 'free'}">
                    <div class="col-12">
                       <button class="btn original-btn"
                       onClick="JavaScript:location.href='answer.inc?b_idx=${b_idx}&ref=${vo.ref }&step=${vo.step }&sunbun=${vo.sunbun }&nowPage=${nowPage }'"
                       >답글</button>
                    </div>
                    <!-- 리뷰게시판 댓글 -->
                    </c:if>
                    <c:if test="${vo.category eq 'review'}">
                    <!-- Comment Area Start -->
                    <c:if test="${sessionScope.memVO ne null }">
	                    <div id="boardCommText">
		                    <textarea id="comm_content"></textarea>
		                    <input type="button" onclick="commSave()" value="등록">
	                    </div>
                    </c:if>
                    <c:if test="${sessionScope.memVO eq null }">
	                    <div id="boardCommText">
		                    [댓글] 로그인이 필요합니다.
	                    </div>
                    </c:if>
                    <div id="boardCommDiv">
                        <table id="boardCommTable">
                        	<colgroup>
                        		<col width="80px"/>
                        		<col width="*"/>
                        		<col width="200px"/>
                        	</colgroup>
                        	<tbody>
                        	</tbody>
                        </table>
                        <ul></ul>
					</div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <form action="boardCommDel.inc" method="post" name="comm_form">
    	<input type="hidden" id="comm_idx" name="c_idx"/>
    </form>
    
    <div id="include_footer"></div>
    
    <!-- ##### Single Blog Area End ##### -->
    
    <script src="resources/js/jquery-3.4.1.min.js"></script>
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
    var cPage = 1;
	var isClicked = false;
	var clicked_index = -1;
	
    $(function(){
    	$("#include_header").load("header.inc");
		$("#include_footer").load("footer.inc");
    	
    	setCommList(1);
    	
    	$(document).on("click", "#editBtn", function(){
			var i = $(this).parent().parent().index();
			if(i > clicked_index && isClicked){
				clicked_index = i-1;
			}else
				clicked_index = i;
			isClicked = true;
			setCommList(cPage);
		});
    });
    
	function setCommList(nowPage){
		
		cPage = nowPage;
		
		$.ajax({
			url: "boardCommList.inc",
			type: "post",
			data: "b_idx=${b_idx}&nowPage="+nowPage,
			dataType: "json"
		}).done(function(data){
			var msg = "";
			if(data.ar != undefined){
				
				for(var i=0; i<data.ar.length; i++){
					msg += "<tr><input type='hidden' value='"+data.ar[i].c_idx+"'/>"
					msg += "<td>"+data.ar[i].mvo.name+"</td>";
					msg += "<td><div>"+data.ar[i].content+"</div></td>";
					msg += "<td align='right'>"+data.ar[i].write_date.substring(5, 19)+"&nbsp";
					
					if(data.ar[i].m_idx == "${sessionScope.memVO.m_idx}" || "${sessionScope.memVO.status}" == "2"){
						msg += "<a href='javascript:commDel("+data.ar[i].c_idx+")'>[삭제]</a>&nbsp;";
						msg += "<a href='javascript:' id='editBtn'>[수정]</a>";
					}
					
					msg += "</td></tr>";
				}
				//위에서 작업된 html코드를 tbody에 html로 적용한다.
				$("#boardCommTable tbody").html(msg);
				$("#boardCommDiv ul").html("");
				$("#boardCommDiv ul").append(data.pageCode);
				
				
				if(isClicked){
					commEdit();
				}
				
			}else{
				msg += "<tr><td>이 영화는 아직 평가가 없습니다...</td></tr>"
			}
			
		});
		
		
	}
   
	function commSave() {
		var content = $("#comm_content").val();
		var m_idx = $("#m_idx").val();
		
		if(content.length < 1){
			alert("내용을 입력해주세요");
			$("#comm_content").focus();
			return;
		}
		
		var param = "content="+encodeURIComponent(content)+
		"&m_idx=${sessionScope.memVO.m_idx}&b_idx=${b_idx}";
		
		$.ajax({
			url: "boardCommSave.inc",
			type: "post",
			data: param,
			dataType: "json"
		}).done(function(data){
			setCommList(1);
			$("#comm_content").val("");
		});
		
	}
   	
	function commDel(c_idx) {
		
		var b = confirm("삭제하시겠습니까?");
		if(!b)
			return;
		
		$.ajax({
			url: "boardCommDel.inc",
			type: "post",
			data: "c_idx="+encodeURIComponent(c_idx),
			dataType: "json"
		}).done(function(){
			console.log("도착함")
			setCommList(cPage);
		});
	}
	
	function commEdit(){
		var msg = "";
		msg += '<tr style="background-color:#efefef;">';
		msg += '<td>└</td><td><textarea rows="2" cols="60"></textarea></td>';
		msg += '<td align="right"><a href="javascript:commEdit_ok()">[저장]</a>&nbsp;'
		msg += '<a href="javascript:resetCommList('+cPage+')">[취소]</a></td>'
		msg += '</tr>'
		
		$("#boardCommTable>tbody>tr:nth-child("+(clicked_index+1)+")").after(msg);
	}
	
	function commEdit_ok(){
		
		var c_idx = $("#boardCommTable>tbody>tr:nth-child("+(clicked_index+1)+") input").val();
		var content = $("#boardCommTable>tbody>tr:nth-child("+(clicked_index+2)+") textarea").val();
		var rate = $("#boardCommTable>tbody>tr:nth-child("+(clicked_index+2)+") select").val();
		
		if(content.length < 1){
			alert("내용을 입력해주세요");
			$("#boardCommTable>tbody>tr:nth-child("+(clicked_index+1)+") input").focus();
			return
		}
		
		var b = confirm("수정하시겠습니까?");
		
		if(!b)
			return;
		
		$.ajax({
			url: "commEdit.inc",
			type: "post",
			data: "c_idx="+encodeURIComponent(c_idx)+
				  "&content="+encodeURIComponent(content),
			dataType: "json"
		}).done(function(){
			resetCommList(cPage);
		});
	}
	
	function resetCommList(page){
		isClicked = false;
		setCommList(page);
	}
	
	function goCommListPage(page){
		isClicked = false;
		clicked_index = -1;
		setCommList(page);
	}
   
    </script>
</body>
</html>