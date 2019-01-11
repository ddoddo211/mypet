package kr.co.mypet.sitter.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.common.model.PageVo;
import kr.co.mypet.common.model.PetkindVo;
import kr.co.mypet.sitter.dao.SitterDaoInf;
import kr.co.mypet.sitter.model.FaqVo;
import kr.co.mypet.sitter.model.PetSitterVo;
import kr.co.mypet.sitter.model.SitterAppVo;
import kr.co.mypet.sitter.model.SitterResVo;
import kr.co.mypet.sitter.model.SitterRevVo;
import kr.co.mypet.sitter.model.ZipVo;

@Service
public class SitterService implements SitterServiceInf {
	
	@Resource(name="sitterDao")
	private SitterDaoInf sitterDao;

	@Override
	public List<PetSitterVo> petNoticeList() {
		return sitterDao.petNoticeList();
	}

	@Override
	public int petRevCnt(String stv_pst) {
		return sitterDao.petRevCnt(stv_pst);
	}

	@Override
	public List<ZipVo> zipList() {
		return sitterDao.zipList();
	}

	@Override
	public PetSitterVo petToHomeDetail(String pst_id) {
		return sitterDao.petToHomeDetail(pst_id);
	}

	@Override
	public List<FaqVo> getFaqList() {
		return sitterDao.getFaqList();
	}

	@Override
	public FaqVo getFaqOne(String psf_id) {
		return sitterDao.getFaqOne(psf_id);
	}

	@Override
	public int memAddrUpdate(Map<String, Object> param) {
		return sitterDao.memAddrUpdate(param);
	}

	@Override
	public List<MypetVo> getMypetList(String mem_id) {
		return sitterDao.getMypetList(mem_id);
	}

	@Override
	public List<PetkindVo> getPetKindList(String am_name) {
		return sitterDao.getPetKindList(am_name);
	}

	@Override
	public int insertMyPet(MypetVo mypetVo) {
		return sitterDao.insertMyPet(mypetVo);
	}

	@Override
	public int deleteMypet(String mypet_id) {
		return sitterDao.deleteMypet(mypet_id);
	}

	@Override
	public MypetVo getPetInfo(String myp_id) {
		return sitterDao.getPetInfo(myp_id);
	}

	@Override
	public int insertReservation(Map<String, Object> param) {
		return sitterDao.insertReservation(param);
	}

	@Override
	public Map<String, Object> getReviewList(Map<String, Object> param) {
		List<SitterRevVo> reviewList = sitterDao.getReviewList(param);
		
		String stv_pst = (String) param.get("stv_pst");
		
		Map<String, Object> map = new HashMap<>();
		map.put("stv_pst", stv_pst);
		
		int totalReviewCnt = sitterDao.getReviewCnt(stv_pst);
		int pageSize = (int) param.get("pageSize");
		int pageCnt = (int)Math.ceil(((double)totalReviewCnt/pageSize));
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("reviewList", reviewList);
		resultMap.put("pageCnt", pageCnt);
		
		return resultMap;
	}

	@Override
	public int getReviewCnt(String stv_pst) {
		return sitterDao.getReviewCnt(stv_pst);
	}

	@Override
	public int insertReview(Map<String, Object> param) {
		return sitterDao.insertReview(param);
	}

	@Override
	public int updateReview(Map<String, Object> param) {
		return sitterDao.updateReview(param);
	}

	@Override
	public int deleteReview(String stv_id) {
		return sitterDao.deleteReview(stv_id);
	}

	@Override
	public int insertSitterTo(PetSitterVo pstVo) {
		return sitterDao.insertSitterTo(pstVo);
	}

	@Override
	public int updateFaq(Map<String, Object> param) {
		return sitterDao.updateFaq(param);
	}

	@Override
	public int deleteFaq(String psf_id) {
		return sitterDao.deleteFaq(psf_id);
	}

	@Override
	public int insertFaq(Map<String, Object> param) {
		return sitterDao.insertFaq(param);
	}

	@Override
	public List<PetSitterVo> petNoticeListDate() {
		return sitterDao.petNoticeListDate();
	}

	@Override
	public List<PetSitterVo> petNoticeListCount() {
		return sitterDao.petNoticeListCount();
	}

	@Override
	public int petNoticeCountUpdate(Map<String, Object> param) {
		return sitterDao.petNoticeCountUpdate(param);
	}

	@Override
	public List<PetSitterVo> petNoticeListSearch(Map<String, Object> param) {
		return sitterDao.petNoticeListSearch(param);
	}

	@Override
	public List<PetSitterVo> petNoticeListSearchDate(Map<String, Object> param) {
		return sitterDao.petNoticeListSearchDate(param);
	}

	@Override
	public List<PetSitterVo> petNoticeListSearchCount(Map<String, Object> param) {
		return sitterDao.petNoticeListSearchCount(param);
	}

