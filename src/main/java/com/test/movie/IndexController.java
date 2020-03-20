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

@Controller
public class IndexController {

	@RequestMapping("/index.inc")
	public ModelAndView index() {
		String img_src = null;
		try {
			img_src = getImg();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("img_src", img_src);
		mv.setViewName("index");
		
		return mv;
	}
	
	private String getImg() throws Exception {
		URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=ef9fe705049caa4b27ad344b76ad885b&targetDt=20200317");
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestProperty("Content-Type", "application/xml");
		
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		
		Document doc = builder.build(conn.getInputStream());
		
		Element root = doc.getRootElement();
		
		Element BOList = root.getChild("dailyBoxOfficeList");
		
		List<Element> BO = BOList.getChildren("dailyBoxOffice");
		
		String img = BO.get(0).getChildText("movieCD");
		
		
		
		URL url2 = new URL("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml2.jsp?collection=kmdb_new2&ServiceKey=RO60W567N4S9H6YV8E3R&detail=Y&codeNo="+"20182530");
		
		HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
		
		conn2.setRequestProperty("Content-Type", "application/xml");
		
		conn2.connect();
		
		SAXBuilder builder2 = new SAXBuilder();
		
		Document doc2 = builder2.build(conn2.getInputStream());
		
		Element root2 = doc2.getRootElement();
		Element result = root2.getChild("Result");
		Element row = result.getChild("Row");
		String posters = row.getChildText("posters");
		
		System.out.println(posters);
		
		if(posters != null) {
			int i = posters.indexOf("|");
			posters = posters.substring(0, i);
			System.out.println(posters);
		}
		
		
		return posters;
	}
}
