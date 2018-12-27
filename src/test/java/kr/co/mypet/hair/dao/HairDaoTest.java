package kr.co.mypet.hair.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.mypet.hair.model.HairBoardVo;
import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.hair.model.PetStyleVo;
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
	
	@Test
	public void selectShopLocTest() {
		/***Given***/
		

		/***When***/
		List<HairShopVo> hairShopList = hairDao.selectHairShopLoc("대전 중구");

		/***Then***/
		
		assertEquals(2,hairShopList.size());
		
	}
	
	//특성 shop을 읽어오는 메서드
	@Test
	public void selectShop() {
		/***Given***/
		String has_id = "has2";
		String has_name = "짱구짱아애견미용샵";
		
		/***When***/
		HairShopVo hairShopVo = hairDao.selectShop(has_id);
		

		/***Then***/
		assertEquals(has_name,hairShopVo.getHas_name());
		
	}
	
	//리뷰조회
	@Test
	public void selectReviewTest() {
		/***Given***/
		String hbrd_has = "has2";

		/***When***/
		List<HairBoardVo> reviewList = hairDao.selectReview(hbrd_has);

		/***Then***/
		assertEquals("cus1",reviewList.get(0).getHbrd_mem());
		
	}
	
	//스타일 조회
	public void selectStyleTest() {
		/***Given***/
		String pts_has = "has2";
		

		/***When***/
		List<PetStyleVo> styleList = hairDao.selectStyle(pts_has);

		/***Then***/
		assertEquals(3,styleList.size());
		
	}

}
