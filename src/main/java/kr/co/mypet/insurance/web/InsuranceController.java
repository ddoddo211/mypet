package kr.co.mypet.insurance.web;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import kr.co.mypet.common.model.AccountVo;
import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.common.model.PetkindVo;
import kr.co.mypet.insurance.model.AccidentVo;
import kr.co.mypet.insurance.model.InsProdVo;
import kr.co.mypet.insurance.model.InsshoppingVo;
import kr.co.mypet.insurance.model.InsuranceNoticeVo;
import kr.co.mypet.insurance.model.InsurancePageVo;
import kr.co.mypet.insurance.model.InsuranceVo;
import kr.co.mypet.insurance.service.InsuranceServiceInf;
import kr.co.mypet.util.StringUtil;

@Controller
@RequestMapping("/isr")
public class InsuranceController {

	@Resource(name = "insuranceService")
	private InsuranceServiceInf insuranceService;

	// 보험 메인으로 가는 부분
	@RequestMapping("/isrMain")
	public String MainView() {
		return "petInsurance";
	}

	// 보험 상품안내로 화면 이동하는 부분
	@RequestMapping(value = "/productInfo")
	public String productInfo(Model model, InsurancePageVo pageVo, HttpServletRequest request) {

		return "petInsurance/insuranceProduct";
	}

	// 보험상품 아작스 이용(리스트)
	@RequestMapping("/prodPageListAjaxHtml")
	public String prodPageListAjaxHtml(Model model, InsurancePageVo pageVo, HttpServletRequest request) {

		// 페이지로 만들어주기 (pageVo로 만들기)
		pageVo.setPage(Integer.parseInt(request.getParameter("page")));
		pageVo.setPageSize(Integer.parseInt(request.getParameter("pageSize")));

		// 쿼리문으로 연결하여 전달하기
		Map<String, Object> resultMap = insuranceService.prodPageList(pageVo);

		// 해당 페이지에 맞게 리스트 가지고 오기
		List<InsProdVo> pageList = (List<InsProdVo>) resultMap.get("pageList");

		int pageSize = 0;
		if (pageList.size() == 0) {
			pageSize = 0;
		} else {
			pageSize = pageList.size();
		}

		// model 객체에 저장
		model.addAttribute("pageSize", pageSize);

		// model 객체에 저장
		model.addAttribute("pageList", pageList);

		int page2 = Integer.parseInt(request.getParameter("page"));
		request.setAttribute("page", page2);

		return "petInsurance/prodPageListAjaxHtml";
	}

	// 보험상품 아작스 이용(페이징)
	@RequestMapping("/paginationHtml")
	public String paginationHtml(Model model, InsurancePageVo pageVo, HttpServletRequest request) {

		// 페이지로 만들어주기 (pageVo로 만들기)
		pageVo.setPage(Integer.parseInt(request.getParameter("page")));
		pageVo.setPageSize(Integer.parseInt(request.getParameter("pageSize")));

		// 쿼리문으로 연결하여 전달하기
		Map<String, Object> resultMap = insuranceService.prodPageList(pageVo);

		// 페이지 건수
		int pageCnt = (int) resultMap.get("pageCnt");

		if (resultMap.get("pageList") == null) {
			pageCnt = 0;
		}

		model.addAttribute("pageCnt", pageCnt);

		int page2 = Integer.parseInt(request.getParameter("page"));
		request.setAttribute("page", page2);

		model.addAttribute("pageSelect", 0);

		return "petInsurance/paginationHtml";
	}

	// 아작스 사용하여 리스트 나오게 설정하기(조회조건을 클릭하였을때 - 리스트 나오는 부분)
	@RequestMapping("/prodKindPageListAjaxHtml")
	public String prodKindPageListAjaxHtml(Model model, InsurancePageVo pageVo, HttpServletRequest request) {

		// 페이지로 만들어주기 (pageVo로 만들기)
		pageVo.setPage(Integer.parseInt(request.getParameter("page")));
		pageVo.setPageSize(Integer.parseInt(request.getParameter("pageSize")));
		pageVo.setPetKind(request.getParameter("petKind"));

		// 쿼리문으로 연결하여 전달하기
		Map<String, Object> resultMap = insuranceService.prodKindPageList(pageVo);

		// 해당 페이지에 맞게 리스트 가지고 오기
		List<InsProdVo> pageList = (List<InsProdVo>) resultMap.get("pageList");

		int pageSize = 0;
		if (pageList.size() == 0) {
			pageSize = 0;
		} else {
			pageSize = pageList.size();
		}

		// model 객체에 저장
		model.addAttribute("pageSize", pageSize);

		// model 객체에 저장
		model.addAttribute("pageList", pageList);

		// 페이지 건수
		int pageCnt = (int) resultMap.get("pageCnt");
		model.addAttribute("pageCnt", pageCnt);

		int page2 = Integer.parseInt(request.getParameter("page"));
		request.setAttribute("page", page2);

		return "petInsurance/prodPageListAjaxHtml";
	}

	// 아작스 사용하여 리스트 나오게 설정하기(조회조건을 클릭하였을때 - 페이징 나오는 부분)
	@RequestMapping("/kindPaginationHtml")
	public String kindPaginationHtml(Model model, InsurancePageVo pageVo, HttpServletRequest request) {

		// 페이지로 만들어주기 (pageVo로 만들기)
		pageVo.setPage(Integer.parseInt(request.getParameter("page")));
		pageVo.setPageSize(Integer.parseInt(request.getParameter("pageSize")));
		pageVo.setPetKind(request.getParameter("petKind"));

		// 쿼리문으로 연결하여 전달하기
		Map<String, Object> resultMap = insuranceService.prodKindPageList(pageVo);

		// 페이지 건수
		int pageCnt = (int) resultMap.get("pageCnt");

		// model 객체에 저장
		model.addAttribute("pageCnt", pageCnt);

		int page2 = Integer.parseInt(request.getParameter("page"));
		request.setAttribute("page", page2);

		model.addAttribute("pageSelect", 1);
		model.addAttribute("petKind", pageVo.getPetKind());
		model.addAttribute("pageSize", pageVo.getPageSize());

		return "petInsurance/paginationHtml";
	}

	// 우리 아이 보험 추천 부분에 나와야 하는 부분(리스트)
	@RequestMapping("/prodProductRecommendation")
	public String prodProductRecommendation(InsurancePageVo pageVo, HttpServletRequest request, Model model) {

		// 생년월일을 나이로 계산하는 작업
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
		Date date = new Date();

		String birth = request.getParameter("petBirth");

		int b = Integer.parseInt(formatter.format(date));
		int a = Integer.parseInt(birth.substring(0, 4));

		int c = b - a;

		// 값 담아주기 (종류 , 생년월일 , 질병여부 , 페이지 , 페이지 사이즈)
		pageVo.setPage(Integer.parseInt(request.getParameter("page")));
		pageVo.setPageSize(Integer.parseInt(request.getParameter("pageSize")));
		pageVo.setPetKind(request.getParameter("petKind"));
		// 문자열로 변경하기
		pageVo.setPetBirth(c + "");
		pageVo.setPetSick(request.getParameter("petSick"));

		// 쿼리문으로 연결하여 전달하기
		Map<String, Object> resultMap = insuranceService.prodProductRecommendation(pageVo);

		List<InsProdVo> pageList = (List<InsProdVo>) resultMap.get("pageList");

		int pageSize = 0;
		if (pageList.size() == 0) {
			pageSize = 0;
		} else {
			pageSize = pageList.size();
		}

		// model 객체에 저장
		model.addAttribute("pageSize", pageSize);

		// model 객체에 저장
		model.addAttribute("pageList", pageList);

		return "petInsurance/prodPageListAjaxHtml";
	}

