package kr.co.mypet.hair.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

public class HairDao implements HairDaoInf {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;	
	
}
