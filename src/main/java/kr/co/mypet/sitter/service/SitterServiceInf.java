package kr.co.mypet.sitter.service;

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

public interface SitterServiceInf {
	/**
	* Method : petNoticeList
	* 작성자 : pc24
	* 변경이력 : 2018-12-05
	* @return
	* Method 설명 : 펫시터 집에 맡기기 게시글 전제조회
	*/
	List<PetSitterVo> petNoticeList();
	
	int petRevCnt(String stv_pst);
	
	/**
	* Method : zipList
	* 작성자 : pc24
	* 변경이력 :
	* @return 2018-12-06
	* Method 설명 : 주소 리스트
	*/
	List<ZipVo> zipList();
	
	/**
	* Method : petToHomeDetail
	* 작성자 : pc24
	* 변경이력 : 2018-12-07
	* @param pst_id
	* @return 
	* Method 설명 : 펫시터 집에 맡기기 상세화면 데이터조회
	*/
	PetSitterVo petToHomeDetail(String pst_id);

	/**
	* Method : getFaqList
	* 작성자 : pc24
	* 변경이력 :
	* @return
	* Method 설명 : 펫시터 FAQ 전체 리스트 조회
	*/
	List<FaqVo> getFaqList();

	/**
	* Method : getFaqOne
	* 작성자 : pc24
	* 변경이력 :
	* @param psf_id
	* @return
	* Method 설명 : 선택한 FAQ 상세 조회 
	*/
	FaqVo getFaqOne(String psf_id);

	/**
	* Method : memAddrUpdate
	* 작성자 : pc24
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 회원의 주소 변경
	*/
	int memAddrUpdate(Map<String, Object> param);

	/**
	* Method : getMypetList
	* 작성자 : pc24
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 나의 반려동물 리스트 조회
	*/
	List<MypetVo> getMypetList(String mem_id);

	/**
	* Method : getPetKindList
	* 작성자 : pc24
	* 변경이력 :
	* @param am_name
	* @return
	* Method 설명 : 동물별 품종 리스트 조회
	*/
	List<PetkindVo> getPetKindList(String am_name);

	/**
	* Method : insertMyPet
	* 작성자 : pc24
	* 변경이력 :
	* @param mypetVo
	* @return
	* Method 설명 : 나의 반려동물 정보 추가
	*/
	int insertMyPet(MypetVo mypetVo);

	/**
	* Method : deleteMypet
	* 작성자 : pc24
	* 변경이력 :
	* @param mypet_id
	* @return
	* Method 설명 : 나의 반려동물 정보 삭제
	*/
	int deleteMypet(String mypet_id);

	/**
	* Method : getPetInfo
	* 작성자 : pc24
	* 변경이력 :
	* @param myp_id
	* @return
	* Method 설명 : 해당 반려동물 정보 가져오기
	*/
	MypetVo getPetInfo(String myp_id);

	/**
	* Method : insertReservation
	* 작성자 : pc24
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 반려동물 예약하기 처리
	*/
	int insertReservation(Map<String, Object> param);

	/**
	* Method : getReviewList
	* 작성자 : pc24
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 펫시터 집에 맡기기 게시글에 따른 후기글 리스트 조회
	*/
	Map<String, Object> getReviewList(Map<String, Object> param);
	
	/**
	* Method : getReviewCnt
	* 작성자 : pc24
	* 변경이력 :
	* @param stv_pst
	* @return
	* Method 설명 : 게시물에 따른 후기게시글의 갯수 
	*/
	int getReviewCnt(String stv_pst);

	/**
	* Method : insertReview
	* 작성자 : pc24
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 후기 게시글 등록
	*/
	int insertReview(Map<String, Object> param);

	/**
	* Method : updateReview
	* 작성자 : pc24
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 후기 게시글 수정 
	*/
	int updateReview(Map<String, Object> param);

	/**
	* Method : deleteReview
	* 작성자 : pc24
	* 변경이력 :
	* @param stv_id
	* @return
	* Method 설명 : 후기 게시글 삭제 
	*/
	int deleteReview(String stv_id);

