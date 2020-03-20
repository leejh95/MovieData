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

import com.test.vo.RankVO;

@Controller
public class RankController {

	@RequestMapping("/rank.inc")
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
		
		for(int i=0; i<BO.size(); i++) {
			RankVO rvo = new RankVO();
			
			rvo.setRank(BO.get(i).getChildText("rank"));
			rvo.setMovieNm(BO.get(i).getChildText("movieNm"));
			rvo.setOpenDt(BO.get(i).getChildText("openDt"));
			rvo.setMovieCd(BO.get(i).getChildText("movieCd"));
			
			ar[i] = rvo;
			
		}
		
		mv.addObject("ar", ar);
		mv.setViewName("rank");
		
		return mv;
	}
}