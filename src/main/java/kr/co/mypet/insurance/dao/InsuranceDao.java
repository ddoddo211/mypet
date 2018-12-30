package kr.co.mypet.insurance.dao;

import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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


@Repository
public class InsuranceDao implements InsuranceDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	

	/**
	* Method : prodPageList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험상품리스트 가지고 오는 부분
	*/
	@Override
	public List<InsProdVo> prodPageList(InsurancePageVo pageVo) {
		return template.selectList("petIns.prodPageList" , pageVo);
	}
	


	/**  * Method   : getInsProductCnt
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  보험상품 리스트 전체 건수
	*/
	@Override
	public int getInsProductCnt() {
		return template.selectOne("petIns.getInsProductCnt");
	}
	
	/**
	* Method : prodKindPageList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험상품리스트 가지고 오는 부분(조회조건(애완동물)
	*/
	@Override
	public List<InsProdVo> prodKindPageList(InsurancePageVo pageVo) {
		return template.selectList("petIns.prodKindPageList" , pageVo);
	}
	
	/**  * Method   : getInsProductKindCnt
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  보험상품 리스트 전체 건수(조회조건)
	*/
	@Override
	public int getInsProductKindCnt(String petKind) {
		return template.selectOne("petIns.getInsProductKindCnt" ,petKind);
	}


	/**
	* Method : prodProductRecommendation
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 우리아이 보험상품 
	*/
	@Override
	public List<InsProdVo> prodProductRecommendation(InsurancePageVo pageVo) {
		return template.selectList("petIns.prodProductRecommendation" , pageVo);
	}
	
	/**  * Method   : getProductRecommendationCnt
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  우리아이 보험상품 총 갯수(페이지 처리를 위해)
	*/
	@Override
	public int getProductRecommendationCnt(InsurancePageVo pageVo) {
		return template.selectOne("petIns.getProductRecommendationCnt" , pageVo);
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
		return template.selectOne("petIns.getProdInfo" , prodId);
	}

	/**
	* Method : planInsert
	* 작성자 : Yumint
	* 변경이력 :
	* @param memberId
	* @return
	* Method 설명 : 보험상품 상세내역에서 플랜정보에 추가하는 부분 
	*/
	@Override
	public int planInsert(InsshoppingVo insshoppingVo) {
		return template.insert("petIns.planInsert" , insshoppingVo);
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
		return template.selectList("petIns.memPlan" , inssp_mem);
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
		return template.selectList("petIns.petList" , myp_mem);
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
		return template.selectOne("member.login" , memVo);
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
		return template.delete("petIns.insShProdDelete", inssp_id);
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
		return template.delete("petIns.mypetDel", myp_id);
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
		return template.selectOne("petIns.memShopping",insShVo);
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
		return template.selectList("petIns.petKind" , am_name);
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
		return template.selectList("petIns.petIsrAlready" , mem_id);
	}


	/**
	* Method : mypetInfo
	* 작성자 : Yumint
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 펫 id를 줘서 해당 펫 정보가지고 오기
	*/
	@Override
	public MypetVo mypetInfo(String mem_id) {
		return template.selectOne("petIns.mypetInfo" , mem_id);
	}


	/**
	* Method : insertPet
	* 작성자 : Yumint
	* 변경이력 :
	* @param mypetVo
	* @return
	* Method 설명 : 펫 정보를 입력하여 추가하기
	*/
	@Override
	public int insertPet(MypetVo mypetVo) {
		return template.insert("petIns.mypetInsert", mypetVo);
	}



	/**
	* Method : petKindVo
	* 작성자 : Yumint
	* 변경이력 :
	* @param myp_petk
	* @return
	* Method 설명 : 마이펫에서 번호를 주면 품종 가지고 오는 쿼리문 (플랜정보에서 보험가입할때 이부분이 필요하다)
	*/
	@Override
	public PetkindVo petKindVo(String petk_id) {
		return template.selectOne("petIns.petIrsJoinKind", petk_id);
	}



	/**
	* Method : isrProdMypetJoin
	* 작성자 : Yumint
	* 변경이력 :
	* @param isrVo
	* @return
	* Method 설명 : 보험상품 가입되는 부분
	*/
	@Override
	public int isrProdMypetJoin(InsuranceVo isrVo) {
		return template.insert("petIns.isrProdMypetJoin",isrVo);
	}


	/**
	* Method : shoppingJoinProd
	* 작성자 : Yumint
	* 변경이력 :
	* @param deleteProd
	* @return
	* Method 설명 :보험가입이 완료 된다면 해당 플랜정보(장바구니)화면에 해당 상품이 삭제 되도록 만들기
	*/
	@Override
	public int shoppingJoinProd(String deleteProd) {
		return template.insert("petIns.shoppingJoinProd",deleteProd);
	}


	/**
	* Method : memAccidentList
	* 작성자 : Yumint
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 해당 회원의 이메일(pk)로 보내서 회원의 계좌번호를 가지고 오는 방법
	*/
	@Override
	public List<AccountVo> memAccountList(String mem_id) {
		return template.selectList("petIns.memAccountList", mem_id);
	}



	/**
	* Method : insNotice
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 :보상안내 공지사항 나오게 설정 
	*/
	@Override
	public List<InsuranceNoticeVo> insNotice() {
		return template.selectList("petIns.insNotice");
	}



	/**
	* Method : claimPetJoinProd
	* 작성자 : Yumint
	* 변경이력 :
	* @param isrVo
	* @return
	* Method 설명 :보상안내 - 보험가입할때 해당 펫의 가입되어 있는 보험상품 나오게 설정
	*/
	@Override
	public List<InsuranceVo> claimPetJoinProd(InsuranceVo isrVo) {
		return template.selectList("petIns.claimPetJoinProd" ,isrVo);
	}



	/**
	* Method : insuredPerson
	* 작성자 : Yumint
	* 변경이력 :
	* @param memId
	* @return
	* Method 설명 : 피보험자 선택하는 부분에 가입이 완료된 상품 나오게 설정
	*/
	@Override
	public List<InsuranceVo> insuredPerson(String memId) {
		return template.selectList("petIns.insuredPerson" ,memId);
	}



	/**
	* Method : accidentInsert
	* 작성자 : Yumint
	* 변경이력 :
	* @param acdVo
	* @return
	* Method 설명 : 보험청구 신청하는 부분
	*/
	@Override
	public int accidentInsert(AccidentVo acdVo) {
		return template.insert("petIns.accidentInsert", acdVo );
	}



	/**
	* Method : isuranceStatus
	* 작성자 : Yumint
	* 변경이력 :
	* @param memId
	* @return
	* Method 설명 : 나의 펫 보험 - 회원이 현재까지 받은 보험금 현황
	*/
	@Override
	public int isuranceStatus(String memId) {
		return template.selectOne("petIns.isuranceStatus", memId);
	}


	/**
	* Method : monthlyPremium
	* 작성자 : Yumint
	* 변경이력 :
	* @param memId
	* @return
	* Method 설명 :나의펫 보험 - 월 전체 보험료 나오는 부분
	*/
	@Override
	public int monthlyPremium(String memId) {
		return template.selectOne("petIns.monthlyPremium", memId);
	}


	/**
	* Method : isrApply
	* 작성자 : Yumint
	* 변경이력 :
	* @param memId
	* @return
	* Method 설명 : 나의 펫 보험 - 현재보험금 신청현황(신청)
	*/
	@Override
	public List<AccidentVo> isrApply(String memId) {
		return template.selectList("petIns.isrApply", memId);
	}
	
	/**
	* Method : underExamination
	* 작성자 : Yumint
	* 변경이력 :
	* @param memId
	* @return
	* Method 설명 : 나의 펫 보험 - 현재보험금현황(반려)
	*/
	@Override
	public List<AccidentVo> underExamination(String memId) {
		return template.selectList("petIns.underExamination", memId);
	}


	/**
	* Method : isrComplete
	* 작성자 : Yumint
	* 변경이력 :
	* @param memId
	* @return
	* Method 설명 : 나의 펫 보험 - 현재보험금현황(완료)
	*/
	@Override
	public List<AccidentVo> isrComplete(String memId) {
		return template.selectList("petIns.isrComplete", memId);
	}


	/**
	* Method : goAccidentDel
	* 작성자 : Yumint
	* 변경이력 :
	* @param accd_id
	* @return
	* Method 설명 : 보험금 신청 현황 화면에서 보험금 신청 취소를 클릭하였을떄 적용되는 부분
	*/
	@Override
	public int goAccidentDel(String accd_id) {
		return template.delete("petIns.goAccidentDel",accd_id);
	}


	/**
	* Method : history
	* 작성자 : Yumint
	* 변경이력 :
	* @param accd_id
	* @return
	* Method 설명 :보험금 내역 확인 버튼을 클릭하였을때 나오는 부분
	*/
	@Override
	public AccidentVo history(String accd_id) {
		return template.selectOne("petIns.history",accd_id);
	}


	/**
	* Method : accountChange
	* 작성자 : Yumint
	* 변경이력 :
	* @param acdVo
	* @return
	* Method 설명 :보험금내역 부분에서 계좌번호를 변경하였을떄 실행
	*/
	@Override
	public int accountChange(AccidentVo acdVo) {
		return template.update("petIns.accountChange",acdVo);
	}



}
