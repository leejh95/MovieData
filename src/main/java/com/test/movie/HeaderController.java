package com.test.movie;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieAdVO;

@Controller
public class HeaderController {
	
	@Autowired
	private MovieDAO m_dao;

	@RequestMapping("/header.inc")
	public ModelAndView header() {
		
		ModelAndView mv = new ModelAndView();
		
		MovieAdVO[] avoList = null;
		avoList = m_dao.getAdList("1");
		
		mv.addObject("header_ad", avoList);
		mv.setViewName("header");
		
		return mv;
	}
	
	
}
