package kr.co.mypet.common.dao;

import java.util.List;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.hair.model.HairShopVo;

public interface CommonDaoInf {

	public int memberJoin(MemberVo memVo);

	public int login(MemberVo memVo);

	public int naverLogin(String mem_id);

	public MemberVo memberInfo(String mem_id);
	
	/**
	* Method : pointUpdate
	* 작성자 : pc25
	* 변경이력 :
	* @param memVo
	* @return
	* Method 설명 : 멤버 포인트 적립 및 사용
	*/
	public int pointUpdate(MemberVo memVo);

	public List<MemberVo> getMemberList();
}
