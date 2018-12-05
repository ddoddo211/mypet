package kr.co.mypet.sitter.dao;

import java.util.List;

import kr.co.mypet.sitter.model.PetSitterVo;

public interface SitterDaoInf {
	
	List<PetSitterVo> petNoticeList();

	int petRevCnt(String stv_pst);
}