	/**
	* Method : insertSitterTo
	* 작성자 : pc24
	* 변경이력 :
	* @param pstVo
	* @return
	* Method 설명 : 펫시터 집에 맡기기 게시글 등록 
	*/
	int insertSitterTo(PetSitterVo pstVo);

	/**
	* Method : updateFaq
	* 작성자 : pc24
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : faq 게시글 수정 처리 
	*/
	int updateFaq(Map<String, Object> param);

	/**
	* Method : deleteFaq
	* 작성자 : pc24
	* 변경이력 :
	* @param psf_id
	* @return
	* Method 설명 : faq 게시글 삭제 처리 
	*/
	int deleteFaq(String psf_id);

	/**
	* Method : insertFaq
	* 작성자 : pc24
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : faq 게시글 등록 처리 
	*/
	int insertFaq(Map<String, Object> param);

	/**
	* Method : petNoticeListDate
	* 작성자 : pc24
	* 변경이력 :
	* @return
	* Method 설명 : 펫시터 집에 맡기기 최신순 정렬 리스트
	*/
	List<PetSitterVo> petNoticeListDate();

	/**
	* Method : petNoticeListCount
	* 작성자 : pc24
	* 변경이력 :
	* @return
	* Method 설명 : 펫시터 집에 맡기기 조회순 정렬 리스트
	*/
	List<PetSitterVo> petNoticeListCount();

	/**
	* Method : petNoticeCountUpdate
	* 작성자 : pc24
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 펫시터 집에 맡기기 조회수 변경 처리 
	*/
	int petNoticeCountUpdate(Map<String, Object> param);

	/**
	* Method : petNoticeListSearch
	* 작성자 : pc24
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 펫시터 집에 맡기기 주소 검색 시 처리
	*/
	List<PetSitterVo> petNoticeListSearch(Map<String, Object> param);

	/**
	* Method : petNoticeListSearchDate
	* 작성자 : pc24
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 펫시터 집에 맡기기 주소 검색 후 최신순 정렬 처리
	*/
	List<PetSitterVo> petNoticeListSearchDate(Map<String, Object> param);

	/**
	* Method : petNoticeListSearchCount
	* 작성자 : pc24
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 펫시터 집에 맡기기 주소 검색 후 조회순 정렬 처리
	*/
	List<PetSitterVo> petNoticeListSearchCount(Map<String, Object> param);

	/**
	* Method : getReservationList
	* 작성자 : pc24
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 마이페이지 예약관리 예약내역리스트
	*/
	List<SitterResVo> getReservationList(String mem_id);

	/**
	* Method : deleteReservation
	* 작성자 : pc24
	* 변경이력 :
	* @param resId
	* @return
	* Method 설명 : 마이페이지 예약내역 취소처리
	*/
	int deleteReservation(String resId);

	/**
	* Method : getMyReviewList
	* 작성자 : pc24
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 나의 후기글 리스트
	*/
	List<SitterRevVo> getMyReviewList(String mem_id);

	/**
	* Method : getMaxFaq
	* 작성자 : pc24
	* 변경이력 :
	* @return
	* Method 설명 : FAQ 게시글 최대값 구하기
	*/
	String getMaxFaq();

	/**
	* Method : insertSupport
	* 작성자 : pc24
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 펫시터 지원하기 등록처리 
	*/
	int insertSupport(Map<String, Object> param);

	/**
	* Method : getMySupport
	* 작성자 : pc24
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 나의 지원내역 조회 
	*/
	SitterAppVo getMySupport(String mem_id);

	/**
	* Method : deleteSupport
	* 작성자 : pc24
	* 변경이력 :
	* @param sta_id
	* @return
	* Method 설명 : 나의 지원내역 취소처리 
	*/
	int deleteSupport(String sta_id);

	/**
	* Method : updateMypetInfo
	* 작성자 : pc24
	* 변경이력 :
	* @param mypetVo
	* @return
	* Method 설명 : 나의 반려동물 정보 수정 처리 
	*/
	int updateMypetInfo(MypetVo mypetVo);

	/**
	* Method : getReservationListAll
	* 작성자 : pc24
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 관리자 마이페이지 전체 예약 내역 조회 
	*/
	List<SitterResVo> getReservationListAll(PageVo pageVo);

