package com.test.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.util.PagingPostComm;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieBoardVO;
import mybatis.vo.MovieCommentVO;

@Controller
public class CommController {

	@Autowired
	private MovieDAO m_dao;
	
	@Autowired
	HttpServletRequest requset;
	
	// 페이징 기법 상수
	public final int BLOCK_LIST = 10;	// 한 페이지당 보여질 게시물 수
	public final int BLOCK_PAGE = 4;	// 한 블럭당 보여질 페이지 수
	int nowPage, rowTotal;
	String pageCode;
	
	@RequestMapping("/postCommList.inc")
	@ResponseBody
	public Map<String, Object> postCommList(String nowPage, String movieCd) throws Exception {
		
		if(nowPage == null) { this.nowPage = 1; }
		else { this.nowPage = Integer.parseInt(nowPage); }
		
		this.rowTotal = m_dao.totalPostCommCount(movieCd);
		PagingPostComm page = new PagingPostComm(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		
		// 페이지 기법의 HTML코드
		this.pageCode = page.getSb().toString();
		
		MovieCommentVO[] ar = m_dao.getPostCommList(movieCd, page.getBegin(), page.getEnd());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("ar", ar);
		map.put("pageCode", this.pageCode);
		
		return map;
	}
	
	@RequestMapping(value = "/commSave.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postCommSave(MovieCommentVO vo) {
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		vo.setIp(requset.getRemoteAddr());
		
		boolean chk = m_dao.writeComment(vo);
		
		map.put("chk", chk);
		return map;
	}
	
	@RequestMapping(value = "/boardCommSave.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> boardCommSave(MovieCommentVO vo) {
		Map<String, Object> map = new HashMap<String, Object>(); 
		//System.out.println(vo.getContent());
		//System.out.println(vo.getM_idx());
		//System.out.println(vo.getMovieCd());
		
		vo.setIp(requset.getRemoteAddr());
		
		boolean chk = m_dao.writeComment(vo);
		
		//MovieCommentVO[] mar = m_dao.getBoardCommList(vo.getB_idx());
		
		map.put("chk", chk);
		//map.put("mar", mar);
		return map;
	}
	
	@RequestMapping(value = "/commDel.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postCommDel(String c_idx, String movieCd) {
		Map<String, Object> map = new HashMap<String, Object>(); 
	
		boolean chk = m_dao.deleteComment(c_idx);
		
		//MovieCommentVO[] mar = m_dao.getCommList(movieCd);
		
		map.put("chk", chk);
		//map.put("mar", mar);
		return map;
	}
	
	@RequestMapping(value = "/commEdit.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postCommEdit(MovieCommentVO vo) {
		Map<String, Object> map = new HashMap<String, Object>(); 
	
		boolean chk = m_dao.updateComment(vo);
		
		map.put("chk", chk);
		return map;
	}
	
	@RequestMapping(value="/boardCommDel.inc", method = RequestMethod.POST)
	public ModelAndView boardCommDel(String c_idx){
		ModelAndView mv = new ModelAndView();
		
		boolean chk = m_dao.deleteComment(c_idx);
		
		mv.addObject("chk", chk);
		mv.setViewName("boardview");
		
		return mv;
		
	}
	
	
}
