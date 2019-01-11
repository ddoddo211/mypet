package kr.co.mypet.common.service;

import java.util.List;
import java.util.Map;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.common.model.PageVo;

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
	
	/**
	* Method : getMemberList
	* 작성자 : pc24
	* 변경이력 :
	* @return
	* Method 설명 : 회원가입 아이디 중복 체크확인
	*/
	public List<MemberVo> getMemberList();

	/**
	* Method : getMemberListAll
	* 작성자 : pc24
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 회원 전체 리스트 조회
	*/
	public Map<String, Object> getMemberListAll(PageVo pageVo);

	/**
	* Method : deleteMember
	* 작성자 : pc24
	* 변경이력 :
	* @param string
	* @return
	* Method 설명 : 회원 탈퇴 
	*/
	public int deleteMember(String string);

	/**
	* Method : memberBlack
	* 작성자 : pc24
	* 변경이력 :
	* @param string
	* @return
	* Method 설명 : 회원 블랙리스트 등록 
	*/
	public int memberBlack(String string);

	/**
	* Method : memberWhite
	* 작성자 : pc24
	* 변경이력 :
	* @param string
	* @return
	* Method 설명 : 회원 블랙리스트 해제
	*/
	public int memberWhite(String string);

	/**
	* Method : getMemberListAll2
	* 작성자 : pc24
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 회원 전체 리스트 조회(탈퇴회원, 블랙리스트회원 제외) 
	*/
	public Map<String, Object> getMemberListAll2(PageVo pageVo);

	/**
	* Method : memberUpdate
	* 작성자 : pc24
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 회원 권한 수정 
	*/
	public int memberUpdate(Map<String, Object> param);
	
	/**
	* Method : memberPWSearch
	* 작성자 : pc24
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 회원의 비밀번호 조회 
	*/
	public String memberPWSearch(String mem_id);
	
	/**
	* Method : idSearch
	* 작성자 : pc25
	* 변경이력 :
	* @param memVo
	* @return 
	* Method 설명 : 멤버ID 찾기
	*/
	public MemberVo idSearch(MemberVo memVo);
}
