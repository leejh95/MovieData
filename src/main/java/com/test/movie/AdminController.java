package com.test.movie;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.util.Paging;
import com.test.util.PagingMemList;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieBoardVO;
import mybatis.vo.MovieMemberVO;

@Controller
public class AdminController {

	@Autowired
	MovieDAO m_dao;
	
	// 페이징 기법 상수
	public final int BLOCK_LIST = 10;	// 한 페이지당 보여질 게시물 수
	public final int BLOCK_PAGE = 4;	// 한 블럭당 보여질 페이지 수
	int nowPage, rowTotal;
	String pageCode, category;
	
	@RequestMapping("/adminPage.inc")
	public String admin() {
		return "admin";
	}
	
	@RequestMapping("/memList.inc")
	public ModelAndView memList(String nowPage) {
		ModelAndView mv = new ModelAndView();
		
		if(nowPage == null) { this.nowPage = 1; }
		else { this.nowPage = Integer.parseInt(nowPage); }
		
		this.rowTotal = m_dao.totalMemberCount();
		PagingMemList page = new PagingMemList(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		
		// 페이지 기법의 HTML코드
		pageCode = page.getSb().toString();
		
		// 게시물 목록
//		MovieBoardVO[] ar = m_dao.getBoardList(category, page.getBegin(), page.getEnd());
		
		//회원 목록
		MovieMemberVO[] ar = m_dao.getMemberList(page.getBegin(), page.getEnd());
		
		mv.addObject("list", ar);
		mv.addObject("pageCode", pageCode);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		
		mv.setViewName("memList");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/restore_member.inc", method = RequestMethod.POST)
	public Map<String, String> deleteMem(String m_idx) {
		String chk = "0";
		Map<String, String> map = new HashMap<String, String>();
		
		if(m_dao.restoreMember(m_idx)) {
			chk = "1";
		} 
		
		map.put("chk", chk);
		
		return map;
	}
}
