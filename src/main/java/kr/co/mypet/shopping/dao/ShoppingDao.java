package kr.co.mypet.shopping.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.mypet.shopping.model.DivisionVo;
import kr.co.mypet.shopping.model.ProdOptionVo;
import kr.co.mypet.shopping.model.ProdVo;
import kr.co.mypet.shopping.model.ProddvVo;
import kr.co.mypet.shopping.model.ShopNoticeVo;

@Repository
public class ShoppingDao implements ShoppingDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	/**
	* Method : shopNoticeList
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 펫쇼핑몰 공지사항 불러오기
	*/
	@Override
	public List<ShopNoticeVo> shopNoticeList() {
		List<ShopNoticeVo> snotList = template.selectList("shop.shopNoticeList");
		return snotList;
	}
	
	/**
	* Method : shopNoticeDetail
	* 작성자 : pc25
	* 변경이력 :
	* @param snot_id
	* @return
	* Method 설명 : 펫쇼핑몰 공지사항 상세정보
	*/
	@Override
	public ShopNoticeVo shopNoticeDetail(String snot_id) {
		ShopNoticeVo snotVo = template.selectOne("shop.shopNoticeDetail",snot_id);
		return snotVo;
	}
	
	/**
	* Method : prodMenu
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_id
	* @return
	* Method 설명 : 강아지/고양이 상품분류(사료,장난감,간식등)List
	*/
	@Override
	public List<DivisionVo> prodMenu(String dvs_id) {
		List<DivisionVo> menuList = template.selectList("shop.prodMenu",dvs_id);
		return menuList;
	}
	
	/**
	* Method : prodMenuOption
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_parent
	* @return
	* Method 설명 : 상품분류의 옵션(연령,브랜드,견종크기등)List
	*/
	@Override
	public List<DivisionVo> prodMenuOption(String dvs_parent) {
		List<DivisionVo> opList = template.selectList("shop.prodMenuOption",dvs_parent);
		return opList;
	}
	
	/**
	* Method : opMenuList
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_parent
	* @return
	* Method 설명 : 옵션(연령,브랜드등) 분류(브랜드명,연령등)List
	*/
	@Override
	public List<DivisionVo> opMenuList(String dvs_parent) {
		List<DivisionVo> opMenuList = template.selectList("shop.opMenuList",dvs_parent);
		return opMenuList;
	}
	
	/**
	* Method : prodList
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_parent
	* @return
	* Method 설명 : 체크박스 조건이 없을 경우 상품List
	*/
	@Override
	public List<ProdVo> prodList(Map<String,Object> map) {
		List<ProdVo> prodList = template.selectList("shop.prodList",map);
		return prodList;
	}
	
	/**
	* Method : prodDetail
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 상품에 대한 상세정보 
	*/
	@Override
	public ProdVo prodDetail(String prod_id) {
		ProdVo prodVo = template.selectOne("shop.prodDetail",prod_id);
		return prodVo;
	}
	
	/**
	* Method : prodSize
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_parent
	* @return
	* Method 설명 : 체크박스 조건이 없을 경우 상품리스트 SIZE
	*/
	@Override
	public int prodSize(String dvs_parent) {
		int prodSize = template.selectOne("shop.prodSize",dvs_parent);
		return prodSize;
	}
	
	/**
	* Method : chkList
	* 작성자 : pc25
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 체크한 체크박스에 id를 받아와 찾아서 상품List 출력
	*/
	@Override
	public List<ProdVo> chkList(Map<String, Object> map) {
		List<ProdVo> prodList = template.selectList("shop.chkList",map);
		return prodList;
	}
	
	/**
	* Method : opChk
	* 작성자 : pc25
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 옵션(연령,브랜드)과 관련된 해당분류id(성견,퍼피등) 찾기
	*/
	@Override
	public List<String> opChk(Map<String, Object> map) {
		List<String> opChk = template.selectList("shop.opChk",map);
		return opChk;
	}
	
	/**
	* Method : chkSize
	* 작성자 : pc25
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 체크박스 조건이 있을 경우 상품리스트 SIZE
	*/
	@Override
	public int chkSize(Map<String, Object> map) {
		int chkSize = template.selectOne("shop.chkSize",map);
		return chkSize;
	}
	
	/**
	* Method : animalList
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 펫쇼핑몰 메인화면 사료검색 동물List
	*/
	@Override
	public List<DivisionVo> animalList() {
		List<DivisionVo> aniList = template.selectList("shop.animalList");
		return aniList;
	}
	
	/**
	* Method : animalSaryo
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_id
	* @return
	* Method 설명 : 동물의 아이디를 받아 해당 동물의 사료메뉴 id 찾기
	*/
	@Override
	public String animalSaryo(String dvs_id) {
		String dvs_parent = template.selectOne("shop.animalSaryo",dvs_id);
		return dvs_parent;
	}
	
	/**
	* Method : brandSearch
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_parent
	* @return
	* Method 설명 : 동물의 아이디를 받아 찾은 사료id를 가지고 브랜드List 찾기
	*/
	@Override
	public List<DivisionVo> brandSearch(String dvs_parent) {
		List<DivisionVo> brdList = template.selectList("shop.brandSearch",dvs_parent);
		return brdList;
	}
	
	/**
	* Method : prodOpList
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 상품의 상세 옵션(ex. 상품 : 티셔츠 - 옵션 : 그레이,화이트)
	*/
	@Override
	public List<ProdOptionVo> prodOpList(String prod_id) {
		List<ProdOptionVo> prodoList = template.selectList("shop.prodOpList",prod_id);
		return prodoList;
	}
	
	/**
	* Method : prodCre
	* 작성자 : pc25
	* 변경이력 :
	* @param prodVo
	* @return
	* Method 설명 : 상품 등록
	*/
	@Override
	public int prodCre(ProdVo prodVo) {
		int result = template.insert("shop.prodCre",prodVo);
		return result;
	}
	
	/**
	* Method : pddCre
	* 작성자 : pc25
	* 변경이력 :
	* @param pddVo
	* @return
	* Method 설명 : 상품 분류 등록
	*/
	@Override
	public int pddCre(ProddvVo pddVo) {
		int result = template.insert("shop.pddCre",pddVo);
		return result;
	}
	
	/**
	* Method : prodoCre
	* 작성자 : pc25
	* 변경이력 :
	* @param prodoVo
	* @return
	* Method 설명 : 상품옵션 등록
	*/
	@Override
	public int prodoCre(ProdOptionVo prodoVo) {
		int result = template.insert("shop.prodoCre",prodoVo);
		return result;
	}
	
	/**
	* Method : prodSearch
	* 작성자 : pc25
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 해당 메뉴와 검색어를 받아 상품List 조회
	*/
	@Override
	public List<ProdVo> prodSearch(Map<String, Object> map) {
		List<ProdVo> prodList = template.selectList("shop.prodSearch",map);
		return prodList;
	}
	
	/**
	* Method : prodSearchChk
	* 작성자 : pc25
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 상품 검색 후 체크 박스
	*/
	@Override
	public List<ProdVo> prodSearchChk(Map<String, Object> map) {
		List<ProdVo> prodList= template.selectList("shop.prodSearchChk",map);
		return prodList;
	}
	
	/**
	* Method : deleteProd
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 상품 삭제
	*/
	@Override
	public int deleteProd(String prod_id) {
		int result = template.delete("shop.deleteProd",prod_id);
		return result;
	}
	
	/**
	* Method : deletePdd
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 :상품 삭제 시 상품의 옵션 등록 부분도 같이 삭제
	*/
	@Override
	public int deletePdd(String prod_id) {
		int result = template.delete("shop.deletePdd",prod_id);
		return result;
	}
	
	/**
	* Method : prodUpdate
	* 작성자 : pc25
	* 변경이력 :
	* @param prodVo
	* @return
	* Method 설명 : 상품 수정
	*/
	@Override
	public int prodUpdate(ProdVo prodVo) {
		int result = template.update("shop.prodUpdate",prodVo);
		return result;
	}
	
	/**
	* Method : deleteOption
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 상품 수정 할 시 기존 옵션을 삭제하고 다시 옵션을 받기 위해서 
	*/
	@Override
	public int deleteOption(String prod_id) {
		int result = template.delete("shop.deleteOption",prod_id);
		return result;
	}
	
}
