package com.test.movie;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieBoardVO;

@Controller
public class BoardviewController {

	@Autowired
	private MovieDAO m_dao;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/boardview.inc")
	public ModelAndView boardView(String b_idx, String nowPage) {
		ModelAndView mv = new ModelAndView();
		
		// Hit
		Object obj = session.getAttribute("m_list");
		List<MovieBoardVO> m_list = null;
		if(obj == null) {
			m_list = new ArrayList<MovieBoardVO>();
		}else {
			m_list = (List)obj;
		}
		
		MovieBoardVO vo = null;
		if(b_idx != null) {
			boolean chk = false;
			vo = m_dao.getBoard(b_idx);
			
			for(MovieBoardVO mvo : m_list) {
				if(vo.getB_idx().equals(mvo.getB_idx())) {
					chk=true;
					break;
				}
			}
			
			if(!chk) {
				vo.setHit(String.valueOf(Integer.parseInt(vo.getHit()) + 1 ));
				m_dao.hit(b_idx);
				m_list.add(vo);
				session.setAttribute("m_list", m_list);
		}
	}
		mv.addObject("vo", vo);
		mv.addObject("nowPage", nowPage);
		mv.addObject("b_idx", b_idx);
		mv.setViewName("boardview");	
		
		return mv;
}
	
	
}
