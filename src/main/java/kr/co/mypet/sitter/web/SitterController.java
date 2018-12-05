package kr.co.mypet.sitter.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mypet.sitter.model.PetSitterVo;
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
	public String sitterFrom() {
		return "petSitter/sitterFrom";
	}
	
	// 펫시터 집에 맡기기 화면
	@RequestMapping("/sitterTo")
	public String sitterTo(Model model) {
		List<PetSitterVo> sitList = sitterService.petNoticeList();
		
		List<Integer> cntList = null;
		
		model.addAttribute("sitList", sitList);
		return "petSitter/sitterTo";
	}
	
	// FAQ 게시판 화면
	@RequestMapping("/faq")
	public String faq() {
		return "petSitter/faq";
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
