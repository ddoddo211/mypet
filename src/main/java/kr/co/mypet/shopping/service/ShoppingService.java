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
import kr.co.mypet.shopping.model.ProdVo;
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
//		values = temp;
//		System.out.println(values[0] + "values");
		List<String> op_chk = new ArrayList<>();
		String[] chkk = new String[opValues.length];
	
		int size = 0;
		if(values.equals("")) {
			prodList = shoppingDao.prodList(map);
			size = shoppingDao.prodSize(dvsVo.getDvs_parent());
		}else {
			prodList = shoppingDao.chkList(map);
			for (int i = 0; i < opValues.length; i++) {
				
				// 연령등 id 받아서 한 리스트로 넘기기
				List<String> valueGo = new ArrayList<>();
				Map<String,Object> chkMap = new HashMap<>();
				String[] tempArray = values.split(",");
				chkMap.put("opid",opValues[i]);
				for (int k = 0; k < tempArray.length; k++) {
					valueGo.add(tempArray[k]);
				}
				
				chkMap.put("valueGo",valueGo);
				List<String> dddd = shoppingDao.opChk(chkMap); 
					
				for (int j = 0; j < dddd.size(); j++) {
						chkk[i] += i+ " " + dddd.get(j) + " ";
				}
				System.out.println(chkk[i] +  " : chkk");
			}
			
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

	@Override
	public List<String> opChk(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	* Method : opChk
	* 작성자 : pc25
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 옵션(연령,브랜드)과 관련된 해당분류id(성견,퍼피등) 찾기
	*/
//	@Override
//	public List<String> opChk(List<String> list) {
//		return shoppingDao.opChk(list);
//	}
	
	
	
}
