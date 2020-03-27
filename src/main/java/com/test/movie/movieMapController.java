package com.test.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class movieMapController {

	
	@RequestMapping("/movieMap.inc")
	public String movieMap() {
		
		return "movieMap";
	}
}
