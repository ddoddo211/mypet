package kr.co.mypet.insurance.web;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@RequestMapping("/productInfo")
	public String productInfo() {
		return "petInsurance/insuranceProduct";
	}
	
	
	
}
