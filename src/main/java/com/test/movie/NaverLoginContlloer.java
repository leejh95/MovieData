package com.test.movie;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieMemberVO;

@Controller
public class NaverLoginContlloer {

	@Autowired
	MovieDAO m_dao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/naver.inc")
	public String naver() {
		
		return "naver";
	}
	
	@RequestMapping("/callback.inc")
	public String callback(String code, String state) {
		//System.out.println(code+"//"+state);
		
		String clientId = "7n3IjfdDMIZUtoQOhPqu";//애플리케이션 클라이언트 아이디값";
		    String clientSecret = "Yu70_SlDq0";//애플리케이션 클라이언트 시크릿값";
		    String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    //System.out.println("apiURL="+apiURL);
		    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br = null;
		      //System.out.print("responseCode="+responseCode);
		      if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine = null;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		        //System.out.println(res.toString());
		        JSONParser jsonParse = new JSONParser();
		        JSONObject jsonObj = (JSONObject) jsonParse.parse(res.toString());
		        
		        String jtoken = (String) jsonObj.get("access_token");

		        String token = jtoken; // 네이버 로그인 접근 토큰;
		        String header = "Bearer " + token; // Bearer 다음에 공백 추가

		        String apiURL1 = "https://openapi.naver.com/v1/nid/me";

		        Map<String, String> requestHeaders = new HashMap<String, String>();
		        requestHeaders.put("Authorization", header);
		        String responseBody = get(apiURL1,requestHeaders);

		        //System.out.println(responseBody);
		        
		        JSONObject resJson = (JSONObject) jsonParse.parse(responseBody);
		        
		        JSONObject response = (JSONObject) resJson.get("response");
		        System.out.println(response);
		        if(resJson.get("resultcode").equals("00")&&resJson.get("message").equals("success")) {
		        	String nickname = (String) response.get("nickname");
		        	String name = (String) response.get("name");
		        	String id = (String) response.get("id");
		        	String email = (String) response.get("email");
		        	
		        	MovieMemberVO vo = m_dao.signInNaver(id, "naver");
		        	
		        	if(vo != null) {
		        		//이미 방문하여 DB에 남아있는경우
		        		session.setAttribute("memVO", vo);
		        	}else {
		        		// 처음온 경우
		        		vo = new MovieMemberVO();
		        		vo.setEmail(email);
		        		vo.setName(name);
		        		vo.setSns_id(id);
		        		vo.setSns_type("naver"); 
		        		m_dao.signUp(vo);
		        		
		        		vo = m_dao.signInNaver(id, "naver");
		        		
		        		session.setAttribute("memVO", vo);
		        	}
		        	//System.out.println(response);
		        }
		        
		      }
		    } catch (Exception e) {
		      System.out.println(e);
		    }
		
		return "index";
	}
	
	private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}
