package kr.co.mypet.sitter.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.common.model.PageVo;
import kr.co.mypet.common.model.PetkindVo;
import kr.co.mypet.sitter.model.FaqVo;
import kr.co.mypet.sitter.model.PetSitterVo;
import kr.co.mypet.sitter.model.SitterRevVo;
import kr.co.mypet.sitter.model.ZipVo;
import kr.co.mypet.sitter.service.SitterServiceInf;
import kr.co.mypet.util.StringUtil;

@Controller
@RequestMapping("/sit")
public class SitterController {

	@Resource(name="sitterService")
	private SitterServiceInf sitterService;
	
	// 펫시터 메인화면
	@RequestMapping("/sitMain")
	public String MainView() {
		return "petSitter/petSitter";
	}
	
	// 펫시터 집으로 부르기 화면
	@RequestMapping("/sitterFrom")
	public String sitterFrom(HttpSession session, Model model) {
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		if(memVo != null) {
			List<MypetVo> mypetList = sitterService.getMypetList(memVo.getMem_id());
			model.addAttribute("mypetList", mypetList);
			return "petSitter/sitterFrom";
		} else {
			return "redirect:/mem/loginPage";
		}
		
	}
	
	// 펫시터 집으로 부르기 -> 주소변경 화면
	@RequestMapping(value= {"/sitFromAddrPopUp"}, method= {RequestMethod.GET})
	public String sitFromAddrPopUpView() {
		return "petSitter/addressUpdate";
	}
	
	// 펫시터 집으로 부르기 -> 주소변경 화면
	@RequestMapping(value= {"/mypetInsertView"}, method= {RequestMethod.GET})
	public String mypetInsertView() {
		return "petSitter/mypetInsert";
	}
	
	// 펫시터 집으로 부르기 -> 주소변경 화면 -> 수정완료 처리
	@RequestMapping(value= {"/addressUpdate"}, method= {RequestMethod.POST})
	public String sitFromAddrPopUp(Model model, HttpSession session, @RequestParam("mem_addr1")String mem_addr, @RequestParam("mem_addr2")String mem_addr2) {
		System.out.println("mem_addr : "+mem_addr);
		System.out.println("mem_addr2 : "+mem_addr2);
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		Map<String, Object> param = new HashMap<>();
		param.put("mem_id", memVo.getMem_id());
		param.put("mem_addr", mem_addr);
		param.put("mem_addr2", mem_addr2);
		
		int updateCnt = sitterService.memAddrUpdate(param);
		
		if(updateCnt !=0) {
			model.addAttribute("updateCnt", updateCnt);
			memVo.setMem_addr(mem_addr);
			memVo.setMem_addr2(mem_addr2);
			System.out.println("수정성공!!");
			return "petSitter/addressUpdate";
		}
		else {
			System.out.println("수정실패!!");
			return "petSitter/addressUpdate";
		}
	}
	
	// ajax 처리(나의 반려동물 정보 추가의 품종 선택)
	@RequestMapping("/petKindHtml")
	public String petKindHtml(Model model, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String petKind = request.getParameter("petKind");
		System.out.println("petKind : "+ petKind);
		
		List<PetkindVo> petKindList = sitterService.getPetKindList(petKind);
		
		for(int i=0;i<petKindList.size();i++) {
			System.out.println("list : "+petKindList.get(i));
		}
		
		model.addAttribute("petKindList", petKindList);
		
		return "petSitter/petKindAjaxHtml";
	}
	
