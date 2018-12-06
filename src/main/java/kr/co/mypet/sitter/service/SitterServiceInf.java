package kr.co.mypet.sitter.service;

import java.util.List;

import kr.co.mypet.sitter.model.PetSitterVo;
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
}
