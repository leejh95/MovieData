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
		
		//System.out.println(type + "/" + value);
		
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
			//System.out.println("sadf");
			//System.out.println(e.getChild("directors").getChild("director").getChildText("peopleNm"));
			//vo.setDirectorNm(e.getChild("directors").getChild("director").getChildText("peopleNm"));
			
			try {
				vo.setImage(getImage(e.getChildText("movieNm"), e.getChildText("openDt").substring(0, 4)));
			} catch (Exception e2) {
				// TODO: handle exception
			}
			
			ar[i++] = vo;
		}
		
		
		mv.addObject("ar", ar);
		mv.addObject("searchType", type);
		mv.addObject("searchValue", value);
		mv.setViewName("searchView");
		
		
		
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
            
            for(String s : list) {
            	int year = s.indexOf("year="+openDt);
            	if(year >= 0) {
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
