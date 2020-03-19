package com.test.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {

	@RequestMapping("/calendar.inc")
	public String calendar() {
		return "calendar";
	}
}