	// 우리 아이 보험 추천 부분에 나와야 하는 부분(페이징)
	@RequestMapping("/getProdRPagenation")
	public String getProdRPagenation(InsurancePageVo pageVo, HttpServletRequest request, Model model) {

		// 생년월일을 나이로 계산하는 작업
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
		Date date = new Date();

		String birth = request.getParameter("petBirth");

		int b = Integer.parseInt(formatter.format(date));
		int a = Integer.parseInt(birth.substring(0, 4));

		int c = b - a;

		// 값 담아주기 (종류 , 생년월일 , 질병여부 , 페이지 , 페이지 사이즈)
		pageVo.setPetKind(request.getParameter("petKind"));
		// 문자열로 변경하기
		pageVo.setPetBirth(c + "");
		pageVo.setPetSick(request.getParameter("petSick"));

		// 쿼리문으로 연결하여 전달하기
		Map<String, Object> resultMap = insuranceService.prodProductRecommendation(pageVo);

		int page2 = Integer.parseInt(request.getParameter("page"));
		request.setAttribute("page", page2);

		// 페이지 건수
		int pageCnt = (int) resultMap.get("pageCnt");

		// model 객체에 저장
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("pageSelect", 2);

		model.addAttribute("petKind", pageVo.getPetKind());
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("birth", pageVo.getPetBirth());
		model.addAttribute("petSick", pageVo.getPetSick());

		return "petInsurance/paginationHtml";
	}

// 보험상품 상세보기 
	/* 보험상세보기 보내는 부분 */
	@RequestMapping("/productDetail")
	public String productDetail(Model model, InsurancePageVo pageVo, HttpServletRequest request, HttpSession session , 
			InsshoppingVo insShVo) {

		String prodId = request.getParameter("prodId");

		// 회원 정보 받아오는 부분
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		// 펫사이즈가 0이라면 펫추가하기 화면으로 이동한다.
		if (memVo != null) {
			// 회원의 플랜정보부분의 추가된 상품 중복 플랜정보 추가 막기 위해서 입력 (보험상품 아이디 하고 회원 정보만 주면된다)
			insShVo = new InsshoppingVo();
			insShVo.setInssp_mem(memVo.getMem_id());
			insShVo.setInssp_insp(prodId);
			
			
			// 플랜정보에 이미 추가되어 있는 부분 확인하기(상품)
			InsshoppingVo insShList = insuranceService.insShList(insShVo);
			
			if(insShList == null) {
				model.addAttribute("insShList", 0);
			}else {
				model.addAttribute("insShList", insShList);
			}
			
		}
		// 서비스 연결해서 해당 상품 정보 가지고 오기
		InsProdVo prodVo = insuranceService.getProdInfo(prodId);
		model.addAttribute("prodVo", prodVo);
		
		return "petInsurance/insuranceProduct2";
	
	}

	
// 플랜정보 추가버튼을 클릭한후 플랜정보 화면으로 이동하는 부분 	
	@RequestMapping(value="/prodAdd", method=RequestMethod.POST)
	public String prodAdd(Model model, HttpServletRequest request, HttpSession session) {

		// 회원 정보 받아오는 부분
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");

		String prodId = request.getParameter("prodId");

		//회원의 펫 가지고 오기
		List<InsshoppingVo> mypetList = insuranceService.petList(memVo.getMem_id());
		model.addAttribute("mypetList", mypetList);
			
		InsshoppingVo isrSPVo = new InsshoppingVo();

		// 회원 아이디 , 보험상품 아이디만 넣어주면 된다
		
		isrSPVo.setInssp_insp(prodId);
		isrSPVo.setInssp_mem(memVo.getMem_id());

		// 플랜정보에 추가하기
		int result = insuranceService.planInsert(isrSPVo);


		return "redirect:/isr/goplanInformation";
	}
	
	// 보험 메뉴에서 플랜정보 버튼을 클릭하였을때 이동하는 부분
	@RequestMapping("/goplanInformation")
	public String planInformation(Model model, HttpSession session, HttpServletRequest request) {

		String joinFail = request.getParameter("joinFail");
		
		// 회원 정보 받아오는 부분
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		// 로그인을 안한 회원일 경우에는 로그인 화면으로 이동
		if (memVo == null) {
			return "petInsurance/memLoginChk";
		} else {
			// 회원의 추가된 보험상품 가지고 오기
			List<InsshoppingVo> memIsrList = insuranceService.memPlan(memVo.getMem_id());
			model.addAttribute("memIsrList", memIsrList);
			
			// 보험상품 에서 삭제 할때 for문 돌리기 위해서 플랜정보에 추가된 상품 수가 필요하기 떄문에 설정
			model.addAttribute("memIsrListSize", memIsrList.size());
			
			
			// 보험상품이 하나도 업을때 사이즈 보내주는것 (상품이 없을때 상품이 없다는 메세지 나오게 하기 위해서 설정) 
			model.addAttribute("isrListSize" , memIsrList.size());
			
			//회원의 펫 가지고 오기
			List<InsshoppingVo> mypetList = insuranceService.petList(memVo.getMem_id());
			model.addAttribute("mypetList", mypetList);
			
			// 나의 펫 에서 삭제 할때 for문 돌리기 위해서 펫의 수가 필요하기 떄문에 설정
			model.addAttribute("mypetListSize" , mypetList.size());
			
			
			//회원의 펫 가입되어 있는 현재 보험 상품 나오게 하기 
			List<InsuranceVo> mypetIsrJoin = insuranceService.petIsrAlready(memVo.getMem_id());
			model.addAttribute("mypetIsrJoin", mypetIsrJoin);
			
			
			// 보험상품 선택한 보험가입이 되어 있는지 확인하려고 for문 돌리기 위해서 필요
			model.addAttribute("mypetIsrJoinSize", mypetIsrJoin.size());
			
	
			// 회원의 펫이 없을떄 가입가능한 나의 펫 부분에 (펫이 없다는 메세지 나오게 하기 위해서 설정)
			model.addAttribute("petListSize", mypetList.size());
			model.addAttribute("joinFail", joinFail);
			
			
			return "petInsurance/planInformation";
		}
	}
	
	// 보험상품 삭제버튼을 클릭하였을때 적용되는 부분 
		@RequestMapping("/productShoppingDel")
		public String productShoppingDel( HttpServletRequest request,HttpSession session,Model model) {

			// 보험상품의 아이디를 매개변수로 담아준다
			String prodId = request.getParameter("prodId");
			
			insuranceService.insShProdDelete(prodId);
			
			// 회원 정보 받아오는 부분
			MemberVo memVo = (MemberVo) session.getAttribute("memVo");
			
			// 로그인을 안한 회원일 경우에는 로그인 화면으로 이동
			if (memVo == null) {
				return "petInsurance/memLoginChk";
			} else {
				// 회원의 추가된 보험상품 가지고 오기
				List<InsshoppingVo> memIsrList = insuranceService.memPlan(memVo.getMem_id());
				model.addAttribute("memIsrList", memIsrList);
				
				//회원의 펫 가지고 오기
				List<InsshoppingVo> mypetList = insuranceService.petList(memVo.getMem_id());
				model.addAttribute("mypetList", mypetList);
			
				return "redirect:/isr/goplanInformation";
			}
		}
		
