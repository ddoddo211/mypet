package kr.co.mypet.shopping.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mypet.common.model.PageVo;
import kr.co.mypet.shopping.model.DivisionVo;
import kr.co.mypet.shopping.model.ProdVo;
import kr.co.mypet.shopping.model.ShopNoticeVo;
import kr.co.mypet.shopping.service.ShoppingServiceInf;
import kr.co.mypet.sitter.model.SitterAppVo;

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
	
	// 펫샵 메인에서 동물을 선택했을 경우 메뉴List 보내주기
	@RequestMapping("/menuSelect")
	public String menuSelect(@RequestParam("dvs_id")String dvs_id,Model model) {
		
		//동물 List
		List<DivisionVo> aniList = shoppingService.animalList();
		//메뉴 List
		List<DivisionVo> menuList = shoppingService.prodMenu(dvs_id);
		
		model.addAttribute("dvs_id",dvs_id);
		model.addAttribute("aniList",aniList);
		model.addAttribute("menuList",menuList);
		
		return "admin/petshop/adminShopMain";
	}
	
	// 펫샵 동물과 메뉴를 선택시 상품List 보내주기
	@RequestMapping("/menuList")
	public String menuList(DivisionVo dvsVo,Model model,PageVo pageVo) {
		
		//동물 List
		List<DivisionVo> aniList = shoppingService.animalList();
		//메뉴 List
		List<DivisionVo> menuList = shoppingService.prodMenu(dvsVo.getDvs_id());
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("pageVo",pageVo);
		map.put("dvsVo",dvsVo);
		List<ProdVo> prodList = shoppingService.prodList(map);
		
		int size = shoppingService.prodSize(dvsVo.getDvs_parent());
		int prodSize = (int) Math.ceil((double) size/pageVo.getPageSize());
		
		model.addAttribute("dvs_id",dvsVo.getDvs_id());
		model.addAttribute("dvs_parent",dvsVo.getDvs_parent());
		model.addAttribute("page",pageVo.getPage());
		model.addAttribute("prodSize",prodSize);
		model.addAttribute("aniList",aniList);
		model.addAttribute("menuList",menuList);
		model.addAttribute("prodList",prodList);
		
		return "admin/petshop/adminShopMain";
	}
	
	// 상품 삭제 후 해당 페이지로 이동
	@RequestMapping("/prodDelete")
	public String prodDelete(DivisionVo dvsVo,Model model,PageVo pageVo,@RequestParam("prod_id")String prod_id) {
		
		// 상품 삭제하기
		shoppingService.deleteProd(prod_id);
		
		//동물 List
		List<DivisionVo> aniList = shoppingService.animalList();
		//메뉴 List
		List<DivisionVo> menuList = shoppingService.prodMenu(dvsVo.getDvs_id());
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("pageVo",pageVo);
		map.put("dvsVo",dvsVo);
		List<ProdVo> prodList = shoppingService.prodList(map);
		
		int size = shoppingService.prodSize(dvsVo.getDvs_parent());
		int prodSize = (int) Math.ceil((double) size/pageVo.getPageSize());
		
		model.addAttribute("dvs_id",dvsVo.getDvs_id());
		model.addAttribute("dvs_parent",dvsVo.getDvs_parent());
		model.addAttribute("page",pageVo.getPage());
		model.addAttribute("prodSize",prodSize);
		model.addAttribute("aniList",aniList);
		model.addAttribute("menuList",menuList);
		model.addAttribute("prodList",prodList);
		
		return "admin/petshop/adminShopMain";
	}
	
	@RequestMapping("/shopAdminEvent")
	public String shopAdminEvent(Model model) {
		
		List<ShopNoticeVo>snotList =  shoppingService.shopNoticeList();
		
		model.addAttribute("snotList",snotList);
		
		return "admin/petshop/adminShopEvent";
	}
	
	@RequestMapping("/seller")
	public String sellerView(Model model, @RequestParam("page")int page, @RequestParam("pageSize")int pageSize) {
		PageVo pageVo = new PageVo();
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);
		
		List<SitterAppVo> supportListAll = shoppingService.getSupportListAll(pageVo); 
		
		int totalCnt = shoppingService.getSupportListAllCnt();
		int pageCnt = (int)Math.ceil(((double)totalCnt/pageSize));
		
		model.addAttribute("supportListAll", supportListAll);
		model.addAttribute("pageCnt", pageCnt);
		
		return "/admin/petshop/adminShopSeller";
	}
	
}