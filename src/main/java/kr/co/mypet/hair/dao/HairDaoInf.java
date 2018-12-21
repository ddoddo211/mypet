package kr.co.mypet.hair.dao;

import java.util.List;

import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.sitter.model.ZipVo;


public interface HairDaoInf {

	List<ZipVo> selectZipHigh();

	List<ZipVo> selectZipLow(String zip_high);

	List<HairShopVo> selectHairShopAll();
	

}
