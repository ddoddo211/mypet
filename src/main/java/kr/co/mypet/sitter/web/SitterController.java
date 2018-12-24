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
import kr.co.mypet.common.model.PetkindVo;
import kr.co.mypet.sitter.model.FaqVo;
import kr.co.mypet.sitter.model.PetSitterVo;
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
		int deleteCnt = sitterService.deleteMypet(mypet_id);
		
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
		int price = (nomalPrice * mypets.length)+(mypets.length * (addPrice * Integer.parseInt(timeChk))); 

		for(int i=0; i< mypets.length;i++) {
			mVo = sitterService.getPetInfo(mypets[i]);
			list.add(mVo);
			
			Map<String, Object> param = new HashMap<>();
			param.put("str_spec", spec);
			param.put("str_price", price);
			param.put("str_time", time);
			param.put("str_atime", timeChk);
			param.put("str_arr", arr);
			param.put("str_pst", null);
			param.put("str_mem", mem_id);
			param.put("str_myp", mVo.getMyp_id());
			
			int resCnt = sitterService.insertReservation(param);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("time", time);
		model.addAttribute("timeChk", timeChk);
		model.addAttribute("spec", spec);
		
		return "petSitter/reservation";
	}
	
	// 펫시터 집에 맡기기 화면
	@RequestMapping("/sitterTo")
	public String sitterTo(Model model, HttpServletRequest request) {
		List<PetSitterVo> sitList = sitterService.petNoticeList();
		
		List<ZipVo> zipList = sitterService.zipList();
		
		request.getServletContext().setAttribute("zipList", zipList);
		
		model.addAttribute("sitList", sitList);
		
		return "petSitter/sitterTo";
	}
	
	// 펫시터 집에 맡기기 상세화면
	@RequestMapping("/sitDetail")
	public String sitterDetail(Model model, @RequestParam("pst_id")String pst_id) {
		
		PetSitterVo pstVo = sitterService.petToHomeDetail(pst_id);
		System.out.println("sitDetail : "+pst_id);
		model.addAttribute("pstVo", pstVo);
		
		return "petSitter/sitterDetail";
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
