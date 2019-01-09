package kr.co.mypet.shopping.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.mypet.common.model.PageVo;
import kr.co.mypet.shopping.dao.ShoppingDaoInf;
import kr.co.mypet.shopping.model.CartVo;
import kr.co.mypet.shopping.model.DeliveryAddrVo;
import kr.co.mypet.shopping.model.DivisionVo;
import kr.co.mypet.shopping.model.OrderSheetVo;
import kr.co.mypet.shopping.model.ProdOptionVo;
import kr.co.mypet.shopping.model.ProdRevVo;
import kr.co.mypet.shopping.model.ProdVo;
import kr.co.mypet.shopping.model.ProddvVo;
import kr.co.mypet.shopping.model.RecentProdVo;
import kr.co.mypet.shopping.model.ShopNoticeVo;
import kr.co.mypet.sitter.model.SitterAppVo;

@Service
public class ShoppingService implements ShoppingServiceInf {

	@Resource(name="shoppingDao")
	private ShoppingDaoInf shoppingDao;

	/**
	* Method : shopNoticeList
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 펫쇼핑몰 공지사항 불러오기
	*/
	@Override
	public List<ShopNoticeVo> shopNoticeList() {
		return shoppingDao.shopNoticeList();
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
		return shoppingDao.shopNoticeDetail(snot_id);
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
		return shoppingDao.prodMenu(dvs_id);
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
		return shoppingDao.prodMenuOption(dvs_parent);
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
		return shoppingDao.opMenuList(dvs_parent);
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
		return shoppingDao.prodList(map);
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
		return shoppingDao.prodSize(dvs_parent);
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
		return shoppingDao.prodDetail(prod_id);
	}

	@Override
	public Map<String, Object> prodPageList(Map<String, Object> map) {
		
		List<ProdVo> prodList = null;
		
		PageVo pageVo = (PageVo) map.get("pageVo");
		DivisionVo dvsVo = (DivisionVo) map.get("dvsVo");
		String values = (String) map.get("values");
		String[] opValues = (String[]) map.get("opValues");
		
		//검색어 내용
		String prod_name = (String) map.get("prod_name");
		
		String chkk = "";
		
		// String에 담은 추출한 값을 다시 List에 담아준다.
		List<String> opChkList = new ArrayList<>();
		
		int size = 0;
		
		// 사료 검색
		if(!(prod_name.equals("")) && (values.equals("")) && !(prod_name.equals("undefined"))){
			prodList = shoppingDao.prodSearch(map);
		}
		else if(values.equals("") || values == null) {
			prodList = shoppingDao.prodList(map);
			size = shoppingDao.prodSize(dvsVo.getDvs_parent());
		}else if(!(values.equals("") || values == null) && prod_name.equals("")){
			for (int i = 0; i < opValues.length; i++) {
				
				// 체크한 체크박스 id들
				List<String> valueGo = new ArrayList<>();
				
				// 해당 옵션id(연령,브랜드등) 과 체크한 체크박스id를 담을 map
				Map<String,Object> chkMap = new HashMap<>();
				
				// 체크한 체크박스를 id를 , 기준으로 짤라서 배열에 담아준다.
				String[] tempArray = values.split(",");
				
				// 옵션id map에 저장
				chkMap.put("opid",opValues[i]);
				
				// 스플리트 한 배열을 리스트에 저장
				for (int k = 0; k < tempArray.length; k++) {
					valueGo.add(tempArray[k]);
				}
				
				// 체크한 체크박스id 리스트를 map 담아준다.
				chkMap.put("valueGo",valueGo);
				
				// 옵션에 해당하는 체크박스id 추출
				List<String> dddd = shoppingDao.opChk(chkMap);
				
				// 옵션에 해당하는 체크박스id를 배열에 저장
				for (int j = 0; j < dddd.size(); j++) {
					chkk += dddd.get(j) + ",";
				}
				if(!(chkk.equals(""))) {
					String last = chkk.substring(0,chkk.lastIndexOf(","));
					String temp = "'"+last.replaceAll(",", "','")+"'";
					opChkList.add(temp);
					chkk = "";
				}
			}
			 map.put("op0",opChkList.get(0));
			 map.put("opChkList",opChkList);
			 size = shoppingDao.chkSize(map);
			 prodList = shoppingDao.chkList(map);
			
		}else {
			for (int i = 0; i < opValues.length; i++) {
				
			// 체크한 체크박스 id들
			List<String> valueGo = new ArrayList<>();
			
			// 해당 옵션id(연령,브랜드등)과 체크한 체크박스id를 담을 map
			Map<String,Object> chkMap = new HashMap<>();
			
			// 체크한 체크박스를 id를 , 기준으로 짤라서 배열에 담아준다.
			String[] tempArray = values.split(",");
			
			
			// 옵션id map에 저장
			chkMap.put("opid",opValues[i]);
			
			// 스플리트 한 배열을 리스트에 저장
			for (int k = 0; k < tempArray.length; k++) {
				valueGo.add(tempArray[k]);
			}
			// 체크한 체크박스id 리스트를 map 담아준다.
			chkMap.put("valueGo",valueGo);
			
			// 옵션에 해당하는 체크박스id 추출
			List<String> dddd = shoppingDao.opChk(chkMap);
			
				// 옵션에 해당하는 체크박스id를 배열에 저장
				for (int j = 0; j < dddd.size(); j++) {
					chkk += dddd.get(j) + ",";
				}
				if(!(chkk.equals(""))) {
					String last = chkk.substring(0,chkk.lastIndexOf(","));
					String temp = "'"+last.replaceAll(",", "','")+"'";
					opChkList.add(temp);
					chkk = "";
				}
			}
			
			map.put("opChkList",opChkList);
			prodList = shoppingDao.prodSearchChk(map);
		}
			
		int prodSize = (int) Math.ceil((double) size/pageVo.getPageSize());
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("prodList",prodList);
		resultMap.put("prodSize",prodSize);
		resultMap.put("page",pageVo.getPage());
		resultMap.put("dvsVo",dvsVo);
		
		return resultMap;
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
		return shoppingDao.chkList(map);
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
		return shoppingDao.opChk(map);
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
		return shoppingDao.chkSize(map);
	}
	
