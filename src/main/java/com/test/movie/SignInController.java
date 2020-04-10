package com.test.movie;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView signIn() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		String clientId = "7n3IjfdDMIZUtoQOhPqu";//애플리케이션 클라이언트 아이디값";
	    String redirectURI = URLEncoder.encode("http://localhost:9090/movie/callback.inc", "UTF-8");
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
		
	    mv.addObject("apiURL", apiURL);
		mv.setViewName("signin");
		
		return mv;
	}
	
	@RequestMapping("/signInForm.inc")
	@ResponseBody
	public Map<String, Object> signInForm(String id, String pw) {
		MovieMemberVO vo = m_dao.signIn(id, pw);
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean chk = false;
		
		if(vo != null) {
			chk = true;
			session.setAttribute("memVO", vo);
		}
		
		map.put("chk", chk);
		
		return map;
	}
	
	
}
