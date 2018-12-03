package kr.co.mypet.common.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDao implements CommonDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

}
