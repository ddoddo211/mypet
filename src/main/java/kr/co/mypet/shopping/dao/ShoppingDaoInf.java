package kr.co.mypet.shopping.dao;

import java.util.List;

import kr.co.mypet.shopping.model.DivisionVo;
import kr.co.mypet.shopping.model.ShopNoticeVo;

public interface ShoppingDaoInf {
	/**
	* Method : shopNoticeList
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 펫쇼핑몰 공지사항 불러오기
	*/
	public List<ShopNoticeVo> shopNoticeList();
	
	/**
	* Method : shopNoticeDetail
	* 작성자 : pc25
	* 변경이력 :
	* @param snot_id
	* @return
	* Method 설명 : 펫쇼핑몰 공지사항 상세정보
	*/
	public ShopNoticeVo shopNoticeDetail(String snot_id);
	
	/**
	* Method : dogMenuList
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 :펫쇼핑몰 강아지 메뉴
	*/
	public List<DivisionVo> dogMenuList();
	
	/**
	* Method : dogMenuOption
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_id
	* @return
	* Method 설명 : 강아지메뉴에 대한 옵션(연령,브랜드,주원료) List
	*/
	public List<DivisionVo> dogMenuOption(String dvs_id);
	
	/**
	* Method : optionDivision
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_id
	* @return
	* Method 설명 : 강아지메뉴에 대한 옵션과 분류 List (분류를 뽑아내기 위해)
	*/
	public List<DivisionVo> optionDivision(String dvs_id);
}
