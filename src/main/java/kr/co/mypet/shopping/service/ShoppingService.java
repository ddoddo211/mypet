package kr.co.mypet.shopping.service;

import javax.annotation.Resource;

import kr.co.mypet.shopping.dao.ShoppingDaoInf;

public class ShoppingService implements ShoppingServiceInf {

	@Resource(name="shoppingDao")
	private ShoppingDaoInf shoppingDao;
	
}
