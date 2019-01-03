package kr.co.mypet.hair.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.hair.model.HairResVo;
import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.hair.model.PetStyleVo;
import kr.co.mypet.hair.service.HairServiceInf;

@RequestMapping("/hairMem")
@Controller
public class HairMemberController {
	
	@Resource(name="hairService")
	private HairServiceInf hairService;
	
	@RequestMapping("/myPage")
	public String mypageMain(MemberVo memVo,Model model) {
		
		String mem_id = memVo.getMem_id();
		
		//mem_id 를이용하여 진행중인 예약건을 불러온다
		List<HairResVo> hairResList = hairService.selectRev(mem_id);
		
		if(hairResList.size()!=0) {
			
			HairResVo hairResVo = new HairResVo();
			
			//list 에서 하나씩 뽑아서 미용실이름, 스타일이름, 스타일 가격을 db에서 뽑아고 그걸 다시 리스트에 set으로 교체한다
			for(int i = 0 ; i < hairResList.size() ; i++) {
				//미용실 id이용해 >> 미용실 이름구하고
				String has_name =""; 
				String has_id = hairResList.get(i).getHres_has();
				
				HairShopVo hairShopVo = hairService.selectShop(has_id);
				has_name = hairShopVo.getHas_name();
				
				// 선택한 스타일 id >> 스타일 이름 , 가격을 불러온다
				String pts_name = "";
				int pts_price = 0;
				String pts_id = hairResList.get(i).getHres_pts();
				
				PetStyleVo petStyleVo = hairService.selectStyle(pts_id);
				pts_name = petStyleVo.getPts_name();
				pts_price = petStyleVo.getPts_price();
				
				hairResVo = hairResList.get(i);
				hairResVo.setHas_name(has_name);
				hairResVo.setPts_name(pts_name);
				hairResVo.setPts_price(pts_price);
				
				//예약 시간에 따른 변환
				if(hairResVo.getHres_time().equals("1")) {hairResVo.setHres_time("8시 ~ 10시");} 
				else if(hairResVo.getHres_time().equals("2")) {hairResVo.setHres_time("10시 ~ 12시");}
				else if(hairResVo.getHres_time().equals("3")) {hairResVo.setHres_time("12시 ~ 14시");}
				else if(hairResVo.getHres_time().equals("4")) {hairResVo.setHres_time("14시 ~ 16시");}
				else if(hairResVo.getHres_time().equals("5")) {hairResVo.setHres_time("16시 ~ 18시");}
				else if(hairResVo.getHres_time().equals("6")) {hairResVo.setHres_time("18시 ~ 20시");}
				
				hairResList.set(i, hairResVo);
				
			}
			
			
			model.addAttribute("hairResList", hairResList);
		}
		
		return "petHair/petHairMypageMain";
	}
	
	@RequestMapping("bookMark")
	public String bookMark() {
		
		return "petHair/petHairBookMark";
	}

}
