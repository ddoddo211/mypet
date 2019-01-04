package kr.co.mypet.hair.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.mypet.common.model.MypetVo;
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
			return hairDao.selectStyleList(pts_has);
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

		@Override
		public List<MypetVo> selectMypet(String myp_mem) {
			// TODO Auto-generated method stub
			return hairDao.selectMypet(myp_mem);
		}

		@Override
		public int insertRev(HairResVo hairResVo) {
			// TODO Auto-generated method stub
			return hairDao.insertRev(hairResVo);
		}

		@Override
		public List<HairResVo> selectRev(String mem_id) {
			// TODO Auto-generated method stub
			return hairDao.selectRev(mem_id);
		}

		@Override
		public PetStyleVo selectStyle(String pts_id) {
			// TODO Auto-generated method stub
			return hairDao.selectStyle(pts_id);
		}

		@Override
		public List<BookmarkVo> selectBookMark(String mem_id) {
			// TODO Auto-generated method stub
			return hairDao.selectBookMark(mem_id);
		}

		@Override
		public List<HairBoardVo> selectAsk(String mem_id) {
			// TODO Auto-generated method stub
			return hairDao.selectAsk(mem_id);
		}

		@Override
		public List<HairResVo> selectRevCom(Map<Object, Object> param) {
			// TODO Auto-generated method stub
			return hairDao.selectRevCom(param);
		}

		@Override
		public int revComCnt(String mem_id) {
			// TODO Auto-generated method stub
			return hairDao.revComCnt(mem_id);
		}
		
		
		
}
