package kr.co.mypet.insurance.dao;

import java.util.List;
import kr.co.mypet.insurance.model.InsProdVo;
import kr.co.mypet.insurance.model.PageVo;

public interface InsuranceDaoInf {
	

	/**
	* Method : prodList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험상품리스트 가지고 오는 부분
	*/
	public List<InsProdVo> prodPageList(PageVo pageVo);
	
	/**  * Method   : getBoardCnt
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  보험상품 리스트 전체 건수
	*/
	int getInsProductCnt();

}