		// 펫 삭제버튼을 클릭하였을때 적용되는 부분 
		@RequestMapping("/mypetDel")
		public String mypetDel(HttpServletRequest request,HttpSession session,Model model) {
			// 보험상품의 아이디를 매개변수로 담아준다
			String petId = request.getParameter("petId");
			
			insuranceService.mypetDel(petId);
			
			// 회원 정보 받아오는 부분
			MemberVo memVo = (MemberVo) session.getAttribute("memVo");
			
			// 로그인을 안한 회원일 경우에는 로그인 화면으로 이동
			if (memVo == null) {
				return "petInsurance/memLoginChk";
			} else {
				// 회원의 추가된 보험상품 가지고 오기
				List<InsshoppingVo> memIsrList = insuranceService.memPlan(memVo.getMem_id());
				model.addAttribute("memIsrList", memIsrList);
				
				//회원의 펫 가지고 오기
				List<InsshoppingVo> mypetList = insuranceService.petList(memVo.getMem_id());
				model.addAttribute("mypetList", mypetList);
				
				return "redirect:/isr/goplanInformation";
			}
		}

		// 펫 추가화면으로 이동 
			@RequestMapping("/petInsert")
			public String petInsert(Model model , HttpSession session) {
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				// 로그인을 안한 회원일 경우에는 로그인 화면으로 이동
				if (memVo == null) {
					return "petInsurance/memLoginChk";
				}
				return "petInsurance/petInsert";
			}
			
		// 펫 품종 ajax 처리
			@RequestMapping("/petKindHtml")
			public String petKindHtml(Model model,HttpServletRequest request) {
			
				String petKind = request.getParameter("petKind");
		
				// 펫추가 하는 화면에 펫 품종 선택할수 있게 넣어 주기
				List<PetkindVo> petKindList = insuranceService.petKindList(petKind);
				model.addAttribute("petKindList", petKindList);
				
				return "petInsurance/petKindAjaxHtml";
				
			}
			
		// 펫 추가 처리 하는 부분
			@RequestMapping("/mypetInsert")
			public String mypetInsert(@RequestPart("petImgForm")MultipartFile part,HttpSession session, Model model, HttpServletRequest request
					) throws ParseException, IOException, ServletException {
				
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				
				// 로그인을 안한 회원일 경우에는 로그인 화면으로 이동
				if (memVo == null) {
					return "petInsurance/memLoginChk";
				} else {
					// 나의 펫에 추가하려며 있어야 하는 부분 
					// myp_mem , myp_petk ,myp_birth , myp_sick ,myp_img ,myp_neu ,myp_gender,myp_name
					//	myp_id -> 시퀀스로 처리
					// mypetVo에 입력하기
					MypetVo mypetVo = new MypetVo();
					
					// 생년월일 Date 타입으로 변경하기
					String birth = request.getParameter("petBirthForm");
					SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
					Date dateBirth = date.parse(birth);

					mypetVo.setMyp_mem(memVo.getMem_id());
					mypetVo.setMyp_name(request.getParameter("petName"));
					mypetVo.setMyp_gender(request.getParameter("petGender"));
					mypetVo.setMyp_petk(request.getParameter("petKindForm"));
					mypetVo.setMyp_birth(dateBirth);
					mypetVo.setMyp_neu(request.getParameter("petNTL"));
					mypetVo.setMyp_sick(request.getParameter("petSick"));
					
					// 파일 저장되기
					
					// 실제 파일 저장될 경로 설정하기
					String path = "C:\\Users\\PC\\6.Spring\\LastProjectWorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\mypet\\img\\petimg";
					String str = part.getOriginalFilename();
					
					// 파일명 가지고 오기
					if(str == "") {
						mypetVo.setMyp_img("/img/petimg/noimg.jpg");
					}else {
						// 확장자만 빼기(확장자는 저장해줘야 한다)
						String fileExt = StringUtil.getFileExt(str);
						String fileName = UUID.randomUUID().toString() + fileExt;	// 충돌 방지를 위한 임의의 파일명 
						
						File file = new File(path + File.separator + fileName);
						
						part.transferTo(file);
						
						str = "/img/petimg/"+fileName;
						
						// DB 넣어주기
						mypetVo.setMyp_img(str);
					}
					
					insuranceService.insertPet(mypetVo);
				
					return "redirect:/isr/goplanInformation";
					
				}
				
			}
			
			// 펫 보험 가입 화면으로 이동
			@RequestMapping("/prodJoin")
			public String prodJoin(HttpSession session, Model model , HttpServletRequest request) {
				
				// 펫의 정보와 보험상품 가입조건이 맞는지 확인한다 
					//애완동물 id 전달하기
					String petId = request.getParameter("mypetId");
					
					// 보험가입할떄 이용하려고 model에 내가 선택한 애완동물 id 받기 
					model.addAttribute("petId" , petId);
					
					//보험상품 id 전달하기
					String prodJoinId = request.getParameter("prodJoinId");
					
					// 보험가입할떄 이용하려고 model에 내가 선택한 보험상품 id 받기 
					model.addAttribute("prodJoinId" , prodJoinId);
					
					// 회원 정보 받아오는 부분
					MemberVo memVo = (MemberVo) session.getAttribute("memVo");
					model.addAttribute("memVo", memVo );
				
					// 가입을 진행하고 있는 보험상품 정보 가지고 오기
					InsProdVo prodJoin = insuranceService.getProdInfo(prodJoinId);
					
					// 가입을 진행하고 있는 펫 정보 가지고 오기
					MypetVo mypetInfo = insuranceService.mypetInfo(petId);
					
					
					// 조회해온 마이펫의 품종을 준다면 그 강아지를 뽑아 올수 있어야 가입조건에 가입대상을 확인할수 있다.
					PetkindVo petkindVo = insuranceService.petKindVo(mypetInfo.getMyp_petk());
					
						// 지금 부분하고 상관은 없지만 알고 있을려고 입력해 놓은것 
						// 날짜를 구하는 부분은 parse로 이용한다
						//String birth = request.getParameter("petBirthForm");
						//Date dateBirth = date.parse(birth);
					
					// 가입대상, 가입연령 , 질병여부 맞는지 확인
					SimpleDateFormat date = new SimpleDateFormat("yyyy");
					// 현재 데이터 나오게 설정
					Date  petdate = new Date();
					
					// string으로 변경하는 부분은 format으로 이용해야 한다
					String petBirth1 = date.format(mypetInfo.getMyp_birth());
					
					// int로 변경한다.
					int petBirth = Integer.parseInt(petBirth1);
					
					// 보험상품의 최소연령
					int minage = prodJoin.getInsp_minage();
					
					// 보험상품의 최대연령
					int maxage = prodJoin.getInsp_maxage();

					// 현재일자
					int b = Integer.parseInt(date.format(petdate));
					
					// 현재 나이 구하는 부분
					int petage = b - petBirth;
					
					// 가입을 진행하고 있는 보험상품 정보 가지고 오기	
					model.addAttribute("prodJoin", prodJoin);
					// 가입을 진행하고 있는 펫 정보 가지고 오기
					model.addAttribute("mypetInfo", mypetInfo);
					
					
					// 해당 회원의 이메일(pk)로 보내서 회원의 계좌번호를 가지고 오는 방법(매개변수를 회원의 아이디로 설정한다) 
					List<AccountVo> memAccidentList = insuranceService.memAccountList(memVo.getMem_id());
					model.addAttribute("memAccidentList", memAccidentList);
					
				
					// 가입조건이 맞지 않는다면 가입이 안되는 메서드 사용 
					if(insuranceAvaliable(prodJoin.getInsp_sick(), mypetInfo.getMyp_sick(), petkindVo.getAm_name(), prodJoin.getInsp_join(), minage, maxage, petage ))	
						return "/petInsurance/prodJoin";
					else {
						model.addAttribute("joinFail" , 0);
						return "redirect:/isr/goplanInformation";
					}
					
			}
			
