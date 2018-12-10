package kr.co.mypet.common.service;

import kr.co.mypet.common.model.MemberVo;

public interface CommonServiceInf {
	
	//memberinsert
	public int memberJoin(MemberVo memVo);

	//loginChk
	public int login(MemberVo memVo);
	
	//naverLoginChk
	public int naverLogin(String mem_id);
	
	
}
