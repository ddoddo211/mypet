package kr.co.mypet.insurance.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mypet.insurance.model.InsProdVo;
import kr.co.mypet.insurance.model.PageVo;
import kr.co.mypet.insurance.service.InsuranceServiceInf;

@Controller
@RequestMapping("/isr")
public class InsuranceController {

	@Resource(name="insuranceService")
	private InsuranceServiceInf insuranceService;
	
	// 보험 메인으로 가는 부분
	@RequestMapping("/isrMain")
	public String MainView() {
		return "petInsurance";
	}
	
	// 보험 상품안내로 화면 이동하는 부분
	@RequestMapping(value="/productInfo")
	public String productInfo(Model model, PageVo pageVo ,HttpServletRequest request) {
				
		//페이지로 만들어주기 (pageVo로 만들기)
//		pageVo.setPage(Integer.parseInt(request.getParameter("page")));
//		pageVo.setPageSize(Integer.parseInt(request.getParameter("pageSize")));
		
		pageVo.setPage(1);
		pageVo.setPageSize(10);

		// 쿼리문으로 연결하여 전달하기 
		Map<String , Object> resultMap = insuranceService.prodPageList(pageVo);
		
		
		// 해당 페이지에 맞게 리스트 가지고 오기
		List<InsProdVo> pageList = (List<InsProdVo>)resultMap.get("pageList");
	
		// 페이지 건수 
		int pageCnt = (int)resultMap.get("pageCnt");
		
		
		// model 객체에 저장 
		model.addAttribute("pageList", pageList);
		model.addAttribute("pageCnt" , pageCnt);
		
		
		if(resultMap.get("pageList") == null){
			pageCnt = 0;
			pageList = null;
		}
		
		
		return "petInsurance/insuranceProduct";
	}
	
	
	
	
	
}
