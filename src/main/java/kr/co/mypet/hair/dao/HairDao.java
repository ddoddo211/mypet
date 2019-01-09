package kr.co.mypet.hair.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.hair.model.BookmarkVo;
import kr.co.mypet.hair.model.HairBoardVo;
import kr.co.mypet.hair.model.HairResVo;
import kr.co.mypet.hair.model.HairShopApplyVo;
import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.hair.model.PetStyleVo;
import kr.co.mypet.sitter.model.ZipVo;


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

	@Override
	public List<HairShopVo> selectHairShopAll() {
		
		List<HairShopVo> hairShopList = template.selectList("petHair.shopSelectAll");
		
		return hairShopList;
	}	
	
	@Override
	public List<HairShopVo> selectHairShopLoc(String has_addr) {
		
		List<HairShopVo> hairShopList = template.selectList("petHair.selectHairShopLoc", has_addr);
		
		
		return hairShopList;
	}

	@Override
	public HairShopVo selectShop(String has_id) {
		HairShopVo hairShopVo = template.selectOne("petHair.selectShop", has_id);
		return hairShopVo;
	}

	@Override
	public List<HairBoardVo> selectReview(String hbrd_has) {
		List<HairBoardVo> reviewList = template.selectList("petHair.selectReview", hbrd_has);
		return reviewList;
	}

	@Override
	public List<PetStyleVo> selectStyleList(String pts_has) {
		List<PetStyleVo> styleList = template.selectList("petHair.selectStyle", pts_has);
		return styleList;
	}
	@Override
	public List<PetStyleVo> selectStyleListAll(String pts_has) {
		List<PetStyleVo> styleList = template.selectList("petHair.selectStyleAll", pts_has);
		return styleList;
	}

	//insert 성공하면 1(갯수), 실패하면 0
	@Override
	public int insertHairBoard(HairBoardVo hairBoardVo) {
		int chk = 0;
		
		chk = template.insert("petHair.insertHairBoard", hairBoardVo);
		
		
		
		return chk;
	}

	@Override
	public int insertBookMark(BookmarkVo bmVo) {
		int chk = template.insert("petHair.insertBookMark",bmVo);
		return chk;
	}

	@Override
	public int bmDup(BookmarkVo bmVo) {
		int chk = template.selectOne("petHair.bmDup", bmVo);
		return chk;
	}

	@Override
	public List<HairResVo> selRes(HairResVo hrVo) {
		List<HairResVo> hrList = template.selectList("petHair.selRes",hrVo);
		return hrList;
	}

	@Override
	public List<MypetVo> selectMypet(String myp_mem) {
		List<MypetVo> selChk = template.selectList("petHair.selectMypet", myp_mem);
		return selChk;
	}

	@Override
	public int insertRev(HairResVo hairResVo) {
		int chk = template.insert("petHair.insertRev",hairResVo);
		return chk;
	}

	@Override
	public List<HairResVo> selectRev(String mem_id) {
		List<HairResVo> hrList = template.selectList("petHair.selectRev", mem_id);
		return hrList;
	}

	@Override
	public PetStyleVo selectStyle(String pts_id) {
		PetStyleVo psVo = template.selectOne("petHair.selectStyleOne", pts_id);
		return psVo;
	}

	@Override
	public List<BookmarkVo> selectBookMark(String mem_id) {
		
		List<BookmarkVo> bmList = template.selectList("petHair.selectBookMark", mem_id);
		
		return bmList;
	}

	@Override
	public List<HairBoardVo> selectAsk(String mem_id) {
		List<HairBoardVo> askList = template.selectList("petHair.selectAsk", mem_id);
		return askList;
	}

	@Override
	public List<HairResVo> selectRevCom(Map<Object, Object> param) {
		
		List<HairResVo> resList = template.selectList("petHair.selectRevCom", param);
		
		return resList;
	}

	@Override
	public int revComCnt(String mem_id) {
		int cnt = template.selectOne("petHair.revComCnt", mem_id);
		System.out.println("dao cnt : " + cnt);
		return cnt;
	}

	@Override
	public int insertReview(HairBoardVo hbVo) {
		int chk = template.insert("petHair.insertReview", hbVo);
		return chk;
	}

	@Override
	public Map<String, Object> getScore(String has_id) {
		
		Map<String, Object> scoreMap = template.selectMap("petHair.getScore", has_id,"dodo");
		return scoreMap;
	}

	@Override
	public int updateScore(HairShopVo hsVo) {
		int chk = template.update("petHair.updateScore", hsVo);
		return chk;
	}

	@Override
	public int deleteBm(String bmk_id) {
		int chk = template.update("petHair.deleteBm", bmk_id);
		return chk;
	}

	@Override
	public HairShopVo selectShopByMemId(String mem_id) {
		HairShopVo haVo = template.selectOne("petHair.selectShopByMemId", mem_id);
		return haVo;
	}

	@Override
	public List<HairBoardVo> selectAskByHasIdNA(String has_id) {
		List<HairBoardVo> askListNa = template.selectList("petHair.selectAskByHasIdNA", has_id);
		return askListNa;
	}

	@Override
	public List<HairBoardVo> selectAskByHasIdYA(String has_id) {
		List<HairBoardVo> askListYa = template.selectList("petHair.selectAskByHasIdYA", has_id);
		return askListYa;
	}

	@Override
	public int insertAskR(HairBoardVo hbVo) {
		int chk = template.update("petHair.insertAskR", hbVo);
		return chk;
	}

	@Override
	public List<HairResVo> selectRespRev(String has_id) {
		
		List<HairResVo> hairResList = template.selectList("petHair.selectRespRev", has_id);
		
		
		return hairResList;
	}

	@Override
	public int updateRevStat(HairResVo hrVo) {
		int chk = template.update("petHair.updateRevStat", hrVo);
		return chk;
	}

	@Override
	public List<HairResVo> selectOgRev(String has_id) {
		List<HairResVo> hrList = template.selectList("petHair.selectOgRev", has_id);
		return hrList;
	}

	@Override
	public int updateShopInfo(HairShopVo hsVo) {
		int chk = template.update("petHair.updateShopInfo", hsVo);
		return chk;
	}

	@Override
	public int updateStyle(PetStyleVo psVo) {
		int chk = template.update("petHair.updateStyle", psVo);
		return chk;
	}

	@Override
	public int insertStyle(PetStyleVo psVo) {
		int chk = template.insert("petHair.insertStyle", psVo);
		return chk;
	}

	@Override
	public int insertHairShopApply(HairShopApplyVo hsaVo) {
		int chk = template.insert("petHair.insertHairShopApply", hsaVo);
		return chk;
	}

	@Override
	public HairShopApplyVo selectHsaById(String hsa_mem) {
		HairShopApplyVo hsaVo = template.selectOne("petHair.selectHsaById", hsa_mem);
		return hsaVo;
	}

	@Override
	public List<HairShopApplyVo> selectHairShopApply() {
		
		List<HairShopApplyVo> hsaList = template.selectList("petHair.selectHairShopApply");
		
		
		return hsaList;
	}

	@Override
	public int insertHairShop(HairShopApplyVo hsaVo) {
		
		int chk = template.insert("petHair.insertHairShop", hsaVo);
		
		return chk;
	}

	@Override
	public int updateHairShopApply(HairShopApplyVo hsaVo) {
		
		int chk = template.update("petHair.updateHairShopApply", hsaVo);
		
		return chk;
	}

	@Override
	public int updateMember(String hsa_mem) {
		int chk = template.update("petHair.updateMember", hsa_mem);
		return 0;
	}

	@Override
	public int updateHairShop(HairShopVo hsVo) {
		int chk  = template.update("petHair.updateHairShop", hsVo);
		return chk;
	}

	@Override
	public List<HairShopVo> selectHairShopAllR() {
			List<HairShopVo> hairShopList = template.selectList("petHair.shopSelectAllR");
		
		return hairShopList;
	}
	
}