	@Override
	public List<SitterResVo> getReservationList(String mem_id) {
		return sitterDao.getReservationList(mem_id);
	}

	@Override
	public int deleteReservation(String resId) {
		return sitterDao.deleteReservation(resId);
	}

	@Override
	public List<SitterRevVo> getMyReviewList(String mem_id) {
		return sitterDao.getMyReviewList(mem_id);
	}

	@Override
	public String getMaxFaq() {
		return sitterDao.getMaxFaq();
	}

	@Override
	public int insertSupport(Map<String, Object> param) {
		return sitterDao.insertSupport(param);
	}

	@Override
	public SitterAppVo getMySupport(String mem_id) {
		return sitterDao.getMySupport(mem_id);
	}

	@Override
	public int deleteSupport(String sta_id) {
		return sitterDao.deleteSupport(sta_id);
	}

	@Override
	public int updateMypetInfo(MypetVo mypetVo) {
		return sitterDao.updateMypetInfo(mypetVo);
	}

	@Override
	public List<SitterResVo> getReservationListAll(PageVo pageVo) {
		return sitterDao.getReservationListAll(pageVo);
	}

	@Override
	public int getReservationListCount() {
		return sitterDao.getReservationListCount();
	}

	@Override
	public List<SitterAppVo> getSupportListAll(PageVo pageVo) {
		return sitterDao.getSupportListAll(pageVo);
	}

	@Override
	public int getSupportListCount() {
		return sitterDao.getSupportListCount();
	}

	@Override
	public int updateSupportSuc(String string) {
		return sitterDao.updateSupportSuc(string);
	}

	@Override
	public int updateSupportFile(Map<String, Object> param) {
		return sitterDao.updateSupportFile(param);
	}

	@Override
	public int getMySitterToCount(String mem_id) {
		return sitterDao.getMySitterToCount(mem_id);
	}

	@Override
	public int updateMemeberSit(String string) {
		return sitterDao.updateMemberSit(string);
	}

	@Override
	public int deleteMySitterTo(String mem_id) {
		return sitterDao.deleteMySitterTo(mem_id);
	}

	@Override
	public int getPetsitterChk(Map<String, Object> map) {
		return sitterDao.getPetsitterChk(map);
	}

	@Override
	public int deleteADReservation(String date) {
		return sitterDao.deleteADReservation(date);
	}
	
	@Override
	public Map<String, Object> getReViewListAll(PageVo pageVo){
		
		List<SitterRevVo> reviewListAll = sitterDao.getReViewListAll(pageVo);
		
		int totalReviewCnt = sitterDao.getReViewAllCnt();
		int pageSize = pageVo.getPageSize();
		int pageCnt = (int)Math.ceil(((double)totalReviewCnt/pageSize));
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("reviewListAll", reviewListAll);
		resultMap.put("pageCnt", pageCnt);
		
		return resultMap;
	}

	@Override
	public int getReViewAllCnt() {
		return sitterDao.getReViewAllCnt();
	}

	@Override
	public Map<String, Object> getPetSitterToListAll(PageVo pageVo) {
		
		List<PetSitterVo> petSitterListAll = sitterDao.getPetSitterToListAll(pageVo);
		
		int totalPetSitterCnt = sitterDao.getPetSitterToAllCnt();
		int pageSize = pageVo.getPageSize();
		int pageCnt = (int)Math.ceil(((double)totalPetSitterCnt/pageSize));
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("petSitterToListAll", petSitterListAll);
		resultMap.put("pageCnt", pageCnt);
		
		return resultMap;
	}

	@Override
	public int getPetSitterToAllCnt() {
		return sitterDao.getPetSitterToAllCnt();
	}

	@Override
	public int deleteSitterTo(String pst_id) {
		return sitterDao.deleteSitterTo(pst_id);
	}

	@Override
	public Map<String, Object> getPetListAll(PageVo pageVo) {
		List<MypetVo> petListAll = sitterDao.getPetListAll(pageVo);
		
		int totalCnt = sitterDao.getPetListAllCnt();
		int pageSize = pageVo.getPageSize();
		int pageCnt = (int)Math.ceil(((double)totalCnt/pageSize));
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("petListAll", petListAll);
		resultMap.put("pageCnt", pageCnt);
		
		return resultMap;
	}

	@Override
	public int getPetListAllCnt() {
		return sitterDao.getPetListAllCnt();
	}

	@Override
	public int getPstReviewAllCnt(String pst_id) {
		return sitterDao.getPstReviewAllCnt(pst_id);
	}

	@Override
	public int getPstReviewScore(String pst_id) {
		return sitterDao.getPstReviceScore(pst_id);
	}

	@Override
	public int updatePetsitterScore(Map<String, Object> param) {
		return sitterDao.updatePetsitterScore(param);
	}

	@Override
	public int insertPetsitterChk(Map<String, Object> param) {
		return sitterDao.insertPetsitterChk(param);
	}
}
