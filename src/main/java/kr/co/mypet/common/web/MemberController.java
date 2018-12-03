package kr.co.mypet.common.web;

import javax.annotation.Resource;

import kr.co.mypet.common.service.CommonServiceInf;

public class MemberController {
	
	@Resource(name="commonService")
	private CommonServiceInf commonService;
	

}
