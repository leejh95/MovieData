package com.test.movie;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.vo.OpenDtVO;

@Controller
public class OpenDtController {

	@RequestMapping("/opendt.inc")
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
		
		URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml?key=ef9fe705049caa4b27ad344b76ad885b&repNationCd=22041011");
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestProperty("Content-Type", "application/xml");
		
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		
		Document doc = builder.build(conn.getInputStream());
		
		Element root = doc.getRootElement();
		
		Element m_list = root.getChild("movieList");
		
		List<Element> mvi = m_list.getChildren("movie");
		
		OpenDtVO[] ar = new OpenDtVO[mvi.size()];
		int i=0;
		for(Element e : mvi) {
			System.out.println("dTime:"+dTime);
			String odt = e.getChildText("openDt");
			System.out.println("odt:"+odt);
			OpenDtVO ovo = new OpenDtVO();
			if(dTime.equals(odt)) {
				
				ovo.setOpenDt(e.getChildText("openDt"));
				ovo.setMovieNm(e.getChildText("movieNm"));
				ovo.setMovieCd(e.getChildText("movieCd"));
			
				try {
					ovo.setImg(getPost(e.getChildText("movieNm")));
				} catch (Exception ee) {
					// TODO: handle exception
				}
				
				ar[i++] = ovo;
			}
			
		}
		
		mv.addObject("ar", ar);
		mv.setViewName("opendt");
		
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