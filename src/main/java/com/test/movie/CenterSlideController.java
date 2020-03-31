package com.test.movie;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.vo.DailyVO;

@Controller
public class CenterSlideController {

	@RequestMapping("/centerSlide.inc")
	public ModelAndView center() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Date dDate = new Date();
		dDate = new Date(dDate.getTime()+(1000*60*60*24*-1));
		SimpleDateFormat dSdf = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		String yesterday = dSdf.format(dDate);
		//System.out.println(yesterday);
		URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=597ea93394fe1b75e69c9cf07a1fc1de&targetDt="+yesterday+"&repNationCd=K");
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestProperty("Content-Type", "application/xml");
		
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		
		Document doc = builder.build(conn.getInputStream());
		
		Element root = doc.getRootElement();
		
		Element dailyBoxOfficeList = root.getChild("dailyBoxOfficeList");
		
		List<Element> dailyBoxOffice = dailyBoxOfficeList.getChildren("dailyBoxOffice");
		
		DailyVO[] dar = new DailyVO[dailyBoxOffice.size()];
		
		int i = 0;
		for(Element e : dailyBoxOffice){
			DailyVO vo = new DailyVO();
			vo.setRank(e.getChildText("rank"));
			vo.setMovieCd(e.getChildText("movieCd"));
			vo.setMovieNm(e.getChildText("movieNm"));
			vo.setOpenDt(e.getChildText("openDt"));
			vo.setRankInten(e.getChildText("rankInten"));
			vo.setAudiAcc(e.getChildText("audiAcc"));
			
			DecimalFormat fm = new DecimalFormat("###,###,###,###");
			Double dbdb = Double.parseDouble(e.getChildText("salesAcc"));
			String ch = fm.format(dbdb);
			//System.out.println(ch);
			vo.setSalesAcc(ch);
			//String ddd = e.getChildText("openDt").substring(0, 4);
			
			try {
				vo.setImage(getPost(e.getChildText("movieNm")));
			} catch (Exception e2) {
				// TODO: handle exception
			}
			
			dar[i++] = vo;
		}
		
		String year = yesterday.substring(0, 4);
		String month = yesterday.substring(4, 6);
		String day = yesterday.substring(6, 8);
		
		String date = year+"년 "+month+"월 "+day+"일";
				
		mv.addObject("yesterday", yesterday);
		mv.addObject("date", date);
		mv.addObject("dar", dar);
		mv.setViewName("centerSlide");
		
		return mv;
	}
	
	public String getPost(String movieNm) throws Exception{
        // 영화 포스터 가져오기
        //System.out.println(movieNm);
        
          String clientID="UssVhdtzaSQlNhAr5bke"; //네이버 개발자 센터에서 발급받은 clientID입력
          String clientSecret = "6bwpOT_Ese";        //네이버 개발자 센터에서 발급받은 clientSecret입력
          
          String mv_name = URLEncoder.encode(movieNm, "UTF-8");
          URL url = new URL("https://openapi.naver.com/v1/search/movie.xml?query="+mv_name);
          
          URLConnection urlConn = url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체 
          
          urlConn.setRequestProperty("X-Naver-Client-ID", clientID);
          urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
          
          SAXBuilder builder = new SAXBuilder();
          Document doc = builder.build(urlConn.getInputStream());
 
          Element root = doc.getRootElement();
          Element channel = root.getChild("channel");

        List<Element> item = channel.getChildren("item");
        String image_s = null;
        if(item.size() != 0) {
           image_s = item.get(0).getChildText("image");         
        }else {
           image_s = "http://www.kobis.or.kr/kobis/web/comm/images/main/noimage.png";
        }
        
        //System.out.println("썸네일 : " + image_s);
          
          return image_s;
     }
}
