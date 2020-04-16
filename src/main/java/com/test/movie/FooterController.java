package com.test.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieAdVO;

@Controller
public class FooterController {
	
	@Autowired
	private MovieDAO m_dao;

	@RequestMapping("/footer.inc")
	public ModelAndView footer() {
		ModelAndView mv = new ModelAndView();
		
		MovieAdVO[] avoList = null;
		avoList = m_dao.getAdList("2");
		
		mv.addObject("header_ad", avoList);
		mv.setViewName("footer");
		
		return mv;
	}
}
