package kr.co.mypet.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.mypet.common.dao.CommonDao;
import kr.co.mypet.common.dao.CommonDaoInf;
import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.common.model.PageVo;

@Service
public class CommonService implements CommonServiceInf {

	@Resource(name="commonDao")
	private CommonDaoInf commonDao;

	@Override
	public int memberJoin(MemberVo memVo) {
		
		return commonDao.memberJoin(memVo);
	}

	@Override
	public int login(MemberVo memVo) {
		int chk =0 ;
		MemberVo memberVo = commonDao.login(memVo);
		if(memberVo == null) {
			chk = 1;
		} else {
			chk = 0;
		}
		return chk;
	}

	@Override
	public int naverLogin(String mem_id) {
		// TODO Auto-generated method stub
		return commonDao.naverLogin(mem_id);
	}

	@Override
	public MemberVo memberInfo(String mem_id) {
		// TODO Auto-generated method stub
		return commonDao.memberInfo(mem_id);
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
		return commonDao.pointUpdate(memVo);
	}

	@Override
	public int updateMemInfo(MemberVo memVo) {
		return commonDao.updateMemInfo(memVo);
	}
	
	@Override
	public List<MemberVo> getMemberList() {
		return commonDao.getMemberList();
	}
	
	// 회원목록List
	@Override
	public Map<String, Object> getMemberListAll(PageVo pageVo) {
		
		List<MemberVo> memList = commonDao.getMemberListAll(pageVo);
		
		int totalCnt = commonDao.getMemberListAllCnt();
		int pageSize = pageVo.getPageSize();
		int pageCnt = (int)Math.ceil(((double)totalCnt/pageSize));
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("page",pageVo.getPage());
		resultMap.put("memList", memList);
		resultMap.put("pageCnt", pageCnt);
		
		return resultMap;
	}

	@Override
	public int deleteMember(String string) {
		return commonDao.deleteMember(string);
	}

	@Override
	public int memberBlack(String string) {
		return commonDao.memberBlack(string);
	}

	@Override
	public int memberWhite(String string) {
		return commonDao.memberWhite(string);
	}

	@Override
	public Map<String, Object> getMemberListAll2(PageVo pageVo) {
		List<MemberVo> memList = commonDao.getMemberListAll2(pageVo);
		
		int totalCnt = commonDao.getMemberListAllCnt2();
		int pageSize = pageVo.getPageSize();
		int pageCnt = (int)Math.ceil(((double)totalCnt/pageSize));
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("page",pageVo.getPage());
		resultMap.put("memList", memList);
		resultMap.put("pageCnt", pageCnt);
		
		return resultMap;
	}

	@Override
	public int memberUpdate(Map<String, Object> param) {
		return commonDao.memberUpdate(param);
	}
	
	/**
	* Method : idSearch
	* 작성자 : pc25
	* 변경이력 :
	* @param memVo
	* @return 
	* Method 설명 : 멤버ID 찾기
	*/
	@Override
	public MemberVo idSearch(MemberVo memVo) {
		return commonDao.idSearch(memVo);
	}
	
	@Override
	public String memberPWSearch(String mem_id) {
		return commonDao.memberPWSearch(mem_id);
	}

	@Override
	public int getSupportPaymentSuccess() {
		return commonDao.getSupportPaymentSuccess();
	}
}
