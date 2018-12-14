package kr.co.mypet.sitter.dao;

import java.util.List;

import kr.co.mypet.sitter.model.FaqVo;
import kr.co.mypet.sitter.model.PetSitterVo;
import kr.co.mypet.sitter.model.ZipVo;

public interface SitterDaoInf {
	
	List<PetSitterVo> petNoticeList();

	int petRevCnt(String stv_pst);

	List<ZipVo> zipList();

	PetSitterVo petToHomeDetail(String pst_id);

	List<FaqVo> getFaqList();

	FaqVo getFaqOne(String psf_id);
}
