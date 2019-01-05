package kr.co.mypet.shopping.dao;

import java.util.List;
import java.util.Map;

import kr.co.mypet.shopping.model.CartVo;
import kr.co.mypet.shopping.model.DeliveryAddrVo;
import kr.co.mypet.shopping.model.DivisionVo;
import kr.co.mypet.shopping.model.OrderSheetVo;
import kr.co.mypet.shopping.model.ProdOptionVo;
import kr.co.mypet.shopping.model.ProdRevVo;
import kr.co.mypet.shopping.model.ProdVo;
import kr.co.mypet.shopping.model.ProddvVo;
import kr.co.mypet.shopping.model.ShopNoticeVo;

public interface ShoppingDaoInf {
	/**
	* Method : shopNoticeList
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 펫쇼핑몰 공지사항 불러오기
	*/
	public List<ShopNoticeVo> shopNoticeList();
	
	/**
	* Method : animalList
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 펫쇼핑몰 메인화면 사료검색 동물List
	*/
	public List<DivisionVo> animalList();
	
	/**
	* Method : animalSaryo
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_id
	* @return
	* Method 설명 : 동물의 아이디를 받아 해당 동물의 사료메뉴 id 찾기
	*/
	public String animalSaryo(String dvs_id);
	
	/**
	* Method : brandSearch
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_parent
	* @return
	* Method 설명 : 동물의 아이디를 받아 찾은 사료id를 가지고 브랜드List 찾기
	*/
	public List<DivisionVo> brandSearch(String dvs_parent);
	
	/**
	* Method : shopNoticeDetail
	* 작성자 : pc25
	* 변경이력 :
	* @param snot_id
	* @return
	* Method 설명 : 펫쇼핑몰 공지사항 상세정보
	*/
	public ShopNoticeVo shopNoticeDetail(String snot_id);
	
	/**
	* Method : prodMenu
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_id
	* @return
	* Method 설명 : 강아지/고양이 상품분류(사료,장난감,간식등)List
	*/
	public List<DivisionVo> prodMenu(String dvs_id);
	
	/**
	* Method : prodMenuOption
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_parent
	* @return
	* Method 설명 : 상품분류의 옵션(연령,브랜드,견종크기등)List
	*/
	public List<DivisionVo> prodMenuOption(String dvs_parent);
	
	/**
	* Method : opMenuList
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_parent
	* @return
	* Method 설명 : 옵션(연령,브랜드등) 분류(브랜드명,연령등)List
	*/
	public List<DivisionVo> opMenuList(String dvs_parent);
	
	/**
	* Method : prodList
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_parent
	* @return
	* Method 설명 : 체크박스 조건이 없을 경우 상품List
	*/
	public List<ProdVo> prodList(Map<String,Object> map);
	
	/**
	* Method : prodSize
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_parent
	* @return
	* Method 설명 : 체크박스 조건이 없을 경우 상품리스트 SIZE
	*/
	public int prodSize(String dvs_parent);
	
	/**
	* Method : prodDetail
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 상품에 대한 상세정보 
	*/
	public ProdVo prodDetail(String prod_id);
	
	/**
	* Method : chkList
	* 작성자 : pc25
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 체크한 체크박스에 id를 받아와 찾아서 상품List 출력
	*/
	public List<ProdVo> chkList(Map<String, Object> map);
	
	/**
	* Method : opChk
	* 작성자 : pc25
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 옵션(연령,브랜드)과 관련된 해당분류id(성견,퍼피등) 찾기
	*/
	public List<String> opChk(Map<String, Object> map);
	
	/**
	* Method : chkSize
	* 작성자 : pc25
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 체크박스 조건이 있을 경우 상품리스트 SIZE
	*/
	public int chkSize(Map<String,Object> map);
	
	/**
	* Method : prodOpList
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 상품의 상세 옵션(ex. 상품 : 티셔츠 - 옵션 : 그레이,화이트)
	*/
	public List<ProdOptionVo> prodOpList(String prod_id);
	
	/**
	* Method : prodCre
	* 작성자 : pc25
	* 변경이력 :
	* @param prodVo
	* @return
	* Method 설명 : 상품 등록
	*/
	public int prodCre(ProdVo prodVo);
	
	/**
	* Method : pddCre
	* 작성자 : pc25
	* 변경이력 :
	* @param pddVo
	* @return
	* Method 설명 : 상품 분류 등록
	*/
	public int pddCre(ProddvVo pddVo);
	
	/**
	* Method : prodoCre
	* 작성자 : pc25
	* 변경이력 :
	* @param prodoVo
	* @return
	* Method 설명 : 상품옵션 등록
	*/
	public int prodoCre(ProdOptionVo prodoVo);
	
	/**
	* Method : prodSearch
	* 작성자 : pc25
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 해당 메뉴와 검색어를 받아 상품List 조회
	*/
	public List<ProdVo> prodSearch(Map<String,Object> map);
	
	/**
	* Method : prodSearchChk
	* 작성자 : pc25
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 상품 검색 후 체크 박스
	*/
	public List<ProdVo> prodSearchChk(Map<String,Object> map);
	
