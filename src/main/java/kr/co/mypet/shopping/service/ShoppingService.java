package kr.co.mypet.shopping.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.mypet.shopping.dao.ShoppingDaoInf;
import kr.co.mypet.shopping.model.AnimalVo;
import kr.co.mypet.shopping.model.BrandVo;
import kr.co.mypet.shopping.model.ProdAgeVo;
import kr.co.mypet.shopping.model.ProdVo;
import kr.co.mypet.shopping.model.ProddvVo;
import kr.co.mypet.shopping.model.ShopNoticeVo;

@Service
public class ShoppingService implements ShoppingServiceInf {

	@Resource(name="shoppingDao")
	private ShoppingDaoInf shoppingDao;

	/**
	* Method : shopNoticeList
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 펫쇼핑몰 공지사항 불러오기
	*/
	@Override
	public List<ShopNoticeVo> shopNoticeList() {
		return shoppingDao.shopNoticeList();
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
		return shoppingDao.shopNoticeDetail(snot_id);
	}
	
	/**
	* Method : prodMenu
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 강이지/고양이 상품메뉴List
	*/
	@Override
	public List<ProddvVo> prodMenu(String pdd_am) {
		return shoppingDao.prodMenu(pdd_am);
	}
	
	/**
	* Method : animalMenu
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 펫쇼핑몰 동물메뉴
	*/
	@Override
	public List<AnimalVo> animalMenu() {
		return shoppingDao.animalMenu();
	}
	
	/**
	* Method : prodList
	* 작성자 : pc25
	* 변경이력 :
	* @param pdd_id
	* @return
	* Method 설명 : 상품분류에 대한 상품List
	*/
	@Override
	public List<ProdVo> prodList(String pdd_id) {
		return shoppingDao.prodList(pdd_id);
	}
	
	/**
	* Method : optionList
	* 작성자 : pc25
	* 변경이력 :
	* @param pdd_id
	* @return
	* Method 설명 : 상품분류(사료,장난감등)안에 옵션분류(연령-성견...)List
	*/
	@Override
	public List<ProdAgeVo> optionList(String pdd_am) {
		return shoppingDao.optionList(pdd_am);
	}
	
	/**
	* Method : brandList
	* 작성자 : pc25
	* 변경이력 :
	* @param pdd_id
	* @return
	* Method 설명 : 상품분류에 대한 상품들의 브랜드List
	*/
	@Override
	public List<BrandVo> brandList(String pdd_id) {
		return shoppingDao.brandList(pdd_id);
	}
	
	/**
	* Method : prodDetail
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 해당 상품에 대한 상세정보
	*/
	@Override
	public ProdVo prodDetail(String prod_id) {
		return shoppingDao.prodDetail(prod_id);
	}

	
	
}
