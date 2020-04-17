package com.test.movie;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
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
			currentTime = new Date(currentTime.getTime()+(1000*60*60*24*-1));
			dTime = formatter.format ( currentTime );
		}
		
		URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.xml?key=2fb600a3207510ce023b34bb82f9db93&repNationCd=K&weekGb=0&targetDt="+dTime);
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestProperty("Content-Type", "application/xml");
		
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		
		Document doc = builder.build(conn.getInputStream());
		
		Element root = doc.getRootElement();
		
		String showRange = root.getChildText("showRange");
		String beginWeekDay = null;
		String endWeekDay = null;
		if(showRange != null) {
			beginWeekDay = showRange.split("~")[0];
			endWeekDay = showRange.split("~")[1];
		}
		
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
		
			try {
				wvo.setImage(getImage(e.getChildText("movieNm")));
			} catch (Exception ee) {
				ee.printStackTrace();
			}
				
			ar[i++] = wvo;
			
		}
		
		String cDate = null;
		Date dDate = new Date();
		dDate = new Date(dDate.getTime());
		SimpleDateFormat dSdf = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		cDate = dSdf.format(dDate);
		
		mv.addObject("cDate", cDate);
		mv.addObject("dTime", dTime);
		mv.addObject("ar", ar);
		mv.addObject("beginWeekDay", beginWeekDay);
		mv.addObject("endWeekDay", endWeekDay);
		mv.setViewName("weekly_rank");
		
		return mv;
	}
	
	public String getImage(String movieNm) throws Exception{
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
            int search_list = content.indexOf("search_list_1");
            content = content.substring(search_list);
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
	*/
	
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
     */
}
