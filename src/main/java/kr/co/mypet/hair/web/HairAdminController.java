package kr.co.mypet.hair.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.hair.model.HairBoardVo;
import kr.co.mypet.hair.model.HairResVo;
import kr.co.mypet.hair.model.HairShopApplyVo;
import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.hair.model.PetStyleVo;
import kr.co.mypet.hair.service.HairServiceInf;
import kr.co.mypet.util.StringUtil;

@RequestMapping("/hairAdmin")
@Controller
public class HairAdminController {
	
	@Resource(name="hairService")
	private HairServiceInf hairService;
	
	@RequestMapping("/askList")
	public String askList(MemberVo memVo,Model model) {
		
		//로그인한 사용자의 미용실정보 가져오기
		String has_id = "";
		HairShopVo hsVo = new HairShopVo();
		
		hsVo = hairService.selectShopByMemId(memVo.getMem_id());
		has_id = hsVo.getHas_id();
		/////////////////////////////
		
		//미용실 정보를 이용하여 해당 미용실에 달려있는 문의내역 list 출력
		List<HairBoardVo> askListNA = new ArrayList<>();
		//답변 미작성 list
		askListNA = hairService.selectAskByHasIdNA(has_id);
		
		//답변 작성 list
		List<HairBoardVo> askListYA = new ArrayList<>();
		askListYA = hairService.selectAskByHasIdYA(has_id);
		
		model.addAttribute("hsVo", hsVo);
		model.addAttribute("askListNA", askListNA);
		model.addAttribute("askListYA", askListYA);
	
		
		
		return "petHair/petAdminAsk";
	}

	@RequestMapping("/insertAskR")
	public String insertAskR(HairBoardVo hbVo, Model model, MemberVo memVo) {
//		System.out.println("답변내용 : "+hbVo.getHbrd_rep());
//		System.out.println("수정할 아이디 : "+hbVo.getHbrd_id());
		int chk = hairService.insertAskR(hbVo);
		
		if(chk==1) {
//			System.out.println("성공");
		} else {
//			System.out.println("실패");
			
			
		}
		
		
		
		
		model.addAttribute("mem_id", memVo.getMem_id());
		
		return "redirect:/hairAdmin/askList";
	}
	
