package kr.co.mypet.hair.service;

import java.util.List;

import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.hair.model.BookmarkVo;
import kr.co.mypet.hair.model.HairBoardVo;
import kr.co.mypet.hair.model.HairResVo;
import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.hair.model.PetStyleVo;
import kr.co.mypet.sitter.model.ZipVo;


public interface HairServiceInf {
	
	//주소 대분류 호출
	public List<ZipVo> selectZipHigh();
	
	//주소 소분류 호출
	public List<ZipVo> selectZipLow(String zip_high);
	
	//모든 헤어샵 호출
	public List<HairShopVo> selectHairShopAll();
	
	//지역의 헤어샵만 호출
	public List<HairShopVo> selectHairShopLoc(String has_addr);
	
	//클릭한 헤어샵만
	public HairShopVo selectShop(String has_id);
	
	//review 조회
	List<HairBoardVo> selectReview(String hbrd_has);
	
	//style list 조회
	List<PetStyleVo> selectStyleList(String pts_has);
	
	//ask insert
	int insertHairBoard(HairBoardVo hairBoardVo);
	
	//insert bookmark
	int insertBookMark(BookmarkVo bmVo);
	
	//bookmart 중복체크
	int bmDup (BookmarkVo bmVo);

	//예약내역 전체조회
	public List<HairResVo> selRes(HairResVo hrVo);

	//나의펫 조회
	public List<MypetVo> selectMypet(String myp_mem);

	//예약 생성
	public int insertRev(HairResVo hairResVo);

	//예약 내역 선택 (멤버 id를 보냄)
	public List<HairResVo> selectRev(String mem_id);

	//스타일의 정보를 한개선택
	public PetStyleVo selectStyle(String pts_id);
	
}
