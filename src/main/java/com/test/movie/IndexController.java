package com.test.movie;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.vo.DailyVO;
import com.test.vo.WeeklyRankVO;

@Controller
public class IndexController {
	
	String beginWeekDay = null;
	String endWeekDay = null;

	@RequestMapping("/index.inc")
	public ModelAndView center() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Date dDate = new Date();
		dDate = new Date(dDate.getTime()+(1000*60*60*24*-1));
		SimpleDateFormat dSdf = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		String yesterday = dSdf.format(dDate);
		
		Date lDate= new Date();
		lDate = new Date(lDate.getTime()+(1000*60*60*24*-7));
		SimpleDateFormat weeklast = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		String lastweek = weeklast.format(lDate);
		//System.out.println(lastweek);
		
		DailyVO[] dar = getDaily(yesterday);
		WeeklyRankVO[] war = getWeekly(lastweek);
		
		//System.out.println(war.length);
		
		String year = yesterday.substring(0, 4);
		String month = yesterday.substring(4, 6);
		String day = yesterday.substring(6, 8);
		
		String date = year+"년 "+month+"월 "+day+"일";
		
		mv.addObject("lastweek", lastweek);
		mv.addObject("yesterday", yesterday);
		mv.addObject("date", date);
		mv.addObject("dar", dar);
		mv.addObject("war", war);
		mv.addObject("beginWeekDay", beginWeekDay);
		mv.addObject("endWeekDay", endWeekDay);
		mv.setViewName("index");
		
