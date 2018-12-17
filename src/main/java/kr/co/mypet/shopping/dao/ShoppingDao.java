package kr.co.mypet.shopping.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.mypet.shopping.model.AnimalVo;
import kr.co.mypet.shopping.model.BrandVo;
import kr.co.mypet.shopping.model.ProdAgeVo;
import kr.co.mypet.shopping.model.ProdVo;
import kr.co.mypet.shopping.model.ProddvVo;
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
	* Method : animalMenu
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 펫쇼핑몰 동물메뉴
	*/
	@Override
	public List<AnimalVo> animalMenu() {
		List<AnimalVo> aniList = template.selectList("shop.animalMenu");
		return aniList;
	}
	
	/**
	* Method : prodMenu
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 동물별 상품메뉴List
	*/
	@Override
	public List<ProddvVo> prodMenu(String pdd_am) {
		List<ProddvVo> pddList = template.selectList("shop.prodMenu",pdd_am);
		return pddList;
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
		List<ProdVo> prodList = template.selectList("shop.prodList",pdd_id);
		return prodList;
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
		List<ProdAgeVo> ageList = template.selectList("shop.optionList",pdd_am);
		return ageList;
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
		List<BrandVo> brdList = template.selectList("shop.brandList",pdd_id);
		return brdList;
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
		ProdVo prodVo = template.selectOne("shop.prodDetail",prod_id);
		return prodVo;
	}
	
	
	
	
	
}
