package kr.co.mypet.shopping.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.common.model.PageVo;
import kr.co.mypet.shopping.model.DivisionVo;
import kr.co.mypet.shopping.model.ProdVo;
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
	public String petShopList(Model model,DivisionVo dvsVo) {
		
		// 강아지/고양이 상품분류(사료,장난감,간식등)List
		List<DivisionVo> menuList = shoppingService.prodMenu(dvsVo.getDvs_id());
		// 상품분류에 대한 체크박스옵션List(연령,브랜드,견종크기등)
		List<DivisionVo> opList = shoppingService.prodMenuOption(dvsVo.getDvs_parent());
		// 체크박스옵션분류List(연령 - 성견,퍼피등..)
		List<DivisionVo> opMenuList = shoppingService.opMenuList(dvsVo.getDvs_parent());
		
		model.addAttribute("dvs_id",dvsVo.getDvs_id());
		model.addAttribute("dvs_parent",dvsVo.getDvs_parent());
		model.addAttribute("menuList",menuList);
		model.addAttribute("opList",opList);
		model.addAttribute("opMenuList",opMenuList);
		
		return "petshop/petShopList";
	}
	
	@RequestMapping("/prodListHtml")
	public String prodListHtml(Model model,DivisionVo dvsVo,PageVo pageVo,@RequestParam("values")String values
							   ,@RequestParam("opValues")String[] opValues) {
		
		Map<String,Object> map = new HashMap<>();
		map.put("pageVo",pageVo);
		map.put("dvsVo",dvsVo);
		map.put("values",values);
		map.put("opValues",opValues);
		
		Map<String,Object> resultMap = shoppingService.prodPageList(map);
		
		model.addAllAttributes(resultMap);
		
		return "petshop/prodListHtml";
	}
	
	@RequestMapping("/prodPageHtml")
	public String prodPageHtml(Model model,DivisionVo dvsVo,PageVo pageVo,@RequestParam("values")String values
							  ,@RequestParam("opValues")String[] opValues) {
		
		Map<String,Object> map = new HashMap<>();
		map.put("pageVo",pageVo);
		map.put("dvsVo",dvsVo);
		map.put("values",values);
		map.put("opValues",opValues);
		
		Map<String,Object> resultMap = shoppingService.prodPageList(map);
		
		model.addAllAttributes(resultMap);

		return "petshop/prodPageHtml";
	}
	
	/**
	* Method : prodDetail
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 상품상세보기 화면으로 이동 상품에 대한 정보를 가지고 이동
	*/
	@RequestMapping("/prodDetail")
	public String prodDetail(@RequestParam("prod_id")String prod_id,Model model,HttpSession session) {
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		ProdVo prodVo = shoppingService.prodDetail(prod_id);
		
		model.addAttribute("prodVo",prodVo);
		
		return "petshop/petProdDetail";
	}
	
	/**
	* Method : lastProd
	* 작성자 : pc25
	* 변경이력 :
	* @param session
	* @param model
	* @return
	* Method 설명 : 최근 본 상품
	*/
	@RequestMapping("/recentProd")
	public String recentProd(HttpSession session,Model model) {
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		return "petshop/recentProd";
	}
	
	@RequestMapping("/basketProd")
	public String basketProd(){
		
		return "petshop/basketProd";
	}
}
