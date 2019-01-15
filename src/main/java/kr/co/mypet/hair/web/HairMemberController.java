package kr.co.mypet.hair.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.common.model.PageVo;
import kr.co.mypet.hair.model.BookmarkVo;
import kr.co.mypet.hair.model.HairBoardVo;
import kr.co.mypet.hair.model.HairPageVo;
import kr.co.mypet.hair.model.HairResVo;
import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.hair.model.PetStyleVo;
import kr.co.mypet.hair.service.HairServiceInf;

@RequestMapping("/hairMem")
@Controller
public class HairMemberController {
	
	@Resource(name="hairService")
	private HairServiceInf hairService;
	
	@RequestMapping("/myPage")
	public String mypageMain(MemberVo memVo,Model model) {
		
		String mem_id = memVo.getMem_id();
		
		//mem_id 를이용하여 진행중인 예약건을 불러온다
		List<HairResVo> hairResList = hairService.selectRev(mem_id);
		
		if(hairResList.size()!=0) {
			
			HairResVo hairResVo = new HairResVo();
			
			//list 에서 하나씩 뽑아서 미용실이름, 스타일이름, 스타일 가격을 db에서 뽑아고 그걸 다시 리스트에 set으로 교체한다
			for(int i = 0 ; i < hairResList.size() ; i++) {
				//미용실 id이용해 >> 미용실 이름구하고
				String has_name =""; 
				String has_id = hairResList.get(i).getHres_has();
				
				HairShopVo hairShopVo = hairService.selectShop(has_id);
				has_name = hairShopVo.getHas_name();
				
				// 선택한 스타일 id >> 스타일 이름 , 가격을 불러온다
				String pts_name = "";
				int pts_price = 0;
				String pts_id = hairResList.get(i).getHres_pts();
				
				PetStyleVo petStyleVo = hairService.selectStyle(pts_id);
				pts_name = petStyleVo.getPts_name();
				pts_price = petStyleVo.getPts_price();
				
				hairResVo = hairResList.get(i);
				hairResVo.setHas_name(has_name);
				hairResVo.setPts_name(pts_name);
				hairResVo.setPts_price(pts_price);
				
				//예약 시간에 따른 변환
				if(hairResVo.getHres_time().equals("1")) {hairResVo.setHres_time("8시 ~ 10시");} 
				else if(hairResVo.getHres_time().equals("2")) {hairResVo.setHres_time("10시 ~ 12시");}
				else if(hairResVo.getHres_time().equals("3")) {hairResVo.setHres_time("12시 ~ 14시");}
				else if(hairResVo.getHres_time().equals("4")) {hairResVo.setHres_time("14시 ~ 16시");}
				else if(hairResVo.getHres_time().equals("5")) {hairResVo.setHres_time("16시 ~ 18시");}
				else if(hairResVo.getHres_time().equals("6")) {hairResVo.setHres_time("18시 ~ 20시");}
				
				hairResList.set(i, hairResVo);
				
			}
			
			//예약중 리스트
			model.addAttribute("hairResList", hairResList);
			
			
		}
		//내가 했던 문의 내역 불러오기
		List<HairBoardVo> askList = new ArrayList<>();
		
		askList = hairService.selectAsk(mem_id);
		System.out.println("mem_id : " + mem_id);
		System.out.println("askList.size() : " + askList.size());
		
		HairBoardVo hbVo = new HairBoardVo();
		
		for(int i = 0 ; i < askList.size() ; i++) {
			String has_name = "";
			String has_id = askList.get(i).getHbrd_has();
			hbVo = askList.get(i);
			has_name = hairService.selectShop(has_id).getHas_name();
			hbVo.setHas_name(has_name);
			
			askList.set(i, hbVo);
			
			
		}
		
		
		//문의 내역 add
		model.addAttribute("askList", askList);
		
		return "petHair/petHairMypageMain";
	}
	
	@RequestMapping("/bookMark")
	public String bookMark(MemberVo memVo, Model model) {
		
		String mem_id = memVo.getMem_id();
		
		List<BookmarkVo> bmList = new ArrayList<>();
		bmList = hairService.selectBookMark(mem_id);
		//bookmark 조회 성공시
		if(bmList.size()!=0) {
			//리스트 사이즈만큼 이름, 주소, 상세주소 조회
			String has_id = ""; //아이디부터 받아옴
			//받아온 id를 바탕으로 해당 미용실의 정보 조회
			String has_name = "";
			String has_addr = "";
			String has_addr2 = "";
			String has_img = "";
			BookmarkVo bmVo = new BookmarkVo();
			HairShopVo hsVo = new HairShopVo();
			
			for(int i = 0 ; i < bmList.size() ; i++) {
				has_id = bmList.get(i).getBmk_has();
				hsVo = hairService.selectShop(has_id);
				has_name = hsVo.getHas_name();
				has_addr = hsVo.getHas_addr();
				has_addr2 = hsVo.getHas_addr2();
				has_img = hsVo.getHas_img();
				
				bmVo = bmList.get(i);
				bmVo.setHas_name(has_name);
				bmVo.setHas_addr(has_addr);
				bmVo.setHas_addr2(has_addr2);
				bmVo.setHas_img(has_img);
				
				bmList.set(i, bmVo);
				
			}
			
			
			
		}
		
		model.addAttribute("bmList", bmList);
		
		
		return "petHair/petHairBookMark";
	}

	
	
