package kr.co.mypet.shopping.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.mypet.shopping.dao.ShoppingDaoInf;
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
	
}
