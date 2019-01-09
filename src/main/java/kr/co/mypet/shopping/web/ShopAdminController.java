package kr.co.mypet.shopping.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mypet.common.model.PageVo;
import kr.co.mypet.shopping.model.DivisionVo;
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
	
	@RequestMapping("/menuSelect")
	public String menuSelect(@RequestParam("dsv_id")String dvs_id) {
		
		//동물 List
		List<DivisionVo> aniList = shoppingService.animalList();
		
		//메뉴 List
		List<DivisionVo> menuList = shoppingService.prodMenu(dvs_id);
		
		return "admin/petshop/adminShopMain";
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
