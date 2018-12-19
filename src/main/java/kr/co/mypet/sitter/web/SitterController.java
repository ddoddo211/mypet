package kr.co.mypet.sitter.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.insurance.model.MypetVo;
import kr.co.mypet.sitter.model.FaqVo;
import kr.co.mypet.sitter.model.PetSitterVo;
import kr.co.mypet.sitter.model.ZipVo;
import kr.co.mypet.sitter.service.SitterServiceInf;

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
	@RequestMapping(value= {"/sitFromPopUp"}, method= {RequestMethod.GET})
	public String sitFromPopUpView() {
		return "petSitter/addressUpdate";
	}
	
	// 펫시터 집으로 부르기 -> 주소변경 화면 -> 수정완료 처리
	@RequestMapping(value= {"/addressUpdate"}, method= {RequestMethod.POST})
	public String sitFromPopUp(Model model, HttpSession session, @RequestParam("mem_addr1")String mem_addr, @RequestParam("mem_addr2")String mem_addr2) {
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
