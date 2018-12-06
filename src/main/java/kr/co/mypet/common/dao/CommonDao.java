package kr.co.mypet.common.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.mypet.common.model.MemberVo;

@Repository
public class CommonDao implements CommonDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public int memberJoin(MemberVo memVo) {
		
		return template.insert("member.insertMember", memVo);
	}


}
