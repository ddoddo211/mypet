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

	@Override
	public int login(MemberVo memVo) {
		// TODO Auto-generated method stub
		int Chk = 0;
		memVo = template.selectOne("member.login", memVo);
		if(memVo==null) {
			//조회 실패
			Chk = 1;
		} else {
			//조회 성공
			Chk = 0;
		}
		return Chk;
	}

	@Override
	public int naverLogin(String mem_id) {
		// TODO Auto-generated method stub
				int Chk = 0;
				MemberVo memVo = template.selectOne("member.naverLogin", mem_id);
				if(memVo==null) {
					//조회 실패
					Chk = 1;
				} else {
					//조회 성공
					Chk = 0;
				}
				return Chk;
	}


}
