package kr.co.mypet.shopping.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.mypet.shopping.dao.ShoppingDaoInf;

@Service
public class ShoppingService implements ShoppingServiceInf {

	@Resource(name="shoppingDao")
	private ShoppingDaoInf shoppingDao;
	
}
