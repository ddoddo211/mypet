package kr.co.mypet.hair.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mypet.hair.service.HairServiceInf;

@RequestMapping("/hair")
@Controller
public class HairShopController {
	
	@Resource(name="hairService")
	private HairServiceInf hairService;
	
	//펫헤어 메인화면 이동 메서드
	@RequestMapping("/hairMain")
	public String hairMain() {return "petHair/petHairMain";}
}
