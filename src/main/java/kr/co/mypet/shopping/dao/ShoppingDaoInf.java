package kr.co.mypet.shopping.dao;

import java.util.List;
import java.util.Map;

import kr.co.mypet.shopping.model.AnimalVo;
import kr.co.mypet.shopping.model.BrandVo;
import kr.co.mypet.shopping.model.ProdAgeVo;
import kr.co.mypet.shopping.model.ProdVo;
import kr.co.mypet.shopping.model.ProddvVo;
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
	* Method : animalMenu
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 펫쇼핑몰 동물메뉴
	*/
	public List<AnimalVo> animalMenu();
	
	/**
	* Method : prodMenu
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 동물별 상품메뉴List
	*/
	public List<ProddvVo> prodMenu(String pdd_am);
	
	/**
	* Method : prodList
	* 작성자 : pc25
	* 변경이력 :
	* @param pdd_id
	* @return
	* Method 설명 : 상품분류에 대한 상품List
	*/
	public List<ProdVo> prodList(String pdd_id);
	
	/**
	* Method : optionList
	* 작성자 : pc25
	* 변경이력 :
	* @param pdd_id
	* @return
	* Method 설명 : 상품분류(사료,장난감등)안에 옵션분류(연령-성견...)List
	*/
	public List<ProdAgeVo> optionList(String pdd_am);
	
	/**
	* Method : brandList
	* 작성자 : pc25
	* 변경이력 :
	* @param pdd_id
	* @return
	* Method 설명 : 상품분류에 대한 상품들의 브랜드List
	*/
	public List<BrandVo> brandList(String pdd_id);
	
	/**
	* Method : prodDetail
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 해당 상품에 대한 상세정보
	*/
	public ProdVo prodDetail(String prod_id);
	
}
