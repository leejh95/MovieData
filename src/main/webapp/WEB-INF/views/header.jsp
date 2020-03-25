<%@page import="mybatis.vo.MovieMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="resources/css/header.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body id="search_body">
	<div id="header_div">
		<nav class="main-navigation">
        <div id='logobt' class="navbar-header animated fadeInUp">
        	<div style="display:inline-block; width: 600px;">
            	<a href="index.inc" id="home_bt"><img alt="메인으로" src="resources/images/logo (1).png"/></a>
            </div>
		<c:if test="${sessionScope.memVO ne null}">
			<div style="display:inline-block; width: 200px;">
		          <button type="button" class="btn btn-default btn-sm btn3d " onclick="location.href='profile.inc'">마이페이지</button>
		          <button type="button" class="btn btn-default btn-sm btn3d " >로그아웃</button>
	        </div>
		</c:if>	
		<c:if test="${sessionScope.memVO eq null}">
            <div style="display:inline-block; width: 200px;">
		          <button type="button" class="btn btn-default btn-sm btn3d" onclick="location.href='signIn.inc'">로그인</button>
		          <button type="button" class="btn btn-default btn-sm btn3d" onclick="location.href=''">회원가입</button>
	        </div>
		</c:if>	
        </div>
        <div id="search_wrap" class="navbar-header animated fadeInUp">
			<form method="post" name="searchFrm" onsubmit="false">
				<table id="search_table" align="center">
					<tbody id="search_tbody">
						<tr id="search_tr">
							<td id="search_td1">
								<select name="type" style="width:100px; height: 29px; border-width: 0;" id="select_type">
									<option>선택하세요.</option>
									<option value="0">영화이름</option>
									<option value="1">감독이름</option>
									<option value="2">개봉년도</option>
								</select>
							</td>
							<td id="search_td2">
								<input type="text" name="searchValue" id="search_text" style=" height: 24px; border-width: 0;" />
								<input type="text" name="values" style=" height: 0px; width: 0px; border-width: 0;" disabled="disabled" />
							</td>
							<td id="search_td3" >
								<input type="button" class="btn btn-default btn-sm btn3d" value="검색" onclick="goSearch()" style="cursor:pointer"/>
								<span class=" glyphicon glyphicon-search"></span>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div>
	        <ul class="nav-list">
	            <li class="nav-list-item">
	                <a href="#" class="nav-link">일일</a>
	            </li>
	            <li class="nav-list-item">
	                <a href="#" class="nav-link">주간</a>
	            </li>
	            <li class="nav-list-item">
	                <a href="#" class="nav-link">개봉</a>
	            </li>
	        </ul>
        </div>
    </nav>
	</div>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>
		$(function(){
			
			$("#search_text").keydown(function(key) {
				if (key.keyCode == 13) {
					goSearch();
				}
			});
		})
	</script>
</body>
</html>