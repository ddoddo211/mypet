package kr.co.mypet.hair.dao;

import java.util.List;
import java.util.Map;

import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.hair.model.BookmarkVo;
import kr.co.mypet.hair.model.HairBoardVo;
import kr.co.mypet.hair.model.HairResVo;
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

}
