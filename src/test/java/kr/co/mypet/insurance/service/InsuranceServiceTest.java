package kr.co.mypet.insurance.service;

import static org.junit.Assert.assertEquals;

import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import kr.co.mypet.insurance.model.InsProdVo;
import kr.co.mypet.insurance.model.InsurancePageVo;

public class InsuranceServiceTest {

	private InsuranceServiceInf insuranceService;
		

	
	@Before
	public void setup(){
		insuranceService = new InsuranceService();
	}
	
	@Test
	public void prodList(){
		
		/***Given***/ 
		
		InsurancePageVo pageVo = new InsurancePageVo();

		pageVo.setPage(0);
		pageVo.setPageSize(10);
		
		/***When***/
		Map<String, Object> prodList = insuranceService.prodPageList(pageVo);
		
		/***Then***/
		assertEquals(2, prodList.size());
	}

}

























