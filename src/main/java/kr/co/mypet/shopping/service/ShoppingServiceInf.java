package kr.co.mypet.shopping.service;

import java.util.List;

import kr.co.mypet.shopping.model.ShopNoticeVo;

public interface ShoppingServiceInf {
	
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
	
}
