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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style type="text/css">
#admin_body{
background-color: #ededed;
}
</style>
</head>
<c:if test="${sessionScope.memVO ne null and sessionScope.memVO.status eq 2}">
<body>
<div id="admin_body" style="padding-top: 1px;">
<div class="admin_container" style=" margin: 100px 50px 0 50px; height: 1300px; ">
    <div class="row"  style="width: 1500px;" >
        <div class="col-md-4" style="width: 300px; display: inline;">
            <!-- It can be fixed with bootstrap affix http://getbootstrap.com/javascript/#affix-->
            <div style="width: 300px; height: 400px; margin-left: 150px;">
                <h3>
                    <b>MANAGEMENT</b>
                </h3>
	            <ul style="display: inline-block; width: 250px;" id="menu_ul"><br>
                    <li style=" height: 20px; "><a href="index.inc"><h5>Home</h5></a></li><br>
                    <li style=" height: 20px; " id="menu_MemberList"><a href="javascript:memList('1')"><h5><i class="fas fa-caret-right"></i>MemberList</h5></a></li><br>
                    <li style=" height: 20px; " id="menu_SearchMember"><a href="javascript:searchMember()"><h5>SearchMember</h5></a></li><br>
                    <li style=" height: 20px; " id="menu_UploadAd"><a href="javascript:uploadAd()"><h5>UploadAd</h5></a></li><br>
                    <li style=" height: 20px; " id="menu_AdList"><a href="javascript:adList()"><h5>AdList</h5></a></li>
	            </ul>
            </div>
        </div>
        <div id="adcon_div" class="col-md-8" style=" width:1200px; height:500px; ">
            <!-- Content Here -->
        </div>
    </div>
</div>
</div>
<input type="hidden" id="currentPage" value="${currentPage }"/>
   
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<!-- Popper js -->
    <script src="resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>
    <script type="text/javascript">
    var searchType = null;
    var searchValue = null;
    var nowPage = 1;
    
    $(function(){
    	
    	var currentPage = $("#currentPage").val();
    	
    	if(currentPage == "adList"){
    		$("#adcon_div").load("adList.inc");
    	}else{
    		$("#adcon_div").load("memList.inc");
    	}
    	
   	 })

    function memList(nowPage){
    	$("i").removeAttr("class");
    	$("#menu_MemberList h5").html("<i class='fas fa-caret-right'></i>MemberList");
    	$("#adcon_div").load("memList.inc?nowPage="+nowPage);
    }
    function searchMember(){
    	$("i").removeAttr("class");
    	$("#menu_SearchMember h5").html("<i class='fas fa-caret-right'></i>SearchMember");
    	$("#adcon_div").load("searchMem.inc");
    }
    function uploadAd(){
    	$("i").removeAttr("class");
    	$("#menu_UploadAd h5").html("<i class='fas fa-caret-right'></i>UploadAd");
    	$("#adcon_div").load("uploadAd.inc");
    }
    function adList(){
    	$("i").removeAttr("class");
    	$("#menu_AdList h5").html("<i class='fas fa-caret-right'></i>AdList");
    	$("#adcon_div").load("adList.inc");
    }
    function adEdit(a_idx){
		$("#adcon_div").load("adOne.inc?a_idx="+a_idx);
	}
    
    function searchMem(cPage){
    	
    	if(searchType == null){
    		searchType = $("#searchDiv select").val();
    	}
    	if(searchValue == null){
    		searchValue = $("#searchDiv input").val();
    	}
    	
    	nowPage = cPage;
    	
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
    function memStop2(m_idx, pw, nowPage){
    	var param = "m_idx="+encodeURIComponent(m_idx)+"&pw="+encodeURIComponent(pw);
    	$.ajax({
			url: "delete_member.inc",
			type: "post",
			data: param,
			dataType: "json"
		}).done(function(data){
			searchMem(nowPage);
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
    
    function memRestore2(m_idx, nowPage){
    	var param = "m_idx="+encodeURIComponent(m_idx);
    	$.ajax({
			url: "restore_member.inc",
			type: "post",
			data: param,
			dataType: "json"
		}).done(function(data){
			searchMem(nowPage);
		});
    }
    function realSearchMem(){
    	searchType = null;
        searchValue = null;
        nowPage = 1;
    	searchMem(nowPage);
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