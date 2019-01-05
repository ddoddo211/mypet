package kr.co.mypet.hair.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.hair.model.HairBoardVo;
import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.hair.service.HairServiceInf;

@RequestMapping("/hairAdmin")
@Controller
public class HairAdminController {
	
	@Resource(name="hairService")
	private HairServiceInf hairService;
	
	@RequestMapping("/askList")
	public String askList(MemberVo memVo,Model model) {
		
		//로그인한 사용자의 미용실정보 가져오기
		String has_id = "";
		HairShopVo hsVo = new HairShopVo();
		
		hsVo = hairService.selectShopByMemId(memVo.getMem_id());
		has_id = hsVo.getHas_id();
		/////////////////////////////
		
		//미용실 정보를 이용하여 해당 미용실에 달려있는 문의내역 list 출력
		List<HairBoardVo> askListNA = new ArrayList<>();
		//답변 미작성 list
		askListNA = hairService.selectAskByHasIdNA(has_id);
		
		//답변 작성 list
		List<HairBoardVo> askListYA = new ArrayList<>();
		askListYA = hairService.selectAskByHasIdYA(has_id);
		
		model.addAttribute("hsVo", hsVo);
		model.addAttribute("askListNA", askListNA);
		model.addAttribute("askListYA", askListYA);
	
		
		
		return "petHair/petAdminAsk";
	}

	@RequestMapping("/insertAskR")
	public String insertAskR(HairBoardVo hbVo, Model model, MemberVo memVo) {
//		System.out.println("답변내용 : "+hbVo.getHbrd_rep());
//		System.out.println("수정할 아이디 : "+hbVo.getHbrd_id());
		int chk = hairService.insertAskR(hbVo);
		
		if(chk==1) {
//			System.out.println("성공");
		} else {
//			System.out.println("실패");
			
			
		}
		
		
		
		
		model.addAttribute("mem_id", memVo.getMem_id());
		
		return "redirect:/hairAdmin/askList";
	}
	
	
	
	
} // controller 종료


