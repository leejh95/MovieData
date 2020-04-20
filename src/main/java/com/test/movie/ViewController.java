package com.test.movie;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.vo.ActorVO;
import com.test.vo.ViewVO;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieCommentVO;

@Controller
public class ViewController {
	
	@Autowired
	private MovieDAO m_dao;

	@RequestMapping("/view.inc")
	public ModelAndView view(String movieCd, String dTime) throws Exception {
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
		if(nation.size() >0)	
			vo.setNationNm(nation.get(0).getChildText("nationNm"));
		//System.out.println(nation.get(0).getChildText("nationNm"));
		
		//장르
		Element genres = movieInfo.getChild("genres");
		List<Element> genre = genres.getChildren("genre");
		if(genre.size() >0)	
			vo.setGenreNm(genre.get(0).getChildText("genreNm"));
		
		//감독
		Element directors = movieInfo.getChild("directors");
		List<Element> director = directors.getChildren("director");
		if(director.size() >0)
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
		if(audit.size() > 0)
			vo.setWatchGradeNm(audit.get(0).getChildText("watchGradeNm"));
		
		//제작사
		Element companys = movieInfo.getChild("companys");
		List<Element> company = companys.getChildren("company");
		if(company.size() >0)
			vo.setCompanyNm(company.get(0).getChildText("companyNm"));
		
		
		try {
			vo.setImage(getImage(movieInfo.getChildText("movieNm"), movieInfo.getChildText("openDt").substring(0, 4)));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		mv.addObject("vo", vo);
		mv.addObject("movieCd", movieCd);
		mv.addObject("dTime", dTime);
		mv.setViewName("view");
		
		return mv;
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
	public String getPost(String movieNm, String prdtYear) throws Exception{
        // 영화 포스터 가져오기
        //System.out.println(movieNm);
        
          String clientID="UssVhdtzaSQlNhAr5bke"; //네이버 개발자 센터에서 발급받은 clientID입력
          String clientSecret = "6bwpOT_Ese";        //네이버 개발자 센터에서 발급받은 clientSecret입력
          
          String mv_name = URLEncoder.encode(movieNm, "UTF-8");
          URL url =  new URL("https://openapi.naver.com/v1/search/movie.xml?query="+mv_name+"&yearfrom="+prdtYear+"&yearto="+prdtYear);
          
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
