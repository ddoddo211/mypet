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
import javax.sound.midi.Synthesizer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itextpdf.text.log.SysoCounter;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.common.model.PageVo;
import kr.co.mypet.common.service.CommonServiceInf;
import kr.co.mypet.shopping.model.CartVo;
import kr.co.mypet.shopping.model.DeliveryAddrVo;
import kr.co.mypet.shopping.model.DivisionVo;
import kr.co.mypet.shopping.model.OrderSheetVo;
import kr.co.mypet.shopping.model.ProdOptionVo;
import kr.co.mypet.shopping.model.ProdRevVo;
import kr.co.mypet.shopping.model.ProdVo;
import kr.co.mypet.shopping.model.ProddvVo;
import kr.co.mypet.shopping.model.RecentProdVo;
import kr.co.mypet.shopping.model.ShopNoticeVo;
import kr.co.mypet.shopping.service.ShoppingServiceInf;
import kr.co.mypet.util.StringUtil;

@Controller
@RequestMapping("/shop")
public class ShoppingController {

	@Resource(name="shoppingService")
	private ShoppingServiceInf shoppingService;
	
	@Resource(name="commonService")
	private CommonServiceInf commonService;
	
	
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
		List<ProdVo> bestList = shoppingService.bestProd(12); 
		
		model.addAttribute("snotList",snotList);
		model.addAttribute("aniList",aniList);
		model.addAttribute("bestList",bestList);
		
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
		
		DivisionVo dvs = shoppingService.dvsDetail(dvsVo.getDvs_id());
		
		String value = "";
		if(value != null) {
			value = request.getParameter("value");
			model.addAttribute("value",value);
		}
		
		String prod_name = request.getParameter("prod_name");
		
