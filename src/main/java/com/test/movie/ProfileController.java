package com.test.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieMemberVO;

@Controller
public class ProfileController {

	@Autowired
	MovieDAO m_dao;
	
	@RequestMapping("/profile.inc")
	public ModelAndView profile(String m_idx) {
		if(m_idx == null)
			m_idx = "1";
		MovieMemberVO vo = m_dao.getMember(m_idx);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("profile");
		
		return mv;
	}
	
	@RequestMapping("/edit_profile.inc")
	public ModelAndView editProfile(MovieMemberVO vo) {
		boolean chk = m_dao.updateMember(vo);
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@RequestMapping("/edit_pw.inc")
	public ModelAndView editPW(String pw) {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@RequestMapping("/delete_member.inc")
	public String deleteMem() {
		return "index.inc";
	}
}
