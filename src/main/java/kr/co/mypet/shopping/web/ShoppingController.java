package kr.co.mypet.shopping.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.common.model.PageVo;
import kr.co.mypet.shopping.model.DivisionVo;
import kr.co.mypet.shopping.model.ProdOptionVo;
import kr.co.mypet.shopping.model.ProdVo;
import kr.co.mypet.shopping.model.ProddvVo;
import kr.co.mypet.shopping.model.ShopNoticeVo;
import kr.co.mypet.shopping.service.ShoppingServiceInf;
import kr.co.mypet.util.StringUtil;

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
		List<DivisionVo> aniList = shoppingService.animalList();
		
		model.addAttribute("snotList",snotList);
		model.addAttribute("aniList",aniList);
		
		return "petShop";
	}
	
	/**
	* Method : saryoSearch
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_id
	* @param model
	* @return
	* Method 설명 : 사료검색의 동물을 선택시 동물의 해당하는 브랜드를 불러주기 위한 컨트롤러
	*/
	@RequestMapping("saryoSearch")
	public String saryoSearch(@RequestParam("dvs_id")String dvs_id,Model model) {
		
		// 이벤트List
		List<ShopNoticeVo>snotList = shoppingService.shopNoticeList();
		// 펫쇼핑몰 동물 List
		List<DivisionVo> aniList = shoppingService.animalList();
		
		if(!(dvs_id.equals("ani"))){
			// 사료검색의 선택한 동물의 사료id 
			String dvs_parent = shoppingService.animalSaryo(dvs_id);
			// 브랜드List
			List<DivisionVo> brdList = shoppingService.brandSearch(dvs_parent);
			model.addAttribute("dvs_parent",dvs_parent);
			model.addAttribute("brdList",brdList);
		}
		
		
		model.addAttribute("snotList",snotList);
		model.addAttribute("aniList",aniList);
		model.addAttribute("dvs_id",dvs_id);
		
		
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
	public String petShopList(Model model,DivisionVo dvsVo,HttpSession session,HttpServletRequest request) {
		
		// 강아지/고양이 상품분류(사료,장난감,간식등)List
		List<DivisionVo> menuList = shoppingService.prodMenu(dvsVo.getDvs_id());
		// 상품분류에 대한 체크박스옵션List(연령,브랜드,견종크기등)
		List<DivisionVo> opList = shoppingService.prodMenuOption(dvsVo.getDvs_parent());
		// 체크박스옵션분류List(연령 - 성견,퍼피등..)
		List<DivisionVo> opMenuList = shoppingService.opMenuList(dvsVo.getDvs_parent());
		
		String value = "";
		if(value != null) {
			value = request.getParameter("value");
			model.addAttribute("value",value);
		}
		
		model.addAttribute("dvs_id",dvsVo.getDvs_id());
		model.addAttribute("dvs_parent",dvsVo.getDvs_parent());
		model.addAttribute("menuList",menuList);
		model.addAttribute("opList",opList);
		model.addAttribute("opMenuList",opMenuList);
		
		return "petshop/petShopList";
	}
	
	/**
	* Method : prodListHtml
	* 작성자 : pc25
	* 변경이력 :
	* @param model
	* @param dvsVo
	* @param pageVo
	* @param values
	* @param opValues
	* @return
	* Method 설명 : ajax로 상품List 
	*/
	@RequestMapping("/prodListHtml")
	public String prodListHtml(Model model,DivisionVo dvsVo,PageVo pageVo,@RequestParam("values")String values
							   ,@RequestParam("opValues")String[] opValues) {

		String value ="";
		
		Map<String,Object> map = new HashMap<>();
		map.put("pageVo",pageVo);
		map.put("dvsVo",dvsVo);
		map.put("values",values);
		map.put("opValues",opValues);
		
		Map<String,Object> resultMap = shoppingService.prodPageList(map);
		
		model.addAllAttributes(resultMap);
		model.addAttribute("value",value);
		
		return "petshop/prodListHtml";
	}
	
	/**
	* Method : prodPageHtml
	* 작성자 : pc25
	* 변경이력 :
	* @param model
	* @param dvsVo
	* @param pageVo
	* @param values
	* @param opValues
	* @return
	* Method 설명 : ajax로 페이지 이동
	*/
	@RequestMapping("/prodPageHtml")
	public String prodPageHtml(Model model,DivisionVo dvsVo,PageVo pageVo,@RequestParam("values")String values
							  ,@RequestParam("opValues")String[] opValues) {
		
		
		String value ="";
		Map<String,Object> map = new HashMap<>();
		map.put("pageVo",pageVo);
		map.put("dvsVo",dvsVo);
		map.put("values",values);
		map.put("opValues",opValues);
		
		Map<String,Object> resultMap = shoppingService.prodPageList(map);
		
		model.addAllAttributes(resultMap);
		model.addAttribute("value",value);

		return "petshop/prodPageHtml";
	}
	
	@RequestMapping("/prodSearch")
	public String prodSearch(DivisionVo dvsVo) {
		
		return "redirect:/shop/petShopList?page=1&pagesize=12&dvs_id="+dvsVo.getDvs_id()+"&dvs_parent="+dvsVo.getDvs_parent();
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
		List<ProdOptionVo> prodoList = shoppingService.prodOpList(prod_id);
		
		model.addAttribute("prodVo",prodVo);
		model.addAttribute("prodoList",prodoList);
		
		return "petshop/petProdDetail";
	}
	
	/**
	* Method : lastProd
	* 작성자 : pc25
	* 변경이력 :
	* @param session
	* @param model
	* @return
	* Method 설명 : 최근 본 상품 이동
	*/
	@RequestMapping("/recentProd")
	public String recentProd(HttpSession session,Model model) {
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		return "petshop/recentProd";
	}
	
	/**
	* Method : basketProd
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 장바구니로 이동
	*/
	@RequestMapping("/basketProd")
	public String basketProd(){
		
		return "petshop/basketProd";
	}
	
	/**
	* Method : prodCre
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_id
	* @param model
	* @return
	* Method 설명 : 상품 등록화면 이동
	*/
	@RequestMapping(value="/prodCre",method=RequestMethod.GET)
	public String prodCreView(@RequestParam("dvs_id")String dvs_id,Model model) {
		
		List<DivisionVo> menuList = shoppingService.prodMenu(dvs_id);
		model.addAttribute("menuList",menuList);
		model.addAttribute("dvs_id",dvs_id);
		return "petshop/prodCre";
	}
	
	@RequestMapping(value="/prodCre",method=RequestMethod.POST)
	public String prodCre(HttpServletRequest request,ProdVo prodVo, HttpSession session,DivisionVo dvsVo,
			@RequestPart("pimg")MultipartFile pimg, @RequestPart("img")MultipartFile img) throws Exception, IOException {
		
		
		// 옵션의 사용 갯수
		if(!(request.getParameter("chkNum").equals(""))){
			int chkNum = Integer.parseInt(request.getParameter("chkNum"));
			System.out.println(chkNum +  " : chkNum");
		}
		
		// 할인가격이 없을 수 있는 경우
		String prodsprice = request.getParameter("prodsprice");
		if(!(prodsprice.equals(""))) {
			int prod_sprice = Integer.parseInt(prodsprice);
			prodVo.setProd_sprice(prod_sprice);;
		}
		
		// 옵션이 있어 상품의 수량이 없을 경우
		String prodqty = request.getParameter("prodqty");
		if(!(prodqty.equals(""))) {
			int prod_qty = Integer.parseInt(prodqty);
			prodVo.setProd_qty(prod_qty);
		}
		
		//------------------------------------------------------------------------------------------------------
		// 상품 이미지 업로드
		String path = "D:\\A_TeachingMaterial\\7.LastProject\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\mypet\\shopimg";
		
		
		String oriFileName = pimg.getOriginalFilename();
		String oriFileName2 = img.getOriginalFilename();
		
		//확장자 잘라오기
		String fileExt = StringUtil.getFileExt(oriFileName);
		String fileExt2 = StringUtil.getFileExt(oriFileName2);
		
		String fileName = UUID.randomUUID().toString() + fileExt; // 충돌 방지를 위한 임의의 파일명
		String fileName2 = UUID.randomUUID().toString() + fileExt2;
		
		File file = new File(path + File.separator + fileName);
		File file2 = new File(path + File.separator + fileName2);
		
		pimg.transferTo(file);
		img.transferTo(file2);
		
		
//		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		prodVo.setProd_mem("brown");
		
		prodVo.setProd_pimg("/shopimg/"+fileName);
		prodVo.setProd_img("/shopimg/"+fileName2);

		
		//---------------------------------------------------------------------------------------------------------
		
		//상춤 추가
		int cnt = shoppingService.prodCre(prodVo);
		
		
		// 상품분류에 상품 추가
		String menuOption = request.getParameter("menuOption");
		String[] menu = menuOption.split(",");
		if(cnt != 0) {
			System.out.println("성공");
			ProddvVo pddVo = new ProddvVo();
			pddVo.setPdd_dvs(dvsVo.getDvs_parent());
			shoppingService.pddCre(pddVo);
			if(!(menu[0].equals(""))) {
				System.out.println("진입");
				for (int i = 0; i < menu.length; i++) {
					pddVo.setPdd_dvs(menu[i]);
					shoppingService.pddCre(pddVo);
				}
			}
		}
		return "redirect:/shop/petShopList?page=1&pagesize=12&dvs_id="+dvsVo.getDvs_id()+"&dvs_parent="+dvsVo.getDvs_parent();
	}
	
	/**
	* Method : menuSelect
	* 작성자 : pc25
	* 변경이력 :
	* @param menu_id
	* @param dvs_id
	* @param model
	* @return
	* Method 설명 : 상품 등록화면 체크박스에 값을 받아 상품옵션을 보내준다.
	*/
	@RequestMapping("/menuSelect")
	public String menuSelect(@RequestParam("menu_id")String menu_id,@RequestParam("dvs_id")String dvs_id
											,Model model) {
		
		List<DivisionVo> menuList = shoppingService.prodMenu(dvs_id);
		List<DivisionVo> opList = shoppingService.prodMenuOption(menu_id);
		List<DivisionVo> opMenuList = shoppingService.opMenuList(menu_id);
		
		model.addAttribute("dvs_id",dvs_id);
		model.addAttribute("menu_id",menu_id);
		model.addAttribute("menuList",menuList);
		model.addAttribute("opList",opList);
		model.addAttribute("opMenuList",opMenuList);
		
		return "petshop/prodCre";
	}
	
}
