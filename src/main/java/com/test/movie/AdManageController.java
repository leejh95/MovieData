package com.test.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieAdVO;

@Controller
public class AdManageController {

	@Autowired
	private MovieDAO m_dao;
	
	@RequestMapping("/adList.inc")
	public ModelAndView adList() {
		ModelAndView mv = new ModelAndView();
		
		MovieAdVO[] ar = m_dao.getAllAdList();
		
		//System.out.println(ar[0].getA_idx());
		
		mv.addObject("adAr", ar);
		mv.setViewName("adList");
		
		return mv;
	}
	
	//특정 광고 가져오기
	@RequestMapping("/adOne.inc")
	public ModelAndView adOne(String a_idx) {
		ModelAndView mv = new ModelAndView();
		System.out.println(a_idx);
		MovieAdVO advo = m_dao.getAd(a_idx);
		
		mv.addObject("advo", advo);
		mv.setViewName("adEdit");
		
		return mv;
	}
	
	// 광고 수정 부분
	
}
