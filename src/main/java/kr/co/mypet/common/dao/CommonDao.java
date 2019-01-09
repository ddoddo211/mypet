package kr.co.mypet.common.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.hair.model.HairShopVo;

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

	@Override
	public MemberVo memberInfo(String mem_id) {
		MemberVo memVo = template.selectOne("member.memberInfo", mem_id);
		return memVo;
	}
	
	/**
	* Method : pointUpdate
	* 작성자 : pc25
	* 변경이력 :
	* @param memVo
	* @return
	* Method 설명 : 멤버 포인트 적립 및 사용
	*/
	@Override
	public int pointUpdate(MemberVo memVo) {
		int result = template.update("member.pointUpdate",memVo);
		return result;
	}

	@Override
	public int updateMemInfo(MemberVo memVo) {
		
		int chk = template.update("member.updateMemInfo", memVo);
		
		return chk;
	}

	@Override
	public List<MemberVo> getMemberList() {
		return template.selectList("member.getMemberList");
	}


}
