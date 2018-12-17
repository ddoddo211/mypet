package kr.co.mypet.common.dao;

import kr.co.mypet.common.model.MemberVo;

public interface CommonDaoInf {

	public int memberJoin(MemberVo memVo);

	public int login(MemberVo memVo);

	public int naverLogin(String mem_id);

	public MemberVo memberInfo(String mem_id);

}
