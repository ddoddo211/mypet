package kr.co.mypet.insurance.service;

import java.util.List;
import java.util.Map;
import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.insurance.model.InsProdVo;
import kr.co.mypet.insurance.model.InsshoppingVo;
import kr.co.mypet.insurance.model.PageVo;


public interface InsuranceServiceInf {
	


	/**
	* Method : prodPageList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험상품리스트 가지고 오는 부분
	*/
	Map<String, Object> prodPageList(PageVo pageVo);
	
	/**
	* Method : prodList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험상품리스트 가지고 오는 부분(조회조건(애완동물)
	*/
	Map<String, Object> prodKindPageList(PageVo pageVo);
	
	/**
	* Method : prodProductRecommendation
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 우리아이 보험상품 
	*/
	Map<String, Object> prodProductRecommendation(PageVo pageVo);
	
	/**
	* Method : getProdInfo
	* 작성자 : Yumint
	* 변경이력 :
	* @param prodId
	* @return
	* Method 설명 : 보험상품 아이디를 매개변수로 줘서 보험상품 정보 가지고 오는 방법
	*/
	public InsProdVo getProdInfo(String prodId);
	
	
	/**
	* Method : planInsert
	* 작성자 : Yumint
	* 변경이력 :
	* @param memberId
	* @return
	* Method 설명 : 보험상품 상세내역에서 플랜정보에 추가하는 부분 
	*/
	int planInsert (InsshoppingVo insshoppingVo);
	
	/**
	* Method : memPlan
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_mem
	* @return
	* Method 설명 : 회원의 플랜정보에 추가된 보험상품 조회
	*/
	List<InsshoppingVo> memPlan(String inssp_mem);
	
	/**
	* Method : petList
	* 작성자 : Yumint
	* 변경이력 :
	* @param myp_mem
	* @return
	* Method 설명 :회원의 펫정보를 가지고 오는 부분
	*/
	List<InsshoppingVo> petList(String myp_mem);
	
	/**
	* Method : memberInfo
	* 작성자 : Yumint
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 : 회원 아이디를 줘서 회원의 정보를 받아오는 부분
	*/
	MemberVo memberInfo(MemberVo memberVo);


}
