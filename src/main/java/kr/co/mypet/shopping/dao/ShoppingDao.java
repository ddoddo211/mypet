package kr.co.mypet.shopping.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.mypet.shopping.model.CartVo;
import kr.co.mypet.shopping.model.DeliveryAddrVo;
import kr.co.mypet.shopping.model.DivisionVo;
import kr.co.mypet.shopping.model.OrderSheetVo;
import kr.co.mypet.shopping.model.ProdOptionVo;
import kr.co.mypet.shopping.model.ProdRevVo;
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
		int result = template.update("shop.deleteProd",prod_id);
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
	
	/**
	* Method : revList
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 상품후기 List
	*/
	@Override
	public List<ProdRevVo> revList(String prod_id) {
		List<ProdRevVo> revList = template.selectList("shop.revList",prod_id);
		return revList;
	}
	
	/**
	* Method : revUpdate
	* 작성자 : pc25
	* 변경이력 :
	* @param prevVo
	* @return
	* Method 설명 : 상품후기 수정
	*/
	@Override
	public int revUpdate(ProdRevVo prevVo) {
		int result = template.update("shop.revUpdate",prevVo);
		return result;
	}
	
	/**
	* Method : revDelete
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 상품후기 삭제
	*/
	@Override
	public int revDelete(String prev_id) {
		int result = template.delete("shop.revDelete",prev_id);
		return result;
	}
	
	/**
	* Method : revInsert
	* 작성자 : pc25
	* 변경이력 :
	* @param prevVo
	* @return
	* Method 설명 : 상품후기 등록
	*/
	@Override
	public int revInsert(ProdRevVo prevVo) {
		int result = template.insert("shop.revInsert",prevVo);
		return result;
	}
	
	/**
	* Method : prodoVo
	* 작성자 : pc25
	* 변경이력 :
	* @param prodo_id
	* @return
	* Method 설명 : 아이디를 받아 해당 옵션 조회
	*/
	@Override
	public ProdOptionVo prodoVo(String prodo_id) {
		ProdOptionVo prodoVo = template.selectOne("shop.prodoVo",prodo_id);
		return prodoVo;
	}
	
	/**
	* Method : cartAdd
	* 작성자 : pc25
	* 변경이력 :
	* @param cartVo
	* @return
	* Method 설명 :장바구니 등록
	*/
	@Override
	public int cartAdd(CartVo cartVo) {
		int result = template.insert("shop.cartAdd",cartVo);
		return result;
	}
	
	/**
	* Method : cartList
	* 작성자 : pc25
	* 변경이력 :
	* @param cart_mem
	* @return
	* Method 설명 : 해당 회원의 장바구니
	*/
	@Override
	public List<CartVo> cartList(String cart_mem) {
		List<CartVo> cartList = template.selectList("shop.cartList",cart_mem);
		return cartList;
	}
	
	/**
	* Method : cartDel
	* 작성자 : pc25
	* 변경이력 :
	* @param cart_id
	* @return
	* Method 설명 : 장바구니 삭제
	*/
	@Override
	public int cartDel(String cart_id) {
		int result = template.delete("shop.cartDel",cart_id);
		return result;
	}
	
	/**
	* Method : cartBuyList
	* 작성자 : pc25
	* 변경이력 :
	* @param cart_ids
	* @return
	* Method 설명 :장바구니에 선택된 상품 주문하기 List
	*/
	@Override
	public List<CartVo> cartBuyList(String cart_ids) {
		List<CartVo> cartList = template.selectList("shop.cartBuyList",cart_ids);
		return cartList;
	}
	
	/**
	* Method : daddrCre
	* 작성자 : pc25
	* 변경이력 :
	* @param daddrVo
	* @return
	* Method 설명 : 배송지 등록
	*/
	@Override
	public int daddrCre(DeliveryAddrVo daddrVo) {
		int result = template.insert("shop.daddrCre",daddrVo);
		return result;
	}
	
	/**
	* Method : basicAddress
	* 작성자 : pc25
	* 변경이력 :
	* @param daddr_mem
	* @return
	* Method 설명 : 기존배송지
	*/
	@Override
	public DeliveryAddrVo basicAddress(String daddr_mem) {
		DeliveryAddrVo daddrVo = template.selectOne("shop.basicAddress",daddr_mem);
		return daddrVo;
	}
	
	/**
	* Method : otherAddress
	* 작성자 : pc25
	* 변경이력 :
	* @param daddr_mem
	* @return
	* Method 설명 : 저장된 배송지
	*/
	@Override
	public List<DeliveryAddrVo> otherAddress(String daddr_mem) {
		List<DeliveryAddrVo> daddrList = template.selectList("shop.otherAddress",daddr_mem);
		return daddrList;
	}
	
	/**
	* Method : qtyUpdate
	* 작성자 : pc25
	* 변경이력 :
	* @param prodVo
	* @return
	* Method 설명 : 상품 판매시 수량 수정
	*/
	@Override
	public int qtyUpdate(ProdVo prodVo) {
		int result = template.update("shop.qtyUpdate",prodVo);
		return result;
	}
	
	/**
	* Method : saveAddr
	* 작성자 : pc25
	* 변경이력 :
	* @param daddr_id
	* @return
	* Method 설명 : 저장된 배송지 조회
	*/
	@Override
	public DeliveryAddrVo saveAddr(String daddr_id) {
		DeliveryAddrVo daddrVo = template.selectOne("shop.saveAddr",daddr_id);
		return daddrVo;
	}
	
	/**
	* Method : orderInsert
	* 작성자 : pc25
	* 변경이력 :
	* @param ordsVo
	* @return
	* Method 설명 : 주문내용 저장
	*/
	@Override
	public int orderInsert(OrderSheetVo ordsVo) {
		int result = template.insert("shop.orderInsert",ordsVo);
		return result;
	}
	
	/**
	* Method : orderInsert2
	* 작성자 : pc25
	* 변경이력 :
	* @param ordsVo
	* @return
	* Method 설명 : 기존 배송지를 사용할 경우
	*/
	@Override
	public int orderInsert2(OrderSheetVo ordsVo) {
		int result = template.insert("shop.orderInsert2",ordsVo);
		return result;
	}
	
	/**
	* Method : updateDaddr
	* 작성자 : pc25
	* 변경이력 :
	* @param daddr_id
	* @return
	* Method 설명 : 기존 배송지에서 저장된 배송지로 변경
	*/
	@Override
	public int updateDaddr(String daddr_id) {
		int result = template.update("shop.updateDaddr",daddr_id);
		return result;
	}
	
}
