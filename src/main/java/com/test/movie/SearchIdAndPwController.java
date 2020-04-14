package com.test.movie;

import java.util.HashMap;
import java.util.Map;

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
		boolean chk = false;
		System.out.println(vo.getEmail() + "/" + vo.getId());
		String m_idx = m_dao.searchByIdAndEmail(vo);
		if(m_idx != null)
			chk = true;
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("chk", chk);
		mv.addObject("m_idx", m_idx);
		mv.setViewName("searchPW_change");
		
		return mv;
	}
	
	@RequestMapping("/searchPwOk.inc")
	@ResponseBody
	public Map<String, Object> searchPwOk(MovieMemberVO vo) {
		
		boolean chk = m_dao.updateMember(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("chk", chk);
		
		return map;
	}
}
