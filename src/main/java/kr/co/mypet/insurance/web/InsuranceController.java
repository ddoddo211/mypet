package kr.co.mypet.insurance.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.insurance.model.InsProdVo;
import kr.co.mypet.insurance.model.InsshoppingVo;
import kr.co.mypet.insurance.model.PageVo;
import kr.co.mypet.insurance.service.InsuranceServiceInf;

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
	public String productInfo(Model model, PageVo pageVo, HttpServletRequest request) {

		return "petInsurance/insuranceProduct";
	}

	// 보험상품 아작스 이용(리스트)
	@RequestMapping("/prodPageListAjaxHtml")
	public String prodPageListAjaxHtml(Model model, PageVo pageVo, HttpServletRequest request) {

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
	public String paginationHtml(Model model, PageVo pageVo, HttpServletRequest request) {

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
	public String prodKindPageListAjaxHtml(Model model, PageVo pageVo, HttpServletRequest request) {

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
	public String kindPaginationHtml(Model model, PageVo pageVo, HttpServletRequest request) {

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
	public String prodProductRecommendation(PageVo pageVo, HttpServletRequest request, Model model) {

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
	public String getProdRPagenation(PageVo pageVo, HttpServletRequest request, Model model) {

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
	public String productDetail(Model model, PageVo pageVo, HttpServletRequest request, HttpSession session) {

		String prodId = request.getParameter("prodId");

		// 회원 정보 받아오는 부분
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");

		// 펫사이즈가 0이라면 펫추가하기 화면으로 이동한다.
		if (memVo == null) {

			// 서비스 연결해서 해당 상품 정보 가지고 오기
			InsProdVo prodVo = insuranceService.getProdInfo(prodId);

			model.addAttribute("prodVo", prodVo);
			model.addAttribute("mypetSize", 0);

			return "petInsurance/insuranceProduct2";

		} else {

			List<InsshoppingVo> mypetList = insuranceService.petList(memVo.getMem_id());

			model.addAttribute("mypetSize", mypetList.size());

			// 서비스 연결해서 해당 상품 정보 가지고 오기
			InsProdVo prodVo = insuranceService.getProdInfo(prodId);
			model.addAttribute("prodVo", prodVo);

			return "petInsurance/insuranceProduct2";

		}
	}

	
// 플랜정보 추가버튼을 클릭한후 플랜정보 화면으로 이동하는 부분 	
	@RequestMapping(value="/prodAdd")
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

		// 회원의 추가된 보험상품 가지고 오기
		List<InsshoppingVo> memIsrList = insuranceService.memPlan(memVo.getMem_id());
		model.addAttribute("memIsrList", memIsrList);

		return "petInsurance/planInformation";

	}
	
	
	// 보험 메뉴에서 플랜정보 버튼을 클릭하였을때 이동하는 부분
	@RequestMapping("/planInformation")
	public String planInformation(Model model, HttpSession session) {

		// 회원 정보 받아오는 부분
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");

		// 로그인을 안한 회원일 경우에는 로그인 화면으로 이동
		if (memVo == null) {
			return "common/login";
		} else {
			// 회원의 추가된 보험상품 가지고 오기
			List<InsshoppingVo> memIsrList = insuranceService.memPlan(memVo.getMem_id());
			model.addAttribute("memIsrList", memIsrList);
			
			//회원의 펫 가지고 오기
			List<InsshoppingVo> mypetList = insuranceService.petList(memVo.getMem_id());
			model.addAttribute("mypetList", mypetList);
			
			return "petInsurance/planInformation";
		}
	}

// 펫 추가화면으로 이동 
	@RequestMapping("/petInsert")
	public String petInsert() {

		return "petInsurance/petInsert";
	}

}
