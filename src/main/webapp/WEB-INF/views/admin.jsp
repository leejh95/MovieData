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
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<c:if test="${sessionScope.memVO ne null and sessionScope.memVO.status eq 2}">
<body>
<div class="admin_container" style=" margin: 100px 50px;  ">
    <div class="row"  style="width: 1500px;" >
        <div class="col-md-4" style="width: 300px; display: inline;">
            <!-- It can be fixed with bootstrap affix http://getbootstrap.com/javascript/#affix-->
            <div id="sidebar" class="well sidebar-nav" style="width: 300px; height: 400px; margin: 0;">
                <h5><i class="glyphicon glyphicon-user"></i>
                    <small><b>MANAGEMENT</b></small>
                </h5>
                <ul class="nav nav-pills nav-stacked" style="display: inline-block; width: 250px;">
                    <li class="active"><a href="index.inc">Home</a></li>
                    <li><a href="javascript:memList('1')">List</a></li>
                    <li><a href="javascript:searchMember()">searchMember</a></li>
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
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>
    <script type="text/javascript">
    $(function(){
    	
    	$("#include_footer").load("footer.inc");
    	
    	  var sBtn = $("ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
    	  sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
    	   sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
    	   $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
    	  })
    	  
   	 })

    function memList(nowPage){
    	$("#adcon_div").load("memList.inc?nowPage="+nowPage);
    }
    function searchMember(){
    	$("#adcon_div").load("searchMem.inc");
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