	@RequestMapping("/respList")
	public String respList(MemberVo memVo , Model model) {
		
		//로그인한 사용자의 미용실정보 가져오기
		String has_id = "";
		HairShopVo hsVo = new HairShopVo();
		
		hsVo = hairService.selectShopByMemId(memVo.getMem_id());
		has_id = hsVo.getHas_id();
		/////////////////////////////
		
		// 상태가 '접수중' 인 예약건수 조회
		List<HairResVo> hairResList = new ArrayList<>();
		
		hairResList = hairService.selectRespRev(has_id);
		
		
		//조회건 데이터 변환
			if(hairResList.size()!=0) {
			
				HairResVo hairResVo = new HairResVo();
				
				//list 에서 하나씩 뽑아서 미용실이름, 스타일이름, 스타일 가격을 db에서 뽑아고 그걸 다시 리스트에 set으로 교체한다
				for(int i = 0 ; i < hairResList.size() ; i++) {
				
				
				// 선택한 스타일 id >> 스타일 이름 , 가격을 불러온다
				String pts_name = "";
				int pts_price = 0;
				String pts_id = hairResList.get(i).getHres_pts();
				
				PetStyleVo petStyleVo = hairService.selectStyle(pts_id);
				pts_name = petStyleVo.getPts_name();
				pts_price = petStyleVo.getPts_price();
				
				hairResVo = hairResList.get(i);
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
			}
		
		
		
		
		model.addAttribute("has_id", has_id);
		model.addAttribute("hairResList", hairResList);
		
		
		
		return "petHair/petAdminRecp";
	}
	
	
	@RequestMapping("/updateRev")
	public String updateRev(MemberVo memVo , Model model,HairResVo hrVo, HttpServletRequest request) {
		
		//update 예약 상태 예약 특이사항
		
		int chk = hairService.updateRevStat(hrVo);
		
		model.addAttribute("mem_id", memVo.getMem_id());
		
		if(request.getParameter("ongoing")!=null) {
			return "redirect:/hairAdmin/onGoing";
		} else {
			return "redirect:/hairAdmin/respList";
			
		}
	}
	
	@RequestMapping("/onGoing")
	public String onGoing(MemberVo memVo , Model model) {
		//로그인한 사용자의 미용실정보 가져오기
				String has_id = "";
				HairShopVo hsVo = new HairShopVo();
				
				hsVo = hairService.selectShopByMemId(memVo.getMem_id());
				has_id = hsVo.getHas_id();
				/////////////////////////////
				
				// 상태가 '접수중' 인 예약건수 조회
				List<HairResVo> hairResList = new ArrayList<>();
				
				hairResList = hairService.selectOgRev(has_id);
				
				
				//조회건 데이터 변환
					if(hairResList.size()!=0) {
					
						HairResVo hairResVo = new HairResVo();
						
						//list 에서 하나씩 뽑아서 미용실이름, 스타일이름, 스타일 가격을 db에서 뽑아고 그걸 다시 리스트에 set으로 교체한다
						for(int i = 0 ; i < hairResList.size() ; i++) {
						
						
						// 선택한 스타일 id >> 스타일 이름 , 가격을 불러온다
						String pts_name = "";
						int pts_price = 0;
						String pts_id = hairResList.get(i).getHres_pts();
						
						PetStyleVo petStyleVo = hairService.selectStyle(pts_id);
						pts_name = petStyleVo.getPts_name();
						pts_price = petStyleVo.getPts_price();
						
						hairResVo = hairResList.get(i);
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
					}
				
				
				
				
				model.addAttribute("has_id", has_id);
				model.addAttribute("hairResList", hairResList);
				
				
				
				return "petHair/petAdminOngoing";
	}
	
	//정보관리 페이지 이동
	@RequestMapping("/shopInfo")
	public String shopInfo(MemberVo memVo , Model model) {
		//로그인한 사용자의 미용실정보 가져오기
		String has_id = "";
		HairShopVo hsVo = new HairShopVo();
		
		hsVo = hairService.selectShopByMemId(memVo.getMem_id());
		has_id = hsVo.getHas_id();
		/////////////////////////////
		
		//해당미용실의 stylelist
		List<PetStyleVo> styleList = new ArrayList<>();
		styleList = hairService.selectStyleListAll(has_id);
		
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("hsVo", hsVo);
		
		
		return "petHair/petAdminShopInfo";
	}
	
	//미용실의 정보수정 method
	@RequestMapping("/updateShopInfo")
	public String updateShopInfo(MemberVo memVo, HairShopVo hsVo, Model model, HttpServletRequest request,@RequestPart("imgfile")MultipartFile pimg) throws IllegalStateException, IOException {
		
		//파일전송 먼저 처리
		if(request.getParameter("file_change").equals("yes")) {
			
			String path1 = request.getSession().getServletContext().getRealPath("");
			
			//파일변경이 있을경우
			//변경된 파일명을 vo에 저장하여 db로 보낸다
			String path = "/hairimg";
			if(!pimg.getOriginalFilename().equals("")) {
				String fileName = pimg.getOriginalFilename();
				String fileExt = StringUtil.getFileExt(fileName);
				String randomFileName = UUID.randomUUID().toString()+fileExt;
				File file = new File(path1+path+File.separator+randomFileName);
				pimg.transferTo(file);
				hsVo.setHas_img(randomFileName);
			}
			
			
			
		} else if(request.getParameter("file_change").equals("no")) {
			//파일 변경이 없을경우
			//기존파일명을 그대로 db로 보낸다
			
		}
		
		//정보수정
		int chk = hairService.updateShopInfo(hsVo);
		
		model.addAttribute("mem_id", memVo.getMem_id());
		return "redirect:/hairAdmin/shopInfo";
	}
	
	@RequestMapping("/updateStyle")
	public String updateStyle(MemberVo memVo, Model model, HttpServletRequest request,MultipartHttpServletRequest mtfRequest) throws IllegalStateException, IOException {
		
		//가져온 리스트의 총 갯수
		int listSize = Integer.parseInt(request.getParameter("listSize"));
		
		List<MultipartFile> filePartList = new ArrayList<>();
		//여러개의 파일을 filePartList 에 담는다
		for(int i = 0 ; i < listSize ; i++) {
			
			filePartList.add(mtfRequest.getFile("imgfile"+(i+1)));
			
		}
		
		//가져올 그외의 정보들
		PetStyleVo psVo = new PetStyleVo();
		String 	pts_id = "";
		int 	pts_price = 0;
		String 	pts_name= "";
		String 	pts_del = "";
		String  pts_img = "";
		for(int i = 0 ; i < listSize ; i++) {
			pts_id = request.getParameter("pts_id"+(i+1));   
			pts_price = Integer.parseInt(request.getParameter("pts_price"+(i+1)) ); 
			pts_name= request.getParameter("pts_name"+(i+1));  
			pts_del = request.getParameter("pts_del"+(i+1));
			pts_img = request.getParameter("pts_img"+(i+1));
			psVo.setPts_id(pts_id);
			psVo.setPts_price(pts_price);
			psVo.setPts_name(pts_name);
			psVo.setPts_del(pts_del);
			psVo.setPts_img(pts_img);
			
			//파일변경이 있었던 경우
			if(request.getParameter(pts_id+(i+1)).equals("yes")) {
				String path1 = request.getSession().getServletContext().getRealPath("");
				String path = "/hairimg";
				MultipartFile img = filePartList.get(i);
				
				String fileName = img.getOriginalFilename();
				String fileExt = StringUtil.getFileExt(fileName);
				String randomFileName = UUID.randomUUID().toString()+fileExt;
				File file = new File(path1+path+File.separator+randomFileName);
				img.transferTo(file);
				psVo.setPts_img(randomFileName);
				
			}
			
			//VO update
			int chk = hairService.updateStyle(psVo);
			
			
			
		}
		
		
		
		model.addAttribute("mem_id", memVo.getMem_id());
		return "redirect:/hairAdmin/shopInfo";
		
	}
	
	@RequestMapping("/insertStyle")
	public String insertStyle(MemberVo memVo, Model model, PetStyleVo psVo,@RequestPart("imgfile")MultipartFile pimg,HttpServletRequest request) throws IllegalStateException, IOException {
		//로그인한 사용자의 미용실정보 가져오기
		String has_id = "";
		HairShopVo hsVo = new HairShopVo();
		
		hsVo = hairService.selectShopByMemId(memVo.getMem_id());
		has_id = hsVo.getHas_id();
		/////////////////////////////
		//style Vo 에 style 소유 미용실을 입력
		psVo.setPts_has(has_id);
		
		//파일 upload 처리
		String path1 = request.getSession().getServletContext().getRealPath("");
		String path = "/hairimg";
		String fileName = pimg.getOriginalFilename();
		String fileExt = StringUtil.getFileExt(fileName);
		String randomFileName = UUID.randomUUID().toString()+fileExt;
		File file = new File(path1+path+File.separator+randomFileName);
		pimg.transferTo(file);
		psVo.setPts_img(randomFileName);
		
		
		int chk = hairService.insertStyle(psVo);
		
		
		model.addAttribute("mem_id", memVo.getMem_id());
		return "redirect:/hairAdmin/shopInfo";
	}
	
	//미용사 지원하기 화면이동
	@RequestMapping("/applyShop")
	public String applyShop(MemberVo memVo, Model model) {
		
		String mem_id = memVo.getMem_id();
		
		//지금 이미 지원중인지 확인하기
		HairShopApplyVo hsaVo = new HairShopApplyVo();
		hsaVo = hairService.selectHsaById(mem_id);
		
		if(hsaVo==null) {
			model.addAttribute("apply", "no");
		} else {
			model.addAttribute("apply", "yes");
			model.addAttribute("hsaVo", hsaVo);
		}
		
		return "petHair/applyShop";
	}
	
	//미용사 지원하기 지원버튼 클릭 후 실행 method
	@RequestMapping("/insertApplyShop")
	public String insertApplyShop(MemberVo memVo, Model model,HairShopApplyVo hsaVo,@RequestPart("imgfile")MultipartFile pimg,HttpServletRequest request) throws IllegalStateException, IOException {
		
		//파일부터 처리
		//파일 upload 처리
		String path1 = request.getSession().getServletContext().getRealPath("");
		String path = "/hairimg";
		String fileName = pimg.getOriginalFilename();
		String fileExt = StringUtil.getFileExt(fileName);
		String randomFileName = UUID.randomUUID().toString()+fileExt;
		File file = new File(path1+path+File.separator+randomFileName);
		pimg.transferTo(file);
		hsaVo.setHsa_img(randomFileName);
		
		//mem_id 새기기
		hsaVo.setHsa_mem(memVo.getMem_id());
		
		//insert
		int chk = hairService.insertHairShopApply(hsaVo);
		
		model.addAttribute("mem_id", memVo.getMem_id());
		
		return "redirect:/hairAdmin/applyShop";
	}
	
	
	
} // controller 종료