	/**
	* Method : getReservationListCount
	* 작성자 : pc24
	* 변경이력 :
	* @return
	* Method 설명 : 관리자 마이페이지 전체 예약 수
	*/
	int getReservationListCount();

	/**
	* Method : getSupportListAll
	* 작성자 : pc24
	* 변경이력 :
	* @return
	* Method 설명 : 관리자 마이페이지 전체 지원리스트
	*/
	List<SitterAppVo> getSupportListAll(PageVo pageVo);

	/**
	* Method : getSupportListCount
	* 작성자 : pc24
	* 변경이력 :
	* @return
	* Method 설명 : 관리자 마이페이지 전체 지원 수 
	*/
	int getSupportListCount();

	/**
	* Method : updateSupportSuc
	* 작성자 : pc24
	* 변경이력 :
	* @param string
	* @return
	* Method 설명 : 관리자 마이페이지 지원자 합격 처리 
	*/
	int updateSupportSuc(String string);

	/**
	* Method : updateSupportFile
	* 작성자 : pc24
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 :  지원자 테이블의 파일 경로 삽입
	*/
	int updateSupportFile(Map<String, Object> param);

	/**
	* Method : getMySitterToCount
	* 작성자 : pc24
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 펫시터 집에 맡기기 나의 글 갯수
	*/
	int getMySitterToCount(String mem_id);

	/**
	* Method : updateMemeberSit
	* 작성자 : pc24
	* 변경이력 :
	* @param string
	* @return
	* Method 설명 : 펫시터 지원 합격 시 권한 수정 
	*/
	int updateMemeberSit(String string);

	/**
	* Method : deleteMySitterTo
	* 작성자 : pc24
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 펫시터 집에 맡기기 나의 게시글 삭제 
	*/
	int deleteMySitterTo(String mem_id);

	/**
	* Method : getPetsitterChk
	* 작성자 : pc24
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 현재 선택한 펫시터 집에 맡기기 게시글의 이용여부확인 
	*/
	int getPetsitterChk(Map<String, Object> map);

	/**
	* Method : deleteADReservation
	* 작성자 : pc24
	* 변경이력 :
	* @param date
	* @return
	* Method 설명 : 펫시터 예약관리 -> 현재 시간보다 이전날짜 예약내역 일괄 삭제
	*/
	int deleteADReservation(String date);
	
	/**
	* Method : getReViewListAll
	* 작성자 : pc24
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 관리자 마이페이지 게시글관리 -> 후기글 전체 조회
	*/
	public Map<String, Object> getReViewListAll(PageVo pageVo);
	
	/**
	* Method : getReViewAllCnt
	* 작성자 : pc24
	* 변경이력 :
	* @return
	* Method 설명 : 관리자 마이페이지 게시글관리 -> 전체 후기글 갯수 
	*/
	int getReViewAllCnt();

	/**
	* Method : getPetSitterToListAll
	* 작성자 : pc24
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 관리자 마이페이지 게시글관리 -> 펫시터 집에 맡기기 리스트
	*/
	Map<String, Object> getPetSitterToListAll(PageVo pageVo);
	
	/**
	* Method : getPetSitterToAllCnt
	* 작성자 : pc24
	* 변경이력 :
	* @return
	* Method 설명 : 관리자 마이페이지 게시글관리 -> 전체 펫시터 집에 맡기기 리스트 갯수
	*/
	int getPetSitterToAllCnt();

	/**
	* Method : deleteSitterTo
	* 작성자 : pc24
	* 변경이력 :
	* @param pst_id
	* @return
	* Method 설명 : 관리자 마이페이지 게시글 관리 -> 펫시터 집에 맡기기 리스트 중 선택삭제 
	*/
	int deleteSitterTo(String pst_id);

	/**
	* Method : getPetListAll
	* 작성자 : pc24
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 관리자 마이페이지 반려동물 관리 -> 반려동물 전체 리스트 조회
	*/
	Map<String, Object> getPetListAll(PageVo pageVo);
	
	/**
	* Method : getPetListAllCnt
	* 작성자 : pc24
	* 변경이력 :
	* @return
	* Method 설명 : 관리자 마이페이지 반려동물 관리 -> 반려동물 전체 리스트 갯수 
	*/
	int getPetListAllCnt();
}
