package kr.co.mypet.hair.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.sitter.model.ZipVo;


@RunWith(SpringJUnit4ClassRunner.class)
//service, dao 에대한 설정파일 필요하다
@ContextConfiguration(locations= {	"classpath:kr/co/mypet/config/spring/root-context.xml",
									"classpath:kr/co/mypet/config/spring/datasource-context.xml",
									"classpath:kr/co/mypet/config/spring/transaction-context.xml"})
@WebAppConfiguration
public class HairDaoTest{

	@Resource(name="hairDao")
	private HairDaoInf hairDao;
	
	
	@Test
	public void selectZipHighTest() {
		/***Given***/
		

		/***When***/
		List<ZipVo> zipHighList = hairDao.selectZipHigh();

		/***Then***/
		assertEquals("충청남도",zipHighList.get(0).getZip_high());
	}
	
	@Test
	public void selectShopAllTest() {
		/***Given***/
		

		/***When***/
		List<HairShopVo> hairShopList = hairDao.selectHairShopAll();

		/***Then***/
		assertEquals("뿅뿅미용실", hairShopList.get(0).getHas_name());
	}

}
