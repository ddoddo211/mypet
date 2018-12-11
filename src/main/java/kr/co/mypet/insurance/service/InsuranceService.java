package kr.co.mypet.insurance.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.insurance.dao.InsuranceDaoInf;
import kr.co.mypet.insurance.model.InsProdVo;
import kr.co.mypet.insurance.model.InsshoppingVo;
import kr.co.mypet.insurance.model.InsuranceVo;
import kr.co.mypet.insurance.model.MypetVo;
import kr.co.mypet.insurance.model.PageVo;

@Service
public class InsuranceService implements InsuranceServiceInf {
	
	@Resource(name="insuranceDao")
	private InsuranceDaoInf insuranceDao;
	
	
	/**
	* Method : prodPageList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험상품리스트 가지고 오는 부분(페이징처리)
	*/
	@Override
	public Map<String, Object> prodPageList(PageVo pageVo) {

		// 페이지에 해당 하는 유저 리스트(1~10건) 
		List<InsProdVo> pageList = insuranceDao.prodPageList(pageVo);
		
		
		// 페이지 내비게이션을 위한 전체 유저 리스트 조회 
		int totalInsProductCnt = insuranceDao.getInsProductCnt();
		
		
		//리턴해야 하는게 두건일경우에는 (Map)
		// 결과를 담는 map
		Map<String , Object> resultMap = new HashMap<String , Object>();
		
		resultMap.put("pageList",pageList);
		
		//Math.ceil가 올림해주는 부분 
		resultMap.put("pageCnt",
				(int)Math.ceil((double)totalInsProductCnt / pageVo.getPageSize()));
		
		return resultMap;
	}
	
	/**
	* Method : prodKindPageList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험상품리스트 가지고 오는 부분(페이징처리)
	*/
	@Override
	public Map<String, Object> prodKindPageList(PageVo pageVo) {

		// 페이지에 해당 하는 유저 리스트(1~10건) 
		List<InsProdVo> pageList = insuranceDao.prodKindPageList(pageVo);
		
		// 페이지 내비게이션을 위한 전체 유저 리스트 조회 
		int totalInsProductCnt = insuranceDao.getInsProductKindCnt(pageVo.getPetKind());
		
		//리턴해야 하는게 두건일경우에는 (Map)
		// 결과를 담는 map
		Map<String , Object> resultMap = new HashMap<String , Object>();
		
		resultMap.put("pageList",pageList);
		
		//Math.ceil가 올림해주는 부분 
		resultMap.put("pageCnt",
				(int)Math.ceil((double)totalInsProductCnt / pageVo.getPageSize()));
		
		return resultMap;
	}

	/**
	* Method : prodProductRecommendation
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 우리아이 보험상품 
	*/
	@Override
	public Map<String, Object> prodProductRecommendation(PageVo pageVo) {
		// 페이지에 해당 하는 유저 리스트(1~10건) 
		List<InsProdVo> pageList = insuranceDao.prodProductRecommendation(pageVo);
		

		// 페이지 내비게이션을 위한 전체 유저 리스트 조회 
		int totalInsProductCnt = insuranceDao.getProductRecommendationCnt(pageVo);
		

		Map<String , Object> resultMap = new HashMap<String , Object>();
		
		resultMap.put("pageList",pageList);
		
		//Math.ceil가 올림해주는 부분 
		resultMap.put("pageCnt",
				(int)Math.ceil((double)totalInsProductCnt / pageVo.getPageSize()));
		
		return resultMap;
		
	}

	/**
	* Method : getProdInfo
	* 작성자 : Yumint
	* 변경이력 :
	* @param prodId
	* @return
	* Method 설명 : 보험상품 아이디를 매개변수로 줘서 보험상품 정보 가지고 오는 방법
	*/
	@Override
	public InsProdVo getProdInfo(String prodId) {
		return insuranceDao.getProdInfo(prodId);
	}
	
	/**
	* Method : planInsert
	* 작성자 : Yumint
	* 변경이력 :
	* @param memberId
	* @return
	* Method 설명 : 보험상품 상세내역에서 플랜정보에 추가하는 부분 
	*/
	public int planInsert (InsshoppingVo insshoppingVo) {
		return insuranceDao.planInsert(insshoppingVo);
	}

	/**
	* Method : memPlan
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_mem
	* @return
	* Method 설명 : 회원의 플랜정보에 추가된 보험상품 조회
	*/
	@Override
	public List<InsshoppingVo> memPlan(String inssp_mem) {
		return insuranceDao.memPlan(inssp_mem);
	}

	/**
	* Method : petList
	* 작성자 : Yumint
	* 변경이력 :
	* @param myp_mem
	* @return
	* Method 설명 :회원의 펫정보를 가지고 오는 부분
	*/
	@Override
	public List<MypetVo> petList(String myp_mem) {
		return insuranceDao.petList(myp_mem);
	}

	
	/**
	* Method : memberInfo
	* 작성자 : Yumint
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 회원 아이디를 줘서 회원의 정보를 받아오는 부분
	*/
	@Override
	public MemberVo memberInfo(MemberVo memVo) {
		return insuranceDao.memberInfo(memVo);
	};



	
	
	
}
