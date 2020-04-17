package com.test.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.util.PagingMemList;
import com.test.util.PagingSearchMember;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieMemberVO;

@Controller
public class SearchMemberController {

	@Autowired
	MovieDAO m_dao;
	
	// 페이징 기법 상수
		public final int BLOCK_LIST = 10;	// 한 페이지당 보여질 게시물 수
		public final int BLOCK_PAGE = 4;	// 한 블럭당 보여질 페이지 수
		int nowPage, rowTotal;
		String pageCode;
	
	@RequestMapping("/searchMem.inc")
	public String searchMem() {
		
		return "searchMember";
		
	}
		
	@RequestMapping("/searchMember.inc")
	public ModelAndView searchMember(String nowPage, String searchType, String searchValue) {
		ModelAndView mv = new ModelAndView();
		
		if(nowPage == null) { this.nowPage = 1; }
		else { this.nowPage = Integer.parseInt(nowPage); }
		
		this.rowTotal = m_dao.searchMemberCount(searchType, searchValue);
		PagingSearchMember page = new PagingSearchMember(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		
		// 페이지 기법의 HTML코드
		pageCode = page.getSb().toString();
		
		//회원 목록
		MovieMemberVO[] ar = m_dao.searchMember(searchType, searchValue, page.getBegin(), page.getEnd());
		mv.addObject("list", ar);
		mv.addObject("pageCode", pageCode);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		
		mv.setViewName("searchMember");
		return mv;
		
	}
	
}