		model.addAttribute("dvs",dvs);
		model.addAttribute("dvs_id",dvsVo.getDvs_id());
		model.addAttribute("dvs_parent",dvsVo.getDvs_parent());
		model.addAttribute("menuList",menuList);
		model.addAttribute("opList",opList);
		model.addAttribute("opMenuList",opMenuList);
		//사료검색명
		model.addAttribute("prod_name",prod_name);
		
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
							   ,@RequestParam("opValues")String[] opValues,HttpServletRequest request) {
		
		String value ="";
		Map<String,Object> map = new HashMap<>();
		map.put("pageVo",pageVo);
		map.put("dvsVo",dvsVo);
		map.put("values",values);
		map.put("opValues",opValues);
		map.put("prod_name",request.getParameter("prod_name"));
		
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
							  ,@RequestParam("opValues")String[] opValues,HttpServletRequest request) {
		
		
		String value ="";
		Map<String,Object> map = new HashMap<>();
		map.put("pageVo",pageVo);
		map.put("dvsVo",dvsVo);
		map.put("values",values);
		map.put("opValues",opValues);
		map.put("prod_name",request.getParameter("prod_name"));
		
		Map<String,Object> resultMap = shoppingService.prodPageList(map);
		
		model.addAllAttributes(resultMap);
		model.addAttribute("value",value);

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
	public String prodDetail(@RequestParam("prod_id")String prod_id,Model model,HttpSession session,DivisionVo dvsVo) {
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		RecentProdVo recpVo = new RecentProdVo();
		
		
		ProdVo prodVo = shoppingService.prodDetail(prod_id);
		List<ProdOptionVo> prodoList = shoppingService.prodOpList(prod_id);
		List<ProdRevVo> revList = shoppingService.revList(prod_id);
		
		
		//해당 상품이 장바구니에 등록되어있는 확인
		int cartChk = 0;
		if(memVo != null) {
			List<CartVo> cartList = shoppingService.cartList(memVo.getMem_id());
			for (int i = 0; i < cartList.size(); i++) {
				if(cartList.get(i).getCart_prod().equals(prod_id)) {
					cartChk = 1;
				}
			}
			recpVo.setRecp_mem(memVo.getMem_id());
			recpVo.setRecp_prod(prod_id);
			shoppingService.insertRecp(recpVo);
			
		}
		
		model.addAttribute("prodVo",prodVo);
		model.addAttribute("prodoList",prodoList);
		model.addAttribute("dvsVo",dvsVo);
		model.addAttribute("revList",revList);
		model.addAttribute("cartChk",cartChk);
		
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
		
		if(memVo != null) {
			List<ProdVo> recpList = shoppingService.recpList(memVo.getMem_id());
			model.addAttribute("recpList",recpList);
		}
		
		
		return "petshop/recentProd";
	}
	
	@RequestMapping("/recentProdDel")
	public String recentProdDel(HttpSession session,@RequestParam("prod_id")String prod_id) {
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		RecentProdVo recpVo = new RecentProdVo();
		
		if(memVo != null) {
			recpVo.setRecp_mem(memVo.getMem_id());
			recpVo.setRecp_prod(prod_id);
			shoppingService.delRecp(recpVo);
		}
		
		return "redirect:/shop/recentProd";
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
	public String prodCreView(DivisionVo dvsVo,Model model) {
		
		List<DivisionVo> menuList = shoppingService.prodMenu(dvsVo.getDvs_id());

		model.addAttribute("menuList",menuList);
		model.addAttribute("dvs_id",dvsVo.getDvs_id());
		model.addAttribute("dvs_parent",dvsVo.getDvs_parent());
		
		return "petshop/prodCre";
	}
	
	@RequestMapping(value="/prodCre",method=RequestMethod.POST)
	public String prodCre(HttpServletRequest request,ProdVo prodVo, HttpSession session,DivisionVo dvsVo,
			@RequestPart("pimg")MultipartFile pimg, @RequestPart("img")MultipartFile img) throws Exception, IOException {
		
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
		String path1 = request.getSession().getServletContext().getRealPath("");
		String path = path1 +"/shopimg";
		
		
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
		
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		prodVo.setProd_mem(memVo.getMem_id());
		
		prodVo.setProd_pimg("/shopimg/"+fileName);
		prodVo.setProd_img("/shopimg/"+fileName2);

		
		//---------------------------------------------------------------------------------------------------------
		
		//상춤 추가
		int cnt = shoppingService.prodCre(prodVo);
		
		
		// 상품분류에 상품 추가
		String menuOption = request.getParameter("menuOption");
		String[] menu = menuOption.split(",");
		ProddvVo pddVo = new ProddvVo();
		if(cnt != 0) {
			pddVo.setPdd_dvs(dvsVo.getDvs_parent());
			shoppingService.pddCre(pddVo);
			pddVo.setPdd_dvs(dvsVo.getDvs_id());
			shoppingService.pddCre(pddVo);
			if(!(menu[0].equals(""))) {
				for (int i = 0; i < menu.length; i++) {
					pddVo.setPdd_dvs(menu[i]);
					shoppingService.pddCre(pddVo);
				}
			}
		}
		// 상품 옵션 추가
		// 옵션의 사용 갯수
		if(!(request.getParameter("chkNum").equals(""))){
			int chkNum = Integer.parseInt(request.getParameter("chkNum"));
			for (int i = 1; i < chkNum; i++) {
				ProdOptionVo prodoVo = new ProdOptionVo();
				if(!(request.getParameter("opName"+i).equals(""))) {
					prodoVo.setProdo_name(request.getParameter("opName"+i));
					prodoVo.setProdo_qty(Integer.parseInt(request.getParameter("opQty"+i)));
					
					if(request.getParameter("opPrice"+i).equals("")) {
						prodoVo.setProdo_price(0);
					}else {
						prodoVo.setProdo_price(Integer.parseInt(request.getParameter("opPrice"+i)));
					}
					
					shoppingService.prodoCre(prodoVo);
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
	
	/**
	* Method : prodDelete
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 상품 삭제시키기
	*/
	@RequestMapping(value="/prodDelete",method=RequestMethod.POST)
	public String prodDelete(@RequestParam("prod_id")String prod_id,DivisionVo dvsVo) {
		
		// 상품 삭제
		shoppingService.deleteProd(prod_id);
		
		return "redirect:/shop/petShopList?page=1&pagesize=12&dvs_id="+dvsVo.getDvs_id()+"&dvs_parent="+dvsVo.getDvs_parent();
	}
	
	/**
	* Method : prodUpdateView
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 상품 수정 View
	*/
	@RequestMapping(value="/prodUpdateView",method=RequestMethod.GET)
	public String prodUpdateView(DivisionVo dvsVo,@RequestParam("prod_id")String prod_id,Model model) {
		
		List<ProdOptionVo> prodoList = shoppingService.prodOpList(prod_id);
		ProdVo prodVo = shoppingService.prodDetail(prod_id);
		
		if(prodoList.size() != 0) {
			model.addAttribute("chkNum",prodoList.size());
		}
		
		model.addAttribute("dvsVo",dvsVo);
		model.addAttribute("prodVo",prodVo);
		model.addAttribute("prodoList",prodoList);
		
		return "/petshop/prodUpdate";
	}
	
	/**
	* Method : prodUpdate
	* 작성자 : pc25
	* 변경이력 :
	* @param chkNum
	* @param prodVo
	* @param dvsVo
	* @param pimg
	* @param img
	* @return
	* Method 설명 : 상품 수정
	 * @throws IOException 
	 * @throws IllegalStateException 
	*/
	@RequestMapping(value="/prodUpdate",method=RequestMethod.POST)
	public String prodUpdate(HttpServletRequest request,ProdVo prodVo,DivisionVo dvsVo,
			@RequestPart("pimg")MultipartFile pimg, @RequestPart("img")MultipartFile img) throws IllegalStateException, IOException {
		
		String path = "D:\\A_TeachingMaterial\\7.LastProject\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\mypet\\shopimg";
		// 상품프로필 이미지 변경
		if(!(pimg.getOriginalFilename().equals(""))) {
			// 상품 이미지 업로드
			String oriFileName = pimg.getOriginalFilename();
			//확장자 잘라오기
			String fileExt = StringUtil.getFileExt(oriFileName);
			String fileName = UUID.randomUUID().toString() + fileExt; // 충돌 방지를 위한 임의의 파일명
			File file = new File(path + File.separator + fileName);
			pimg.transferTo(file);
			prodVo.setProd_pimg("/shopimg/"+fileName);
		}
		
		// 상품상세보기 이미지 변경
		if(!(img.getOriginalFilename().equals(""))) {
			// 상품 이미지 업로드
			String oriFileName = img.getOriginalFilename();
			// 확장자 잘라오기
			String fileExt = StringUtil.getFileExt(oriFileName);
			String fileName = UUID.randomUUID().toString() + fileExt;
			File file = new File(path + File.separator + fileName);
			img.transferTo(file);
			prodVo.setProd_img("/shopimg/"+fileName);
		}
		
		//상품 수정
		shoppingService.prodUpdate(prodVo);
		//옵션 수정 --------------------------------
		if(!(request.getParameter("chkNum").equals(""))){
			int chkNum = Integer.parseInt(request.getParameter("chkNum"));
			int result = shoppingService.deleteOption(prodVo.getProd_id());
			if(result != 0) {
				for (int i = 1; i <= chkNum; i++) {
					ProdOptionVo prodoVo = new ProdOptionVo();
					if(request.getParameter("opName"+i) == null || request.getParameter("opName"+i).equals("") ) {
					}else {
						prodoVo.setProdo_name(request.getParameter("opName"+i));
						prodoVo.setProdo_qty(Integer.parseInt(request.getParameter("opQty"+i)));
						
						if(request.getParameter("opPrice"+i).equals("")) {
							prodoVo.setProdo_price(0);
						}else {
							prodoVo.setProdo_price(Integer.parseInt(request.getParameter("opPrice"+i)));
						}
						
						shoppingService.prodoCre(prodoVo);
					}
				}
			}
		}
		
		return "redirect:/shop/prodDetail?dvs_id="+dvsVo.getDvs_id() + "&dvs_parent=" +dvsVo.getDvs_parent() + "&prod_id="+prodVo.getProd_id();
	}
	
	
	/**
	* Method : revCre
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 상품후기 등록
	*/
	@RequestMapping(value="/revCre",method=RequestMethod.POST)
	public String revCre(ProdRevVo prevVo,HttpSession session,DivisionVo dvsVo) {
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		prevVo.setPrev_mem(memVo.getMem_id());
		shoppingService.revInsert(prevVo);
		
		return "redirect:/shop/prodDetail?dvs_id="+dvsVo.getDvs_id() + "&dvs_parent=" +dvsVo.getDvs_parent() + "&prod_id="+prevVo.getPrev_prod();
	}
	
	/**
	* Method : revUpdate
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 상품 후기 수정
	*/
	@RequestMapping(value="/revUpdate",method=RequestMethod.POST)
	public String revUpdate(DivisionVo dvsVo,ProdRevVo prevVo) {
		shoppingService.revUpdate(prevVo);
		
		return "redirect:/shop/prodDetail?dvs_id="+dvsVo.getDvs_id() + "&dvs_parent=" +dvsVo.getDvs_parent() + "&prod_id="+prevVo.getPrev_prod();
	}
	
	/**
	* Method : revDelete
	* 작성자 : pc25
	* 변경이력 :
	* @param prev_id
	* @param prod_id
	* @param dvsVo
	* @return
	* Method 설명 : 상품 후기 삭제
	*/
	@RequestMapping("/revDelete")
	public String revDelete(@RequestParam("prev_id")String prev_id,@RequestParam("prod_id")String prod_id,DivisionVo dvsVo) {
		shoppingService.revDelete(prev_id);
		return "redirect:/shop/prodDetail?dvs_id="+dvsVo.getDvs_id() + "&dvs_parent=" +dvsVo.getDvs_parent() + "&prod_id="+prod_id;
	}
	
	/**
	* Method : prodQtyHtml
	* 작성자 : pc25
	* 변경이력 :
	* @param dvsVo
	* @param prodVo
	* @param model
	* @return
	* Method 설명 : 상품상세화면 수량 변경시 가격 고치기
	*/
	@RequestMapping("/prodQtyHtml")
	public String prodQtyHtml(DivisionVo dvsVo,ProdVo prodVo,Model model,@RequestParam("qty")String[] qty,@RequestParam("prodo_ids")String[] prodo_ids) {
		ProdVo prod = shoppingService.prodDetail(prodVo.getProd_id());
		int price = 0;
		if(prodo_ids.length != 0) {
			for (int i = 0; i < prodo_ids.length; i++) {
				ProdOptionVo prodoVo = shoppingService.prodoVo(prodo_ids[i]);
				if(prod.getProd_sprice() == 0) {
					if(prodoVo.getProdo_price() == 0) {
						price += prod.getProd_price() * Integer.parseInt(qty[i]);
					}else {
						price += (prod.getProd_price() * Integer.parseInt(qty[i])) + (Integer.parseInt(qty[i]) * prodoVo.getProdo_price()); 
					}
				}else {
					if(prodoVo.getProdo_price() == 0) {
						price += prod.getProd_sprice() * Integer.parseInt(qty[i]);
					}else {
						price += (prod.getProd_sprice() * Integer.parseInt(qty[i])) + (Integer.parseInt(qty[i]) * prodoVo.getProdo_price()); 
					}
				}
			}
		}else {
			if(prod.getProd_sprice() == 0) {
				price = prod.getProd_price() * Integer.parseInt(qty[0]);
			}else {
				price = prod.getProd_sprice() * Integer.parseInt(qty[0]);
			}
		}
		
		
		
		model.addAttribute("price",price);
		
		return "/petshop/prodQtyHtml";
	}
	
	/**
	* Method : prodOpHtml
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 상품 옵션 추가 
	*/
	@RequestMapping("/prodOpHtml")
	public String prodOpHtml(DivisionVo dvsVo,@RequestParam("prod_id")String prod_id,@RequestParam("prodo_id")String prodo_id,Model model) {
		
		ProdOptionVo prodoVo = shoppingService.prodoVo(prodo_id);
		model.addAttribute("prodoVo",prodoVo);
		return "/petshop/prodOpHtml";
	}
	
	/**
	* Method : cartList
	* 작성자 : pc25
	* 변경이력 :
	* @param session
	* @param model
	* @return
	* Method 설명 : 장바구니 이동
	*/
	@RequestMapping("/cartList")
	public String cartList(HttpSession session,Model model,CartVo cartVo,HttpServletRequest request) {
		
		
		String prodo_ids = request.getParameter("prodo_ids");
		if(prodo_ids == null) {
			model.addAttribute("prodo_ids",prodo_ids);
		}
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		if(memVo != null) {
			List<CartVo> cartList = shoppingService.cartList(memVo.getMem_id());
			model.addAttribute("cartList",cartList);
		}
		
		return "/petshop/basketProd";
	}
	
	/**
	* Method : cartAdd
	* 작성자 : pc25
	* 변경이력 :
	* @param cartVo
	* @param session
	* @param model
	* @return
	* Method 설명 : 장바구니 등록
	*/
	@RequestMapping(value ="/cartAdd" , method = RequestMethod.POST)
	public String cartAdd(CartVo cartVo,HttpSession session,Model model,HttpServletRequest request) {
		
		String prodo_ids = request.getParameter("prodo_ids");
		if(!(prodo_ids.equals(""))) {
			model.addAttribute("prodo_ids",prodo_ids);
		}
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		cartVo.setCart_mem(memVo.getMem_id());
		shoppingService.cartAdd(cartVo);
		
		return "redirect:/shop/cartList";
	}
	
	@RequestMapping("/cartDel")
	public String cartDel(@RequestParam("cart_ids")String cart_ids,Model model,HttpSession session) {
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		if(!(cart_ids.equals("")) || cart_ids != null) {
			String[] cart_id = cart_ids.split(",");
			for (int i = 0; i < cart_id.length; i++) {
				shoppingService.cartDel(cart_id[i]);
			}
			List<CartVo> cartList = shoppingService.cartList(memVo.getMem_id());
			model.addAttribute("cartList",cartList);
		}
		
		
		return "redirect:/shop/cartList";
	}
	
	@RequestMapping(value = "/prodOrder",method=RequestMethod.GET)
	public String prodOrder(Model model,OrderSheetVo ordsVo,HttpServletRequest request,HttpSession session) {
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		DeliveryAddrVo basicAddress = null;
		
		if(memVo != null) {
			 if(shoppingService.basicAddress(memVo.getMem_id()) == null) {
				basicAddress = new DeliveryAddrVo();
			}else {
				basicAddress = shoppingService.basicAddress(memVo.getMem_id());
			}
			 List<DeliveryAddrVo> otherAddrList = shoppingService.otherAddress(memVo.getMem_id());
			 
			 model.addAttribute("basicAddress",basicAddress);
			 model.addAttribute("otherAddrList",otherAddrList);
		}
		
		String cart_id = request.getParameter("cart_ids");
		String totalPrice= request.getParameter("totalPrice");
		
		if(cart_id == null) {
			String prod_id = request.getParameter("prod_id");
			ProdVo prodVo = shoppingService.prodDetail(prod_id);
			
			model.addAttribute("ordsVo",ordsVo);
			model.addAttribute("prodVo",prodVo);
		}else {
			String cart_ids = "'"+cart_id.replaceAll(",","','")+"'";
			List<CartVo> cartList = shoppingService.cartBuyList(cart_ids);
			model.addAttribute("cartList",cartList);
		}
		
		
		model.addAttribute("totalPrice",totalPrice);
		return "/petshop/prodOrder";
	}
	
	@RequestMapping(value="/payment",method=RequestMethod.POST)
	public String payment(DeliveryAddrVo daddrVo,HttpServletRequest request,HttpSession session) {
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		if(memVo != null) {
			
			String ids = request.getParameter("ids");	
			String qty = request.getParameter("qtys");
			String prices = request.getParameter("prices");
			String[] prod_qty = qty.split(",");
			String[] prod_id = ids.split(",");
			String[] prod_price = prices.split(",");
			ProdVo prodVo = new ProdVo();
			OrderSheetVo ordsVo = new OrderSheetVo();
			
			//주문서 회원
			ordsVo.setOrds_mem(memVo.getMem_id());

			//기존배송지 변경/배송지 저장
			daddrVo.setDaddr_mem(memVo.getMem_id());
			
			
			if(daddrVo.getDaddr_chk() == 1) {
				ordsVo.setOrds_daddr(daddrVo.getDaddr_id());
				//기존 배송지 처리
				DeliveryAddrVo basicAddr = shoppingService.basicAddress(memVo.getMem_id());
				
				// 기존 배송지 있을 경우 변경
				if(basicAddr == null) {
						for (int i = 0; i < prod_id.length; i++) {
							//배송지 생성
							shoppingService.daddrCre(daddrVo);
							//하나의 상품들을 주문서 만들기
							ordsVo.setOrds_qty(Integer.parseInt(prod_qty[i]));
							ordsVo.setOrds_price(Integer.parseInt(prod_price[i]));
							ordsVo.setOrds_prod(prod_id[i]);
							int insert = shoppingService.orderInsert(ordsVo);
							if(insert != 0) {
								prodVo = shoppingService.prodDetail(prod_id[i]);
								prodVo.setProd_qty(prodVo.getProd_qty()-Integer.parseInt(prod_qty[i]));
								shoppingService.qtyUpdate(prodVo);
							}
						}
				}else {
					int update = shoppingService.updateDaddr(basicAddr.getDaddr_id());
					
					if(update != 0) {
						for (int i = 0; i < prod_id.length; i++) {
							//배송지 생성
							shoppingService.daddrCre(daddrVo);
							//하나의 상품들을 주문서 만들기
							ordsVo.setOrds_qty(Integer.parseInt(prod_qty[i]));
							ordsVo.setOrds_price(Integer.parseInt(prod_price[i]));
							ordsVo.setOrds_prod(prod_id[i]);
							int insert = shoppingService.orderInsert(ordsVo);
							if(insert != 0) {
								prodVo = shoppingService.prodDetail(prod_id[i]);
								prodVo.setProd_qty(prodVo.getProd_qty()-Integer.parseInt(prod_qty[i]));
								shoppingService.qtyUpdate(prodVo);
							}
						}
					}
				}
			}
			//저장된 배송지 사용 
			else if(daddrVo.getDaddr_chk() == 2) {
				
				// 기존에 저장된 배송지 아이디 넣어주기
				ordsVo.setOrds_daddr(daddrVo.getDaddr_id());
				
				for (int i = 0; i < prod_id.length; i++) {
					//하나의 상품들을 주문서 만들기
					ordsVo.setOrds_qty(Integer.parseInt(prod_qty[i]));
					ordsVo.setOrds_price(Integer.parseInt(prod_price[i]));
					ordsVo.setOrds_prod(prod_id[i]);
					int otherAddr = shoppingService.orderInsert2(ordsVo);
					if(otherAddr != 0) {
						prodVo = shoppingService.prodDetail(prod_id[i]);
						prodVo.setProd_qty(prodVo.getProd_qty()-Integer.parseInt(prod_qty[i]));
						shoppingService.qtyUpdate(prodVo);
					}
				}
			}
			//배송지 저장
			else if(daddrVo.getDaddr_chk() == 3) {
				daddrVo.setDaddr_chk(2);
				shoppingService.daddrCre(daddrVo);
				for (int i = 0; i < prod_id.length; i++) {
					
					ordsVo.setOrds_qty(Integer.parseInt(prod_qty[i]));
					ordsVo.setOrds_price(Integer.parseInt(prod_price[i]));
					ordsVo.setOrds_prod(prod_id[i]);
					int result = shoppingService.orderInsert(ordsVo);
					if(result != 0) {
						prodVo = shoppingService.prodDetail(prod_id[i]);
						prodVo.setProd_qty(prodVo.getProd_qty()-Integer.parseInt(prod_qty[i]));
						shoppingService.qtyUpdate(prodVo);
					}
				}
			}else {
				shoppingService.daddrCre(daddrVo);
				for (int i = 0; i < prod_id.length; i++) {
					
					ordsVo.setOrds_qty(Integer.parseInt(prod_qty[i]));
					ordsVo.setOrds_price(Integer.parseInt(prod_price[i]));
					ordsVo.setOrds_prod(prod_id[i]);
					int result = shoppingService.orderInsert(ordsVo);
					if(result != 0) {
						prodVo = shoppingService.prodDetail(prod_id[i]);
						prodVo.setProd_qty(prodVo.getProd_qty()-Integer.parseInt(prod_qty[i]));
						shoppingService.qtyUpdate(prodVo);
					}
				}
			}
		}
		
		return "";
	}
	
	/**
	* Method : saveAddrHtml
	* 작성자 : pc25
	* 변경이력 :
	* @param daddr_id
	* @param model
	* @param session
	* @return
	* Method 설명 : 저장된 배송지 아작스 처리
	*/
	@RequestMapping("/saveAddrHtml")
	public String saveAddrHtml(@RequestParam("daddr_id")String daddr_id,Model model,HttpSession session) {
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		DeliveryAddrVo daddrVo = shoppingService.saveAddr(daddr_id);
		List<DeliveryAddrVo> otherAddrList = shoppingService.otherAddress(memVo.getMem_id());
		 
		model.addAttribute("otherAddrList",otherAddrList);
		model.addAttribute("basicAddress",daddrVo);
		
		return "petshop/saveAddrHtml";
	}
	
	/**
	* Method : prodBest
	* 작성자 : pc25
	* 변경이력 :
	* @param model
	* @return
	* Method 설명 : 베스트화면 조회 
	*/
	@RequestMapping("/prodBest")
	public String prodBest(Model model) {
		
		List<ProdVo> bestList = shoppingService.bestProd(30);
		
		model.addAttribute("bestList",bestList);
		
		return "petshop/prodBest";
	}
	
	/**
	* Method : prodEvent
	* 작성자 : pc25
	* 변경이력 :
	* @param model
	* @return
	* Method 설명 : 이벤트 조회
	*/
	@RequestMapping("/prodEvent")
	public String prodEvent(Model model) {
		List<ShopNoticeVo> snotList = shoppingService.shopNoticeList();
		
		model.addAttribute("snotList",snotList);
		return "petshop/petShopEvent";
	}
	
	/**
	* Method : shopMypage
	* 작성자 : pc25
	* 변경이력 :
	* @param session
	* @param model
	* @return
	* Method 설명 : mypage view 이동
	*/
	@RequestMapping("/shopMypage")
	public String shopMypage(HttpSession session,Model model) {
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		if(memVo != null) {
			// 주문내역 List
			List<OrderSheetVo> orderList = shoppingService.orderList(memVo.getMem_id());
			List<OrderSheetVo> buyList = shoppingService.buyList(memVo.getMem_id());
			List<OrderSheetVo> cancleList = shoppingService.cancleList(memVo.getMem_id());
			
			model.addAttribute("orderList",orderList);
			model.addAttribute("buyList",buyList);
			model.addAttribute("cancleList",cancleList);
			
			if(memVo.getMem_shop() == 2) {
				List<ProdVo> marketerList = shoppingService.marketerList(memVo.getMem_id());
				model.addAttribute("marketerList",marketerList);
				List<OrderSheetVo> marketOrderList = shoppingService.marketerOrderList(memVo.getMem_id());
				model.addAttribute("marketOrderList",marketOrderList);
			}
		}
		
		
		return "petshop/shopMypage";
	}
	
	/**
	* Method : orderCancle
	* 작성자 : pc25
	* 변경이력 :
	* @param ords_id
	* @return
	* Method 설명 : 주문 구매 취소
	*/
	@RequestMapping("/orderCancle")
	public String orderCancle(@RequestParam("ords_id")String ords_id) {
		
		shoppingService.orderCancle(ords_id);
		
		return "redirect:/shop/shopMypage";
	}
	
	
	/**
	* Method : orderDecide
	* 작성자 : pc25
	* 변경이력 :
	* @param ords_id
	* @param session
	* @return
	* Method 설명 : 주문한 상품 구매확정 포인트로 전환
	*/
	@RequestMapping("orderDecide")
	public String orderDecide(@RequestParam("ords_id")String ords_id,HttpSession session) {
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		MemberVo memberInfo = commonService.memberInfo(memVo.getMem_id());
		
		// 주문서 내역 조회
		OrderSheetVo ordsVo = shoppingService.orderDetail(ords_id);
		
		int result = shoppingService.decideUpdate(ords_id);
		if(result != 0) {
			int point  = (int) (memberInfo.getMem_point() + (ordsVo.getOrds_price() * 0.01));
			MemberVo memberVo = new MemberVo();
			memberVo.setMem_id(memVo.getMem_id());
			memberVo.setMem_point(point);
			commonService.pointUpdate(memberVo);
		}
		
		
		return "redirect:/shop/shopMypage";
	}
	
	/**
	* Method : prodRev
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @param model
	* @return
	* Method 설명 : 구매확정 상품 후기 쓰러가기 , 판매자 상품 수정/삭제 하기
	*/
	@RequestMapping("/prodRev")
	public String prodRev(@RequestParam("prod_id")String prod_id,Model model) {
		
		String dvs_id = shoppingService.searchId(prod_id);
		ProddvVo pddVo = new ProddvVo();
		pddVo.setPdd_dvs(dvs_id);
		pddVo.setPdd_prod(prod_id);
		
		String dvs_parent = shoppingService.searchParent(pddVo);
		
		return "redirect:/shop/prodDetail?dvs_id="+dvs_id+ "&dvs_parent=" +dvs_parent + "&prod_id="+prod_id;
	}
	
	@RequestMapping("/prodDelivery")
	public String prodDelivery(@RequestParam("ords_id")String ords_id) {
		
		shoppingService.deliveryUpdate(ords_id);
		
		return "redirect:/shop/shopMypage";
	}
	
	@RequestMapping("/swapUpdate")
	public String swapUpdate(@RequestParam("ords_id")String ords_id) {
		
		shoppingService.swapUpdate(ords_id);
		
		return "redirect:/shop/shopMypage";
	}
	
	@RequestMapping("/returnUpdate")
	public String returnUpdate(@RequestParam("ords_id")String ords_id) {
		
		shoppingService.returnUpdate(ords_id);
		
		return "redirect:/shop/shopMypage";
	}
}
