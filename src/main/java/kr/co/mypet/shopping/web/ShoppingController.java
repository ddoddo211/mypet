package kr.co.mypet.shopping.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mypet.shopping.service.ShoppingServiceInf;

@Controller
@RequestMapping("/shop")
public class ShoppingController {

	@Resource(name="shoppingService")
	private ShoppingServiceInf shoppingService;
	
	
	@RequestMapping("/shopMain")
	public String shopMain() {
		return "petShop";
	}
}
