<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#search_wrap {
		padding-top: 20px; 
		padding-bottom: 20px;
		height: 100px;
	}
	#logo_wrap{
		float: left;
		padding-top: 20px; 
		padding-bottom: 20px;
		height: 100px;
		position: absolute; 
		left: 150px;
	}
	#search_table {
		border-bottom: 1px solid black;
		margin-top: 20px;
	}
	#search_tbody{
	}
	#search_td1, #search_td2, #search_td3{
		padding: 10px 0;
		margin: 0;
		display: inline-block;
	}
	#a_search{
		background-image: url("resources/images/searchImg.png") ;
		background-repeat: no-repeat;
		width: 35px;
		height: 35px;
		border: 0;
		outline: 0;
		background-color: transparent;
	}
	#home_bt{
	}

</style>
</head>
<body id="search_body">
	<div id="logo_wrap">
		<a href="#" id="home_bt"><img alt="메인으로" src="resources/images/logo (1).png"/></a>
	</div>
	<div id="search_wrap">
		<form action="search.inc" method="post" name="searchFrm">
			<table id="search_table" align="center">
				<tbody id="search_tbody">
					<tr id="search_tr">
						<td id="search_td1">
							<select name="type" style="width:100px; height: 29px; border-width: 0;">
								<option>선택하세요.</option>
								<option value="0">영화이름</option>
								<option value="1">감독이름</option>
								<option value="2">개봉년도</option>
							</select>
						</td>
						<td id="search_td2">
							<input type="text" name="searchValue" style=" height: 24px; border-width: 0;" />
						</td>
						<td id="search_td3" >
							<input type="button" id="a_search" onclick="goSearch(this.form)"  style="cursor:pointer"/>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>