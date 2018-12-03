package kr.co.mypet.shopping.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

public class ShoppingDao implements ShoppingDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
}
