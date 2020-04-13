package com.test.movie;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.test.util.FileRenameUtil;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieBoardVO;

@Controller
public class WriteController {
	
	@Autowired
	private MovieDAO m_dao;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private HttpServletRequest request;
	
	private String uploadPath = "/resources/upload";
	private String editorPath = "/resources/editor_img";

	@RequestMapping("/writeForm.inc")
	public String writejsp() {
		return "write";
	}
	
	@RequestMapping(value="/saveImage.inc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> saveImage(MovieBoardVO vo) throws Exception{
		System.out.println("saveImage.inc");
		Map<String, String> map = new HashMap<String, String>();
		String f_name ="";
		
		if(vo.getUpload() != null && vo.getUpload().getSize() >0) {
			String path = application.getRealPath(editorPath);
			f_name = (vo.getUpload().getOriginalFilename());
			f_name = (FileRenameUtil.CheckFileName(path, f_name));
			
			vo.getUpload().transferTo(new File(path, f_name));
		}
		
		map.put("url", request.getContextPath()+editorPath+"/"+f_name);
		return map;
	}
	
	@RequestMapping("/write.inc")
	public ModelAndView write(MovieBoardVO vo) throws Exception{
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
		vo.setIp(request.getRemoteAddr());
		
		m_dao.writeBoard(vo);
		
		mv.setViewName("redirect:/list.inc?category="+vo.getCategory()+"&nowPage="+1);
		
		return mv;
	}
}
