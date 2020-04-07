package com.test.movie;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.test.util.FileRenameUtil;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieBoardVO;

@Controller
public class AnswerController {

	@Autowired
	private MovieDAO m_dao;
	@Autowired
	private ServletContext application;
	@Autowired
	private HttpServletRequest request;
	
	private String uploadPath = "/resources/upload";
	
	@RequestMapping("/answer.inc")
	public ModelAndView answer_jsp(MovieBoardVO vo) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", vo);
		mv.setViewName("answer");
		
		return mv;
	}
	
	@RequestMapping("/answrite.inc")
	public ModelAndView answrite(MovieBoardVO vo) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MultipartFile mf = vo.getUpload();
		if(mf != null && mf.getSize() > 0) {
			String path = application.getRealPath(uploadPath);
			
			vo.setFile_name(FileRenameUtil.CheckFileName(path, mf.getOriginalFilename()));
			vo.setOri_name(mf.getOriginalFilename());
			mf.transferTo(new File(path, vo.getFile_name()));
		}else {
			vo.setFile_name("");
			vo.setOri_name("");
		}
		vo.setIp(request.getRemoteAddr());
		vo.setCategory("free");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("ref", vo.getRef());
		map.put("sunbun", vo.getSunbun());
		
		m_dao.updateSunbun(map);
		
		int step = Integer.parseInt(vo.getStep())+1;
		vo.setStep(String.valueOf(step));
		
		int sunbun = Integer.parseInt(vo.getSunbun())+1;
		vo.setSunbun(String.valueOf(sunbun));
		
		m_dao.writeAnswer(vo);
		
		mv.addObject("nowPage", vo.getNowPage());
		mv.setViewName("redirect:/goListIndex.inc?category="+vo.getCategory());
		
		return mv;
	}
	
}
