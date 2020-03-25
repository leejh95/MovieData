package com.test.movie;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieMemberVO;

@Controller
public class SignInController {

	@Autowired
	MovieDAO m_dao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/signIn.inc")
	public String signIn() {
		return "signin";
	}
	
	@RequestMapping("/signInForm.inc")
	public ModelAndView signInForm(String id, String pw) {
		ModelAndView mv = new ModelAndView();
		
		MovieMemberVO vo = m_dao.signIn(id, pw);
		
		if(vo != null) {
			mv.setViewName("index");
			session.setAttribute("memVO", vo);
		}else {
			mv.setViewName("signin");
			mv.addObject("isFailed", true);
		}
		
		return mv;
	}
}
