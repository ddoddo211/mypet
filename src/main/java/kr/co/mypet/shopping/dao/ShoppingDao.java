package kr.co.mypet.shopping.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.mypet.shopping.model.DivisionVo;
import kr.co.mypet.shopping.model.ShopNoticeVo;

@Repository
public class ShoppingDao implements ShoppingDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	/**
	* Method : shopNoticeList
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 펫쇼핑몰 공지사항 불러오기
	*/
	@Override
	public List<ShopNoticeVo> shopNoticeList() {
		List<ShopNoticeVo> snotList = template.selectList("shop.shopNoticeList");
		return snotList;
	}
	
	/**
	* Method : shopNoticeDetail
	* 작성자 : pc25
	* 변경이력 :
	* @param snot_id
	* @return
	* Method 설명 : 펫쇼핑몰 공지사항 상세정보
	*/
	@Override
	public ShopNoticeVo shopNoticeDetail(String snot_id) {
		ShopNoticeVo snotVo = template.selectOne("shop.shopNoticeDetail",snot_id);
		return snotVo;
	}
	
	/**
	* Method : dogMenuList
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 :펫쇼핑몰 강아지 메뉴
	*/
	@Override
	public List<DivisionVo> dogMenuList() {
		List<DivisionVo> menuList = template.selectList("shop.dogMenuList");
		return menuList;
	}
	
	/**
	* Method : dogMenuOption
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_id
	* @return
	* Method 설명 : 강아지메뉴에 대한 옵션(연령,브랜드,주원료) List
	*/
	@Override
	public List<DivisionVo> dogMenuOption(String dvs_id) {
		List<DivisionVo> optionList = template.selectList("shop.dogMenuOption",dvs_id);
		return optionList;
	}
	
	/**
	* Method : optionDivision
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_id
	* @return
	* Method 설명 : 강아지메뉴에 대한 옵션과 분류 List (분류를 뽑아내기 위해)
	*/
	@Override
	public List<DivisionVo> optionDivision(String dvs_id) {
		List<DivisionVo> optionList = template.selectList("shop.optionDivision",dvs_id);
		return optionList;
	}

	
}
