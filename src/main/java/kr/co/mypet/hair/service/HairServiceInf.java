package kr.co.mypet.hair.service;

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


public interface HairServiceInf {
	
	//주소 대분류 호출
	public List<ZipVo> selectZipHigh();
	
	//주소 소분류 호출
	public List<ZipVo> selectZipLow(String zip_high);
	
	//모든 헤어샵 호출
	public List<HairShopVo> selectHairShopAll();
	//모든 헤어샵 호출
	public List<HairShopVo> selectHairShopAllR();
	
	//지역의 헤어샵만 호출
	public List<HairShopVo> selectHairShopLoc(String has_addr);
	
	//클릭한 헤어샵만
	public HairShopVo selectShop(String has_id);
	
	//review 조회
	List<HairBoardVo> selectReview(String hbrd_has);
	
	//style list 조회
	List<PetStyleVo> selectStyleList(String pts_has);
	//style list 조회
	List<PetStyleVo> selectStyleListAll(String pts_has);
	
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

	
	//mem_id 를 이용해 즐겨찾기에 등록한 미용실 목록을 불러오는 메서드
	public List<BookmarkVo> selectBookMark(String mem_id);

	//mem_id 를 이용해 내가쓴 문의 내역을 확인하는 메서드
	public List<HairBoardVo> selectAsk(String mem_id);

	//완료된 예약건을 확인하는 메서드
	public List<HairResVo> selectRevCom(Map<Object, Object> param);
	
	//완료예약건 총갯수새기
	public int revComCnt(String mem_id);
	
	//후기 작성 insert
	public int insertReview(HairBoardVo hbVo);

	//가게 id를 이용해 총 리뷰갯수와 총 리뷰점수 합계를 구하는 method
	public Map<String, Object> getScore(String has_id);

	//리뷰작성시 동시에 해당 가게의 평점이 update 되는 메서드
	public int updateScore(HairShopVo hsVo);

	//북마크 삭제 메서드 (update)
	public int deleteBm(String bmk_id);

	// mem_id 를 이용하여 미용실의 정보를 가져오는 method
	public HairShopVo selectShopByMemId(String mem_id);

	//(미답변 목록)미용실 id를 이용하여 해당 미용실에 달려있는 문의를 모두 불러오는 메서드
	public List<HairBoardVo> selectAskByHasIdNA(String has_id);

	//(답변작성이 완료된) 문의내역 출력
	public List<HairBoardVo> selectAskByHasIdYA(String has_id);

	//문의에 대한 답변작성, 수정 method
	public int insertAskR(HairBoardVo hbVo);

	//접수된 예약건 확인
	public List<HairResVo> selectRespRev(String has_id);

	//접수된의뢰를 취소 or 접수하는 method
	public int updateRevStat(HairResVo hrVo);

	//진행중인 건수 확인
	public List<HairResVo> selectOgRev(String has_id);

	//미용실의 정보를 수정하는 methdo
	public int updateShopInfo(HairShopVo hsVo);

	//style 관리 목록에서 update 하기
	public int updateStyle(PetStyleVo psVo);
	
	//style insert
	public int insertStyle(PetStyleVo psVo);
	
	//insert hairShopApply
	public int insertHairShopApply(HairShopApplyVo hsaVo);
	
	//select apply hairshop 중에서 대기중인 사람 인지 아닌지
	public HairShopApplyVo selectHsaById(String hsa_mem);

	//hairshop 이 되기위해 지원한 모든사람들의 list
	public List<HairShopApplyVo> selectHairShopApply();

	//insertHairShop
	public int insertHairShop(HairShopApplyVo hsaVo);

	//updateHairShopApply
	public int updateHairShopApply(HairShopApplyVo hsaVo);

	//회원등급업
	public int updateMember(String hsa_mem);

	//미용실 정보 수정 method
	public int updateHairShop(HairShopVo hsVo);
	
}
