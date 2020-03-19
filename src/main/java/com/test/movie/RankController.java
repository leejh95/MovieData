package com.test.movie;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.vo.RankVO;

@Controller
public class RankController {

	@RequestMapping("/Rank.inc")
	public ModelAndView rank(String dTime) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		/*
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
		Date currentTime = new Date ();
		String dTime = formatter.format ( currentTime );
		System.out.println ( dTime );
		*/
		
		URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=ef9fe705049caa4b27ad344b76ad885b&targetDt="+dTime);
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestProperty("Content-Type", "application/xml");
		
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		
		Document doc = builder.build(conn.getInputStream());
		
		Element root = doc.getRootElement();
		
		Element BOList = root.getChild("dailyBoxOfficeList");
		
		List<Element> BO = BOList.getChildren("dailyBoxOffice");
		
		RankVO[] ar = new RankVO[BO.size()];
		
		for(int i=0;i<BO.size();i++) {
			RankVO rvo = new RankVO();
			
			rvo.setRank(BO.get(i).getChildText("rank"));
			rvo.setMovieNm(BO.get(i).getChildText("movieNm"));
			rvo.setOpenDt(BO.get(i).getChildText("OpenDt"));
			
			Element mc = BO.get(i).getChild("movieCd");
			URL url2 = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=ef9fe705049caa4b27ad344b76ad885b&movieCd="+mc);
			
			HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
			conn2.setRequestProperty("Content-Type", "application/xml");
			conn2.connect();
			
			SAXBuilder builder2 = new SAXBuilder();
			
			Document doc2 = builder2.build(conn2.getInputStream());
			Element root2 = doc2.getRootElement();
			
			Element MInfo = root2.getChild("movieInfo");
			Element ga = MInfo.getChild("genres").getChild("genre").getChild("genreNm");
			Element na = MInfo.getChild("nations").getChild("nation").getChild("nationNm");
			Element di = MInfo.getChild("directors").getChild("director").getChild("peopleNm");
			
			rvo.setGenreAlt(ga.toString());
			rvo.setNationAlt(na.toString());
			rvo.setDirector(di.toString());
			
			ar[i] = rvo;
			
		}
		
		mv.addObject("ar", ar);
		mv.setViewName("rank");
		
		return mv;
	}
}