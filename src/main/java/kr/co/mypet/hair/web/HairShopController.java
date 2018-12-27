package kr.co.mypet.hair.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mypet.hair.model.BookmarkVo;
import kr.co.mypet.hair.model.HairBoardVo;
import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.hair.model.PetStyleVo;
import kr.co.mypet.hair.service.HairServiceInf;
import kr.co.mypet.sitter.model.ZipVo;

@RequestMapping("/hair")
@Controller
public class HairShopController {
	
	@Resource(name="hairService")
	private HairServiceInf hairService;
	
	//펫헤어 메인화면 이동 메서드
	//메인화면 진입시 지역선택 option 창을 db데이터로 채운다
	@RequestMapping("/hairMain")
	public String hairMain(Model model) {
	
		//주소 대분류 list
		List<ZipVo> zipHighList = hairService.selectZipHigh();
		
		//모든 hairshoplist
		List<HairShopVo> hairShopList = hairService.selectHairShopAll();
		
		model.addAttribute("zipHighList", zipHighList);
		model.addAttribute("hairShopList", hairShopList);
		
		return "petHair/petHairMain";
		
	}
	
	//main 화면에서 리스트 조회를 위한 주소 대분류 >> 주소소분류 리스트 불러오는 메서드
	@RequestMapping("/selectLow")
	public String selectLow(Model model, ZipVo zipVo) {
		
		//주소 대분류 list
		List<ZipVo> zipHighList = hairService.selectZipHigh();
		
		model.addAttribute("zipHighList", zipHighList);
		
		//주소 소분류 list, 방금 선택한 대분류를 model로 넘김
		List<ZipVo> zipLowList = null;
		if(!zipVo.getZip_high().equals("")) {
			zipLowList = hairService.selectZipLow(zipVo.getZip_high());
			model.addAttribute("zipLowList", zipLowList);
			model.addAttribute("zip_high", zipVo.getZip_high());
		}
		
		//선택한 대분류로 검색한 미용실 목록
		String zip_high = zipVo.getZip_high().replace("특별시", "");
		zip_high = zip_high.replace("광역시", "");
		System.out.println(zip_high);
		List<HairShopVo> hairShopList = hairService.selectHairShopLoc(zip_high);
		
		model.addAttribute("hairShopList", hairShopList);
		
		return "petHair/petHairMain";
	}
	
	//select shop 주소 소분류 선택 후 해당 소분류의 미용실 리스트를 불러오는 메서드
	@RequestMapping("/selectShop")
	public String selectShop(Model model, ZipVo zipVo) {
		
		//주소 대분류 list
		List<ZipVo> zipHighList = hairService.selectZipHigh();
		
		model.addAttribute("zipHighList", zipHighList);
		
		//주소 소분류 list, 방금 선택한 대분류를 model로 넘김
		List<ZipVo> zipLowList = null;
		if(!zipVo.getZip_high().equals("")) {
			zipLowList = hairService.selectZipLow(zipVo.getZip_high());
			model.addAttribute("zipLowList", zipLowList);
			model.addAttribute("zip_high", zipVo.getZip_high());
			model.addAttribute("zip_low", zipVo.getZip_low());
		}
		
		//선택한 대분류로 검색한 미용실 목록
		String zip = zipVo.getZip_high().replace("특별시", " ")+zipVo.getZip_low();
		zip = zip.replace("광역시", " ");
//		System.out.println(zip);
		List<HairShopVo> hairShopList = hairService.selectHairShopLoc(zip);
		
		model.addAttribute("hairShopList", hairShopList);
		
		return "petHair/petHairMain";
	}
	
