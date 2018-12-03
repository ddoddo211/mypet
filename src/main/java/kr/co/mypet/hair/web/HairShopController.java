package kr.co.mypet.hair.web;

import javax.annotation.Resource;

import kr.co.mypet.hair.service.HairServiceInf;

public class HairShopController {
	
	@Resource(name="hairService")
	private HairServiceInf hairService;
}
