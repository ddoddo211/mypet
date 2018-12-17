package kr.co.mypet.hair.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.mypet.hair.dao.HairDaoInf;
import kr.co.mypet.hair.model.ZipVo;

@Service
public class HairService implements HairServiceInf {

		@Resource(name="hairDao")
		private HairDaoInf hairDao;

		@Override
		public List<ZipVo> selectZipHigh() {
			// TODO Auto-generated method stub
			return hairDao.selectZipHigh();
		}

		@Override
		public List<ZipVo> selectZipLow(String zip_high) {
			// TODO Auto-generated method stub
			return hairDao.selectZipLow(zip_high);
		}
}