	//미용실의 목록에서 미용실프로필을 클릭했을떄 상세정보를 표시하는 method
	@RequestMapping("/shopDetail")
	public String shopDetail(Model model, ZipVo zipVo, HairShopVo hairShopVo, HttpServletRequest request) {
		
		//주소 대분류 list
				List<ZipVo> zipHighList = hairService.selectZipHigh();
				
				model.addAttribute("zipHighList", zipHighList);
				
				//주소 소분류 list, 방금 선택한 대분류를 model로 넘김
				List<ZipVo> zipLowList = null;
				if(!zipVo.getZip_high().equals("")) {
					zipLowList = hairService.selectZipLow(zipVo.getZip_high());
					model.addAttribute("zipLowList", zipLowList);
					model.addAttribute("zip_high", zipVo.getZip_high());
					model.addAttribute("zip_low", zipVo.getZip_low());
				}
				
				//선택한 대분류로 검색한 미용실 목록
				String zip = zipVo.getZip_high().replace("특별시", " ")+zipVo.getZip_low();
				zip = zip.replace("광역시", " ");
				System.out.println(zip);
				List<HairShopVo> hairShopList = hairService.selectHairShopLoc(zip);
				
				model.addAttribute("hairShopList", hairShopList);
				
				//받아온 has_id 를 이용해 특정 미용실의 정보 조회
				hairShopVo = hairService.selectShop(hairShopVo.getHas_id());
				model.addAttribute("hairShopVo", hairShopVo);
				
				//has_id 를 이용해 review 조회
				List<HairBoardVo> reviewList = hairService.selectReview(hairShopVo.getHas_id());
				if(reviewList!=null) {
					model.addAttribute("reviewList", reviewList);
				}
				
				//style list
				List<PetStyleVo> styleList = hairService.selectStyleList(hairShopVo.getHas_id());
				if(styleList != null) {
					model.addAttribute("styleList", styleList);
				}
				
				String mem_id = "";
				if(request.getParameter("bmid")!=null) {
					if(!request.getParameter("bmid").equals("no")) {
						mem_id=request.getParameter("bmid");
					}
					
				}
				
				//북마크에 이미있는지 중복체크 해야됨
				
				
				//bookmark 여부 확인
				String bmChk = request.getParameter("bmChk");
				if(bmChk.equals("yes")) {
					//yes 일경우 북마크 등록 실행
					BookmarkVo bmVo = new BookmarkVo();
					bmVo.setBmk_has(hairShopVo.getHas_id());
					bmVo.setBmk_mem(mem_id);
					bmVo.setBmk_fac("");
					int chk = hairService.insertBookMark(bmVo);
					
				}
		
		
		
		return "petHair/petHairMain";
	}
	
	@RequestMapping("/askShop")
	public String askShop(Model model, ZipVo zipVo, HairShopVo hairShopVo, HairBoardVo hairBoardVo) {
		
		//주소 대분류 list
		List<ZipVo> zipHighList = hairService.selectZipHigh();
		
		model.addAttribute("zipHighList", zipHighList);
		
		//주소 소분류 list, 방금 선택한 대분류를 model로 넘김
		List<ZipVo> zipLowList = null;
		if(!zipVo.getZip_high().equals("")) {
			zipLowList = hairService.selectZipLow(zipVo.getZip_high());
			model.addAttribute("zipLowList", zipLowList);
			model.addAttribute("zip_high", zipVo.getZip_high());
			model.addAttribute("zip_low", zipVo.getZip_low());
		}
		
		//선택한 대분류로 검색한 미용실 목록
		String zip = zipVo.getZip_high().replace("특별시", " ")+zipVo.getZip_low();
		zip = zip.replace("광역시", " ");
		System.out.println(zip);
		List<HairShopVo> hairShopList = hairService.selectHairShopLoc(zip);
		
		model.addAttribute("hairShopList", hairShopList);
		
		//받아온 has_id 를 이용해 특정 미용실의 정보 조회
		hairShopVo = hairService.selectShop(hairShopVo.getHas_id());
		model.addAttribute("hairShopVo", hairShopVo);
		
		//has_id 를 이용해 review 조회
		List<HairBoardVo> reviewList = hairService.selectReview(hairShopVo.getHas_id());
		if(reviewList!=null) {
			model.addAttribute("reviewList", reviewList);
		}
		
		//style list
		List<PetStyleVo> styleList = hairService.selectStyleList(hairShopVo.getHas_id());
		if(styleList != null) {
			model.addAttribute("styleList", styleList);
		}
		
		//문의사항 insert
		int cnt = hairService.insertHairBoard(hairBoardVo);
		
		
		return "petHair/petHairMain";
	}
	
	
}
