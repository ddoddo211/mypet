package kr.co.mypet.shopping.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mypet.shopping.model.DivisionVo;
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
		model.addAttribute("snotList",snotList);
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
	public String petShopList(Model model,@RequestParam("dvs_id")String dvs_id) {
		
		List<DivisionVo> menuList = shoppingService.dogMenuList();
		List<DivisionVo> optionList = shoppingService.dogMenuOption(dvs_id);
		List<DivisionVo> dvsList = shoppingService.optionDivision(dvs_id);
		
		model.addAttribute("menuList",menuList);
		model.addAttribute("optionList",optionList);
		model.addAttribute("dvsList",dvsList);
		
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
	public String prodDetail() {
		return "petshop/petProdDetail";
	}
}