			// 보험상품 가입을 위한 마지막 처리 (이부분을 지나면 보험가입이 완료된다)
			@RequestMapping("/isrProdMypetJoin")
			public String isrProdMypetJoin(HttpServletRequest request) throws Exception {
				
				// 내 반려동물 id , 회원 id(이메일) , 보험상품 id ,선택한 계좌번호 변수에 담아주기
				String petId = request.getParameter("petId");
				String memId = request.getParameter("memId");
				String prodJoinId = request.getParameter("prodJoinId");
				String memAccident = request.getParameter("memAccount");
				
				// 만기일 계산하기 
				// 만기일을 계산할떄에는 현재 애완펫의 년생을 구한다 
				
					// 가입을 진행하고 있는 펫 정보 가지고 오기
					MypetVo mypetInfo = insuranceService.mypetInfo(petId);
				
					// 년도만 비교 한다
					SimpleDateFormat date = new SimpleDateFormat("yyyy");
					// 현재 데이터 나오게 설정
					Date  petdate = new Date();
					
					// string으로 변경하는 부분은 format으로 이용해야 한다
					String petInfoBirth = date.format(mypetInfo.getMyp_birth());
				
					// 애완동물의 나이(년도가 저장되어 있는 변수명)
					int petBirth1 = Integer.parseInt(petInfoBirth);
					
					// 보험상품의 보장기간 구해오기 
					// 가입을 진행하고 있는 보험상품 정보 가지고 오기
					InsProdVo prodJoin = insuranceService.getProdInfo(prodJoinId);
				
					// 보험상품 보장기간 넣어주기
					int period = prodJoin.getInsp_period();
				
					// 만기되는 일자 구하기 (년도)
					int duedateDay = petBirth1 + period;
					
						// 월을 저장하는 부분
						SimpleDateFormat month = new SimpleDateFormat("MM");
						String petInfoBirthmonth = month.format(mypetInfo.getMyp_birth());
						
						// 애완동물 월 저장되는 변수 (만기 월)
						int petBirthMonthSub = Integer.parseInt(petInfoBirthmonth);
						
						// 일을 저장하는 부분
						SimpleDateFormat day = new SimpleDateFormat("dd");
						String petInfoBirthDay = day.format(mypetInfo.getMyp_birth());
						
						// 애완동물 월 일 저장되는 변수 (만기 일)
						int petBirthDaySub = Integer.parseInt(petInfoBirthDay);
					
					// 년 / 월 / 일 모두 더해주기
					String duedate = duedateDay +"-"+petBirthMonthSub +"-" + petBirthDaySub;
					
					// DB가 DATE형 이기 때문에 DATE형으로 변경해준다
					Date prodDuedate = date.parse(duedate);
					
				// 서비스 이용하여 db 보험가입상품 테이블에 추가하기 (매개변수는 보험상품 VO로 넘겨주기)
				// 내 반려동물 id , 회원 id(이메일) , 보험상품 id, 보험만기일, 선택한 보험 상품 변수에 담아주기
				InsuranceVo isrVo = new InsuranceVo();
				
				isrVo.setMyp_id(petId);
				isrVo.setMem_id(memId);
				isrVo.setInssp_id(prodJoinId);
				isrVo.setIns_end(prodDuedate);
				isrVo.setAct_id(memAccident);
				
				// 쿼리문 이용하여 저장해주기
				insuranceService.isrProdMypetJoin(isrVo);
				
				// 플랜정보(장바구니에서 보험가입된 상품을 삭제해주는 부분)
				insuranceService.shoppingJoinProd(prodJoinId);

				return "redirect:/isr/goplanInformation";
			}
			
			
			/**
			* Method : insuranceAvaliable
			* 작성자 : Yumint
			* 변경이력 :
			* @param insp_sick
			* @param myp_sick
			* @param am_name
			* @param insp_join
			* @param minage
			* @param maxage
			* @param petage
			* @return
			* Method 설명 : 보험가입가능여부
			*/
			public boolean insuranceAvaliable(String insp_sick, String myp_sick, String am_name, String insp_join, int minage, int maxage, int petage) {
				String insuranceAvaliable ="Y";
				if(insp_sick.equals("N") &&	myp_sick.equals("Y"))
						insuranceAvaliable = "N";
				//보험가입가능
				if(insuranceAvaliable.equals("Y") &&  (am_name.equals(insp_join)) &&  (petage >= minage && petage <= maxage))
					return true;
				else
					return false;
			}
			
			
			
			
			
			
			
			// 보상안내로 화면이동 하는 컨트롤러
			@RequestMapping("/compensationGuide")
			public String compensationGuide(Model model) {
				
				// 보상안내 화면에 접속할때 공지사항은 나와야 하기 때문에 설정
				List<InsuranceNoticeVo> insNoiceList =  insuranceService.insNotice();
				
				model.addAttribute("insNoiceList" , insNoiceList);
				
				return "petInsurance/compensationGuide";
			}
			
			// 인터넷 청구 화면으로 이동하는부분
			@RequestMapping("/insuranceClaim")
			public String insuranceClaim(HttpSession session , Model model) {
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				
				// 로그인을 안한 회원일 경우에는 로그인 화면으로 이동
				if (memVo == null) {
					return "petInsurance/memLoginChk";
				} else {
					
					// 보험가입이 완료된 펫 정보 가지고 오기
					List<InsuranceVo> mypetList = insuranceService.insuredPerson(memVo.getMem_id());
					model.addAttribute("mypetList", mypetList);
					
					// 나의 펫 에서 삭제 할때 for문 돌리기 위해서 펫의 수가 필요하기 떄문에 설정
					model.addAttribute("mypetListSize" , mypetList.size());
							
					return "petInsurance/insuranceClaim";
				}
			}
			
