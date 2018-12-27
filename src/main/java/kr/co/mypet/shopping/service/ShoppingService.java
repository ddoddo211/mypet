package kr.co.mypet.shopping.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.mypet.common.model.PageVo;
import kr.co.mypet.shopping.dao.ShoppingDaoInf;
import kr.co.mypet.shopping.model.DivisionVo;
import kr.co.mypet.shopping.model.ProdOptionVo;
import kr.co.mypet.shopping.model.ProdVo;
import kr.co.mypet.shopping.model.ProddvVo;
import kr.co.mypet.shopping.model.ShopNoticeVo;

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
		
		
//		String temp = values.replaceAll(",", "','");
		String chkk = "";
		
		// String에 담은 추출한 값을 다시 List에 담아준다.
		List<String> opChkList = new ArrayList<>();
		
		int size = 0;
		if(values.equals("") || values == null) {
			prodList = shoppingDao.prodList(map);
			size = shoppingDao.prodSize(dvsVo.getDvs_parent());
		}else if(!(values.equals("") || values == null)){
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
	};
	
	
	
}
