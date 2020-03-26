package com.test.movie;

import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.vo.ActorVO;
import com.test.vo.OpenDtVO;
import com.test.vo.ViewVO;
import com.test.vo.WeeklyRankVO;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieCommentVO;

@Controller
public class WeeklyRankController {
	
	@RequestMapping("/weekly_rank.inc")
	public ModelAndView weeklyRank(String dTime) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		if(dTime == null) {
			SimpleDateFormat formatter = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
			Date currentTime = new Date ();
			dTime = formatter.format ( currentTime );
		}
		
		URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.xml?key=2fb600a3207510ce023b34bb82f9db93&repNationCd=K&weekGb=0&targetDt="+dTime);
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestProperty("Content-Type", "application/xml");
		
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		
		Document doc = builder.build(conn.getInputStream());
		
		Element root = doc.getRootElement();
		
		Element weeklyBoxOfficeList = root.getChild("weeklyBoxOfficeList");
		
		List<Element> weekly = weeklyBoxOfficeList.getChildren("weeklyBoxOffice");
		
		WeeklyRankVO[] ar = new WeeklyRankVO[weekly.size()];
		
		for(Element e : weekly) {
			int i=0;
			WeeklyRankVO wvo = new WeeklyRankVO();
			
			wvo.setAudiAcc(e.getChildText("audiAcc"));
			wvo.setAudiChange(e.getChildText("audiChange"));
			wvo.setAudiCnt(e.getChildText("audiCnt"));
			wvo.setAudiInten(e.getChildText("audiInten"));
			wvo.setRank(e.getChildText("rank"));
			wvo.setRankInten(e.getChildText("rankInten"));
			wvo.setRankOldAndNew(e.getChildText("rankOldAndNew"));
			wvo.setRnum(e.getChildText("rnum"));
			wvo.setSalesAcc(e.getChildText("salesAcc"));
			wvo.setSalesAmt(e.getChildText("salesAmt"));
			wvo.setSalesChange(e.getChildText("salesChange"));
			wvo.setSalesInten(e.getChildText("salesInten"));
			wvo.setSalesShare(e.getChildText("salesShare"));
			wvo.setScrnCnt(e.getChildText("scrnCnt"));
			wvo.setShowCnt(e.getChildText("showCnt"));
			wvo.setOpenDt(e.getChildText("openDt"));
			wvo.setMovieNm(e.getChildText("movieNm"));
			wvo.setMovieCd(e.getChildText("movieCd"));
		
			try {
				wvo.setImage(getImg(e.getChildText("movieCd")));
			} catch (Exception ee) {
				ee.printStackTrace();
			}
				
			ar[i++] = wvo;
			
		}
		
		mv.addObject("ar", ar);
		mv.setViewName("weekly_rank");
		
		return mv;
	}
	
	private String getImg(String movieCd1) throws Exception {
	      
	      URL url = new URL("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml2.jsp?collection=kmdb_new2&ServiceKey=RO60W567N4S9H6YV8E3R&detail=Y&codeNo="+movieCd1);
	      
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
