package kr.co.mypet.hair.service;

import java.util.List;

import kr.co.mypet.hair.model.ZipVo;

public interface HairServiceInf {
	
	public List<ZipVo> selectZipHigh();

	public List<ZipVo> selectZipLow(String zip_high);
	
}
