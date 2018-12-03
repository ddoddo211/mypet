package kr.co.mypet.sitter.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

public class SitterDao implements SitterDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;	
}
