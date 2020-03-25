package com.test.movie;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieCommentVO;

@Controller
public class CommController {

	@Autowired
	private MovieDAO m_dao;
	
	@Autowired
	HttpServletRequest requset;
	
	@RequestMapping(value = "/commSave.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> commSave(MovieCommentVO vo) {
		Map<String, Object> map = new HashMap<String, Object>(); 
		//System.out.println(vo.getContent());
		//System.out.println(vo.getM_idx());
		//System.out.println(vo.getMovieCd());
		
		vo.setIp(requset.getRemoteAddr());
		
		boolean chk = m_dao.writeComment(vo);
		
		MovieCommentVO[] mar = m_dao.getCommList(vo.getMovieCd());
		
		map.put("chk", chk);
		map.put("mar", mar);
		return map;
	}
	
	@RequestMapping(value = "/commDel.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> commDel(String c_idx, String movieCd) {
		Map<String, Object> map = new HashMap<String, Object>(); 
	
		boolean chk = m_dao.deleteComment(c_idx);
		
		MovieCommentVO[] mar = m_dao.getCommList(movieCd);
		
		map.put("chk", chk);
		map.put("mar", mar);
		return map;
	}
	
}
