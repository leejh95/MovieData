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
<c:if test="${sessionScope.memVO ne null and sessionScope.memVO.status eq 2}">
<body>
<div id="include_header"></div>
<div class="admin_container" style=" margin: 100px 50px; height: 1000px; ">
    <div class="row"  style="width: 1500px;" >
        <div class="col-md-4" style="width: 300px; display: inline;">
            <!-- It can be fixed with bootstrap affix http://getbootstrap.com/javascript/#affix-->
            <div style="width: 300px; height: 400px; margin: 0;">
                <h5>
                    <b>MANAGEMENT</b>
                </h5>
                <ul style="display: inline-block; width: 250px;">
                    <li style=" height: 20px; "><a href="index.inc">Home</a></li>
                    <li style=" height: 20px; "><a href="javascript:memList('1')">List</a></li>
                    <li style=" height: 20px; "><a href="javascript:searchMember()">SearchMember</a></li>
                    <li style=" height: 20px; "><a href="javascript:uploadAd()">UploadAd</a></li>
                </ul>
            </div>
        </div>
        <div id="adcon_div" class="col-md-8" style=" width:1200px; height:500px; ">
            <!-- Content Here -->
        </div>
    </div>
</div>

 
<div id="include_footer"></div>
   
	<script src="resources/js/jquery-3.4.1.min.js"></script>
    <!-- Popper js -->
    <script src="resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <!-- Plugins js -->
    <!-- Active js -->
    <script type="text/javascript">
    $(function(){
    	
    	$("#include_header").load("header.inc");
    	
    	$("#include_footer").load("footer.inc");
    	
   	 })

    function memList(nowPage){
    	$("#adcon_div").load("memList.inc?nowPage="+nowPage);
    }
    function searchMember(){
    	$("#adcon_div").load("searchMem.inc");
    }
    function uploadAd(){
    	$("#adcon_div").load("uploadAd.inc");
    	
    }
    
    function searchMem(nowPage){
    	var searchType = $("#searchDiv select").val();
    	var searchValue = $("#searchDiv input").val();
    	
    	if(searchValue.length < 1){
    		alert("내용을 입력해주세요");
    		$("#searchDiv input").focus();
    		return;
    	}
    	
    	$("#adcon_div").load("searchMember.inc?nowPage="+nowPage+"&searchType="+searchType+"&searchValue="+searchValue);
    }
    function memStop(m_idx, pw, nowPage){
    	var param = "m_idx="+encodeURIComponent(m_idx)+"&pw="+encodeURIComponent(pw);
    	$.ajax({
			url: "delete_member.inc",
			type: "post",
			data: param,
			dataType: "json"
		}).done(function(data){
			$("#adcon_div").load("memList.inc?nowPage="+nowPage);
		});
    	
    }
    
    function memRestore(m_idx, nowPage){
    	var param = "m_idx="+encodeURIComponent(m_idx);
    	$.ajax({
			url: "restore_member.inc",
			type: "post",
			data: param,
			dataType: "json"
		}).done(function(data){
			$("#adcon_div").load("memList.inc?nowPage="+nowPage);
		});
    	
    }
    </script>
</body>
</c:if>
<c:if test="${sessionScope.memVO eq null or sessionScope.memVO.status ne 2}">
	<body>
		<script type="text/javascript">
			
		    $(function(){
		    	alert("잘못된 접근입니다.");
		    	document.location.href="index.inc";
		   	 })
			
		</script>
	</body>
</c:if>
</html>