package kr.co.mypet.common.dao;

import java.util.List;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.hair.model.HairShopVo;

public interface CommonDaoInf {

	public int memberJoin(MemberVo memVo);

	public int login(MemberVo memVo);

	public int naverLogin(String mem_id);

	public MemberVo memberInfo(String mem_id);
	
	
}
