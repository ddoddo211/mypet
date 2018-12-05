package kr.co.mypet.insurance.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.mypet.insurance.model.InsProdVo;
import kr.co.mypet.insurance.model.PageVo;

import org.junit.Before;
import org.junit.Test;

public class InsuranceDaoTest {

	@Resource(name="insuranceDao")
	private InsuranceDaoInf insuranceDao;
		

	
	@Before
	public void setup(){
		insuranceDao = new InsuranceDao();
	}
	@Test
	public void prodList(){
		
	
	}
}

























