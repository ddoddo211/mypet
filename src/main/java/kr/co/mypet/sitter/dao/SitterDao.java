package kr.co.mypet.sitter.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.mypet.sitter.model.PetSitterVo;

@Repository
public class SitterDao implements SitterDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<PetSitterVo> petNoticeList() {
		return template.selectList("petSitter.petSitterToHomeList");
	}

	@Override
	public int petRevCnt(String stv_pst) {
		return template.selectOne("petSitter.petRevCnt", stv_pst);
	}	
}
