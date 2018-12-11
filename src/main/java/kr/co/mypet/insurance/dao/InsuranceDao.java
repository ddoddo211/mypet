package kr.co.mypet.insurance.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.mypet.insurance.model.InsProdVo;
import kr.co.mypet.insurance.model.InsuranceVo;
import kr.co.mypet.insurance.model.MypetVo;
import kr.co.mypet.insurance.model.PageVo;
import kr.co.mypet.insurance.model.ProdShoppingVo;


@Repository
public class InsuranceDao implements InsuranceDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	

	/**
	* Method : prodPageList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험상품리스트 가지고 오는 부분
	*/
	@Override
	public List<InsProdVo> prodPageList(PageVo pageVo) {
		return template.selectList("petIns.prodPageList" , pageVo);
	}
	


	/**  * Method   : getInsProductCnt
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  보험상품 리스트 전체 건수
	*/
	@Override
	public int getInsProductCnt() {
		return template.selectOne("petIns.getInsProductCnt");
	}
	
	/**
	* Method : prodKindPageList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험상품리스트 가지고 오는 부분(조회조건(애완동물)
	*/
	@Override
	public List<InsProdVo> prodKindPageList(PageVo pageVo) {
		return template.selectList("petIns.prodKindPageList" , pageVo);
	}
	
	/**  * Method   : getInsProductKindCnt
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  보험상품 리스트 전체 건수(조회조건)
	*/
	@Override
	public int getInsProductKindCnt(String petKind) {
		return template.selectOne("petIns.getInsProductKindCnt" ,petKind);
	}


	/**
	* Method : prodProductRecommendation
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 우리아이 보험상품 
	*/
	@Override
	public List<InsProdVo> prodProductRecommendation(PageVo pageVo) {
		return template.selectList("petIns.prodProductRecommendation" , pageVo);
	}
	
	/**  * Method   : getProductRecommendationCnt
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  우리아이 보험상품 총 갯수(페이지 처리를 위해)
	*/
	@Override
	public int getProductRecommendationCnt(PageVo pageVo) {
		return template.selectOne("petIns.getProductRecommendationCnt" , pageVo);
	}


	/**
	* Method : getProdInfo
	* 작성자 : Yumint
	* 변경이력 :
	* @param prodId
	* @return
	* Method 설명 : 보험상품 아이디를 매개변수로 줘서 보험상품 정보 가지고 오는 방법
	*/
	@Override
	public InsProdVo getProdInfo(String prodId) {
		return template.selectOne("petIns.getProdInfo" , prodId);
	}

	/**
	* Method : planInsert
	* 작성자 : Yumint
	* 변경이력 :
	* @param memberId
	* @return
	* Method 설명 : 보험상품 상세내역에서 플랜정보에 추가하는 부분 
	*/
	@Override
	public int planInsert(InsuranceVo insuranceVo) {
		return template.selectOne("petIns.planInsert" , insuranceVo);
	}


	/**
	* Method : memPlan
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_mem
	* @return
	* Method 설명 : 회원의 플랜정보에 추가된 보험상품 조회
	*/
	@Override
	public List<ProdShoppingVo> memPlan(String ins_mem) {
		return template.selectList("petIns.memPlan" , ins_mem);
	}


	/**
	* Method : petList
	* 작성자 : Yumint
	* 변경이력 :
	* @param myp_mem
	* @return
	* Method 설명 :회원의 펫정보를 가지고 오는 부분
	*/
	@Override
	public List<MypetVo> petList(String myp_mem) {
		return template.selectList("petIns.memPet" , myp_mem);
	}


}
