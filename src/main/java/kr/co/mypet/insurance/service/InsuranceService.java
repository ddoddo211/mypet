package kr.co.mypet.insurance.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.common.model.PetkindVo;
import kr.co.mypet.insurance.dao.InsuranceDaoInf;
import kr.co.mypet.insurance.model.InsProdVo;
import kr.co.mypet.insurance.model.InsshoppingVo;
import kr.co.mypet.insurance.model.InsurancePageVo;
import kr.co.mypet.insurance.model.InsuranceVo;

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
	public Map<String, Object> prodPageList(InsurancePageVo pageVo) {

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
	public Map<String, Object> prodKindPageList(InsurancePageVo pageVo) {

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
	public Map<String, Object> prodProductRecommendation(InsurancePageVo pageVo) {
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
	public List<InsshoppingVo> petList(String myp_mem) {
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
	}

	
	/**
	* Method : insShProdDelete
	* 작성자 : Yumint
	* 변경이력 :
	* @param inssp_id
	* @return
	* Method 설명 : 플랜정보에서 보험상품삭제 버튼을 클릭하였을때 보험상품 아이디를 줘서 삭제하는 쿼리문
	*/
	@Override
	public int insShProdDelete(String inssp_id) {
		return insuranceDao.insShProdDelete(inssp_id);
	}

	
	/**
	* Method : mypetDel
	* 작성자 : Yumint
	* 변경이력 :
	* @param myp_id
	* @return
	* Method 설명 : 플랜정보에서 펫 삭제하기 버튼을 클릭하였을떄 펫의 아이디를 줘서 삭제하는 쿼리문 
	*/
	@Override
	public int mypetDel(String myp_id) {
		return insuranceDao.mypetDel(myp_id);
	}

	
	/**
	* Method : insShList
	* 작성자 : Yumint
	* 변경이력 :
	* @param insShVo
	* @return
	* Method 설명 : 회원이 플랜정보 추가버튼을 클릭하였을때 이미 플랜정보에 추가되어진 상품인지 확인하는 부분
	*/
	@Override
	public InsshoppingVo insShList(InsshoppingVo insShVo) {
		return insuranceDao.insShList(insShVo);
	}

	
	/**
	* Method : petKindList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 반려동물 품종 조회해오는 쿼리문
	*/
	@Override
	public List<PetkindVo> petKindList(String am_name) {
		return insuranceDao.petKindList(am_name);
	}

	/**
	* Method : petIsrAlready
	* 작성자 : Yumint
	* 변경이력 :
	* @param myp_id
	* @return
	* Method 설명 :플랜정보에서 나의 펫에 현재 보험가입이 되어 있는 상품 보여주기
	*/
	@Override
	public List<InsuranceVo> petIsrAlready(String mem_id) {
		return insuranceDao.petIsrAlready(mem_id);
	}

	@Override
	public MypetVo mypetInfo(String mem_id) {
		return insuranceDao.mypetInfo(mem_id);
	}

	@Override
	public int insertPet(MypetVo mypetVo) {
		return insuranceDao.insertPet(mypetVo);
	}

	
	
}
