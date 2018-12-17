package kr.co.mypet.hair.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.mypet.hair.model.ZipVo;

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
	
}
