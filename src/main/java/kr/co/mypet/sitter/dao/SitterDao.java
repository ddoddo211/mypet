package kr.co.mypet.sitter.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.common.model.PageVo;
import kr.co.mypet.common.model.PetkindVo;
import kr.co.mypet.sitter.model.FaqVo;
import kr.co.mypet.sitter.model.PetSitterVo;
import kr.co.mypet.sitter.model.SitterAppVo;
import kr.co.mypet.sitter.model.SitterResVo;
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

	@Override
	public int updateFaq(Map<String, Object> param) {
		return template.update("petSitter.updateFaq", param);
	}

	@Override
	public int deleteFaq(String psf_id) {
		return template.delete("petSitter.deleteFaq", psf_id);
	}

	@Override
	public int insertFaq(Map<String, Object> param) {
		return template.insert("petSitter.insertFaq", param);
	}

	@Override
	public List<PetSitterVo> petNoticeListDate() {
		return template.selectList("petSitter.petNoticeListDate");
	}

	@Override
	public List<PetSitterVo> petNoticeListCount() {
		return template.selectList("petSitter.petNoticeListCount");
	}

	@Override
	public int petNoticeCountUpdate(Map<String, Object> param) {
		return template.update("petSitter.petNoticeCountUpdate", param);
	}

	@Override
	public List<PetSitterVo> petNoticeListSearch(Map<String, Object> param) {
		return template.selectList("petSitter.petNoticeListSearch", param);
	}

	@Override
	public List<PetSitterVo> petNoticeListSearchDate(Map<String, Object> param) {
		return template.selectList("petSitter.petNoticeListSearchDate", param);
	}

	@Override
	public List<PetSitterVo> petNoticeListSearchCount(Map<String, Object> param) {
		return template.selectList("petSitter.petNoticeListSearchCount", param);
	}

	@Override
	public List<SitterResVo> getReservationList(String mem_id) {
		return template.selectList("petSitter.getReservationList", mem_id);
	}

	@Override
	public int deleteReservation(String resId) {
		return template.delete("petSitter.deleteReservation", resId);
	}

	@Override
	public List<SitterRevVo> getMyReviewList(String mem_id) {
		return template.selectList("petSitter.getMyReviewList", mem_id);
	}

	@Override
	public String getMaxFaq() {
		return template.selectOne("petSitter.getMaxFaq");
	}

	@Override
	public int insertSupport(Map<String, Object> param) {
		return template.insert("petSitter.insertSupport", param);
	}

	@Override
	public SitterAppVo getMySupport(String mem_id) {
		return template.selectOne("petSitter.getMySupport", mem_id);
	}

	@Override
	public int deleteSupport(String sta_id) {
		return template.delete("petSitter.deleteSupport", sta_id);
	}

	@Override
	public int updateMypetInfo(MypetVo mypetVo) {
		return template.update("petSitter.updateMypetInfo", mypetVo);
	}

	@Override
	public List<SitterResVo> getReservationListAll(PageVo pageVo) {
		return template.selectList("petSitter.getReservationListAll", pageVo);
	}

	@Override
	public int getReservationListCount() {
		return template.selectOne("petSitter.getReservationListCount");
	}

	@Override
	public List<SitterAppVo> getSupportListAll(PageVo pageVo) {
		return template.selectList("petSitter.getSupportListAll", pageVo);
	}

	@Override
	public int getSupportListCount() {
		return template.selectOne("petSitter.getSupportListCount");
	}

	@Override
	public int updateSupportSuc(String string) {
		return template.update("petSitter.updateSupportSuc", string);
	}

	@Override
	public int updateSupportFile(Map<String, Object> param) {
		return template.update("petSitter.updateSupportFile", param);
	}

	@Override
	public int getMySitterToCount(String mem_id) {
		return template.selectOne("petSitter.getMySitterToCount", mem_id);
	}

	@Override
	public int updateMemberSit(String string) {
		return template.update("petSitter.updateMemeberSit", string);
	}

	@Override
	public int deleteMySitterTo(String mem_id) {
		return template.update("petSitter.deleteMySitterTo", mem_id);
	}

	@Override
	public int getPetsitterChk(Map<String, Object> map) {
		return template.selectOne("petSitter.getPetSitterChk", map);
	}

	@Override
	public int deleteADReservation(String date) {
		return template.delete("petSitter.deleteADReservation", date);
	}	
	
	@Override
	public List<SitterRevVo> getReViewListAll(PageVo pageVo){
		return template.selectList("petSitter.getReViewListAll", pageVo);
	}

	@Override
	public int getReViewAllCnt() {
		return template.selectOne("petSitter.getReViewAllCnt");
	}

	@Override
	public List<PetSitterVo> getPetSitterToListAll(PageVo pageVo) {
		return template.selectList("petSitter.getPetSitterToListAll", pageVo);
	}

	@Override
	public int getPetSitterToAllCnt() {
		return template.selectOne("petSitter.getPetSitterToAllCnt");
	}

	@Override
	public int deleteSitterTo(String pst_id) {
		return template.update("petSitter.deleteSitterTo", pst_id);
	}

	@Override
	public List<MypetVo> getPetListAll(PageVo pageVo) {
		return template.selectList("petSitter.getPetListAll", pageVo);
	}

	@Override
	public int getPetListAllCnt() {
		return template.selectOne("petSitter.getPetListAllCnt");
	}

	@Override
	public int getPstReviewAllCnt(String pst_id) {
		return template.selectOne("petSitter.getPstReviewAllCnt", pst_id);
	}

	@Override
	public int getPstReviceScore(String pst_id) {
		return template.selectOne("petSitter.getPstReviewScore", pst_id);
	}

	@Override
	public int updatePetsitterScore(Map<String, Object> param) {
		return template.update("petSitter.updatePetsitterScore", param);
	}

	@Override
	public int insertPetsitterChk(Map<String, Object> param) {
		return template.insert("petSitter.insertPetsitterChk", param);
	}

	@Override
	public int getMySupportCnt(String mem_id) {
		return template.selectOne("petSitter.getMySupportCnt", mem_id);
	}
}
