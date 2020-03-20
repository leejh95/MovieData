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
#cal_nav{
border: 1px solid red;

}
#cal_nav *{
text-decoration: none;
}
#cal_tab{
width: 1000px;
border-collapse: collapse;
}
#cal_tab th, #cal_tab td{
text-align: center;
border: 1px solid white;
background: #fafafa;
}
#cal_tab td:hover{
background: #bbbbbb;
}
#cal_tab td:active{
background: #ffffff;
}
#cal_tab *{
margin: 0;
text-decoration: none;
}
</style>
</HEAD>
<BODY>
	<DIV id="cal_content">
	
		<!-- 날짜 네비게이션 시작 -->
		<div id="cal_nav">
			<!-- 이전해 -->
			<a href="javascript:goCal('${year -1 }', '${month }')" target="_self">
				<b>&lt;&lt;</b>
			</a> 
			
			<!-- 이전달 -->
			<c:if test="${month > 0 }">
			<a href="javascript:goCal('${year }', '${month-1 }')" target="_self">
				<b>&lt;</b>
			</a>
			</c:if>
			
			<c:if test="${month eq 0 }">
				<b>&lt;</b>
			</c:if>
			
			<b>${year }년 ${month +1 }월</b>
			
			<c:if test="${month < 11 }">
			<a href="javascript:goCal('${year }', '${month+1}')" target="_self">
				<b>&gt;</b>
			</a>
			</c:if>
			
			<c:if test="${month eq 11 }">
				<b>&gt;</b>
			</c:if>
			
			<!-- 다음해 -->
			<a href="javascript:goCal('${year+1}', '${month}')" target="_self"> 
				<b>&gt;&gt;</b>
			</a>
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
