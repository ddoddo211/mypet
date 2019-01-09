package kr.co.mypet.common.service;

import java.util.List;

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

	/**
	* Method : getMemberList
	* 작성자 : pc24
	* 변경이력 :
	* @return
	* Method 설명 : 회원가입 아이디 중복 체크확인
	*/
	public List<MemberVo> getMemberList();
}
