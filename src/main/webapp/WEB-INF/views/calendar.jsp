<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	
%>
<html lang="ko">
<HEAD>
<TITLE>Calendar</TITLE>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<style type="text/css">
#cal_content{
width: 1000px;
margin: auto;
}
#cal_nav{
background: #4b4b4b;
width: 150px;
height: 90px;
position: relative;
padding: 10px 0 10px 0;
float: right;
}
#cal_nav div *{
margin: 0;
display: inline-block;
color: white;
font-weight: bold;
text-decoration: none;
}
#cal_nav_year{
width: 120px;
height: 30px;
margin: auto;
text-align: center;
font-size: 18px;
}
#cal_nav_month{
width: 120px;
height: 30px;
margin: auto;
text-align: center;
font-size: 30px;
}
#cal_tab{
width: 1000px;
border-collapse: collapse;
}
#cal_tab *{
margin-left: 0;
margin-right: 0;
text-decoration: none;
}
#cal_tab th, #cal_tab td{
text-align: center;
border-top: 1px solid #4b4b4b;
margin-bottom: 10px;
}
#cal_tab th{
height: 30px;
}
#cal_tab td{
height: 45px;
line-height: 45px;
}
#cal_tab td:hover{
background: #bbbbbb;
}
#cal_tab td:active{
background: #ffffff;
}
#today{
background: #dddddd;
}
</style>
</HEAD>
<BODY>
	<DIV id="cal_content">
	
		<!-- 날짜 네비게이션 시작 -->
		<div id="cal_nav">
		
			<div id="cal_nav_year">
				<!-- 이전해 -->
				<span>
					<a href="javascript:goCal('${year -1 }', '${month }')" target="_self">
						<img alt="left_year" src="resources/images/left_arrow.png" width="15px">
					</a> 
				</span>
				
				<span>
					<a>${year }년</a>
				</span>
				
				<span>
					<!-- 다음해 -->
					<a href="javascript:goCal('${year+1}', '${month}')" target="_self"> 
						<img alt="right_year" src="resources/images/right_arrow.png" width="15px">
					</a>
				</span>
			</DIV>
			<div id="cal_nav_month">
				<!-- 이전달 -->
				<span>
					<c:if test="${month > 0 }">
					<a href="javascript:goCal('${year }', '${month-1 }')" target="_self">
						<img alt="left_month" src="resources/images/left_arrow.png" width="15px">
					</a>
					</c:if>
					
					<c:if test="${month eq 0 }">
					<a href="javascript:goCal('${year-1 }', '11')" target="_self">
						<img alt="left_month" src="resources/images/left_arrow.png" width="15px">
					</a>
					</c:if>
				</span>
				
				<span>
					<a>${month +1 }월</a>
				</span>
				
				<!-- 다음달 -->
				<span>
					<c:if test="${month < 11 }">
					<a href="javascript:goCal('${year }', '${month+1}')" target="_self">
						<img alt="right_month" src="resources/images/right_arrow.png" width="15px">
					</a>
					</c:if>
					
					<c:if test="${month eq 11 }">
					<a href="javascript:goCal('${year+1 }', '0')" target="_self">
						<img alt="right_month" src="resources/images/right_arrow.png" width="15px">
					</a>
					</c:if>
				</span>
			</DIV>
			
		</div>
		<!-- 날짜 네비게이션 끝 -->
		
		<br/>
		
		<!-- 달력 테이블 시작 -->
		<table id="cal_tab">
			<THEAD>
				<TR>
					<th style="color:#fc7474;">일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th style="color:#529dbc;">토</th>
				</TR>
			</THEAD>
			<TBODY>
				<TR>
					${msg }
				</TR>

			</TBODY>
		</TABLE>
		<!-- 달력 테이블 끝 -->
	</DIV>
</BODY>
</HTML>