	/**
	* Method : animalList
	* 작성자 : pc25
	* 변경이력 :
	* @return
	* Method 설명 : 펫쇼핑몰 메인화면 사료검색 동물List
	*/
	@Override
	public List<DivisionVo> animalList(){
		return shoppingDao.animalList();
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
		return shoppingDao.animalSaryo(dvs_id);
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
		return shoppingDao.brandSearch(dvs_parent);
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
		return shoppingDao.prodOpList(prod_id);
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
		return shoppingDao.prodCre(prodVo);
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
		return shoppingDao.pddCre(pddVo);
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
		return shoppingDao.prodoCre(prodoVo);
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
		return shoppingDao.prodSearch(map);
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
		return shoppingDao.prodSearchChk(map);
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
		return shoppingDao.deleteProd(prod_id);
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
		return shoppingDao.deletePdd(prod_id);
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
		return shoppingDao.prodUpdate(prodVo);
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
		return shoppingDao.deleteOption(prod_id);
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
		return shoppingDao.revList(prod_id);
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
		return shoppingDao.revUpdate(prevVo);
	}
	
	/**
	* Method : revDelete
	* 작성자 : pc25
	* 변경이력 :
	* @param prev_id
	* @return
	* Method 설명 : 상품후기 삭제
	*/
	@Override
	public int revDelete(String prev_id) {
		return shoppingDao.revDelete(prev_id);
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
		return shoppingDao.revInsert(prevVo);
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
		return shoppingDao.prodoVo(prodo_id);
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
		return shoppingDao.cartAdd(cartVo);
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
		return shoppingDao.cartList(cart_mem);
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
		return shoppingDao.cartDel(cart_id);
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
		return shoppingDao.cartBuyList(cart_ids);
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
		return shoppingDao.daddrCre(daddrVo);
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
		return shoppingDao.basicAddress(daddr_mem);
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
		return shoppingDao.otherAddress(daddr_mem);
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
		return shoppingDao.qtyUpdate(prodVo);
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
		return shoppingDao.saveAddr(daddr_id);
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
		return shoppingDao.orderInsert(ordsVo);
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
		return shoppingDao.orderInsert2(ordsVo);
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
		return shoppingDao.updateDaddr(daddr_id);
	}
	
	/**
	* Method : bestProd
	* 작성자 : pc25
	* 변경이력 :
	* @param rownum
	* @return
	* Method 설명 : best상품 조회
	*/
	@Override
	public List<ProdVo> bestProd(int rownum) {
		return shoppingDao.bestProd(rownum);
	}
	
	/**
	* Method : insertRecp
	* 작성자 : pc25
	* 변경이력 :
	* @param recpVo
	* @return
	* Method 설명 : 최근 본 상품 등록
	*/
	@Override
	public int insertRecp(RecentProdVo recpVo) {
		return shoppingDao.insertRecp(recpVo);
	}
	
	/**
	* Method : recpList
	* 작성자 : pc25
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 :회원 최근 본상품
	*/
	@Override
	public List<ProdVo> recpList(String mem_id) {
		return shoppingDao.recpList(mem_id);
	}
	
	/**
	* Method : delRecp
	* 작성자 : pc25
	* 변경이력 :
	* @param recpVo
	* @return
	* Method 설명 : 최근 본 상품 삭제
	*/
	@Override
	public int delRecp(RecentProdVo recpVo) {
		return shoppingDao.delRecp(recpVo);
	}
	
