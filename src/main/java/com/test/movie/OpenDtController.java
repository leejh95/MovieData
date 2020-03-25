package com.test.movie;

import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.vo.OpenDtVO;

@Controller
public class OpenDtController {

	@RequestMapping("/opendt.inc")
	public ModelAndView rank(String dTime) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		/*
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
		Date currentTime = new Date ();
		String dTime = formatter.format ( currentTime );
		System.out.println ( dTime );
		*/
		
		if(dTime == null) {
			Calendar todayCal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
			dTime = sdf.format(todayCal.getTime());
		}
		
		URL url = new URL("http://http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml?key=ef9fe705049caa4b27ad344b76ad885b");
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestProperty("Content-Type", "application/xml");
		
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		
		Document doc = builder.build(conn.getInputStream());
		
		Element root = doc.getRootElement();
		
		Element m_list = root.getChild("movieList");
		
		List<Element> mvi = m_list.getChildren("movie");
		
		OpenDtVO[] ar = new OpenDtVO[mvi.size()];
		
		for(Element e : mvi) {
			int i=0;
			String odt = e.getChildText("openDt");
			OpenDtVO ovo = new OpenDtVO();
			if(dTime.equals(odt)) {
				
				ovo.setOpenDt(e.getChildText("openDt"));
				ovo.setMovieNm(e.getChildText("movieNm"));
				ovo.setMovieCd(e.getChildText("movieCd"));
			
				try {
					ovo.setImg(getImg(e.getChildText("movieCd")));
				} catch (Exception ee) {
					// TODO: handle exception
				}
				
				ar[i++] = ovo;
			}
			
		}
		
		mv.addObject("ar", ar);
		mv.setViewName("opendt");
		
		return mv;
	}
	
	private String getImg(String movieCd) throws Exception {
	      
	      URL url = new URL("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml2.jsp?collection=kmdb_new2&ServiceKey=RO60W567N4S9H6YV8E3R&detail=Y&codeNo="+movieCd);
	      
	      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	      
	      conn.setRequestProperty("Content-Type", "application/xml");
	      
	      conn.connect();
	      
	      SAXBuilder builder = new SAXBuilder();
	      
	      Document doc = builder.build(conn.getInputStream());
	      
	      Element root = doc.getRootElement();
	      Element result = root.getChild("Result");
	      Element row = result.getChild("Row");
	      String posters = row.getChildText("posters");
	      
	      if(posters != null) {
	         int i = posters.indexOf("|");
	         posters = posters.substring(0, i);
	      }

	      return posters;
	   }
}