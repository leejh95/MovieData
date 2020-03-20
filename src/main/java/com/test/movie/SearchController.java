package com.test.movie;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.vo.SearchVO;

@Controller
public class SearchController {

	@RequestMapping("/search.inc")
	public ModelAndView search(String type, String value) throws Exception  {
		ModelAndView mv = new ModelAndView();
		int searchType = Integer.parseInt(type);
		System.out.println(searchType+"/"+value);
		
		URL url = null;
		
		switch (searchType) {
		case 0:
			url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml?key=597ea93394fe1b75e69c9cf07a1fc1de&movieNm="+value);
			break;
		case 1:
			url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml?key=597ea93394fe1b75e69c9cf07a1fc1de&directorNm="+value);
			break;	
		case 2:
			url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml?key=597ea93394fe1b75e69c9cf07a1fc1de&openStartDt="+value);
			break;
		}
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestProperty("Content-Type", "application/xml");
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		
		Document doc = builder.build(conn.getInputStream());
		
		Element root = doc.getRootElement();
		
		Element movieList = root.getChild("movieList");
		
		List<Element> movie = movieList.getChildren("movie");
		
		SearchVO[] ar = new SearchVO[movie.size()];
		
		int i = 0;
		for(Element e : movie) {
			SearchVO vo = new SearchVO();
			vo.setMovieCd(e.getChildText("movieCd"));
			vo.setMovieNm(e.getChildText("movieNm"));
			vo.setMovieNmEn(e.getChildText("movieNmEn"));
			vo.setPrdtYear(e.getChildText("prdtYear"));
			vo.setOpenDt(e.getChildText("openDt"));
			vo.setTypeNm(e.getChildText("typeNm"));
			vo.setPrdtStatNm(e.getChildText("prdtStatNm"));
			vo.setNationAlt(e.getChildText("nationAlt"));
			vo.setGenreAlt(e.getChildText("genreAlt"));
			vo.setDirectorNm(e.getChild("directors").getChild("director").getChildText("peopleNm"));
			
			try {
				vo.setImage(getImg(e.getChildText("movieCd")));
			} catch (Exception e2) {
				// TODO: handle exception
			}
			
			ar[i++] = vo;
		}
		
		
		mv.addObject("ar", ar);
		mv.setViewName("searchView");
		
		
		
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
