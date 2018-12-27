package kr.co.mypet.sitter.dao;

import java.util.List;
import java.util.Map;

import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.common.model.PetkindVo;
import kr.co.mypet.sitter.model.FaqVo;
import kr.co.mypet.sitter.model.PetSitterVo;
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
}
