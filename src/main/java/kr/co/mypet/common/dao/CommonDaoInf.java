package kr.co.mypet.common.dao;

import java.util.List;
import java.util.Map;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.common.model.PageVo;
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

	public int updateMemInfo(MemberVo memVo);
	
	public List<MemberVo> getMemberList();

	public List<MemberVo> getMemberListAll(PageVo pageVo);

	public int getMemberListAllCnt();

	public int deleteMember(String string);

	public int memberBlack(String string);

	public int memberWhite(String string);

	public List<MemberVo> getMemberListAll2(PageVo pageVo);

	public int getMemberListAllCnt2();

	public int memberUpdate(Map<String, Object> param);
	
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
