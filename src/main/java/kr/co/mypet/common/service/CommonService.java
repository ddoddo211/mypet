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
	
}