			// 인터넷청구 (피보험자 선택한 다음페이지로 넘어가는 컨트롤러)
			@RequestMapping("/claim2")
			public String claim2(HttpServletRequest request, HttpSession session, Model model) {
				
				// 인터넷 청구 할때 피보험자 선택한후 다음페이지 넘겨 줄것을 입력한다
				String petId = request.getParameter("petId");
				
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				// 다음 화면에서 회원정보를 사용해야 하기 때문에 model에 담아주기 
				model.addAttribute("memVo" , memVo);
				
				// 객체 만들어주기
				InsuranceVo isrVo = new InsuranceVo();
				
				// 회원의 아이디와 나의 펫의 아이디 담아주기
				isrVo.setMem_id(memVo.getMem_id());
				isrVo.setMyp_id(petId);
				
				// 서비스 연결하여 해당 펫의 가입되어 있는 상품 가지고 오기 
				List<InsuranceVo> isrVoList =  insuranceService.claimPetJoinProd(isrVo);
				// 다음 화면에서 펫 보험정보를 사용해야 하기 때문에 model에 담아주기 
				model.addAttribute("isrVoList" , isrVoList);
				model.addAttribute("isrVoListSize" , isrVoList.size());
				
				// 가입을 진행하고 있는 펫 정보 가지고 오기
				MypetVo mypetInfo = insuranceService.mypetInfo(petId);
				// 가입 진행하고 있는 펫의 정보 담아주기
				model.addAttribute("mypetInfo" , mypetInfo);
				
				// 해당 회원의 이메일(pk)로 보내서 회원의 계좌번호를 가지고 오는 방법(매개변수를 회원의 아이디로 설정한다) 
				List<AccountVo> memAccidentList = insuranceService.memAccountList(memVo.getMem_id());
				model.addAttribute("memAccidentList", memAccidentList);
				
				return "petInsurance/insuranceClaim2";
			}
			
			// 보험금 청구 신청 완료되는 컨트롤러 
			@RequestMapping("/claimApply")
			public String claimApply(HttpServletRequest request , @RequestPart("diagnosis")MultipartFile part,
					@RequestPart("accidentPhoto")MultipartFile part2 , HttpSession session, Model model) throws Exception, Exception {				

				// 파라미터 가져오기 
				String selectProd = request.getParameter("selectProd");
				
				String petId = request.getParameter("petId");
				String accidentDate = request.getParameter("accidentDate");
				String accidentPlace = request.getParameter("accidentPlace");
				String accidentContent = request.getParameter("accidentContent");
				String selectAccident = request.getParameter("selectAccident");
				
				// 사고 vo에 담아주기
				//	사고일자 , 사고장소 , 사고설명 , 사고사진 , 진단서 ,이메일아이디 , 내반려동물ID , 보험ID
				AccidentVo acdVo = new AccidentVo();
				
				acdVo.setAccd_myp(petId);
				acdVo.setAccd_act(selectAccident);
				
				// String 을 Date로 변경하는 작업 
				SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
				Date accidentDay = date.parse(accidentDate);
				acdVo.setAccd_date(accidentDay);
				
				acdVo.setAccd_addr(accidentPlace);
				acdVo.setAccd_text(accidentContent);
				
				// 회원의 아이디를 매개변수로 설정한다
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				acdVo.setAccd_mem(memVo.getMem_id());
				
				acdVo.setAccd_ins(selectProd);
				
				// 사고사진 하고 진단서는 아래 부분에서 처리 
				// 파일 저장되기
				
				// 실제 파일 저장될 경로 설정하기
				String path = "C:\\Users\\PC\\6.Spring\\LastProjectWorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\mypet\\img\\petInsuranceAccident";
				// 진단서
				String str = part.getOriginalFilename();
				// 사고 사진
				String str2 = part2.getOriginalFilename();
				
				// 진단서 처리
				// 파일명 가지고 오기
				if(str == "") {
					acdVo.setAccd_recp("/img/petimg/noimg.jpg");
				}else {
					// 확장자만 빼기(확장자는 저장해줘야 한다)
					String fileExt = StringUtil.getFileExt(str);
					String fileName = UUID.randomUUID().toString() + fileExt;	// 충돌 방지를 위한 임의의 파일명 
					
					File file = new File(path + File.separator + fileName);
					
					part.transferTo(file);
					
					str = "/img/petInsuranceAccident/"+fileName;
					
					// DB 넣어주기
					acdVo.setAccd_recp(str);
				}
				
				// 사고 사진 처리
				// 파일명 가지고 오기
				if(str2 == "") {
					acdVo.setAccd_img("/img/petimg/noimg.jpg");
				}else {
					// 확장자만 빼기(확장자는 저장해줘야 한다)
					String fileExt = StringUtil.getFileExt(str2);
					String fileName = UUID.randomUUID().toString() + fileExt;	// 충돌 방지를 위한 임의의 파일명 
					
					File file = new File(path + File.separator + fileName);
					
					part2.transferTo(file);
					
					str2 = "/img/petInsuranceAccident/"+fileName;
					
					// DB 넣어주기
					acdVo.setAccd_img(str2);
				}
				
				// 사고 접수 하는 서비스에 전달하기 
				insuranceService.accidentInsert(acdVo);
				
				// 사고 접수 후에 마이페이지로 갔을때 있어야 하는것들 
				//회원의 펫 가지고 오기
				List<InsshoppingVo> mypetList = insuranceService.petList(memVo.getMem_id());
				model.addAttribute("mypetList", mypetList);
				
				// 나의펫 보험 화면에서 현재까지 받은 보험금 현황 부분에 나와야 하는 부분
				int isuranceStatus = insuranceService.isuranceStatus(memVo.getMem_id());
				model.addAttribute("money",isuranceStatus );
				
				// 월 전체 보험료가 나오는 부분
				int monthlyPremium = insuranceService.monthlyPremium(memVo.getMem_id());
				model.addAttribute("money2",monthlyPremium);
				
				// 현재 보험금 신청현황(신청)- 신청 건수가 나와야 하기 때문에
				List<AccidentVo> isrApply =  insuranceService.isrApply(memVo.getMem_id());
				model.addAttribute("isrApplySize",isrApply.size());
				
				// 현재 보험금 신청현황(심사중)- 심사중 건수가 나와야 하기 때문에
				List<AccidentVo> underExamination =  insuranceService.underExamination(memVo.getMem_id());
				model.addAttribute("ueSize",underExamination.size());
				
				// 현재 보험금 신청현황(완료)- 완료 건수가 나와야 하기 때문에
				List<AccidentVo> isrComplete =  insuranceService.isrComplete(memVo.getMem_id());
				model.addAttribute("isrCompleteSize",isrComplete.size());

				return "petInsurance/myPetInsurance";
			}
			
			
			
			// 나의 펫 보험 화면으로 이동
			@RequestMapping("/mypetPage")
			public String mypetPage(Model model, HttpSession session) {
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				
				// 로그인을 안한 회원일 경우에는 로그인 화면으로 이동
				if (memVo == null) {
					return "petInsurance/memLoginChk";
				} else {
					//회원의 펫 가지고 오기
					List<InsshoppingVo> mypetList = insuranceService.petList(memVo.getMem_id());
					model.addAttribute("mypetList", mypetList);
					
					// 나의펫 보험 화면에서 현재까지 받은 보험금 현황 부분에 나와야 하는 부분
					int isuranceStatus = insuranceService.isuranceStatus(memVo.getMem_id());
					model.addAttribute("money",isuranceStatus );
					
					// 월 전체 보험료가 나오는 부분
					int monthlyPremium = insuranceService.monthlyPremium(memVo.getMem_id());
					model.addAttribute("money2",monthlyPremium);
					
					// 현재 보험금 신청현황(신청)- 신청 건수가 나와야 하기 때문에
					List<AccidentVo> isrApply =  insuranceService.isrApply(memVo.getMem_id());
					model.addAttribute("isrApplySize",isrApply.size());
					
					// 현재 보험금 신청현황(심사중)- 심사중 건수가 나와야 하기 때문에
					List<AccidentVo> underExamination =  insuranceService.underExamination(memVo.getMem_id());
					model.addAttribute("ueSize",underExamination.size());
					
					// 현재 보험금 신청현황(완료)- 완료 건수가 나와야 하기 때문에
					List<AccidentVo> isrComplete =  insuranceService.isrComplete(memVo.getMem_id());
					model.addAttribute("isrCompleteSize",isrComplete.size());
					
					return "petInsurance/myPetInsurance";
				}				
			}
			
