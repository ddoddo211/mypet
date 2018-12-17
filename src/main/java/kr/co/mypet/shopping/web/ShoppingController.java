package kr.co.mypet.shopping.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mypet.shopping.model.AnimalVo;
import kr.co.mypet.shopping.model.BrandVo;
import kr.co.mypet.shopping.model.ProdAgeVo;
import kr.co.mypet.shopping.model.ProdVo;
import kr.co.mypet.shopping.model.ProddvVo;
import kr.co.mypet.shopping.model.ShopNoticeVo;
import kr.co.mypet.shopping.service.ShoppingServiceInf;

@Controller
@RequestMapping("/shop")
public class ShoppingController {

	@Resource(name="shoppingService")
	private ShoppingServiceInf shoppingService;
	
	/**
	* Method : shopMain
	* 작성자 : pc25
	* 변경이력 :
	* @param model
	* @return
	* Method 설명 : 펫쇼핑몰 메인으로 이동 이동하면 메인에 필요한 베스트상품 12개와 이벤트리스트를 보내준다.
	*/
	@RequestMapping("/shopMain")
	public String shopMain(Model model) {
		
		List<ShopNoticeVo>snotList = shoppingService.shopNoticeList();
		List<AnimalVo> aniList = shoppingService.animalMenu();
		
		model.addAttribute("snotList",snotList);
		model.addAttribute("aniList",aniList);
		
		return "petShop";
	}
	
	/**
	* Method : shopNoticeDetail
	* 작성자 : pc25
	* 변경이력 :
	* @param snot_id
	* @param model
	* @return
	* Method 설명 : 이벤트 상세화면 이동 선택한 이벤트에 대한 정보를 가지고 이동
	*/
	@RequestMapping("/shopNoticeDetail")
	public String shopNoticeDetail(@RequestParam("snot_id")String snot_id,Model model) {
		
		ShopNoticeVo snotVo = shoppingService.shopNoticeDetail(snot_id);
		model.addAttribute("snotVo",snotVo);
		
		return "petshop/petNoticeDetail";
	}
	
	/**
	* Method : petShopList
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 강아지/고양이 쇼핑몰화면으로 이동 첫화면은 가장 첫메뉴 사료 부분의 리스트를 보여준다.
	*/
	@RequestMapping("/petShopList")
	public String petShopList(Model model,ProddvVo pddVo) {
		
		List<ProddvVo> pddList = shoppingService.prodMenu(pddVo.getPdd_am());
		List<ProdVo> prodList = shoppingService.prodList(pddVo.getPdd_id());
		List<BrandVo> brdList = shoppingService.brandList(pddVo.getPdd_id());
		for(int i = 0; i < prodList.size();i++) {
			if(prodList.get(i).getProd_page() != null) {
				List<ProdAgeVo> ageList = shoppingService.optionList(pddVo.getPdd_am());
				model.addAttribute("ageList",ageList);
			}
			if(prodList.get(i).getProd_size() != null) {
			}
		}
		
		model.addAttribute("pddList",pddList);
		model.addAttribute("prodList",prodList);
		model.addAttribute("brdList",brdList);
		
		return "petshop/petShopList";
	}
	
	/**
	* Method : prodDetail
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 상품상세보기 화면으로 이동 상품에 대한 정보를 가지고 이동
	*/
	@RequestMapping("/prodDetail")
	public String prodDetail(@RequestParam("prod_id")String prod_id,Model model) {
		
		ProdVo prodVo = shoppingService.prodDetail(prod_id);
		model.addAttribute("prodVo",prodVo);
		
		return "petshop/petProdDetail";
	}
}
