package kr.co.mypet.insurance.dao;

import java.util.List;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.insurance.model.InsProdVo;
import kr.co.mypet.insurance.model.InsuranceVo;
import kr.co.mypet.insurance.model.MypetVo;
import kr.co.mypet.insurance.model.PageVo;
import kr.co.mypet.insurance.model.ProdShoppingVo;

public interface InsuranceDaoInf {
	

	// 보험상품 
	/**
	* Method : prodPageList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험상품리스트 가지고 오는 부분
	*/
	public List<InsProdVo> prodPageList(PageVo pageVo);
	
	/**  * Method   : getInsProductCnt
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  보험상품 리스트 전체 건수
	*/
	int getInsProductCnt();
	
	/**
	* Method : prodKindPageList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험상품리스트 가지고 오는 부분(조회조건(애완동물)
	*/
	public List<InsProdVo> prodKindPageList(PageVo pageVo);
	
	/**  * Method   : getInsProductKindCnt
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  보험상품 리스트 전체 건수(조회조건)
	*/
	int getInsProductKindCnt(String petKind);
	
	/**
	* Method : prodProductRecommendation
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 우리아이 보험상품 
	*/
	public List<InsProdVo> prodProductRecommendation(PageVo pageVo);
	
	/**  * Method   : getProductRecommendationCnt
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  우리아이 보험상품 총 갯수
	*/
	int getProductRecommendationCnt(PageVo pageVo);
	

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
	int planInsert (InsuranceVo insuranceVo);
	
	/**
	* Method : memPlan
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_mem
	* @return
	* Method 설명 : 회원의 플랜정보에 추가된 보험상품 조회
	*/
	List<ProdShoppingVo> memPlan(String ins_mem);
	
	
	/**
	* Method : petList
	* 작성자 : Yumint
	* 변경이력 :
	* @param myp_mem
	* @return
	* Method 설명 :회원의 펫정보를 가지고 오는 부분
	*/
	List<MypetVo> petList(String myp_mem);
	
	/**
	* Method : memberInfo
	* 작성자 : Yumint
	* 변경이력 :
	* @param memVo
	* @return
	* Method 설명 : 회원 아이디를 줘서 회원의 정보를 받아오는 부분
	*/
	MemberVo memberInfo(MemberVo memVo);

}