		return mv;
	}
	
	public DailyVO[] getDaily(String dTime) throws Exception{
		URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=597ea93394fe1b75e69c9cf07a1fc1de&targetDt="+dTime+"&repNationCd=K");
		
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
			vo.setRankOldAndNew(e.getChildText("rankOldAndNew"));
			
			vo.setSalesShare(e.getChildText("salesShare"));
			vo.setSalesChange(e.getChildText("salesChange"));
			vo.setAudiChange(e.getChildText("audiChange"));
			vo.setScrnCnt(e.getChildText("scrnCnt"));
			vo.setShowCnt(e.getChildText("showCnt"));
			
			DecimalFormat fm = new DecimalFormat("###,###,###,###");
			String salesAcc = fm.format(Double.parseDouble(e.getChildText("salesAcc")));
			String audiAcc = fm.format(Double.parseDouble(e.getChildText("audiAcc")));
			String salesAmt = fm.format(Double.parseDouble(e.getChildText("salesAmt")));
			String salesInten = fm.format(Double.parseDouble(e.getChildText("salesInten")));
			String audiCnt = fm.format(Double.parseDouble(e.getChildText("audiCnt")));
			String audiInten = fm.format(Double.parseDouble(e.getChildText("audiInten")));
			
			vo.setSalesAcc(salesAcc);
			vo.setAudiAcc(audiAcc);
			vo.setSalesAmt(salesAmt);
			vo.setSalesInten(salesInten);
			vo.setAudiCnt(audiCnt);
			vo.setAudiInten(audiInten);
			
			try {
				vo.setImage(getImage(e.getChildText("movieNm"), e.getChildText("openDt").substring(0, 4)));
			} catch (Exception e2) {
				// TODO: handle exception
			}
			
			dar[i++] = vo;
		}
		return dar;
	}
	
	public WeeklyRankVO[] getWeekly(String dTime) throws Exception {
		URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.xml?key=2fb600a3207510ce023b34bb82f9db93&repNationCd=K&weekGb=0&targetDt="+dTime);
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestProperty("Content-Type", "application/xml");
		
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		
		Document doc = builder.build(conn.getInputStream());
		
		Element root = doc.getRootElement();

		String showRange = root.getChildText("showRange");
		
		String begin = showRange.split("~")[0];
		String year = begin.substring(0, 4);
		String month = begin.substring(4, 6);
		String day = begin.substring(6, 8);
		beginWeekDay = year+"년 "+month+"월 "+day+"일";
		
		String end = showRange.split("~")[1];
		year = end.substring(0, 4);
		month = end.substring(4, 6);
		day = end.substring(6, 8);
		endWeekDay = year+"년 "+month+"월 "+day+"일";
		
		Element weeklyBoxOfficeList = root.getChild("weeklyBoxOfficeList");
		
		List<Element> weekly = weeklyBoxOfficeList.getChildren("weeklyBoxOffice");
		
		WeeklyRankVO[] ar = new WeeklyRankVO[weekly.size()];
		
		int i=0;
		for(Element e : weekly) {
			
			WeeklyRankVO wvo = new WeeklyRankVO();
			
			wvo.setRank(e.getChildText("rank"));
			wvo.setOpenDt(e.getChildText("openDt"));
			wvo.setMovieNm(e.getChildText("movieNm"));
			wvo.setMovieCd(e.getChildText("movieCd"));
			wvo.setRankInten(e.getChildText("rankInten"));
			wvo.setRankOldAndNew(e.getChildText("rankOldAndNew"));
			DecimalFormat fm = new DecimalFormat("###,###,###,###");
			Double dbdb = Double.parseDouble(e.getChildText("salesAcc"));
			Double dbdb2 = Double.parseDouble(e.getChildText("audiAcc"));
			String ch = fm.format(dbdb);
			String ch2 = fm.format(dbdb2);
			//System.out.println(ch);
			wvo.setSalesAcc(ch);
			wvo.setAudiAcc(ch2);
			
			try {
				wvo.setImage(getImage(e.getChildText("movieNm"), e.getChildText("openDt").substring(0, 4)));
			} catch (Exception ee) {
				ee.printStackTrace();
			}
				
			ar[i++] = wvo;
			
		}
		
		return ar;
	}
	
	public String getImage(String movieNm, String openDt) throws Exception{
		movieNm = URLEncoder.encode(movieNm, "UTF-8");
		
		String urlPath = "https://movie.naver.com/movie/search/result.nhn?query="+movieNm+"&section=all&ie=utf8";
        String pageContents = "";
        StringBuilder contents = new StringBuilder();
        String movieCd = null;
        try{
 
            URL url = new URL(urlPath);
            URLConnection con = (URLConnection)url.openConnection();
            InputStreamReader reader = new InputStreamReader (con.getInputStream(), "utf-8");
 
            BufferedReader buff = new BufferedReader(reader);
 
            while((pageContents = buff.readLine())!=null){
                //System.out.println(pageContents);             
                contents.append(pageContents);
                contents.append("\r\n");
            }
 
            buff.close();
            
            String content = contents.toString();
            int ul_start = content.indexOf("search_list_1");
            
            if(ul_start == -1)
            	return null;
            
            content = content.substring(ul_start);
            int ul_end = content.indexOf("/ul");
            content = content.substring(0, ul_end);
            
            String[] li_ar = content.split("<li>");
            ArrayList<String> list = new ArrayList<String>();
            
            for(String s : li_ar) {
            	int korea = s.indexOf("nation=KR");
            	if(korea >= 0) {
            		list.add(s);
            	}
            }
            if(!list.isEmpty()) {
            	content = "";
            	for(String s : list)
            		content += s;
            }
            
            String probablyPrdtYear = String.valueOf(Integer.parseInt(openDt)-1);
            
            for(String s : list) {
            	int year = s.indexOf("year="+openDt);
            	int year2 = s.indexOf("year="+probablyPrdtYear);
            	if(year >= 0 || year2 >= 0) {
            		content = s;
            		break;
            	}
            }
            
            int i = content.indexOf("basic.nhn?code=");
            content = content.substring(i);
            int j = content.indexOf(">");
            movieCd = content.substring(15, j-1);
 
        }catch(Exception e){
            e.printStackTrace();
        }
		
		String imageSrc = getSrc(movieCd);
		
		return imageSrc;
	}
	
	public String getSrc(String movieCd) {
		String urlPath = "https://movie.naver.com/movie/bi/mi/photoViewPopup.nhn?movieCode="+ movieCd;
        String pageContents = "";
        StringBuilder contents = new StringBuilder();
        String imageSrc = null;
 
        try{
 
            URL url = new URL(urlPath);
            URLConnection con = (URLConnection)url.openConnection();
            InputStreamReader reader = new InputStreamReader (con.getInputStream(), "utf-8");
 
            BufferedReader buff = new BufferedReader(reader);
 
            while((pageContents = buff.readLine())!=null){
                //System.out.println(pageContents);             
                contents.append(pageContents);
                contents.append("\r\n");
            }
 
            buff.close();
            
            int i = contents.indexOf("page_content");
            String content = contents.substring(i);
            i = content.indexOf("targetImage");
            content = content.substring(i);
            int j = content.indexOf("alt");
            imageSrc = content.substring(18, j-2);
 
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return imageSrc;
	}
	
	/*
	public String getPost(String movieNm) throws Exception{
        // 영화 포스터 가져오기
        //System.out.println(movieNm);
        
          String clientID="UssVhdtzaSQlNhAr5bke"; //네이버 개발자 센터에서 발급받은 clientID입력
          String clientSecret = "6bwpOT_Ese";        //네이버 개발자 센터에서 발급받은 clientSecret입력
          
          String mv_name = URLEncoder.encode(movieNm, "UTF-8");
          URL url = new URL("https://openapi.naver.com/v1/search/movie.xml?query="+mv_name);
          
          URLConnection urlConn = url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체 
          
          urlConn.setRequestProperty("X-Naver-Client-ID", clientID);
          urlConn.setRequestProperty("X-Naver-Clienit-Secret", clientSecret);
          
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
    */
	
	
	@RequestMapping("/testUi.inc")
	public String testUI(){
		return "testUi";
		
	}
}
