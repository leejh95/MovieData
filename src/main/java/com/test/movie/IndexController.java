package com.test.movie;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

	@RequestMapping("/index.inc")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/goListIndex.inc")
	public ModelAndView goList(String category) {
		ModelAndView mv = new ModelAndView();
		boolean chk = false;
		
		if(category != null)
			chk = true;
		
		mv.addObject("category", category);
		mv.addObject("chk", chk);
		mv.setViewName("index");
		return mv;
	}
	
}
