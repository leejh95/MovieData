package com.test.movie;

import java.io.File;

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
import mybatis.vo.MovieBoardVO;

@Controller
public class UploadAdController {
	
	@Autowired
	private MovieDAO m_dao;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private HttpServletRequest request;
	
	private String uploadPath = "/resources/upload";

	@RequestMapping("/uploadAd.inc")
	public String uploadAd() {
		
		return "uploadAd";
	}
	
	@RequestMapping("/uploadAdOk.inc")
	public ModelAndView write(MovieAdVO vo) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MultipartFile mf = vo.getUpload();
		
		if(mf != null && mf.getSize()>0) {
			String path = application.getRealPath(uploadPath);
			File f = new File(path);
			if(f.exists())
				f.mkdir();
			vo.setFile_name(FileRenameUtil.CheckFileName(path, mf.getOriginalFilename()));
			vo.setOri_name(mf.getOriginalFilename());
			mf.transferTo(new File(path, vo.getFile_name()));
		}else {
			vo.setFile_name("");
			vo.setOri_name("");
		}
		
		m_dao.uploadAd(vo);
		
		mv.setViewName("redirect:/index.inc");
		
		return mv;
	}
}
