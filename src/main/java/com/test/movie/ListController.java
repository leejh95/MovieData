package com.test.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.util.Paging;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieBoardVO;

@Controller
public class ListController {
	
	@Autowired
	MovieDAO m_dao;
	
	// 페이징 기법 상수
	public final int BLOCK_LIST = 10;	// 한 페이지당 보여질 게시물 수
	public final int BLOCK_PAGE = 4;	// 한 블럭당 보여질 페이지 수
	int nowPage, rowTotal;
	String pageCode, category; 

	@RequestMapping("/list.inc")
	public ModelAndView list(String nowPage, String category) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		if(nowPage == null) { this.nowPage = 1; }
		else { this.nowPage = Integer.parseInt(nowPage); }
		
		if(category.equals("free")) { this.category = "free"; }
		else if(category.equals("review")) { this.category = "review"; }
		
		this.rowTotal = m_dao.totalCount(category);
		Paging page = new Paging(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, this.category);
		
		// 페이지 기법의 HTML코드
		pageCode = page.getSb().toString();
		
		// 게시물 목록
		MovieBoardVO[] ar = m_dao.getBoardList(category, page.getBegin(), page.getEnd());
		
		mv.addObject("list", ar);
		mv.addObject("pageCode", pageCode);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("category", category);
		
		mv.setViewName("list");
		return mv;
	}
	
}
