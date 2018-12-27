package kr.co.mypet.sitter.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.common.model.PetkindVo;
import kr.co.mypet.sitter.model.FaqVo;
import kr.co.mypet.sitter.model.PetSitterVo;
import kr.co.mypet.sitter.model.SitterRevVo;
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

	@Override
	public List<PetkindVo> getPetKindList(String am_name) {
		return template.selectList("petSitter.getPetKindList", am_name);
	}

	@Override
	public int insertMyPet(MypetVo mypetVo) {
		return template.insert("petSitter.insertMypet", mypetVo);
	}

	@Override
	public int deleteMypet(String mypet_id) {
		return template.delete("petSitter.deleteMypet", mypet_id);
	}

	@Override
	public MypetVo getPetInfo(String myp_id) {
		return template.selectOne("petSitter.getPetInfo", myp_id);
	}

	@Override
	public int insertReservation(Map<String, Object> param) {
		return template.insert("petSitter.insertReservation", param);
	}

	@Override
	public List<SitterRevVo> getReviewList(Map<String, Object> param) {
		return template.selectList("petSitter.getReviewList", param);
	}

	@Override
	public int getReviewCnt(String stv_pst) {
		return template.selectOne("petSitter.getReviewCnt", stv_pst);
	}

	@Override
	public int insertReview(Map<String, Object> param) {
		return template.insert("petSitter.insertReview", param);
	}

	@Override
	public int updateReview(Map<String, Object> param) {
		return template.update("petSitter.updateReview", param);
	}

	@Override
	public int deleteReview(String stv_id) {
		return template.delete("petSitter.deleteReview", stv_id);
	}

	@Override
	public int insertSitterTo(PetSitterVo pstVo) {
		return template.insert("petSitter.insertSitterTo", pstVo);
	}	
}
