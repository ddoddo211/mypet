package kr.co.mypet.common.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mypet.common.service.CommonServiceInf;

@RequestMapping("/mem")
@Controller
public class MemberController {
	
	@Resource(name="commonService")
	private CommonServiceInf commonService;
	
	//�ʱ⿡ main ȭ�� ����
	@RequestMapping("/main")
	public String main() {return "common/main";}
	
	//�α��� ȭ�� ����
	@RequestMapping("/loginPage")
	public String loginPage() {return "common/login";}
	
	//ȸ������ȭ�� ����
	@RequestMapping("/memJoin")
	public String memJoin() {return "common/join";}
	
	//ȸ������ ó���޼���
	@RequestMapping("/join")
	public String join() {
		
		return "common/main";
	}
	
	//�α��� �õ��ҋ� �Ǵ� method
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		
		/////////////���̹� �α��� collback
		
		String clientId = "dQEq__PeBE4FPR0eimgb";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
	    String clientSecret = "eBH_cdrwIQ";//���ø����̼� Ŭ���̾�Ʈ ��ũ����";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI="";
		try {
			redirectURI = URLEncoder.encode("http://localhost:8081/mem/login", "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    System.out.println("apiURL="+apiURL);
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.println("responseCode="+responseCode);
	      if(responseCode==200) { // ���� ȣ��
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // ���� �߻�
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      if(responseCode==200) {
	        System.out.println(res.toString());
	      }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
		
		
		//////////////////////////////
		
		
		return "common/main";
	}
	

}
