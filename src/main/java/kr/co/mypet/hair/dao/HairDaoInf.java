package kr.co.mypet.hair.dao;

import java.util.List;
import java.util.Map;

import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.hair.model.BookmarkVo;
import kr.co.mypet.hair.model.HairBoardVo;
import kr.co.mypet.hair.model.HairResVo;
import kr.co.mypet.hair.model.HairShopApplyVo;
import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.hair.model.PetStyleVo;
import kr.co.mypet.sitter.model.ZipVo;


public interface HairDaoInf {

	List<ZipVo> selectZipHigh();

	List<ZipVo> selectZipLow(String zip_high);

	List<HairShopVo> selectHairShopAll();
	
	
	public List<HairShopVo> selectHairShopLoc(String has_addr);
	
	HairShopVo selectShop(String has_id);
	
	List<HairBoardVo> selectReview(String hbrd_has);
	
	List<PetStyleVo> selectStyleList(String pts_has);
	List<PetStyleVo> selectStyleListAll(String pts_has);

	int insertHairBoard(HairBoardVo hairBoardVo);
	
	int insertBookMark(BookmarkVo bmVo);
	
	int bmDup (BookmarkVo bmVo);

	List<HairResVo> selRes(HairResVo hrVo);

	List<MypetVo> selectMypet(String myp_mem);

	int insertRev(HairResVo hairResVo);

	List<HairResVo> selectRev(String mem_id);

	PetStyleVo selectStyle(String pts_id);

	List<BookmarkVo> selectBookMark(String mem_id);

	List<HairBoardVo> selectAsk(String mem_id);

	List<HairResVo> selectRevCom(Map<Object, Object> param);
	
	int revComCnt(String mem_id);
	
	int insertReview(HairBoardVo hbVo);

	Map<String, Object> getScore(String has_id);

	int updateScore(HairShopVo hsVo);

	int deleteBm(String bmk_id);

	HairShopVo selectShopByMemId(String mem_id);

	List<HairBoardVo> selectAskByHasIdNA(String has_id);

	List<HairBoardVo> selectAskByHasIdYA(String has_id);

	int insertAskR(HairBoardVo hbVo);

	List<HairResVo> selectRespRev(String has_id);

	int updateRevStat(HairResVo hrVo);

	List<HairResVo> selectOgRev(String has_id);

	int updateShopInfo(HairShopVo hsVo);

	int updateStyle(PetStyleVo psVo);

	int insertStyle(PetStyleVo psVo);
	
	int insertHairShopApply(HairShopApplyVo hsaVo);
	
	HairShopApplyVo selectHsaById(String hsa_mem);

	List<HairShopApplyVo> selectHairShopApply();

	int insertHairShop(HairShopApplyVo hsaVo);

	int updateHairShopApply(HairShopApplyVo hsaVo);

	int updateMember(String hsa_mem);

	int updateHairShop(HairShopVo hsVo);

	List<HairShopVo> selectHairShopAllR();

}
