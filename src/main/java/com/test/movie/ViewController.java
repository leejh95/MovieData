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

import com.test.vo.ActorVO;
import com.test.vo.ViewVO;

@Controller
public class ViewController {

	@RequestMapping("/view.inc")
	public ModelAndView view(String movieCd) throws Exception {
		ModelAndView mv = new ModelAndView();
		ViewVO vo = new ViewVO();
		
		URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=597ea93394fe1b75e69c9cf07a1fc1de&movieCd="+movieCd);
		//URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=597ea93394fe1b75e69c9cf07a1fc1de&movieCd=20124079");
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestProperty("Content-Type", "application/xml");
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		
		Document doc = builder.build(conn.getInputStream());
		
		Element root = doc.getRootElement();
		
		Element movieInfo = root.getChild("movieInfo");
		
		//영화 이름
		vo.setMovieNm(movieInfo.getChildText("movieNm"));
		vo.setMovieNmEn(movieInfo.getChildText("movieNmEn"));
		//러닝타임
		vo.setShowTm(movieInfo.getChildText("showTm"));
		//제작년도?
		vo.setPrdtYear(movieInfo.getChildText("prdtYear"));
		//개봉일
		vo.setOpenDt(movieInfo.getChildText("openDt"));
		//제작상태
		vo.setPrdtStatNm(movieInfo.getChildText("prdtStatNm"));
		//장편인지 뭔지
		vo.setTypeNm(movieInfo.getChildText("typeNm"));
		//국가
		Element nations = movieInfo.getChild("nations");
		List<Element> nation = nations.getChildren("nation");
		vo.setNationNm(nation.get(0).getChildText("nationNm"));
		//System.out.println(nation.get(0).getChildText("nationNm"));
		
		//장르
		Element genres = movieInfo.getChild("genres");
		List<Element> genre = genres.getChildren("genre");
		vo.setGenreNm(genre.get(0).getChildText("genreNm"));
		
		//감독
		Element directors = movieInfo.getChild("directors");
		List<Element> director = directors.getChildren("director");
		vo.setDirectorNm(director.get(0).getChildText("peopleNm"));
		
		//배우 3명 까지만
		Element actors = movieInfo.getChild("actors");
		List<Element> actor = actors.getChildren("actor");
		ActorVO[] avo = null;
		if(actor.size() < 3) 
			avo = new ActorVO[actor.size()];
		else
			avo = new ActorVO[3];
		
		for(int i = 0; i<avo.length; i++) {
			ActorVO a_vo = new ActorVO();
			a_vo.setActorNm(actor.get(i).getChildText("peopleNm"));
			a_vo.setCastNm(actor.get(i).getChildText("cast"));
			avo[i] = a_vo;
		}
		
		vo.setActors(avo);
		
	//	vo.setActorNm1(actor.get(0).getChildText("peopleNm"));
	//	vo.setActorNm2(actor.get(1).getChildText("peopleNm"));
	//	if(!actor.get(2).getChildText("peopleNm").isEmpty())
		//vo.setActorNm3(actor.get(2).getChildText("peopleNm"));
		//System.out.println(actor.get(0).getChildText("peopleNm"));
		
		
		
		//배우 3명의 배역
	//	vo.setCast1(actor.get(0).getChildText("cast"));
	//	vo.setCast2(actor.get(1).getChildText("cast"));
	//	if(!actor.get(2).getChildText("cast").isEmpty())
		//	vo.setCast3(actor.get(2).getChildText("cast"));
		
		//관람등급
		Element audits = movieInfo.getChild("audits");
		List<Element> audit = audits.getChildren("audit");
		vo.setWatchGradeNm(audit.get(0).getChildText("watchGradeNm"));
		
		//제작사
		Element companys = movieInfo.getChild("companys");
		List<Element> company = companys.getChildren("company");
		vo.setCompanyNm(company.get(0).getChildText("companyNm"));
		
		mv.addObject("vo", vo);
		mv.setViewName("view");
		
		return mv;
	}
	
}
