package kr.co.mypet.hair.dao;

import java.util.List;

import kr.co.mypet.hair.model.ZipVo;

public interface HairDaoInf {

	List<ZipVo> selectZipHigh();

	List<ZipVo> selectZipLow(String zip_high);
	

}
