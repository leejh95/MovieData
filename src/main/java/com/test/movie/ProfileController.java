package com.test.movie;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value="/edit_profile.inc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> editProfile(MovieMemberVO vo) {
		boolean chk = m_dao.updateMember(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("chk", chk);
		map.put("vo",vo);
	
		return map;
	}
	
	@RequestMapping(value="/edit_pw.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> editPW(MovieMemberVO vo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean chk = m_dao.updateMember(vo);
		
		map.put("chk", chk);
		map.put("vo", vo);
		
		return map;
	
	}
	
	@ResponseBody
	@RequestMapping(value="/delete_member.inc", method = RequestMethod.POST)
	public Map<String, String> deleteMem(String m_idx, String pw) {
		String chk = "0";
		Map<String, String> map = new HashMap<String, String>();
		
		if(m_dao.deleteMember(m_idx, pw)) {
			chk = "1";
		} 
		System.out.println(chk);
		
		map.put("chk", chk);
		
		return map;
	}
}
