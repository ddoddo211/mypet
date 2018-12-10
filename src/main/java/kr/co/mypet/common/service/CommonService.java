package kr.co.mypet.common.service;

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
	
}
