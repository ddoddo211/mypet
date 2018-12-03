package kr.co.mypet.sitter.web;

import javax.annotation.Resource;

import kr.co.mypet.sitter.service.SitterServiceInf;

public class SitterController {

	@Resource(name="sitterService")
	private SitterServiceInf sitterService;
	
}
