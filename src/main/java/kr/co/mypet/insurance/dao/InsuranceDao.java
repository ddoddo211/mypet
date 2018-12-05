package kr.co.mypet.insurance.dao;

import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import kr.co.mypet.insurance.model.InsProdVo;
import kr.co.mypet.insurance.model.PageVo;


@Repository
public class InsuranceDao implements InsuranceDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	

	/**
	* Method : prodList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험상품리스트 가지고 오는 부분
	*/
	@Override
	public List<InsProdVo> prodPageList(PageVo pageVo) {
		return template.selectList("petIns.prodPageList" , pageVo);
	}
	


	/**  * Method   : getBoardCnt
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  보험상품 리스트 전체 건수
	*/
	@Override
	public int getInsProductCnt() {
		return template.selectOne("petIns.getInsProductCnt");
	}


}
