package kr.co.mypet.common.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.mypet.common.dao.CommonDao;
import kr.co.mypet.common.dao.CommonDaoInf;
import kr.co.mypet.common.model.MemberVo;

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
		
		return commonDao.login(memVo);
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
		// TODO Auto-generated method stub
		return commonDao.updateMemInfo(memVo);
	}
	
	@Override
	public List<MemberVo> getMemberList() {
		return commonDao.getMemberList();
	}
	
	
}
