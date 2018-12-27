package kr.co.mypet.sitter.service;

import java.util.List;
import java.util.Map;

import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.common.model.PetkindVo;
import kr.co.mypet.sitter.model.FaqVo;
import kr.co.mypet.sitter.model.PetSitterVo;
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
	
	
}