			// 나의 펫 보험에서 펫 추가하는 화면으로 이동하기
			@RequestMapping("/petInsert2")
			public String petInsert2(HttpSession session) {
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				// 로그인을 안한 회원일 경우에는 로그인 화면으로 이동
				if (memVo == null) {
					return "petInsurance/memLoginChk";
				}
				return "petInsurance/petInsert2";
			}
			
			// 펫 추가 처리 하는 부분
			@RequestMapping("/mypetInsert2")
			public String mypetInsert2(@RequestPart("petImgForm")MultipartFile part,HttpSession session, Model model, HttpServletRequest request
					) throws ParseException, IOException, ServletException {
				
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				
				// 로그인을 안한 회원일 경우에는 로그인 화면으로 이동
				if (memVo == null) {
					return "petInsurance/memLoginChk";
				} else {
					// 나의 펫에 추가하려며 있어야 하는 부분 
					// myp_mem , myp_petk ,myp_birth , myp_sick ,myp_img ,myp_neu ,myp_gender,myp_name
					//	myp_id -> 시퀀스로 처리
					// mypetVo에 입력하기
					MypetVo mypetVo = new MypetVo();
					
					// 생년월일 Date 타입으로 변경하기
					String birth = request.getParameter("petBirthForm");
					SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
					Date dateBirth = date.parse(birth);

					mypetVo.setMyp_mem(memVo.getMem_id());
					mypetVo.setMyp_name(request.getParameter("petName"));
					mypetVo.setMyp_gender(request.getParameter("petGender"));
					mypetVo.setMyp_petk(request.getParameter("petKindForm"));
					mypetVo.setMyp_birth(dateBirth);
					mypetVo.setMyp_neu(request.getParameter("petNTL"));
					mypetVo.setMyp_sick(request.getParameter("petSick"));
					
					// 파일 저장되기
					
					// 실제 파일 저장될 경로 설정하기
					String path = "C:\\Users\\PC\\6.Spring\\LastProjectWorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\mypet\\img\\petimg";
					String str = part.getOriginalFilename();
					
					// 파일명 가지고 오기
					if(str == "") {
						mypetVo.setMyp_img("/img/petimg/noimg.jpg");
					}else {
						// 확장자만 빼기(확장자는 저장해줘야 한다)
						String fileExt = StringUtil.getFileExt(str);
						String fileName = UUID.randomUUID().toString() + fileExt;	// 충돌 방지를 위한 임의의 파일명 
						
						File file = new File(path + File.separator + fileName);
						
						part.transferTo(file);
						
						str = "/img/petimg/"+fileName;
						
						// DB 넣어주기
						mypetVo.setMyp_img(str);
					}
					
					//회원의 펫 가지고 오기
					List<InsshoppingVo> mypetList = insuranceService.petList(memVo.getMem_id());
					model.addAttribute("mypetList", mypetList);
										
					// 나의 펫 에서 삭제 할때 for문 돌리기 위해서 펫의 수가 필요하기 떄문에 설정
					model.addAttribute("mypetListSize" , mypetList.size());
					
					//회원의 펫 가입되어 있는 현재 보험 상품 나오게 하기 
					List<InsuranceVo> mypetIsrJoin = insuranceService.petIsrAlready(memVo.getMem_id());
					model.addAttribute("mypetIsrJoin", mypetIsrJoin);
					
					
					// 보험상품 선택한 보험가입이 되어 있는지 확인하려고 for문 돌리기 위해서 필요
					model.addAttribute("mypetIsrJoinSize", mypetIsrJoin.size());
					
					insuranceService.insertPet(mypetVo);
				
					return "redirect:/isr/mypetPage";
					
				}
				
			}
			
			// 나의 펫 정보 처음 시작할때 안내 글 나오게 설정하는것 
			@RequestMapping("/petInfoFormAjaxHtml")
			public String petInfoFormAjaxHtml() {
				return "petInsurance/petInfoFormAjaxHtml";
				
			}
			
			// 나의 펫 정보에서 펫보이게 설정한후 해당 petId 받아서 나오게 설정하기 
			@RequestMapping("/petInfoAjaxHtml")
			public String petInfoAjaxHtml(HttpServletRequest request , Model model , @RequestParam("petId")String petId,
					HttpSession session) {
				
				// 펫의 정보 가지고 오기 
				MypetVo mypetInfo = insuranceService.mypetInfo(petId);
				model.addAttribute("mypetInfo" , mypetInfo);
				
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				
				// 객체 만들어주기
				InsuranceVo isrVo = new InsuranceVo();
				
				// 펫의 가입되어 있는 보험 상품 나오게 설정하기
				//claimPetJoinProd -> 펫의 id(myp_id) , 회원의 id(mem_id)
				isrVo.setMem_id(memVo.getMem_id());
				isrVo.setMyp_id(petId);
				
				List<InsuranceVo> isrVoList =  insuranceService.claimPetJoinProd1(isrVo);
				// 다음 화면에서 펫 보험정보를 사용해야 하기 때문에 model에 담아주기 
				model.addAttribute("isrVoList" , isrVoList);
				model.addAttribute("isrVoListSize" , isrVoList.size());
				
				// 해당 펫이 해지한 보험가입 내역 나오게 설정
				List<InsuranceVo> isrVoList2 =  insuranceService.claimPetJoinProd2(isrVo);
				// 다음 화면에서 펫 보험정보를 사용해야 하기 때문에 model에 담아주기 
				model.addAttribute("isrVoList2" , isrVoList2);
				model.addAttribute("isrVoList2Size" , isrVoList2.size());
				
				//펫 삭제할떄 보험금 청구 신청 건이 있을때 삭제 못하도록 하는것
				List<AccidentVo> acVo = insuranceService.petDelCondition(petId);
				model.addAttribute("acVoSize",acVo.size());
				
				return "petInsurance/petInfoAjaxHtml";
				
			}		
			
			// 나의 펫 보험에서 - 펫 삭제버튼을 클릭하였을때 적용되는 부분 
			@RequestMapping("/mypageMypetDel")
			public String mypageMypetDel(HttpServletRequest request,HttpSession session,Model model) {
				// 보험상품의 아이디를 매개변수로 담아준다
				String petId = request.getParameter("mypetId");
				
				insuranceService.mypetDel(petId);
				
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				
					//회원의 펫 가지고 오기
					List<InsshoppingVo> mypetList = insuranceService.petList(memVo.getMem_id());
					model.addAttribute("mypetList", mypetList);
					
					// 나의펫 보험 화면에서 현재까지 받은 보험금 현황 부분에 나와야 하는 부분
					int isuranceStatus = insuranceService.isuranceStatus(memVo.getMem_id());
					model.addAttribute("money",isuranceStatus );
					
					// 월 전체 보험료가 나오는 부분
					int monthlyPremium = insuranceService.monthlyPremium(memVo.getMem_id());
					model.addAttribute("money2",monthlyPremium);
					
					// 현재 보험금 신청현황(신청)- 신청 건수가 나와야 하기 때문에
					List<AccidentVo> isrApply =  insuranceService.isrApply(memVo.getMem_id());
					model.addAttribute("isrApplySize",isrApply.size());
					
					// 현재 보험금 신청현황(반려)- 반려 건수가 나와야 하기 때문에
					List<AccidentVo> underExamination =  insuranceService.underExamination(memVo.getMem_id());
					model.addAttribute("ueSize",underExamination.size());
					
					// 현재 보험금 신청현황(완료)- 완료 건수가 나와야 하기 때문에
					List<AccidentVo> isrComplete =  insuranceService.isrComplete(memVo.getMem_id());
					model.addAttribute("isrCompleteSize",isrComplete.size());
					
					return "petInsurance/myPetInsurance";		
					
			
			}
			
