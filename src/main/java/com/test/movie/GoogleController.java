package com.test.movie;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieMemberVO;

@Controller
public class GoogleController {
	
	@Autowired
	MovieDAO m_dao;
	
	@Autowired
	HttpSession session;

	@RequestMapping("/google.inc")
	public String signin() {
		
		return "google";
	}
	
	@RequestMapping("/googlelogin.inc")
	public String googlelogin(MovieMemberVO mvo) {
		
		System.out.println("fdsafdsa");
		
		MovieMemberVO vo = m_dao.signInSns(mvo.getSns_id(), mvo.getSns_type());
		
		if(vo != null) {
    		//이미 방문하여 DB에 남아있는경우
    		session.setAttribute("memVO", vo);
    	}else {
    		// 처음온 경우
    		m_dao.signUp(mvo);
    		vo = m_dao.signInSns(mvo.getSns_id(), mvo.getSns_type());
    		session.setAttribute("memVO", vo);
    	}

		return "index";
	}
	
}
