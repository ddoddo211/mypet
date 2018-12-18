package kr.co.mypet.sitter.dao;

import java.util.List;
import java.util.Map;

import kr.co.mypet.insurance.model.MypetVo;
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

	int memAddrUpdate(Map<String, Object> param);

	List<MypetVo> getMypetList(String mem_id);
}