	/**
	* Method : deleteProd
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 상품 삭제
	*/
	public int deleteProd(String prod_id);
	
	/**
	* Method : deletePdd
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 :상품 삭제 시 상품의 옵션 등록 부분도 같이 삭제
	*/
	public int deletePdd(String prod_id);
	
	/**
	* Method : prodUpdate
	* 작성자 : pc25
	* 변경이력 :
	* @param prodVo
	* @return
	* Method 설명 : 상품 수정
	*/
	public int prodUpdate(ProdVo prodVo);
	
	/**
	* Method : deleteOption
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 상품 수정 할 시 기존 옵션을 삭제하고 다시 옵션을 받기 위해서 
	*/
	public int deleteOption(String prod_id);
	
	/**
	* Method : revList
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 상품후기 List
	*/
	public List<ProdRevVo> revList(String prod_id);
	
	/**
	* Method : revUpdate
	* 작성자 : pc25
	* 변경이력 :
	* @param prevVo
	* @return
	* Method 설명 : 상품후기 수정
	*/
	public int revUpdate(ProdRevVo prevVo);
	
	/**
	* Method : revDelete
	* 작성자 : pc25
	* 변경이력 :
	* @param prev_id
	* @return
	* Method 설명 : 상품후기 삭제
	*/
	public int revDelete(String prev_id);
	
	/**
	* Method : revInsert
	* 작성자 : pc25
	* 변경이력 :
	* @param prevVo
	* @return
	* Method 설명 : 상품후기 등록
	*/
	public int revInsert(ProdRevVo prevVo);
	
	/**
	* Method : prodoVo
	* 작성자 : pc25
	* 변경이력 :
	* @param prodo_id
	* @return
	* Method 설명 : 아이디를 받아 해당 옵션 조회
	*/
	public ProdOptionVo prodoVo(String prodo_id);
	
	/**
	* Method : cartAdd
	* 작성자 : pc25
	* 변경이력 :
	* @param cartVo
	* @return
	* Method 설명 :장바구니 등록
	*/
	public int cartAdd(CartVo cartVo);
	
	/**
	* Method : cartList
	* 작성자 : pc25
	* 변경이력 :
	* @param cart_mem
	* @return
	* Method 설명 : 해당 회원의 장바구니
	*/
	public List<CartVo> cartList(String cart_mem);
	
	/**
	* Method : cartDel
	* 작성자 : pc25
	* 변경이력 :
	* @param cart_id
	* @return
	* Method 설명 : 장바구니 삭제
	*/
	public int cartDel(String cart_id);
	
	/**
	* Method : cartBuyList
	* 작성자 : pc25
	* 변경이력 :
	* @param cart_ids
	* @return
	* Method 설명 :장바구니에 선택된 상품 주문하기 List
	*/
	public List<CartVo> cartBuyList(String cart_ids);
	
	/**
	* Method : daddrCre
	* 작성자 : pc25
	* 변경이력 :
	* @param daddrVo
	* @return
	* Method 설명 : 배송지 등록
	*/
	public int daddrCre(DeliveryAddrVo daddrVo);
	
	/**
	* Method : basicAddress
	* 작성자 : pc25
	* 변경이력 :
	* @param daddr_mem
	* @return
	* Method 설명 : 기존배송지
	*/
	public DeliveryAddrVo basicAddress(String daddr_mem);
	
	/**
	* Method : otherAddress
	* 작성자 : pc25
	* 변경이력 :
	* @param daddr_mem
	* @return
	* Method 설명 : 저장된 배송지
	*/
	public List<DeliveryAddrVo> otherAddress(String daddr_mem);
	
	/**
	* Method : qtyUpdate
	* 작성자 : pc25
	* 변경이력 :
	* @param prodVo
	* @return
	* Method 설명 : 상품 판매시 수량 수정
	*/
	public int qtyUpdate(ProdVo prodVo);
	
	/**
	* Method : saveAddr
	* 작성자 : pc25
	* 변경이력 :
	* @param daddr_id
	* @return
	* Method 설명 : 저장된 배송지 조회
	*/
	public DeliveryAddrVo saveAddr(String daddr_id);
	
	/**
	* Method : orderInsert
	* 작성자 : pc25
	* 변경이력 :
	* @param ordsVo
	* @return
	* Method 설명 : 주문내용 저장
	*/
	public int orderInsert(OrderSheetVo ordsVo);
	
	/**
	* Method : orderInsert2
	* 작성자 : pc25
	* 변경이력 :
	* @param ordsVo
	* @return
	* Method 설명 : 기존 배송지를 사용할 경우
	*/
	public int orderInsert2(OrderSheetVo ordsVo);
	
	/**
	* Method : updateDaddr
	* 작성자 : pc25
	* 변경이력 :
	* @param daddr_id
	* @return
	* Method 설명 : 기존 배송지에서 저장된 배송지로 변경
	*/
	public int updateDaddr(String daddr_id);
}
