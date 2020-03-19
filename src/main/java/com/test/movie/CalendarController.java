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
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("year", i_year);
		mv.addObject("month", i_month);
		mv.addObject("startDay", startDay);
		mv.addObject("endDay", endDay);
		mv.addObject("start", start);
		mv.addObject("newLine", newLine);
		mv.addObject("intToday", intToday);
		
		mv.setViewName("calendar");
		
		return mv;
	}
}
