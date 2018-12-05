package kr.co.mypet.insurance.service;

import java.util.List;
import java.util.Map;

import kr.co.mypet.insurance.model.InsProdVo;
import kr.co.mypet.insurance.model.PageVo;


public interface InsuranceServiceInf {
	


	/**
	* Method : prodList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험상품리스트 가지고 오는 부분
	*/
	Map<String, Object> prodPageList(PageVo pageVo);

}
