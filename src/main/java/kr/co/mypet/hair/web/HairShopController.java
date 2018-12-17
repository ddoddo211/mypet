package kr.co.mypet.hair.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mypet.hair.model.ZipVo;
import kr.co.mypet.hair.service.HairServiceInf;

@RequestMapping("/hair")
@Controller
public class HairShopController {
	
	@Resource(name="hairService")
	private HairServiceInf hairService;
	
	//펫헤어 메인화면 이동 메서드
	//메인화면 진입시 지역선택 option 창을 db데이터로 채운다
	@RequestMapping("/hairMain")
	public String hairMain(Model model) {
	
		List<ZipVo> zipHighList = hairService.selectZipHigh();
		
		model.addAttribute("zipHighList", zipHighList);
		
		return "petHair/petHairMain";
		
	}
	
	//main 화면에서 리스트 조회를 위한 주소 대분류 >> 주소소분류 리스트 불러오는 메서드
	@RequestMapping("/selectLow")
	public String selectLow(Model model, ZipVo zipVo) {
		
		List<ZipVo> zipHighList = hairService.selectZipHigh();
		
		model.addAttribute("zipHighList", zipHighList);
		
		List<ZipVo> zipLowList = null;
		if(!zipVo.getZip_high().equals("")) {
			zipLowList = hairService.selectZipLow(zipVo.getZip_high());
			model.addAttribute("zipLowList", zipLowList);
			model.addAttribute("zip_high", zipVo.getZip_high());
		}
		
		
		return "petHair/petHairMain";
	}
	
	
}
