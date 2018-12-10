package kr.co.mypet.shopping.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mypet.shopping.model.ShopNoticeVo;
import kr.co.mypet.shopping.service.ShoppingServiceInf;

@Controller
@RequestMapping("/shop")
public class ShoppingController {

	@Resource(name="shoppingService")
	private ShoppingServiceInf shoppingService;
	
	
	@RequestMapping("/shopMain")
	public String shopMain(Model model) {
		
		List<ShopNoticeVo>snotList = shoppingService.shopNoticeList();
		model.addAttribute("snotList",snotList);
		return "petShop";
	}
	
	@RequestMapping("/shopNoticeDetail")
	public String shopNoticeDetail(@RequestParam("snot_id")String snot_id,Model model) {
		
		ShopNoticeVo snotVo = shoppingService.shopNoticeDetail(snot_id);
		model.addAttribute("snotVo",snotVo);
		
		return "petshop/petNoticeDetail";
	}
	
	@RequestMapping("/petShopList")
	public String petShopList() {
		return "petshop/petShopList";
	}
	
	@RequestMapping("/prodDetail")
	public String prodDetail() {
		return "petshop/petProdDetail";
	}
}
