package kr.co.mypet.sitter.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.sitter.model.FaqVo;
import kr.co.mypet.sitter.model.PetSitterVo;
import kr.co.mypet.sitter.model.ZipVo;

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

	@Override
	public List<ZipVo> zipList() {
		return template.selectList("petSitter.petSitterZip");
	}

	@Override
	public PetSitterVo petToHomeDetail(String pst_id) {
		return template.selectOne("petSitter.petToHomeDetail", pst_id);
	}

	@Override
	public List<FaqVo> getFaqList() {
		return template.selectList("petSitter.getFaqList");
	}

	@Override
	public FaqVo getFaqOne(String psf_id) {
		return template.selectOne("petSitter.getFaqOne", psf_id);
	}

	@Override
	public int memAddrUpdate(Map<String, Object> param) {
		return template.update("petSitter.memAddrUpdate", param);
	}

	@Override
	public List<MypetVo> getMypetList(String mem_id) {
		return template.selectList("petSitter.getMypetList", mem_id);
	}	
}
