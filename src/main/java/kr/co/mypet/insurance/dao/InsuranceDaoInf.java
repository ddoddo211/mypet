package kr.co.mypet.insurance.dao;

import java.util.List;

import kr.co.mypet.common.model.AccountVo;
import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.common.model.PetkindVo;
import kr.co.mypet.insurance.model.AccidentVo;
import kr.co.mypet.insurance.model.InsProdVo;
import kr.co.mypet.insurance.model.InsshoppingVo;
import kr.co.mypet.insurance.model.InsuranceNoticeVo;
import kr.co.mypet.insurance.model.InsurancePageVo;
import kr.co.mypet.insurance.model.InsuranceVo;

public interface InsuranceDaoInf {
	

	// 보험상품 
	/**
	* Method : prodPageList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험상품리스트 가지고 오는 부분
	*/
	public List<InsProdVo> prodPageList(InsurancePageVo pageVo);
	
	/**  * Method   : getInsProductCnt
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  보험상품 리스트 전체 건수
	*/
	int getInsProductCnt();
	
	/**
	* Method : prodKindPageList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험상품리스트 가지고 오는 부분(조회조건(애완동물)
	*/
	public List<InsProdVo> prodKindPageList(InsurancePageVo pageVo);
	
	/**  * Method   : getInsProductKindCnt
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  보험상품 리스트 전체 건수(조회조건)
	*/
	int getInsProductKindCnt(String petKind);
	
	/**
	* Method : prodProductRecommendation
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 우리아이 보험상품 
	*/
	public List<InsProdVo> prodProductRecommendation(InsurancePageVo pageVo);
	
	/**  * Method   : getProductRecommendationCnt
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  우리아이 보험상품 총 갯수
	*/
	int getProductRecommendationCnt(InsurancePageVo pageVo);
	

	/**
	* Method : getProdInfo
	* 작성자 : Yumint
	* 변경이력 :
	* @param prodId
	* @return
	* Method 설명 : 보험상품 아이디를 매개변수로 줘서 보험상품 정보 가지고 오는 방법
	*/
	public InsProdVo getProdInfo(String prodId);
	
	/**
	* Method : planInsert
	* 작성자 : Yumint
	* 변경이력 :
	* @param memberId
	* @return
	* Method 설명 : 보험상품 상세내역에서 플랜정보에 추가하는 부분 
	*/
	int planInsert (InsshoppingVo insshoppingVo);
	
	/**
	* Method : memPlan
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_mem
	* @return
	* Method 설명 : 회원의 플랜정보에 추가된 보험상품 조회
	*/
	List<InsshoppingVo> memPlan(String inssp_mem);
	
	
	/**
	* Method : petList
	* 작성자 : Yumint
	* 변경이력 :
	* @param myp_mem
	* @return
	* Method 설명 :회원의 펫정보를 가지고 오는 부분
	*/
	List<InsshoppingVo> petList(String myp_mem);
	
	/**
	* Method : memberInfo
	* 작성자 : Yumint
	* 변경이력 :
	* @param memVo
	* @return
	* Method 설명 : 회원 아이디를 줘서 회원의 정보를 받아오는 부분
	*/
	MemberVo memberInfo(MemberVo memVo);
	
	
	/**
	* Method : insShProdDelete
	* 작성자 : Yumint
	* 변경이력 :
	* @param inssp_id
	* @return
	* Method 설명 : 플랜정보에서 보험상품삭제 버튼을 클릭하였을때 보험상품 아이디를 줘서 삭제하는 쿼리문
	*/
	int insShProdDelete (String inssp_id);
	

	/**
	* Method : mypetDel
	* 작성자 : Yumint
	* 변경이력 :
	* @param myp_id
	* @return
	* Method 설명 : 플랜정보에서 펫 삭제하기 버튼을 클릭하였을떄 펫의 아이디를 줘서 삭제하는 쿼리문 
	*/
	int mypetDel (String myp_id);
	
	
	
	/**
	* Method : insShList
	* 작성자 : Yumint
	* 변경이력 :
	* @param insShVo
	* @return
	* Method 설명 : 회원이 플랜정보 추가버튼을 클릭하였을때 이미 플랜정보에 추가되어진 상품인지 확인하는 부분
	*/
	InsshoppingVo insShList(InsshoppingVo insShVo);
	
	
	/**
	* Method : petKindList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 반려동물 품종 조회해오는 쿼리문
	*/
	List<PetkindVo> petKindList(String am_name);
	
	
	/**
	* Method : petIsrAlready
	* 작성자 : Yumint
	* 변경이력 :
	* @param myp_id
	* @return
	* Method 설명 :플랜정보에서 나의 펫에 현재 보험가입이 되어 있는 상품 보여주기
	*/
	List<InsuranceVo> petIsrAlready (String mem_id );
	
	
	/**
	* Method : mypetInfo
	* 작성자 : Yumint
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 펫 id를 줘서 해당 펫 정보가지고 오기
	*/
	MypetVo mypetInfo(String mem_id);

