package kr.co.mypet.hair.service;

import java.util.List;

import kr.co.mypet.hair.model.HairBoardVo;
import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.sitter.model.ZipVo;


public interface HairServiceInf {
	
	//주소 대분류 호출
	public List<ZipVo> selectZipHigh();
	
	//주소 소분류 호출
	public List<ZipVo> selectZipLow(String zip_high);
	
	//모든 헤어샵 호출
	public List<HairShopVo> selectHairShopAll();
	
	//지역의 헤어샵만 호출
	public List<HairShopVo> selectHairShopLoc(String has_addr);
	
	//클릭한 헤어샵만
	public HairShopVo selectShop(String has_id);
	
	//review 조회
	List<HairBoardVo> selectReview(String hbrd_has);
	
}
