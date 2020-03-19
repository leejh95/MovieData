<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Calendar cal = Calendar.getInstance();

	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);

	if (strYear != null) {
		year = Integer.parseInt(strYear);
		month = Integer.parseInt(strMonth);

	} else {

	}
	
	//년도/월 셋팅
	cal.set(year, month, 1);

	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0;

	//오늘 날짜 저장.
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
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
		<table id="cal_nav">
			<tr>
				<td align="center">
					<!-- 이전해 -->
					<a href="calendar.inc?year=<%=year - 1%>&month=<%=month%>" target="_self">
						<b>&lt;&lt;</b>
					</a> 
<%
if (month > 0) {
%> 
					<!-- 이전달 -->
						<a href="calendar.inc?year=<%=year%>&month=<%=month - 1%>" target="_self">
							<b>&lt;</b>
					</a>
<%
} else {
%> 
						<b>&lt;</b>
<%
}
%> 
						&nbsp;&nbsp; <%=year%>년 <%=month + 1%>월 &nbsp;&nbsp;
<%
if (month < 11) {
%>
						 <!-- 다음달 -->
						<a href="calendar.inc?year=<%=year%>&month=<%=month + 1%>" target="_self">
						<b>&gt;</b>
					</a> 
<%
} else {
%> 
						<b>&gt;</b>
<%
}
%> 
						<!-- 다음해 -->
						<a href="calendar.inc?year=<%=year + 1%>&month=<%=month%>" target="_self"> 
						<b>&gt;&gt;</b>
					</a>
				</td>
			</tr>
		</table>
		<!-- 날짜 네비게이션 끝 -->
		
		<br>
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
					<%
						//처음 빈공란 표시
						for (int index = 1; index < start; index++) {
							out.println("<TD >&nbsp;</TD>");
							newLine++;
						}

						for (int index = 1; index <= endDay; index++) {
							String color = "";

							if (newLine == 0) 
								color = "RED";
							else if (newLine == 6)
								color = "#529dbc";
							else 
								color = "BLACK";

							String sDate = Integer.toString(year);

							sDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
									: Integer.toString(month + 1);
							sDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
									: Integer.toString(index);

							int iUseDate = Integer.parseInt(sDate);

							String backColor = "#ffffff";
							if (iUseDate == intToday) {
								backColor = "#bfbfbf";
							}
							out.println("<TD bgcolor='" + backColor + "' nowrap>");
					%>
					<font color='<%=color%>'><%=index%>
					</font>

					<%
							out.println("<BR>");
							out.println(iUseDate);

							//기능 제거	
							out.println("</TD>");
							newLine++;

							if (newLine == 7) {
								out.println("</TR>");
								if (index <= endDay) {
									out.println("<TR>");
								}
								newLine = 0;
							}
						}
						
						//마지막 공란 LOOP
						while (newLine > 0 && newLine < 7) {
							out.println("<TD>&nbsp;</TD>");
							newLine++;
						}
					%>
				</TR>

			</TBODY>
		</TABLE>
	</DIV>
</BODY>
</HTML>
