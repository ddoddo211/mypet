package kr.co.mypet.shopping.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	
}