	// 펫시터 집으로 부르기 -> 나의 반려동물 정보 추가 처리
	@RequestMapping("/mypetInsert")
	public String mypetInsert(HttpSession session, HttpServletRequest request, @RequestPart("petImgForm")MultipartFile part) throws Exception, IOException {
		// 회원 정보 받아오는 부분
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		// 로그인을 안한 회원일 경우에는 로그인 화면으로 이동
		if (memVo == null) {
			return "petInsurance/memLoginChk";
		} else {
			// 나의 펫에 추가하려며 있어야 하는 부분 
			// myp_mem , myp_petk ,myp_birth , myp_sick ,myp_img ,myp_neu ,myp_gender,myp_name
			//	myp_id -> 시퀀스로 처리
			// mypetVo에 입력하기
			MypetVo mypetVo = new MypetVo();
			
			// 생년월일 Date 타입으로 변경하기
			String birth = request.getParameter("petBirthForm");
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			Date dateBirth = date.parse(birth);

			mypetVo.setMyp_mem(memVo.getMem_id());
			mypetVo.setMyp_name(request.getParameter("petName"));
			mypetVo.setMyp_gender(request.getParameter("petGender"));
			mypetVo.setMyp_petk(request.getParameter("petKindForm"));
			mypetVo.setMyp_birth(dateBirth);
			mypetVo.setMyp_neu(request.getParameter("petNTL"));
			mypetVo.setMyp_sick(request.getParameter("petSick"));
			
			// 파일 저장되기
			
			// 실제 파일 저장될 경로 설정하기
			String path = "D:\\A_TeachingMaterial\\7.LastProject\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\mypet\\img\\petimg";
			String str = part.getOriginalFilename();
			
			// 파일명 가지고 오기
			if(str == "") {
				mypetVo.setMyp_img("/img/petimg/noimg.jpg");
			}else {
				// 확장자만 빼기(확장자는 저장해줘야 한다)
				String fileExt = StringUtil.getFileExt(str);
				String fileName = UUID.randomUUID().toString() + fileExt;	// 충돌 방지를 위한 임의의 파일명 
				
				File file = new File(path + File.separator + fileName);
				
				part.transferTo(file);
				
				str = "/img/petimg/"+fileName;
				
				// DB 넣어주기
				mypetVo.setMyp_img(str);
			}
			
			int insertCnt = sitterService.insertMyPet(mypetVo);
			
			return "redirect:/sit/sitterFrom";
			
		}
	}
	
	// 나의 반려동물 정보 삭제
	@RequestMapping("/mypetDel")
	public String mypetDel(Model model, @RequestParam("mypet_id")String mypet_id) {
		System.out.println("여기왔니? 혼자왔니?");
		
		String[] mypetId = mypet_id.split(" ");
		
		for(int i=0;i<mypetId.length;i++) {
			System.out.println("mypet : "+mypetId[i]);
		}
		
		for(int i=0;i<mypetId.length;i++) {
			int deleteCnt = sitterService.deleteMypet(mypetId[i]);
		}
		
		return "redirect:/sit/sitterFrom";
	}
	
