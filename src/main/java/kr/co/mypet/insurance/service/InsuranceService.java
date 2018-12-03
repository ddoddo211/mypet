package kr.co.mypet.insurance.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.mypet.insurance.dao.InsuranceDaoInf;

@Service
public class InsuranceService implements InsuranceServiceInf {
	
	@Resource(name="insuranceDao")
	private InsuranceDaoInf insuranceDao;
	
}
