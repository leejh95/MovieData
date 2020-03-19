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
table, table th, table td{
border: 1px solid blue;
}
#cal_nav{
border: 1px solid red;
}
#cal_tab{
border-collapse: collapse;
}
#cal_tab th, #cal_tab td{
border: 1px solid black;
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
			
			&nbsp;&nbsp; ${year }년 ${month +1 }월 &nbsp;&nbsp;
			
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
					<TD>일</TD>
					<TD>월</TD>
					<TD>화</TD>
					<TD>수</TD>
					<TD>목</TD>
					<TD>금</TD>
					<TD>토</TD>
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
