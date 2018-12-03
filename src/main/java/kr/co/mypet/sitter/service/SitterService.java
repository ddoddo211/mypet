package kr.co.mypet.sitter.service;

import javax.annotation.Resource;

import kr.co.mypet.sitter.dao.SitterDaoInf;

public class SitterService implements SitterServiceInf {
	
	@Resource(name="sitterDao")
	private SitterDaoInf sitterDao;
}
