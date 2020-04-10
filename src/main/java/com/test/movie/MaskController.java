package com.test.movie;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MaskController {

	@RequestMapping("/unique.inc")
	public ModelAndView mask() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		URL url = new URL("https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/stores/json?page=1&perPage=500");
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		BufferedReader br;
		br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		StringBuffer sb = new StringBuffer();
		String inputLine;

        while ((inputLine = br.readLine()) != null) {
           sb.append(inputLine);
        }
        br.close();

        JSONParser jp = new JSONParser();
        // 정상호출. JSONParse에 json데이터를 넣어 파싱
        JSONObject jsonObj = (JSONObject) jp.parse(sb.toString());
        JSONArray jsonAr = (JSONArray) jsonObj.get("storeInfos");
        
        for(int i=0; i < jsonAr.size(); i++) {
        	JSONObject personObject = (JSONObject) jsonAr.get(i);
        	System.out.println(personObject.get("name")); 
        	System.out.println(personObject.get("addr")); 
        }

		mv.setViewName("uni");
		return mv;
	}
}