			// 나의 펫 정보에서 선택한 펫의 정보 수정하는 화면으로 보내기 
			@RequestMapping("/petInfoUpdateAjaxHtml")
			public String petInfoUpdateAjaxHtml(HttpServletRequest request , Model model , 
												@RequestParam("petId")String petId) {
				
				// 펫의 정보 가지고 오기 
				MypetVo mypetInfo = insuranceService.mypetInfo(petId);
				model.addAttribute("mypetInfo" , mypetInfo);
				
				// 해당 펫의 이미를 표시하기 위해 필요 
				model.addAttribute("petImg" , mypetInfo.getMyp_img());
				
				// 생년월일 미리 표시하게 필요하기 때문에 설정
				model.addAttribute("petBirth" , mypetInfo.getMyp_birth());
				
				// 성별 미리 표시하기 위해 필요 
				model.addAttribute("petGender" , mypetInfo.getMyp_gender());
				
				// 질별여부 미리 표시하기 위해 필요 
				model.addAttribute("petSick" , mypetInfo.getMyp_sick());
				
				// 중성화 여부 미리 표시하기 위해 필요 
				model.addAttribute("petNeu" , mypetInfo.getMyp_neu());
				
				return "petInsurance/petInfoUpdateAjaxHtml";
				
			}	
			
			// 나의 펫 정보 수정에 해당 내용을 수정하는 쿼리문에 넣어 주는 부분
			@RequestMapping("/mypetInfoUpdateS")
			public String mypetInfoUpdateS(HttpServletRequest request,HttpSession session,Model model,
					@RequestPart("petImg")MultipartFile part) throws Exception {
				
				String petPreImg = request.getParameter("petPreImg");
				
				String petId = request.getParameter("petId");
				String petName = request.getParameter("petName");
				String petBirth = request.getParameter("petBirthSelect");
				String petGender = request.getParameter("petGender");
				String petSick = request.getParameter("petSick");
				String petNeu = request.getParameter("petNeutralization");
				
				// 객체 만들기
				MypetVo petVo = new MypetVo();
				
				// 생년월일 Date 타입으로 변경하기
				SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
				Date petBirthUpdate = date.parse(petBirth);
				
				// 수정할수 있는 부분 펫 이름 , 생년월일 , 성별 , 질병여부 , 중성화 여부 
				petVo.setMyp_id(petId);
				petVo.setMyp_name(petName);
				petVo.setMyp_birth(petBirthUpdate);
				petVo.setMyp_gender(petGender);
				petVo.setMyp_sick(petSick);
				petVo.setMyp_neu(petNeu);
				
				
				// 나의펫의 이미지 경로 저장
				// 실제 파일 저장될 경로 설정하기
				String path = "C:\\Users\\PC\\6.Spring\\LastProjectWorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\mypet\\img\\petimg";
				// 진단서
				String str = part.getOriginalFilename();
				
				// 진단서 처리
				// 파일명 가지고 오기
				
				// 파일명 가지고 오기
				if(str == "") {
					petVo.setMyp_img(petPreImg);
				}else {
					// 확장자만 빼기(확장자는 저장해줘야 한다)
					String fileExt = StringUtil.getFileExt(str);
					String fileName = UUID.randomUUID().toString() + fileExt;	// 충돌 방지를 위한 임의의 파일명 
					
					File file = new File(path + File.separator + fileName);
					
					part.transferTo(file);
					
					str = "/img/petimg/"+fileName;
	
					// DB 넣어주기
					petVo.setMyp_img(str);
					
				
				}
				// 서비스 연결하기
				insuranceService.mypetInfoUpdate(petVo);
				
				// 다시 화면으로 접속되었을떄 뿌려줘야 이전 자료를 뿌려줘야 하기 때문에 설정
				model.addAttribute("petId" , petId);
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				
					//회원의 펫 가지고 오기
					List<InsshoppingVo> mypetList = insuranceService.petList(memVo.getMem_id());
					model.addAttribute("mypetList", mypetList);
					
					// 나의펫 보험 화면에서 현재까지 받은 보험금 현황 부분에 나와야 하는 부분
					int isuranceStatus = insuranceService.isuranceStatus(memVo.getMem_id());
					model.addAttribute("money",isuranceStatus );
					
					// 월 전체 보험료가 나오는 부분
					int monthlyPremium = insuranceService.monthlyPremium(memVo.getMem_id());
					model.addAttribute("money2",monthlyPremium);
					
					// 현재 보험금 신청현황(신청)- 신청 건수가 나와야 하기 때문에
					List<AccidentVo> isrApply =  insuranceService.isrApply(memVo.getMem_id());
					model.addAttribute("isrApplySize",isrApply.size());
					
					// 현재 보험금 신청현황(반려)- 반려 건수가 나와야 하기 때문에
					List<AccidentVo> underExamination =  insuranceService.underExamination(memVo.getMem_id());
					model.addAttribute("ueSize",underExamination.size());
					
					// 현재 보험금 신청현황(완료)- 완료 건수가 나와야 하기 때문에
					List<AccidentVo> isrComplete =  insuranceService.isrComplete(memVo.getMem_id());
					model.addAttribute("isrCompleteSize",isrComplete.size());
				
				return "petInsurance/myPetInsurance";
			}
			
			// 보험금 신청현황 부분에서 신청 화면으로 이동하는 부분
			@RequestMapping("/goisrApply")
			public String goisrApply(Model model ,HttpSession session) {
				
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				
				// 현재 보험금 신청현황(신청)- 신청 건수가 나와야 하기 때문에
				List<AccidentVo> isrApply =  insuranceService.isrApply(memVo.getMem_id());
				model.addAttribute("isrApply",isrApply);
				
				// 만약 0건일때 나와야 하는 화면때문에 설정 
				model.addAttribute("isrApplySize",isrApply.size());
				
				return "petInsurance/isrApply";
			}
			
			// 보험금 신청 현황 - 신청 화면에서 보험금 신청 취소를 클릭하였을떄 적용되는 부분
			@RequestMapping("/goisrApplyDel")
			public String goisrApplyDel(Model model ,HttpSession session,HttpServletRequest request) {
				
				// 삭제되는 쿼리문 들어가는부분 (사고 pk를 매개변수로 설정하기)
				String accd_id = request.getParameter("accd_id");
				insuranceService.goAccidentDel(accd_id);
				
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				
				// 현재 보험금 신청현황(신청)- 신청 리스트가 나와야 하기 때문에
				List<AccidentVo> isrApply =  insuranceService.isrApply(memVo.getMem_id());
				model.addAttribute("isrApply",isrApply);
				
				// 만약 0건일때 나와야 하는 화면때문에 설정 
				model.addAttribute("isrApplySize",isrApply.size());
				
				return "petInsurance/isrApply";
			}
			
