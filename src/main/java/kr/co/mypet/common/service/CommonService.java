package kr.co.mypet.common.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.mypet.common.dao.CommonDao;

@Service
public class CommonService implements CommonServiceInf {

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
}
