package kr.co.mypet.shopping.web;

import javax.annotation.Resource;

import kr.co.mypet.shopping.service.ShoppingServiceInf;

public class ShoppingController {

	@Resource(name="shoppingService")
	private ShoppingServiceInf shoppingService;
	
}
