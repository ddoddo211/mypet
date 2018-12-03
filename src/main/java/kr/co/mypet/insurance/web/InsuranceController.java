package kr.co.mypet.insurance.web;

import javax.annotation.Resource;

import kr.co.mypet.insurance.service.InsuranceServiceInf;

public class InsuranceController {

	@Resource(name="insuranceService")
	private InsuranceServiceInf insuranceService;
	
}
