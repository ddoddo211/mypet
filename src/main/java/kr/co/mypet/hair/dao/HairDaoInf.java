package kr.co.mypet.hair.dao;

import java.util.List;

import kr.co.mypet.hair.model.HairBoardVo;
import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.hair.model.PetStyleVo;
import kr.co.mypet.sitter.model.ZipVo;


public interface HairDaoInf {

	List<ZipVo> selectZipHigh();

	List<ZipVo> selectZipLow(String zip_high);

	List<HairShopVo> selectHairShopAll();
	
	
	public List<HairShopVo> selectHairShopLoc(String has_addr);
	
	HairShopVo selectShop(String has_id);
	
	List<HairBoardVo> selectReview(String hbrd_has);
	
	List<PetStyleVo> selectStyle(String pts_has);

}
