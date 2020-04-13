package com.test.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieMemberVO;

@Controller
public class SearchIdAndPwController {

	@Autowired
	MovieDAO m_dao;
	
	@RequestMapping("/searchID.inc")
	public String searchID() {
		return "searchID";
	}
	
	@RequestMapping("/searchPW.inc")
	public String searchPW() {
		return "searchPW";
	}
	
	@RequestMapping("/searchIdForm.inc")
	public ModelAndView searchIdForm(String email) {
		String id = m_dao.searchIdByEmail(email);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("id", id);
		mv.setViewName("searchID_ok");
		
		return mv;
	}
	
	@RequestMapping("/searchPwForm.inc")
	public ModelAndView searchPwForm(MovieMemberVO vo) {
		boolean chk = m_dao.isExistPw(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("chk", chk);
		mv.setViewName("searchPW_ok");
		
		return mv;
	}
}
