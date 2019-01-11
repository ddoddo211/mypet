package kr.co.mypet.common.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.common.model.PageVo;
import kr.co.mypet.common.service.CommonServiceInf;
import kr.co.mypet.hair.model.HairShopApplyVo;
import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.hair.service.HairServiceInf;

@RequestMapping("/mem")
@Controller
public class MemberController {

	@Resource(name = "commonService")
	private CommonServiceInf commonService;

	@Resource(name = "hairService")
	private HairServiceInf hairService;

	// 초기에 main 화면 진입
	@RequestMapping("/main")
	public String main() {
		return "common/main";
	}

	// 로그인 화면 진입
	@RequestMapping("/loginPage")
	public String loginPage() {
		return "common/login";
	}

	// 회원가입 방식 선택화면 진입
	@RequestMapping("/memJoinSel")
	public String memJoinSel() {
		return "common/joinSelect";
	}

	// 회원가입화면 진입
	@RequestMapping("/memJoin")
	public String memJoin() {
		return "common/join";
	}

	// 네이버 회원가입 페이지이동
	@RequestMapping("/join")
	public String join(HttpServletRequest request) {

		MemberVo memVo = new MemberVo();
		///////////// 네이버 로그인 collback

		String clientId = "dQEq__PeBE4FPR0eimgb";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "eBH_cdrwIQ";// 애플리케이션 클라이언트 시크릿값";
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = "";
		try {
			redirectURI = URLEncoder.encode("http://localhost:8081/mem/join", "UTF-8");
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
		System.out.println("apiURL=" + apiURL);
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode=" + responseCode);
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
				System.out.println(res.toString());

				// res.toString() 에서 token 빼오기
				String temp = res.toString();
				int startIndex = temp.indexOf("access_token") + 15;
				int endIndex = temp.indexOf("refresh_token") - 3;
				access_token = temp.substring(startIndex, endIndex);
				System.out.println("access_token : " + access_token);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		//////////////////////////////

		/////////////// 로그인 회원정보 조회

		String token = access_token;// 네이버 로그인 접근 토큰;
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
		try {
			apiURL = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
			String temp = response.toString();

			if (temp.contains("email")) {
				int startIndex = temp.indexOf("email") + 8;
				int endIndex = temp.lastIndexOf("\"");
				String mem_id = temp.substring(startIndex, endIndex);
				System.out.println("로그인 아이디 : " + mem_id);
				memVo.setMem_id(mem_id);

			} else {
				if (request.getAttribute("memVo") != null) {
					memVo = (MemberVo) request.getAttribute("memVo");
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		///////////////////////////
		request.setAttribute("mem_id", memVo.getMem_id());

		return "common/join";
	}

	// 일반 로그인 method
	@RequestMapping("/loginNM")
	public String loginNM(MemberVo memVo, HttpSession session) {
		String url = "";
		int chk = commonService.login(memVo);

		if (chk == 0) {

			memVo = commonService.memberInfo(memVo.getMem_id());
			session.setAttribute("memVo", memVo);

			// 멤버의 아이디가 admin일경우에는 관리자용 화면으로 접속해야 한다.
			if (memVo.getMem_id().equals("admin")) {
				// 관리자용 화면으로 접속
				url = "admin/adminMain";
			} else {
				// 조회 성공
				url = "common/main";
			}

		} else {
			url = "common/login";

		}

		return url;
	}

	// 회원 가입 처리 method
	@RequestMapping("/joinMethod")
	public String joinMethod(MemberVo memVo) {

		int stat = commonService.memberJoin(memVo);

		return "common/main";
	}

	// naver 로그인 시도할떄 판단 method
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {

		MemberVo memVo = new MemberVo();
		///////////// 네이버 로그인 collback

		String clientId = "dQEq__PeBE4FPR0eimgb";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "eBH_cdrwIQ";// 애플리케이션 클라이언트 시크릿값";
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = "";
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
		System.out.println("apiURL=" + apiURL);
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode=" + responseCode);
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
				System.out.println(res.toString());

				// res.toString() 에서 token 빼오기
				String temp = res.toString();
				int startIndex = temp.indexOf("access_token") + 15;
				int endIndex = temp.indexOf("refresh_token") - 3;
				access_token = temp.substring(startIndex, endIndex);
				System.out.println("access_token : " + access_token);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		//////////////////////////////

		/////////////// 로그인 회원정보 조회

		String token = access_token;// 네이버 로그인 접근 토큰;
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
		try {
			apiURL = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
			String temp = response.toString();

			if (temp.contains("email")) {
				int startIndex = temp.indexOf("email") + 8;
				int endIndex = temp.lastIndexOf("\"");
				String mem_id = temp.substring(startIndex, endIndex);
				System.out.println("로그인 아이디 : " + mem_id);
				memVo.setMem_id(mem_id);

			} else {
				if (request.getSession().getAttribute("memVo") != null) {
					memVo = (MemberVo) request.getSession().getAttribute("memVo");
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		///////////////////////////
		String url = "";
		int chk = commonService.naverLogin(memVo.getMem_id());

		if (chk == 0) {
			// 조회 성공
			url = "common/main";
			memVo = commonService.memberInfo(memVo.getMem_id());
			request.getSession().setAttribute("memVo", memVo);
		} else {
			request.setAttribute("navermsg", "사이트 회원등록이 필요합니다 회원가입해주세요");
			url = "common/login";

		}

		return url;
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();

		return "common/main";
	}

	// 펫쇼핑몰로 화면이동
	@RequestMapping("/petShop")
	public String shopping() {
		return "petShop";
	}

	// 관리자용 화면에서 해당 메뉴 버튼을 클릭하였을때 이동 하는부분
	@RequestMapping("/petManagerMain")
	public String petManagerMain() {
		return "admin/adminMain";
	}

	// 관리자용 화면에서 해당 메뉴 버튼을 클릭하였을때 이동 하는부분
	@RequestMapping("/petInsManager")
	public String petInsManager() {
		return "admin/petInsurance/petInsuranceMain";
	}

	// petHair 관리자 부분
	// /////////////////////////////////////////////////////////////////////////////////////////////////////////
	// hair 관리 페이지 진입
	@RequestMapping("/petHairAdmin")
	public String petHairAdmin() {

		return "admin/petHair/petHairAdmin";
	}

	// 펫미용실 등록관리 화면이동
	@RequestMapping("/petHairApplyCheck")
	public String petHairApplyCheck(Model model) {

		List<HairShopApplyVo> hsaList = new ArrayList<>();
		hsaList = hairService.selectHairShopApply();

		model.addAttribute("hsaList", hsaList);
		return "admin/petHair/petHairApplyCheck";
	}

	// 펫 미용실 관리
	@RequestMapping("/petHairCon")
	public String petHairCon(Model model) {

		List<HairShopVo> hsList = new ArrayList<>();
		hsList = hairService.selectHairShopAllR();

		model.addAttribute("hsList", hsList);
		return "admin/petHair/petHairCon";
	}

	// 관리자가 미용실 지원자들의 정보를 관리
	@RequestMapping("/updateHsa")
	public String updateHsa(HairShopApplyVo hsaVo) {

		// 승인, 거절, 대기 일경우의 처리
		if (hsaVo.getHsa_acp().equals("승인")) {
			// hsa_acp == '승인'

			// insert hairshop
			int chk = hairService.insertHairShop(hsaVo);

			// update member
			int chkmem = hairService.updateMember(hsaVo.getHsa_mem());

			// update hairshopapply
			int chkupdate = hairService.updateHairShopApply(hsaVo);

		} else if (hsaVo.getHsa_acp().equals("거절")) {
			// hsa_acp =='거절'
			// update hairshopapply
			int chkupdate = hairService.updateHairShopApply(hsaVo);

		} else {
			// hsa_acp =='대기'

		}

		return "redirect:/mem/petHairApplyCheck";
	}

	// 관리자가 미용실 정보 싹다 날려버림
	@RequestMapping("/updateHairShop")
	public String updateHairShop(HairShopVo hsVo) {

		// 모든 내용을 지워버림

		if (hsVo.getHas_score() == 0) {
			hsVo.setHas_score(1);

		} else {
			hsVo.setHas_score(0);

		}
		int chk = hairService.updateHairShop(hsVo);

		return "redirect:/mem/petHairCon";
	}

	// petHair 관리자 부분
	// /////////////////////////////////////////////////////////////////////////////////////////////////////////

	// member 정보 수정
	@RequestMapping("/updateMemInfo")
	public String updateMemInfo(MemberVo memVo, HttpSession session) {

		// 회원의 정보수정하기 호출
		int chk = commonService.updateMemInfo(memVo);

		if (chk == 1) {
			// 정보수정 성공
			memVo = commonService.memberInfo(memVo.getMem_id());
			session.setAttribute("memVo", memVo);
		} else {
			// 정보수정 실패
		}

		return "common/memMypage";
	}

	// 관리자 마이페이지(펫시터)
	@RequestMapping("/petSitManager")
	public String petSitManager() {
		return "/admin/petSitter/petSitterMain";
	}

	// 회원 마이페이지이로 이동하는 부분
	@RequestMapping("/memMypage")
	public String memMypage() {
		return "/common/memMypage";
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@Autowired
	private JavaMailSenderImpl mailSender;

	@RequestMapping("/chkMember")
	public String chkMember(final HttpServletRequest request, @RequestParam("memId") final String memId, Model model) {

		List<MemberVo> memberList = commonService.getMemberList();
		boolean chk = false;
		for (MemberVo memVo : memberList) {
			if (memVo.getMem_id().equals(memId)) {
				chk = false;
				break;
			} else {
				chk = true;
			}
		}

		if (chk == true) {
			final int random = (int) (Math.random() * 99999 + 100000);
			model.addAttribute("random", random);
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("sjyounghos@naver.com");
					helper.setTo(memId);
					helper.setSubject("메일 인증번호");
					helper.setText("인증 번호 : " + random, true);
				}
			};
			mailSender.send(preparator);
			model.addAttribute("memId", memId);
			model.addAttribute("chk", chk);
		} else {
			model.addAttribute("chk", chk);
		}

		return "common/join";
	}
	
	@RequestMapping("/memManager")
	public String memManager() {
		return "admin/common/memberAdmin";
	}
	
	@RequestMapping("/memMain")
	public String memMain() {
		return "admin/common/memberAdmin";
	}
	
	@RequestMapping("/memExit")
	public String memExitView(Model model, PageVo pageVo) {
				
		Map<String, Object> resultMap = commonService.getMemberListAll(pageVo);
		
		List<MemberVo> memList = (List<MemberVo>) resultMap.get("memList");
		
		model.addAttribute("memList", memList);
		
		return "admin/common/memberExit";
	}
	
	@RequestMapping("/memPage")
	public String memPage(Model model, PageVo pageVo) {
		
		Map<String, Object> resultMap = commonService.getMemberListAll(pageVo);
		
		int page = (int) resultMap.get("page");
		int pageCnt = (int) resultMap.get("pageCnt");
		
		model.addAttribute("page",page);
		model.addAttribute("pageCnt",pageCnt);
		
		return "admin/common/memPage";
	}
	
	
	@RequestMapping("/memDelete")
	public String memDelete(PageVo pageVo, @RequestParam("mem_id")String mem_id, Model model) {
		
		String[] memId = mem_id.split(" ");
		for(int i=0; i<memId.length; i++) {
			int deleteCnt = commonService.deleteMember(memId[i]);
		}
		
		Map<String, Object> resultMap = commonService.getMemberListAll(pageVo);
		
		List<MemberVo> memList = (List<MemberVo>) resultMap.get("memList");
		
		model.addAttribute("memList", memList);
		
		return "admin/common/memberExit";
	}
	
	@RequestMapping("/memBlack")
	public String memBlack(PageVo pageVo, @RequestParam("mem_id")String mem_id, Model model) {
		
		String[] memId = mem_id.split(" ");
		for(int i=0; i<memId.length; i++) {
			int deleteCnt = commonService.memberBlack(memId[i]);
		}
		
		Map<String, Object> resultMap = commonService.getMemberListAll(pageVo);
		
		List<MemberVo> memList = (List<MemberVo>) resultMap.get("memList");
		
		model.addAttribute("memList", memList);
		
		return "admin/common/memberExit";
	}
	
	@RequestMapping("/memWhite")
	public String memWhite(PageVo pageVo, @RequestParam("mem_id")String mem_id, Model model) {
		
		String[] memId = mem_id.split(" ");
		for(int i=0; i<memId.length; i++) {
			int deleteCnt = commonService.memberWhite(memId[i]);
		}
		
		Map<String, Object> resultMap = commonService.getMemberListAll(pageVo);
		
		List<MemberVo> memList = (List<MemberVo>) resultMap.get("memList");
		
		model.addAttribute("memList", memList);
		
		return "admin/common/memberExit";
	}
	
	@RequestMapping("/memRight")
	public String memRightView(Model model, PageVo pageVo) {
		
		Map<String, Object> resultMap = commonService.getMemberListAll2(pageVo);
		
		List<MemberVo> memList = (List<MemberVo>) resultMap.get("memList");
		
		model.addAttribute("memList", memList);
		
		
		
		return "admin/common/memRight";
	}
	
	@RequestMapping("/memRightPage")
	public String memRightPage(Model model, PageVo pageVo) {
		
		Map<String, Object> resultMap = commonService.getMemberListAll2(pageVo);
		
		int page = (int) resultMap.get("page");
		int pageCnt = (int) resultMap.get("pageCnt");
		
		model.addAttribute("page",page);
		model.addAttribute("pageCnt",pageCnt);
		
		return "admin/common/memRightPage";
	}
	
	@RequestMapping("/memberUpdate")
	public String memberUpdate(Model model, PageVo pageVo, MemberVo memVo) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("mem_id", memVo.getMem_id());
		param.put("mem_sit", memVo.getMem_sit());
		param.put("mem_shop", memVo.getMem_shop());
		param.put("mem_hair", memVo.getMem_hair());
		
		int updateCnt = commonService.memberUpdate(param);
		
		Map<String, Object> resultMap = commonService.getMemberListAll2(pageVo);
		
		List<MemberVo> memList = (List<MemberVo>) resultMap.get("memList");
		
		model.addAttribute("memList", memList);
		
		return "admin/common/memRight";
	}
	
	/**
	* Method : idSearchView
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 아이디 찾기 화면
	*/
	@RequestMapping("/idSearchView")
	public String idSearchView() {
		return "common/loginIdSearch";
	}
	
	/**
	* Method : idSearch
	* 작성자 : pc25
	* 변경이력 :
	* @param memVo
	* @param model
	* @return
	* Method 설명 : 아이디 찾기
	*/
	@RequestMapping("/idSearch")
	public String idSearch(MemberVo memVo,Model model) {
		MemberVo memberVo = commonService.idSearch(memVo);
		int chk = 0;
		
		if(memberVo == null) {
			chk = 1;
		}
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("chk",chk);
		return "common/loginIdSearch";
	}
} // controller class 끝나는곳