	@RequestMapping("/history")
	public String resHistory(MemberVo memVo,Model model,HttpServletRequest request,HairPageVo hairPageVo) {
		
		String mem_id = memVo.getMem_id();
		
		//원하는 페이지
		int page = 1;
		
		page = hairPageVo.getPage();
		
		Map<Object, Object> param = new HashMap<>();
		param.put("mem_id", mem_id);
		param.put("page", page);
		
		//총갯수
		int totalCnt = 0;
		totalCnt = hairService.revComCnt(mem_id);
		String numTemp = Integer.toString(totalCnt);
		hairPageVo.setTotalCnt(totalCnt);
		model.addAttribute("hairPageVo", hairPageVo);
		model.addAttribute("page", page);
		
		//mem_id 를이용하여 진행중인 예약건을 불러온다
		List<HairResVo> hairResList = hairService.selectRevCom(param);
		
		if(hairResList.size()!=0) {
			
			HairResVo hairResVo = new HairResVo();
			
			//list 에서 하나씩 뽑아서 미용실이름, 스타일이름, 스타일 가격을 db에서 뽑아고 그걸 다시 리스트에 set으로 교체한다
			for(int i = 0 ; i < hairResList.size() ; i++) {
				//미용실 id이용해 >> 미용실 이름구하고
				String has_name =""; 
				String has_id = hairResList.get(i).getHres_has();
				
				HairShopVo hairShopVo = hairService.selectShop(has_id);
				has_name = hairShopVo.getHas_name();
				
				// 선택한 스타일 id >> 스타일 이름 , 가격을 불러온다
				String pts_name = "";
				int pts_price = 0;
				String pts_id = hairResList.get(i).getHres_pts();
				
				PetStyleVo petStyleVo = hairService.selectStyle(pts_id);
				pts_name = petStyleVo.getPts_name();
				pts_price = petStyleVo.getPts_price();
				
				hairResVo = hairResList.get(i);
				hairResVo.setHas_name(has_name);
				hairResVo.setPts_name(pts_name);
				hairResVo.setPts_price(pts_price);
				
				//예약 시간에 따른 변환
				if(hairResVo.getHres_time().equals("1")) {hairResVo.setHres_time("8시 ~ 10시");} 
				else if(hairResVo.getHres_time().equals("2")) {hairResVo.setHres_time("10시 ~ 12시");}
				else if(hairResVo.getHres_time().equals("3")) {hairResVo.setHres_time("12시 ~ 14시");}
				else if(hairResVo.getHres_time().equals("4")) {hairResVo.setHres_time("14시 ~ 16시");}
				else if(hairResVo.getHres_time().equals("5")) {hairResVo.setHres_time("16시 ~ 18시");}
				else if(hairResVo.getHres_time().equals("6")) {hairResVo.setHres_time("18시 ~ 20시");}
				
				hairResList.set(i, hairResVo);
				
			}
			
			//예약중 리스트
			model.addAttribute("hairResList", hairResList);
			
			
		}
		
		return "petHair/petHairHistory";
//		return "redirect:temp";
	}
	
//	@RequestMapping("/temp")
//	public String tempMethod(HttpServletRequest request, Model model) {
//		
//		model.addAttribute("hairResList", request.getAttribute("hairResList"));
//		
//		return "petHair/petHairHistory";
//	}
	
	
	@RequestMapping("/insertReview")
	public String insertReview(Model model, HairBoardVo hbVo, HttpServletRequest request) {
		
		//후기글 insert
		int chk = hairService.insertReview(hbVo);
		if(chk==1) {
		} else {
		}
		
		//별점 관련
		//갯수 불러옴
		//불러올 가게 id
		String has_id = hbVo.getHbrd_has();
		//총점
		int totalScore = 0 ;
		//총갯수
		int totalCnt = 0 ; 
		
		
		Map<String, Object> scoreMap = null;
		scoreMap = hairService.getScore(has_id);
		
		int index = 0;
		for(String ob : scoreMap.keySet()) {
			HashMap<String, String> temp = (HashMap<String, String>) scoreMap.get(ob);
			for(Object tt : temp.values()) {
				String txt = String.valueOf(tt);
				
				if(index==0) {
					totalCnt = Integer.parseInt(txt);
				} else if(index==2) {
					totalScore = Integer.parseInt(txt);
				}
				
				index++;
			}
			
		}
		
		totalCnt +=1;
		totalScore += hbVo.getHbrd_score();
		
		HairShopVo hsVo = new HairShopVo();
		if(!(totalScore/totalCnt==0)) {
			hsVo.setHas_score(totalScore/totalCnt);
		} else {
			hsVo.setHas_score(3);
			
		}
		hsVo.setHas_id(has_id);
		chk = hairService.updateScore(hsVo);
		
		if(chk == 1) {
			//System.out.println("성공");
		} else {
			//System.out.println("실패");
			
		}
		
		
		
		//이전페이지 돌려보내기
		String referer = request.getHeader("Referer");
		
		
		return "redirect:"+referer;
	}
	
	
	@RequestMapping("/deleteBm")
	public String deleteBm(HttpServletRequest request,BookmarkVo bmVo,MemberVo memVo,Model model) {
		System.out.println("메서드 진입");
		String bmk_id = bmVo.getBmk_id();
		
		int chk = hairService.deleteBm(bmk_id);
		
		if(chk==1) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		
		model.addAttribute("mem_id", memVo.getMem_id());
		
		return "redirect:/hairMem/bookMark";
	}
	
	
	
	
	
	
	
	
	
	
	
} // contorller class 종료부분
