package kr.co.mypet.hair.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.mypet.hair.dao.HairDaoInf;
import kr.co.mypet.hair.model.BookmarkVo;
import kr.co.mypet.hair.model.HairBoardVo;
import kr.co.mypet.hair.model.HairResVo;
import kr.co.mypet.hair.model.HairShopVo;
import kr.co.mypet.hair.model.PetStyleVo;
import kr.co.mypet.sitter.model.ZipVo;

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

		@Override
		public List<HairShopVo> selectHairShopAll() {
			// TODO Auto-generated method stub
			return hairDao.selectHairShopAll();
		}

		@Override
		public List<HairShopVo> selectHairShopLoc(String has_addr) {
			// TODO Auto-generated method stub
			return hairDao.selectHairShopLoc(has_addr);
		}

		@Override
		public HairShopVo selectShop(String has_id) {
			// TODO Auto-generated method stub
			return hairDao.selectShop(has_id);
		}

		@Override
		public List<HairBoardVo> selectReview(String hbrd_has) {
			// TODO Auto-generated method stub
			return hairDao.selectReview(hbrd_has);
		}

		@Override
		public List<PetStyleVo> selectStyleList(String pts_has) {
			// TODO Auto-generated method stub
			return hairDao.selectStyle(pts_has);
		}

		@Override
		public int insertHairBoard(HairBoardVo hairBoardVo) {
			// TODO Auto-generated method stub
			return hairDao.insertHairBoard(hairBoardVo);
		}

		@Override
		public int insertBookMark(BookmarkVo bmVo) {
			// TODO Auto-generated method stub
			return hairDao.insertBookMark(bmVo);
		}

		@Override
		public int bmDup(BookmarkVo bmVo) {
			// TODO Auto-generated method stub
			return hairDao.bmDup(bmVo);
		}

		@Override
		public List<HairResVo> selRes(HairResVo hrVo) {
			// TODO Auto-generated method stub
			return hairDao.selRes(hrVo);
		}
		
		
		
}
