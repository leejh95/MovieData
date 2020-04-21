package com.test.movie;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalendarController {

	@RequestMapping("/calendar.inc")
	public ModelAndView calendar(String year, String month, String sDate) {
		
		if(sDate == null || sDate.length() < 1)
			sDate = "1";
		
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
		int intSdate = Integer.parseInt(sDate);
		
		String msg = "";
		
		for (int index = 1; index < start; index++) {
			msg += "<Th>&nbsp;</Th>";
			newLine++;
		}

		for (int index = 1; index <= endDay; index++) {
			String color = "";

			if (newLine == 0) 
				color = "#fc7474";
			else if (newLine == 6)
				color = "#529dbc";
			else 
				color = "#4b4b4b";

			String sd = Integer.toString(i_year);

			sd += Integer.toString(i_month + 1).length() == 1 ? "0" + Integer.toString(i_month + 1)
					: Integer.toString(i_month + 1);
			sd += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
					: Integer.toString(index);
			
			String isToday = "";
			if (Integer.parseInt(sd) == intToday) 
				isToday = "today";
			String isSdate = "";
			if (Integer.parseInt(sd) == intSdate) 
				isSdate = "sDate";
			
			msg += "<TD id='" + isToday + "' class='"+isSdate+"'><a style='display:block; width:100%; height:100%; color:"+ color +";' href='javascript:goDate("+sd+")'>";
			
			msg += index;

			//기능 제거	
			msg += "</a></TD>";
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
			msg += "<Th>&nbsp;</Th>";
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
