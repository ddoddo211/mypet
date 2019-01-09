package kr.co.mypet.common.service;

import kr.co.mypet.common.model.MemberVo;

public interface CommonServiceInf {
	
	//memberinsert
	public int memberJoin(MemberVo memVo);

	//loginChk
	public int login(MemberVo memVo);
	
	//naverLoginChk
	public int naverLogin(String mem_id);
	
	//memberinfo
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

	
	//member 의 정보 수정
	public int updateMemInfo(MemberVo memVo);
}
