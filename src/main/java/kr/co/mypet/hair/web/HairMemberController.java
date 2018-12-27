package kr.co.mypet.hair.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mypet.hair.service.HairServiceInf;

@RequestMapping("/hairMem")
@Controller
public class HairMemberController {
	
	@Resource(name="hairService")
	private HairServiceInf hairService;
	
	@RequestMapping("/myPage")
	public String mypageMain() {
		
		return "petHair/petHairMypageMain";
	}
	
	@RequestMapping("bookMark")
	public String bookMark() {
		
		return "petHair/petHairBookMark";
	}

}
