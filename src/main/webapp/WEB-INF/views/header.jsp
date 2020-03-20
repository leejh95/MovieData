<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#header_div{
		width: 1000px;
		margin: auto;
	}

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
	<div id="header_div">
		<div id="logo_wrap">
			<a href="index.inc" id="home_bt"><img alt="메인으로" src="resources/images/logo (1).png"/></a>
		</div>
		<div id="search_wrap">
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
								<input type="button" id="a_search" onclick="goSearch()"  style="cursor:pointer"/>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
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