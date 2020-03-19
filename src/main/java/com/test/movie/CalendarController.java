package com.test.movie;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalendarController {

	@RequestMapping("/calendar.inc")
	public ModelAndView calendar(String year, String month) {
		
		Calendar cal = Calendar.getInstance();

		int i_year = cal.get(Calendar.YEAR);
		int i_month = cal.get(Calendar.MONTH);
		int date = cal.get(Calendar.DATE);

		if (year != null) 
			i_year = Integer.parseInt(year);
		if (month != null) 
			i_month = Integer.parseInt(month);
		
		//년도/월 셋팅
		cal.set(i_year, i_month, 1);

		int startDay = cal.getMinimum(java.util.Calendar.DATE);
		int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
		int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
		int newLine = 0;

		//오늘 날짜 저장.
		Calendar todayCal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
		
		int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
		
		String msg = "";
		
		for (int index = 1; index < start; index++) {
			msg += "<TD >&nbsp;</TD>";
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

			String sDate = Integer.toString(i_year);

			sDate += Integer.toString(i_month + 1).length() == 1 ? "0" + Integer.toString(i_month + 1)
					: Integer.toString(i_month + 1);
			sDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
					: Integer.toString(index);

			String backColor = "#ffffff";
			
			if (Integer.parseInt(sDate) == intToday) 
				backColor = "#bfbfbf";
			
			msg += "<TD bgcolor='" + backColor + "'><a style='display:block; width:100%;' href='javascript:goRank("+sDate+")'>";
			
			msg += "<font color='<%=color%>'>" + index + "</font>";

			//기능 제거	
			msg += "</TD>";
			newLine++;

			if (newLine == 7) {
				msg += "</TR>";
				if (index <= endDay) {
					msg += "<TR>";
				}
				newLine = 0;
			}
		}
		
		//마지막 공란 LOOP
		while (newLine > 0 && newLine < 7) {
			msg += "<TD>&nbsp;</TD>";
			newLine++;
		}

		ModelAndView mv = new ModelAndView();
		
		mv.addObject("year", i_year);
		mv.addObject("month", i_month);
		mv.addObject("msg", msg);
		
		mv.setViewName("calendar");
		
		return mv;
	}
}