	// 펫시터 집으로 부르기 -> 예약하기
	@RequestMapping("/reservation")
	public String reservation(HttpServletRequest request, Model model) {
		String mypet = request.getParameter("mypet");
		String time = request.getParameter("time");
		String timeChk = request.getParameter("timeSelect");
		String spec = request.getParameter("spec");
		String arr = request.getParameter("arr");
		
		MemberVo memVo = (MemberVo) request.getSession().getAttribute("memVo");		
		String mem_id = memVo.getMem_id();
		String[] mypets = mypet.split(" ");
		MypetVo mVo = null;
		List<MypetVo> list = new ArrayList<>();
		
		int nomalPrice = 28000;
		int addPrice = 15000;
		int price = (nomalPrice)+((addPrice * Integer.parseInt(timeChk))); 

		for(int i=0; i< mypets.length;i++) {
			mVo = sitterService.getPetInfo(mypets[i]);
			list.add(mVo);
			
			Map<String, Object> param = new HashMap<>();
			param.put("str_spec", spec);
			param.put("str_price", price);
			param.put("str_time", time);
			param.put("str_atime", timeChk);
			param.put("str_arr", arr);
			param.put("str_pst", "");
			param.put("str_mem", mem_id);
			param.put("str_myp", mVo.getMyp_id());
			
//			int resCnt = sitterService.insertReservation(param);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("time", time);
		model.addAttribute("timeChk", timeChk);
		model.addAttribute("spec", spec);
		model.addAttribute("nomalPrice", nomalPrice);
		model.addAttribute("addPrice", addPrice);
		model.addAttribute("mypetCnt", mypets.length);
		
		return "petSitter/reservation";
	}
	
	// 펫시터 집에 맡기기 화면
	@RequestMapping("/sitterTo")
	public String sitterTo(Model model, HttpServletRequest request) {
		List<PetSitterVo> sitList = new ArrayList<>();
		System.out.println("sitterTo : "+request.getParameter("sort"));
		if(request.getParameter("sort") != null) {
			int sortCnt = Integer.parseInt(request.getParameter("sort"));
			
			if(sortCnt == 1) {
				sitList = sitterService.petNoticeListDate();
				
				model.addAttribute("sitList", sitList);
			} else if(sortCnt == 2) {
				sitList = sitterService.petNoticeListCount();
				
				model.addAttribute("sitList", sitList);
			} 
		} else {
			sitList = sitterService.petNoticeList();
			
			model.addAttribute("sitList", sitList);
		}
				
		List<ZipVo> zipList = sitterService.zipList();
		
		request.getServletContext().setAttribute("zipList", zipList);
		
		return "petSitter/sitterTo";
	}
	
	// 펫시터 집에 맡기기 상세화면
	@RequestMapping("/sitDetail")
	public String sitterDetail(Model model, @RequestParam("pst_id")String pst_id, @RequestParam("count")int count) {
		
		PetSitterVo pstVo = sitterService.petToHomeDetail(pst_id);
		
		Map<String, Object> param = new HashMap<>();
		param.put("pst_id", pst_id);
		param.put("pst_view", count);
		
		int updateCnt = sitterService.petNoticeCountUpdate(param);
		
		model.addAttribute("pstVo", pstVo);
		
		return "petSitter/sitterDetail";
	}
	
	// 펫시터 집에 맡기기 - 게시글 등록 화면
	@RequestMapping("/sitterToInsertView")
	public String sitterToInsertView() {
		
		return "petSitter/sitterToInsert";
	}
	
	// 펫시터 집에 맡기기 - 후기글 리스트 조회
	@RequestMapping("/reviewPageListAjaxHtml")
	public String reviewPageListAjaxHtml(PageVo pageVo, @RequestParam("pst_id")String pst_id, Model model) {
		
		String stv_pst = pst_id;
		
		Map<String, Object> param = new HashMap<>();
		param.put("page", pageVo.getPage());
		param.put("pageSize", pageVo.getPageSize());
		param.put("stv_pst", stv_pst);
		
		Map<String, Object> resultMap = sitterService.getReviewList(param);
		
		List<SitterRevVo> reviewList = (List<SitterRevVo>) resultMap.get("reviewList");
		model.addAttribute("reviewList", reviewList);
		
		return "/petSitter/reviewPageListAjaxHtml";				
	}
	@RequestMapping("/reviewPaginationAjaxHtml")
	public String reviewPaginationAjaxHtml(PageVo pageVo, @RequestParam("pst_id")String pst_id, Model model) {
				
			String stv_pst = pst_id;
			
			Map<String, Object> param = new HashMap<>();
			param.put("page", pageVo.getPage());
			param.put("pageSize", pageVo.getPageSize());
			param.put("stv_pst", stv_pst);
			
			Map<String, Object> resultMap = sitterService.getReviewList(param);
			
			List<SitterRevVo> reviewList = (List<SitterRevVo>) resultMap.get("reviewList");
			int pageCnt = (int) resultMap.get("pageCnt");
			
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("pageCnt", pageCnt);
			model.addAttribute("page", pageVo.getPage());
			model.addAttribute("stv_pst", stv_pst);
			
			return "/petSitter/reviewPaginationAjaxHtml";
	}
	
	// 후기 게시글 등록
	@RequestMapping("/insertReview")
	public String insertReview(@RequestParam("pst_id")String pst_id, @RequestParam("stv_text")String stv_text, HttpSession session) {
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		System.out.println("insertReview : "+pst_id);
		System.out.println("insertReview : "+stv_text);
		System.out.println("insertReview : "+memVo.getMem_id());
		
		Map<String, Object> param = new HashMap<>();
		param.put("stv_pst", pst_id);
		param.put("stv_text", stv_text);
		param.put("stv_mem", memVo.getMem_id());
		
		int insertCnt = sitterService.insertReview(param);
		
		return "redirect:/sit/sitDetail?pst_id="+pst_id;
	}
	
	// 후기 게시글 수정
	@RequestMapping("/updateReview")
	public String updateReview(@RequestParam("revText")String revText, @RequestParam("stv_id")String stv_id, @RequestParam("pst_id")String pst_id) {
		System.out.println("여기왔니?");
		System.out.println("revText : "+revText);
		Map<String, Object> param = new HashMap<>();
		param.put("stv_text", revText);
		param.put("stv_id", stv_id);
		
		int updateCnt = sitterService.updateReview(param);
		
		return "redirect:/sit/sitDetail?pst_id="+pst_id;
	}
	
	@RequestMapping("/deleteReview")
	public String deleteReview(@RequestParam("stvID")String stv_id, @RequestParam("pst_id")String pst_id) {
		
		int deleteCnt = sitterService.deleteReview(stv_id);
		
		return "redirect:/sit/sitDetail?pst_id="+pst_id;
	}
	
	@RequestMapping("/sitterToInsert")
	public String sitterToInsert(@RequestParam("notice_title")String notice_title, @RequestParam("pst_text")String pst_text,
			@RequestParam("chkIn")String pst_cidate,@RequestParam("chkOut")String pst_codate, @RequestParam("chkIn2")String pst_cidate2,@RequestParam("chkOut2")String pst_codate2,
			@RequestPart("notice_file")MultipartFile part, @RequestParam("price_dc")String price_dc, @RequestParam("price_1d")String price_1d, HttpSession session) throws Exception, IOException {

		MemberVo memVo = (MemberVo) session.getAttribute("memVo");

		PetSitterVo pstVo = new PetSitterVo();

		// 로그인을 안한 회원일 경우에는 로그인 화면으로 이동
		if (memVo == null) {
			return "petSitter/sitterDetail";
		} else {

			// 실제 파일 저장될 경로 설정하기
			String path = "D:\\A_TeachingMaterial\\7.LastProject\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\mypet\\img\\petSitterImg";
			String str = part.getOriginalFilename();

			// 파일명 가지고 오기
			if (str == "") {
				pstVo.setPst_img("/img/petimg/noimg.jpg");
			} else {
				// 확장자만 빼기(확장자는 저장해줘야 한다)
				String fileExt = StringUtil.getFileExt(str);
				String fileName = UUID.randomUUID().toString() + fileExt; // 충돌 방지를 위한 임의의 파일명

				File file = new File(path + File.separator + fileName);

				part.transferTo(file);

				str = "/img/petSitterImg/" + fileName;

				// DB 넣어주기
				pstVo.setPst_img(str);
			}
			
			String cidate = pst_cidate + " ~ "+ pst_codate2;
			String codate = pst_codate + " ~ "+ pst_codate2;
			
			String[] string = pst_text.split("\\r\\n");
			for(int i=0;i<string.length;i++) {
				System.out.println("string : "+string[i]);
			}
			
			pstVo.setPst_mem(memVo.getMem_id());
			pstVo.setPst_price1(Integer.parseInt(price_dc));
			pstVo.setPst_price2(Integer.parseInt(price_1d));
			pstVo.setPst_text(pst_text);
			pstVo.setPst_title(notice_title);
			pstVo.setPst_cidate(cidate);
			pstVo.setPst_codate(codate);

//			int insertCnt = sitterService.insertSitterTo(pstVo);
			
			return "redirect:/sit/sitterTo";

		}

	}
	
	// FAQ 게시판 화면
	@RequestMapping("/faq")
	public String faq(Model model) {
		List<FaqVo> faqList = sitterService.getFaqList();
		model.addAttribute("faqList", faqList);
		return "petSitter/faq";
	}
	
	// FAQ 게시판 상세화면
	@RequestMapping("/faqDetail")
	public String faqDetail(Model model, @RequestParam("faqId")String psf_id) {
		
		FaqVo fVo = sitterService.getFaqOne(psf_id);
		
		model.addAttribute("fVo", fVo);
		
		return "petSitter/faqDetail";
	}
	
	// faq 수정화면 이동
	@RequestMapping("/faqUpdateView")
	public String faqUpdateView(Model model, @RequestParam("faq_id")String psf_id) {
		FaqVo faqVo =  sitterService.getFaqOne(psf_id);
		model.addAttribute("faqVo", faqVo);
		return "petSitter/faqUpdate";
	}
	
	// faq 수정처리
	@RequestMapping("/faqUpdate")
	public String faqUpdate(@RequestParam("psf_id")String psf_id, @RequestParam("faq_name")String psf_name, @RequestParam("smarteditor")String psf_text) {
		Map<String, Object> param = new HashMap<>();
		param.put("psf_id", psf_id);
		param.put("psf_name", psf_name);
		param.put("psf_text", psf_text);
		
		int updateCnt = sitterService.updateFaq(param);
		
		return "redirect:/sit/faq";
	}
	
	// faq 삭제 처리
	@RequestMapping("/faqDelete")
	public String faqDelete(@RequestParam("faq_id")String psf_id) {
		
		int deleteCnt = sitterService.deleteFaq(psf_id);
		
		return "redirect:/sit/faq";
	}
	
	// faq 등록화면 이동
	@RequestMapping("/faqInsertView")
	public String faqInsertView() {
		return "petSitter/faqInsert";
	}
	
	// faq 등록 처리
	@RequestMapping("/faqInsert")
	public String faqInsert(@RequestParam("faq_name")String psf_name, @RequestParam("smarteditor")String psf_text) {
		Map<String, Object> param = new HashMap<>();
		param.put("psf_name", psf_name);
		param.put("psf_text", psf_text);
		
		int insertCnt = sitterService.insertFaq(param); 
		return "redirect:/sit/faq";
	}
	
	// 펫시터 지원하기 화면
	@RequestMapping("/support")
	public String support() {
		return "petSitter/support";
	}
	
	// 마이페이지 화면
	@RequestMapping("/myPage")
	public String myPage() {
		return "petSitter/myPage";
	}
	
}