			// 보험금 신청현황 부분에서 반려 화면으로 이동하는 부분
			@RequestMapping("/gocompanion")
			public String gocompanion(Model model ,HttpSession session) {
				
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				
				// 현재 보험금 신청현황(신청)- 신청 건수가 나와야 하기 때문에
				List<AccidentVo> companion =  insuranceService.underExamination(memVo.getMem_id());
				model.addAttribute("companion",companion);
				
				// 만약 0건일때 나와야 하는 화면때문에 설정 
				model.addAttribute("companionSize",companion.size());
				
				return "petInsurance/companion";
			}
			
			// 보험금 신청현황 부분에서 심사완료 화면으로 이동하는 부분
			@RequestMapping("/gocompleted")
			public String gocompleted(Model model ,HttpSession session) {
				
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				
				// 현재 보험금 신청현황(신청)- 신청 건수가 나와야 하기 때문에
				List<AccidentVo> completed =  insuranceService.isrComplete(memVo.getMem_id());
				model.addAttribute("completed",completed);
				
				// 만약 0건일때 나와야 하는 화면때문에 설정 
				model.addAttribute("completedSize",completed.size());
				
				return "petInsurance/completed";
			}
			
			// 보험금 내역 확인 버튼을 클릭하였을떄 작동하는 부분 
			@RequestMapping("/gohistory")
			public String gohistory(Model model ,HttpSession session,HttpServletRequest request) {
				
				String accd_id = request.getParameter("accd_id2");
				
				// 현재 보험금 신청현황(신청)- 신청 건수가 나와야 하기 때문에
				AccidentVo history =  insuranceService.history(accd_id);
				model.addAttribute("history",history);
				
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				// 해당 회원의 이메일(pk)로 보내서 회원의 계좌번호를 가지고 오는 방법(매개변수를 회원의 아이디로 설정한다) 
				List<AccountVo> memAccidentList = insuranceService.memAccountList(memVo.getMem_id());
				model.addAttribute("memAccidentList", memAccidentList);
								
				return "petInsurance/history";
			}
			
			// 보험금내역 부분에서 계좌번호를 변경하였을떄 실행 
			@RequestMapping("/accountChange")
			public String accountChange(Model model ,HttpSession session,HttpServletRequest request) {
				
				//계좌번호 받아온 부분
				String accd_act = request.getParameter("selectAc");
				
				// 다시 보험금 청구 내역 확인화면으로 접속해야 하기 때문에 설정 
				String accd_id = request.getParameter("accd_id");
				
				AccidentVo acdVo = new AccidentVo();
				acdVo.setAccd_act(accd_act);
				acdVo.setAccd_id(accd_id);
				
				// 계좌번호 변경하는 쿼리문 전달 
				insuranceService.accountChange(acdVo);
				
				// 현재 보험금 신청현황(신청)- 신청 건수가 나와야 하기 때문에
				AccidentVo history =  insuranceService.history(accd_id);
				model.addAttribute("history",history);
				
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				// 해당 회원의 이메일(pk)로 보내서 회원의 계좌번호를 가지고 오는 방법(매개변수를 회원의 아이디로 설정한다) 
				List<AccountVo> memAccidentList = insuranceService.memAccountList(memVo.getMem_id());
				model.addAttribute("memAccidentList", memAccidentList);
								
				return "petInsurance/history";
			}	
			
			// 보험금 내역 확인 버튼을 클릭하였을떄 작동하는 부분 
			@RequestMapping("/gohistory2")
			public String gohistory2(Model model ,HttpSession session,HttpServletRequest request) {
				
				String accd_id = request.getParameter("accd_id");
				
				// 현재 보험금 신청현황(반려)
				AccidentVo history =  insuranceService.history(accd_id);
				model.addAttribute("history",history);
				
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				// 해당 회원의 이메일(pk)로 보내서 회원의 계좌번호를 가지고 오는 방법(매개변수를 회원의 아이디로 설정한다) 
				List<AccountVo> memAccidentList = insuranceService.memAccountList(memVo.getMem_id());
				model.addAttribute("memAccidentList", memAccidentList);
				
				return "petInsurance/history2";
			}
			
			// 보험금 내역 확인 버튼을 클릭하였을떄 작동하는 부분 
			@RequestMapping("/gohistory3")
			public String gohistory3(Model model ,HttpSession session,HttpServletRequest request) {
				
				String accd_id = request.getParameter("accd_id");
				
				// 현재 보험금 신청현황(반려)
				AccidentVo history =  insuranceService.history(accd_id);
				model.addAttribute("history",history);
				
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				// 해당 회원의 이메일(pk)로 보내서 회원의 계좌번호를 가지고 오는 방법(매개변수를 회원의 아이디로 설정한다) 
				List<AccountVo> memAccidentList = insuranceService.memAccountList(memVo.getMem_id());
				model.addAttribute("memAccidentList", memAccidentList);
				
				return "petInsurance/history3";
			}
			
			// 나의 펫 보험 - 해당 펫에 가입되어 있는 보험 삭제 하는 부분(실제로 데이터를 삭제하지 않고 해지여부에 Y로 변경하는 작업)
			@RequestMapping("/mypetIsrDel")
			public String mypetIsrDel(Model model ,HttpSession session,HttpServletRequest request) {
				
				// 펫 보험 가입상품 체크박스 pk 담아준것
				String ins_id = request.getParameter("petProdSelect");
				
				// 다시 화면으로 접속되었을떄 뿌려줘야 이전 자료를 뿌려줘야 하기 때문에 설정
				String petId = request.getParameter("petId");
				model.addAttribute("petId" , petId);
				
				//  해당 펫에 가입되어 있는 보험 삭제 하는 부분(매개변수 보험가입상품 id)
				insuranceService.mypetIsrDel(ins_id);
								
				// 회원 정보 받아오는 부분
				MemberVo memVo = (MemberVo) session.getAttribute("memVo");
				
					//회원의 펫 가지고 오기
					List<InsshoppingVo> mypetList = insuranceService.petList(memVo.getMem_id());
					model.addAttribute("mypetList", mypetList);
					
					// 나의펫 보험 화면에서 현재까지 받은 보험금 현황 부분에 나와야 하는 부분
					int isuranceStatus = insuranceService.isuranceStatus(memVo.getMem_id());
					model.addAttribute("money",isuranceStatus );
					
					// 월 전체 보험료가 나오는 부분
					int monthlyPremium = insuranceService.monthlyPremium(memVo.getMem_id());
					model.addAttribute("money2",monthlyPremium);
					
					// 현재 보험금 신청현황(신청)- 신청 건수가 나와야 하기 때문에
					List<AccidentVo> isrApply =  insuranceService.isrApply(memVo.getMem_id());
					model.addAttribute("isrApplySize",isrApply.size());
					
					// 현재 보험금 신청현황(반려)- 반려 건수가 나와야 하기 때문에
					List<AccidentVo> underExamination =  insuranceService.underExamination(memVo.getMem_id());
					model.addAttribute("ueSize",underExamination.size());
					
					// 현재 보험금 신청현황(완료)- 완료 건수가 나와야 하기 때문에
					List<AccidentVo> isrComplete =  insuranceService.isrComplete(memVo.getMem_id());
					model.addAttribute("isrCompleteSize",isrComplete.size());
					
				return "petInsurance/myPetInsurance";
				
			}
			
			

}
