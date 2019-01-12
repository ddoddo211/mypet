package kr.co.mypet.sitter.dao;

import java.util.List;
import java.util.Map;

import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.common.model.PageVo;
import kr.co.mypet.common.model.PetkindVo;
import kr.co.mypet.sitter.model.FaqVo;
import kr.co.mypet.sitter.model.PetSitterVo;
import kr.co.mypet.sitter.model.SitterAppVo;
import kr.co.mypet.sitter.model.SitterResVo;
import kr.co.mypet.sitter.model.SitterRevVo;
import kr.co.mypet.sitter.model.ZipVo;

public interface SitterDaoInf {
	
	List<PetSitterVo> petNoticeList();

	int petRevCnt(String stv_pst);

	List<ZipVo> zipList();

	PetSitterVo petToHomeDetail(String pst_id);

	List<FaqVo> getFaqList();

	FaqVo getFaqOne(String psf_id);

	int memAddrUpdate(Map<String, Object> param);

	List<MypetVo> getMypetList(String mem_id);

	List<PetkindVo> getPetKindList(String am_name);

	int insertMyPet(MypetVo mypetVo);

	int deleteMypet(String mypet_id);

	MypetVo getPetInfo(String myp_id);

	int insertReservation(Map<String, Object> param);

	List<SitterRevVo> getReviewList(Map<String, Object> param);

	int getReviewCnt(String stv_pst);

	int insertReview(Map<String, Object> param);

	int updateReview(Map<String, Object> param);

	int deleteReview(String stv_id);

	int insertSitterTo(PetSitterVo pstVo);

	int updateFaq(Map<String, Object> param);

	int deleteFaq(String psf_id);

	int insertFaq(Map<String, Object> param);

	List<PetSitterVo> petNoticeListDate();

	List<PetSitterVo> petNoticeListCount();

	int petNoticeCountUpdate(Map<String, Object> param);

	List<PetSitterVo> petNoticeListSearch(Map<String, Object> param);

	List<PetSitterVo> petNoticeListSearchDate(Map<String, Object> param);

	List<PetSitterVo> petNoticeListSearchCount(Map<String, Object> param);

	List<SitterResVo> getReservationList(String mem_id);

	int deleteReservation(String resId);

	List<SitterRevVo> getMyReviewList(String mem_id);

	String getMaxFaq();

	int insertSupport(Map<String, Object> param);

	SitterAppVo getMySupport(String mem_id);

	int deleteSupport(String sta_id);

	int updateMypetInfo(MypetVo mypetVo);

	List<SitterResVo> getReservationListAll(PageVo pageVo);

	int getReservationListCount();

	List<SitterAppVo> getSupportListAll(PageVo pageVo);

	int getSupportListCount();

	int updateSupportSuc(String string);

	int updateSupportFile(Map<String, Object> param);

	int getMySitterToCount(String mem_id);

	int updateMemberSit(String string);

	int deleteMySitterTo(String mem_id);

	int getPetsitterChk(Map<String, Object> map);

	int deleteADReservation(String date);
	
	public List<SitterRevVo> getReViewListAll(PageVo pageVo);

	int getReViewAllCnt();

	List<PetSitterVo> getPetSitterToListAll(PageVo pageVo);

	int getPetSitterToAllCnt();

	int deleteSitterTo(String pst_id);

	List<MypetVo> getPetListAll(PageVo pageVo);

	int getPetListAllCnt();

	int getPstReviewAllCnt(String pst_id);

	int getPstReviceScore(String pst_id);

	int updatePetsitterScore(Map<String, Object> param);

	int insertPetsitterChk(Map<String, Object> param);

	int getMySupportCnt(String mem_id);
}
