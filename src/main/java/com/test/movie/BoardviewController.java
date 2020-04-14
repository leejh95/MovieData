package com.test.movie;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.util.PagingBoardComm;
import com.test.util.PagingPostComm;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieBoardVO;
import mybatis.vo.MovieCommentVO;

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
	
	// 페이징 기법 상수
	public final int BLOCK_LIST = 10;	// 한 페이지당 보여질 게시물 수
	public final int BLOCK_PAGE = 4;	// 한 블럭당 보여질 페이지 수
	int nowPage, rowTotal;
	String pageCode, b_idx;

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
	
	@RequestMapping("/boardCommList.inc")
	@ResponseBody
	public Map<String, Object> boardCommList(String nowPage, String b_idx) throws Exception{
		this.b_idx = b_idx;
		if(nowPage == null) { this.nowPage = 1; }
		else { this.nowPage = Integer.parseInt(nowPage); }
		
		this.rowTotal = m_dao.totalBoardCommCount(b_idx);
		
		PagingBoardComm page = new PagingBoardComm(this.nowPage, this.rowTotal, BLOCK_LIST, BLOCK_PAGE, this.b_idx);
		
		// 페이지 기법의 HTML코드
		this.pageCode = page.getSb().toString();
		
		
		MovieCommentVO[] ar = m_dao.getBoardCommList(this.b_idx, page.getBegin(), page.getEnd());
	
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("ar", ar);
		
		map.put("pageCode", this.pageCode);
		
		return map;
	
	}
	
	@RequestMapping("/boardEdit.inc")
	public ModelAndView boardEdit(String b_idx, String nowPage) {
		
		ModelAndView mv = new ModelAndView();
		
		MovieBoardVO vo = m_dao.getBoard(b_idx);
		
		mv.addObject("vo", vo);
		mv.setViewName("edit");
		
		return mv;
	}
	
	@RequestMapping("/Edit.inc")
	public ModelAndView Edit(MovieBoardVO vo) {
		ModelAndView mv = new ModelAndView();
	
		boolean chk = m_dao.updateBoard(vo);
		
		String b_idx=vo.getB_idx();
		int nowPage=vo.getNowPage();
		String category=vo.getCategory();
		
		mv.addObject("vo", vo);
		mv.addObject("b_idx", b_idx);
		mv.addObject("nowPage", nowPage);
		mv.addObject("category", category);
		mv.setViewName("redirect:boardview.inc");
		
		return mv;
	}
	
}
