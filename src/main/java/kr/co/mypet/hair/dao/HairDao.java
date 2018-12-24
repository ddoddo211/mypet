package kr.co.mypet.hair.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.mypet.hair.model.HairBoardVo;
import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.hair.model.PetStyleVo;
import kr.co.mypet.sitter.model.ZipVo;


@Repository
public class HairDao implements HairDaoInf {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<ZipVo> selectZipHigh() {
		
		List<ZipVo> zipList = template.selectList("petHair.zipHigh");
		
		return zipList;
	}

	@Override
	public List<ZipVo> selectZipLow(String zip_high) {
		
		List<ZipVo> zipList = template.selectList("petHair.zipLow",zip_high);
		
		return zipList;
	}

	@Override
	public List<HairShopVo> selectHairShopAll() {
		
		List<HairShopVo> hairShopList = template.selectList("petHair.shopSelectAll");
		
		return hairShopList;
	}	
	
	@Override
	public List<HairShopVo> selectHairShopLoc(String has_addr) {
		
		List<HairShopVo> hairShopList = template.selectList("petHair.selectHairShopLoc", has_addr);
		
		
		return hairShopList;
	}

	@Override
	public HairShopVo selectShop(String has_id) {
		HairShopVo hairShopVo = template.selectOne("petHair.selectShop", has_id);
		return hairShopVo;
	}

	@Override
	public List<HairBoardVo> selectReview(String hbrd_has) {
		List<HairBoardVo> reviewList = template.selectList("petHair.selectReview", hbrd_has);
		return reviewList;
	}

	@Override
	public List<PetStyleVo> selectStyle(String pts_has) {
		List<PetStyleVo> styleList = template.selectList("petHair.selectStyle", pts_has);
		return styleList;
	}
	
}
