package kr.co.mypet.shopping.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mypet.shopping.model.DivisionVo;
import kr.co.mypet.shopping.service.ShoppingServiceInf;

@Controller
@RequestMapping("/shopAdmin")
public class ShopAdminController {
	
	@Resource(name="shoppingService")
	private ShoppingServiceInf shoppingService;
	
	//관리자용 펫샵 메인
	@RequestMapping("/shopAdminMain")
	public String shopAdminMain(Model model) {
		
		List<DivisionVo> aniList = shoppingService.animalList();
		
		model.addAttribute("aniList",aniList);
		
		return "admin/petshop/adminShopMain";
	}
	
	@RequestMapping("/menuSelect")
	public String menuSelect(@RequestParam("dsv_id")String dvs_id) {
		
		//동물 List
		List<DivisionVo> aniList = shoppingService.animalList();
		
		//메뉴 List
		List<DivisionVo> menuList = shoppingService.prodMenu(dvs_id);
		
		return "admin/petshop/adminShopMain";
	}
	
}