	/**
	* Method : insertPet
	* 작성자 : Yumint
	* 변경이력 :
	* @param mypetVo
	* @return
	* Method 설명 : 나의 반려동물 정보 추가
	*/
	public int insertPet(MypetVo mypetVo);
	
	
	/**
	* Method : petKindVo
	* 작성자 : Yumint
	* 변경이력 :
	* @param myp_petk
	* @return
	* Method 설명 : 마이펫에서 번호를 주면 품종 가지고 오는 쿼리문 (플랜정보에서 보험가입할때 이부분이 필요하다)
	*/
	PetkindVo petKindVo (String petk_id);
	
	/**
	* Method : isrProdMypetJoin
	* 작성자 : Yumint
	* 변경이력 :
	* @param isrVo
	* @return
	* Method 설명 : 보험상품 가입되는 부분
	*/
	int isrProdMypetJoin(InsuranceVo isrVo);
	
	
	/**
	* Method : shoppingJoinProd
	* 작성자 : Yumint
	* 변경이력 :
	* @param deleteProd
	* @return
	* Method 설명 :보험가입이 완료 된다면 해당 플랜정보(장바구니)화면에 해당 상품이 삭제 되도록 만들기
	*/
	int shoppingJoinProd(String deleteProd);
	
	
	/**
	* Method : memAccidentList
	* 작성자 : Yumint
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 회원의 이메일(pk)로 보내서 회원의 계좌번호를 가지고 오는 방법
	*/
	List<AccountVo> memAccountList(String mem_id);
	
	
	/**
	* Method : insNotice
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 :보상안내 공지사항 나오게 설정 
	*/
	List<InsuranceNoticeVo> insNotice();
	
	
	
	/**
	* Method : claimPetJoinProd
	* 작성자 : Yumint
	* 변경이력 :
	* @param isrVo
	* @return
	* Method 설명 :보상안내 - 보험가입할때 해당 펫의 가입되어 있는 보험상품 나오게 설정
	*/
	List<InsuranceVo> claimPetJoinProd (InsuranceVo isrVo);
	
	
	/**
	* Method : insuredPerson
	* 작성자 : Yumint
	* 변경이력 :
	* @param memId
	* @return
	* Method 설명 : 피보험자 선택하는 부분에 가입이 완료된 상품 나오게 설정
	*/
	List<InsuranceVo> insuredPerson (String memId);
	
	
	/**
	* Method : accidentInsert
	* 작성자 : Yumint
	* 변경이력 :
	* @param acdVo
	* @return
	* Method 설명 : 보험청구 신청하는 부분
	*/
	int accidentInsert(AccidentVo acdVo);
	
	
	/**
	* Method : isuranceStatus
	* 작성자 : Yumint
	* 변경이력 :
	* @param memId
	* @return
	* Method 설명 : 나의 펫 보험 - 회원이 현재까지 받은 보험금 현황
	*/
	int isuranceStatus(String memId);
	
	/**
	* Method : monthlyPremium
	* 작성자 : Yumint
	* 변경이력 :
	* @param memId
	* @return
	* Method 설명 :나의펫 보험 - 월 전체 보험료 나오는 부분
	*/
	int monthlyPremium(String memId);
	
	
	/**
	* Method : isrApply
	* 작성자 : Yumint
	* 변경이력 :
	* @param memId
	* @return
	* Method 설명 : 나의 펫 보험 - 현재보험금 신청현황(신청)
	*/
	List<AccidentVo> isrApply (String memId);
	
	/**
	* Method : underExamination
	* 작성자 : Yumint
	* 변경이력 :
	* @param memId
	* @return
	* Method 설명 : 나의 펫 보험 - 현재보험금현황(심사중)
	*/
	List<AccidentVo> underExamination (String memId);
	
	/**
	* Method : isrComplete
	* 작성자 : Yumint
	* 변경이력 :
	* @param memId
	* @return
	* Method 설명 : 나의 펫 보험 - 현재보험금현황(완료)
	*/
	List<AccidentVo> isrComplete (String memId);

}
