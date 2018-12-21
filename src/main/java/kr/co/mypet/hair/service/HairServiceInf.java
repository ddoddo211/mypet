package kr.co.mypet.hair.service;

import java.util.List;

import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.sitter.model.ZipVo;


public interface HairServiceInf {
	
	//주소 대분류 호출
	public List<ZipVo> selectZipHigh();
	
	//주소 소분류 호출
	public List<ZipVo> selectZipLow(String zip_high);
	
	//모든 헤어샵 호출
	public List<HairShopVo> selectHairShopAll();
	
}