	/**
	* Method : dvsDetail
	* 작성자 : pc25
	* 변경이력 :
	* @param dvs_id
	* @return
	* Method 설명 : 강아지/고양이 확인
	*/
	@Override
	public DivisionVo dvsDetail(String dvs_id) {
		return shoppingDao.dvsDetail(dvs_id);
	}
	
	/**
	* Method : orderList
	* 작성자 : pc25
	* 변경이력 :
	* @param ords_mem
	* @return
	* Method 설명 : 주문내역 조회
	*/
	@Override
	public List<OrderSheetVo> orderList(String ords_mem) {
		return shoppingDao.orderList(ords_mem);
	}
	
	/**
	* Method : orderCancle
	* 작성자 : pc25
	* 변경이력 :
	* @param ords_id
	* @return
	* Method 설명 : 마이페이지 구매취소
	*/
	@Override
	public int orderCancle(String ords_id) {
		return shoppingDao.orderCancle(ords_id);
	}
	
	/**
	* Method : buyList
	* 작성자 : pc25
	* 변경이력 :
	* @param ords_mem
	* @return
	* Method 설명 : 구매내역 조회
	*/
	@Override
	public List<OrderSheetVo> buyList(String ords_mem) {
		return shoppingDao.buyList(ords_mem);
	}
	
	/**
	* Method : orderDetail
	* 작성자 : pc25
	* 변경이력 :
	* @param ords_id
	* @return
	* Method 설명 : 주문서 내역 조회
	*/
	@Override
	public OrderSheetVo orderDetail(String ords_id) {
		return shoppingDao.orderDetail(ords_id);
	}
	
	/**
	* Method : searchParent
	* 작성자 : pc25
	* 변경이력 :
	* @param pddVo
	* @return
	* Method 설명 : 상품디테일로 가기 위해서 dvs_parent 찾기
	*/
	@Override
	public String searchParent(ProddvVo pddVo) {
		return shoppingDao.searchParent(pddVo);
	}
	
	/**
	* Method : searchId
	* 작성자 : pc25
	* 변경이력 :
	* @param prod_id
	* @return
	* Method 설명 : 상품디테일로 가기 위해서 dvs_id 찾기
	*/
	@Override
	public String searchId(String prod_id) {
		return shoppingDao.searchId(prod_id);
	}
	
	/**
	* Method : marketerList
	* 작성자 : pc25
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 판매자가 등록한 상품List
	*/
	@Override
	public List<ProdVo> marketerList(String mem_id) {
		return shoppingDao.marketerList(mem_id);
	}
	
	/**
	* Method : marketerOrderList
	* 작성자 : pc25
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 판매자가 등록한 상품 주문 확인
	*/
	@Override
	public List<OrderSheetVo> marketerOrderList(String mem_id) {
		return shoppingDao.marketerOrderList(mem_id);
	}
	
	/**
	* Method : deliveryUpdate
	* 작성자 : pc25
	* 변경이력 :
	* @param ords_id
	* @return
	* Method 설명 : 배송 보내면 배송완료로 끝
	*/
	@Override
	public int deliveryUpdate(String ords_id) {
		return shoppingDao.deliveryUpdate(ords_id);
	}
	
	/**
	* Method : decideUpdate
	* 작성자 : pc25
	* 변경이력 :
	* @param ords_id
	* @return
	* Method 설명 : 구매확정
	*/
	@Override
	public int decideUpdate(String ords_id) {
		return shoppingDao.decideUpdate(ords_id);
	}
	
	/**
	* Method : cancleList
	* 작성자 : pc25
	* 변경이력 :
	* @param ords_mem
	* @return
	* Method 설명 : 취소/환불/반품 List
	*/
	@Override
	public List<OrderSheetVo> cancleList(String ords_mem) {
		return shoppingDao.cancleList(ords_mem);
	}
	
	/**
	* Method : swapUpdate
	* 작성자 : pc25
	* 변경이력 :
	* @param ords_id
	* @return
	* Method 설명 : 교환 
	*/
	@Override
	public int swapUpdate(String ords_id) {
		return shoppingDao.swapUpdate(ords_id);
	}
	
	/**
	* Method : returnUpdate
	* 작성자 : pc25
	* 변경이력 :
	* @param ords_id
	* @return
	* Method 설명 : 반품
	*/
	@Override
	public int returnUpdate(String ords_id) {
		return shoppingDao.returnUpdate(ords_id);
	}

	@Override
	public int insertSupport(Map<String, Object> param) {
		return shoppingDao.insertSupport(param);
	}

	@Override
	public List<SitterAppVo> getSupportListAll(PageVo pageVo) {
		
		List<SitterAppVo> supportListAll = shoppingDao.getSupportListAll(pageVo);
		
		return supportListAll;
	}

	@Override
	public int getSupportListAllCnt() {
		return shoppingDao.getSupportListAllCnt();
	}
	
	
}
