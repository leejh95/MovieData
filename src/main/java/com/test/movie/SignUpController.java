package com.test.movie;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieMemberVO;

@Controller
public class SignUpController {
	
	@Autowired
	MovieDAO m_dao;

	@RequestMapping("/signUp.inc")
	public String signUp() {
		return "signup";
	}
	
	@RequestMapping("/signUpKey.inc")
	@ResponseBody
	public Map<String, Object> signUpKey(String id){
		boolean chk = m_dao.isExistID(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("chk", chk);
		
		return map;
	}
	
	@RequestMapping("/signUpForm.inc")
	public String signUpForm(MovieMemberVO vo) {
		boolean chk = m_dao.signUp(vo);
		return "index";
	}
}
