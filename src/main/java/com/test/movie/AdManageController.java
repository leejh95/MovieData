package com.test.movie;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.test.util.FileRenameUtil;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieAdVO;

@Controller
public class AdManageController {

	@Autowired
	private MovieDAO m_dao;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private HttpServletRequest request;
	
	private String uploadPath = "/resources/upload";
	
	@RequestMapping("/adList.inc")
	public ModelAndView adList() {
		ModelAndView mv = new ModelAndView();
		
		MovieAdVO[] ar = m_dao.getAllAdList();
		
		//System.out.println(ar[0].getA_idx());
		
		mv.addObject("adAr", ar);
		mv.setViewName("adList");
		
		return mv;
	}
	
	//특정 광고 가져오기
	@RequestMapping("/adOne.inc")
	public ModelAndView adOne(String a_idx) {
		ModelAndView mv = new ModelAndView();
		//System.out.println(a_idx);
		MovieAdVO advo = m_dao.getAd(a_idx);
		
		mv.addObject("advo", advo);
		mv.setViewName("adEdit");
		
		return mv;
	}
	
	// 광고 수정 부분
	@RequestMapping("/adEdit.inc")
	public ModelAndView adEdit(MovieAdVO vo) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		MultipartFile mf = vo.getUpload();
		
		if(mf != null && mf.getSize()>0) {
			String path = application.getRealPath(uploadPath);
			File f = new File(path);
			if(!f.exists())
				f.mkdir();
			
			vo.setImage(FileRenameUtil.CheckFileName(path, mf.getOriginalFilename()));
			
			mf.transferTo(new File(path, vo.getImage()));
		}
		
		boolean chk = m_dao.updateAd(vo);
		
		mv.addObject("currentPage", "adList");
		mv.setViewName("admin");
		
		return mv;
	}
	
	
	
}
