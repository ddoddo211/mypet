package kr.co.mypet.sitter.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.sitter.dao.SitterDaoInf;
import kr.co.mypet.sitter.model.FaqVo;
import kr.co.mypet.sitter.model.PetSitterVo;
import kr.co.mypet.sitter.model.ZipVo;

@Service
public class SitterService implements SitterServiceInf {
	
	@Resource(name="sitterDao")
	private SitterDaoInf sitterDao;

	@Override
	public List<PetSitterVo> petNoticeList() {
		return sitterDao.petNoticeList();
	}

	@Override
	public int petRevCnt(String stv_pst) {
		return sitterDao.petRevCnt(stv_pst);
	}

	@Override
	public List<ZipVo> zipList() {
		return sitterDao.zipList();
	}

	@Override
	public PetSitterVo petToHomeDetail(String pst_id) {
		return sitterDao.petToHomeDetail(pst_id);
	}

	@Override
	public List<FaqVo> getFaqList() {
		return sitterDao.getFaqList();
	}

	@Override
	public FaqVo getFaqOne(String psf_id) {
		return sitterDao.getFaqOne(psf_id);
	}

	@Override
	public int memAddrUpdate(Map<String, Object> param) {
		return sitterDao.memAddrUpdate(param);
	}

	@Override
	public List<MypetVo> getMypetList(String mem_id) {
		return sitterDao.getMypetList(mem_id);
	}
}
