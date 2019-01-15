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
		return template.update("petIns.mypetDel", myp_id);
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
	* Method 설명 : 반려동물 품종 조회해오는 쿼리문 (펫 추가할때 사용)
	*/
	@Override
	public List<PetkindVo> petKindList(String am_name) {
		return template.selectList("petIns.petKindList" , am_name);
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
	public PetkindVo petKindVo(PetkindVo petKindVo) {
		return template.selectOne("petIns.petKindVo", petKindVo);
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



	/**
	* Method : claimPetJoinProd1
	* 작성자 : Yumint
	* 변경이력 :
	* @param isrVo
	* @return
	* Method 설명 : 나의 펫 보험 부분에서 가입이 완료된 상품만 나오게 설정
	*/
	@Override
	public List<InsuranceVo> claimPetJoinProd1(InsuranceVo isrVo) {
		return template.selectList("petIns.claimPetJoinProd1",isrVo);
	}


	/**
	* Method : mypetIsrDel
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_id
	* @return
	* Method 설명 :나의 펫 보험 화면에서 해당 펫의 가입되어 있는 보험상품 해지 하는 부분
	*/
	@Override
	public int mypetIsrDel(String ins_id) {
		return template.update("petIns.mypetIsrDel",ins_id);
	}



	/**
	* Method : claimPetJoinProd2
	* 작성자 : Yumint
	* 변경이력 :
	* @param isrVo
	* @return
	* Method 설명 : 나의 펫 보험 - 보험 해지 되어 있는 가입내역이 나오는 부분
	*/
	@Override
	public List<InsuranceVo> claimPetJoinProd2(InsuranceVo isrVo) {
		return template.selectList("petIns.claimPetJoinProd2",isrVo);
	}
	
	/**
	* Method : claimPetJoinHandling
	* 작성자 : Yumint
	* 변경이력 :
	* @param isrVo
	* @return
	* Method 설명 : 나의 펫 보험 - 보험 신청 반려 되어 있는 가입내역이 나오는 부분
	*/
	@Override
	public List<InsuranceVo> claimPetJoinHandling(InsuranceVo isrVo) {
		return template.selectList("petIns.claimPetJoinHandling",isrVo);
	}


	/**
	* Method : mypetInfoUpdate
	* 작성자 : Yumint
	* 변경이력 :
	* @param petVo
	* @return
	* Method 설명 :나의 펫 보험 화면에서 펫의 정보 수정하는 부분
	*/
	@Override
	public int mypetInfoUpdate(MypetVo petVo) {
		return template.update("petIns.mypetInfoUpdate",petVo);
	}


	/**
	* Method : petDelCondition
	* 작성자 : Yumint
	* 변경이력 :
	* @param accd_myp
	* @return
	* Method 설명 : 나의 펫 보험 - 펫 삭제할떄 보험금 청구 신청을 하였을때 삭제 못하도록 하는것
	*/
	@Override
	public List<AccidentVo> petDelCondition(String accd_myp) {
		return template.selectList("petIns.petDelCondition",accd_myp);
	}


	/**
	* Method : caninsured
	* 작성자 : Yumint
	* 변경이력 : 
	* @return
	* Method 설명 : 관리자용 - 보험상품관리 : 전체 가입가능한 보험상품 수
	*/
	@Override
	public List<InsProdVo> caninsured() {
		return template.selectList("petIns.caninsured");
	}


	/**
	 * Method : dogProd
	 * 작성자 : Yumint
	 * 변경이력 : 
	 * @return
	 * Method 설명 : 관리자용 - 보험상품관리 : 강아지 보험 상품 수가 나오는 부분
	 */
	@Override
	public List<InsProdVo> dogProd() {
		return template.selectList("petIns.dogProd");
	}


	/**
	 * Method : catProd
	 * 작성자 : Yumint
	 * 변경이력 : 
	 * @return
	 * Method 설명 : 관리자용 - 보험상품관리 : 고양이 보험 상품 수가 나오는 부분
	 */
	@Override
	public List<InsProdVo> catProd() {
		return template.selectList("petIns.catProd");
	}


	/**
	 * Method : catProd
	 * 작성자 : Yumint
	 * 변경이력 : 
	 * @return
	 * Method 설명 : 관리자용 - 보험상품관리 : 가입만료된 보험상품 수가 나오는 부분
	 */
	@Override
	public List<InsProdVo> expiration() {
		return template.selectList("petIns.expiration");
	}


	/**
	* Method : prodPageList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 관리자용 - 보험상품관리 : 가입자수 나오는 리스트목록
	*/
	@Override
	public List<InsProdVo> prodPageJoinList(InsurancePageVo pageVo) {
		return template.selectList("petIns.prodPageJoinList" , pageVo);
	}



	/**
	* Method : goInsProdDelUpdate
	* 작성자 : Yumint
	* 변경이력 :
	* @param prodId
	* @return
	* Method 설명 :관리자용 - 보험상품관리 : 가입여부 상태 만료로 변경하는 부분
	*/
	@Override
	public int goInsProdDelUpdate(String prodId) {
		return template.update("petIns.goInsProdDelUpdate",prodId);
	}
	
	/**
	* Method : goInsProdDelRelease
	* 작성자 : Yumint
	* 변경이력 :
	* @param prodId
	* @return
	* Method 설명 :관리자용 - 보험상품관리 : 가입여부 상태 해제로 변경하는 부분
	*/
	@Override
	public int goInsProdDelRelease(String prodId) {
		return template.update("petIns.goInsProdDelRelease",prodId);
	}


	/**
	* Method : prodKindPageListM
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 관리자용 - 보험상품관리 : 조회조건을 주었을때 조회되는 리스트 부분
	*/
	@Override
	public List<InsProdVo> prodKindPageListM(InsurancePageVo pageVo) {
		return template.selectList("petIns.prodKindPageListM" , pageVo);
	}


	/**  * Method   : getInsProductKindCntM
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  관리자용 - 보험상품관리 : 보험상품 총갯수(조건)
	*/
	@Override
	public int getInsProductKindCntM(String petKind) {
		return template.selectOne("petIns.getInsProductKindCntM" ,petKind);
	}


	/**
	* Method : prodNameSame
	* 작성자 : Yumint
	* 변경이력 :
	* @param insp_kind
	* @return
	* Method 설명 : 관리자용 - 보험상품관리 : 보험상품을 등록할때 이름이 동일한건이 있는지 확인
	*/
	@Override
	public List<InsProdVo> prodNameSame(InsProdVo insProdVo) {
		return template.selectList("petIns.prodNameSame" , insProdVo);
	}


	/**
	* Method : prodInsert
	* 작성자 : Yumint
	* 변경이력 :
	* @param insProdVo
	* @return
	* Method 설명 :관리자용 - 보험상품관리 : 보험상품 추가해주는 쿼리문
	*/
	@Override
	public int prodInsert(InsProdVo insProdVo) {
		return template.insert("petIns.prodInsert", insProdVo);
	}


	/**
	* Method : completed
	* 작성자 : Yumint
	* 변경이력 :
	* @param inssp_id
	* @return
	* Method 설명 : 관리자용 - 보험상품관리(보험상세화면) : 보험상품 가입완료자 수가 있는지 확인 
	*/
	@Override
	public List<InsProdVo> completed(String inssp_id) {
		return template.selectList("petIns.completed" , inssp_id);
	}


	/**
	 * Method : applicant
	 * 작성자 : Yumint
	 * 변경이력 :
	 * @param inssp_id
	 * @return
	 * Method 설명 : 관리자용 - 보험상품관리(보험상세화면) : 보험상품 가입신청자 수가 있는지 확인 
	 */
	@Override
	public List<InsProdVo> applicant(String inssp_id) {
		return template.selectList("petIns.applicant" , inssp_id);
	}


	/**
	* Method : goInsProdUpdateS
	* 작성자 : Yumint
	* 변경이력 :
	* @param insProdVo
	* @return
	* Method 설명 :보험상품관리(보험내용수정) : 보험상품 내용수정하기
	*/
	@Override
	public int goInsProdUpdateS(InsProdVo insProdVo) {
		return template.update("petIns.goInsProdUpdateS" ,insProdVo );
	}


	/**
	* Method : applyList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 :보험신청/가입자관리 화면 : 보험신청자 나오는 부분 
	*/
	@Override
	public List<InsuranceVo> applyList() {
		return template.selectList("petIns.applyList" );
	}


	/**
	* Method : completeList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 :보험신청/가입자관리 화면 : 보험가입자 나오는 부분 
	*/
	@Override
	public List<InsuranceVo> completeList() {
		return template.selectList("petIns.completeList" );
	}


	/**
	* Method : goApplyJoin
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_id
	* @return
	* Method 설명 :보험신청/가입자관리 화면 : 신청 승인 버튼을 클릭하였을때 가입여부를 완료로 변경해주는 부분
	*/
	@Override
	public int goApplyJoin(InsuranceVo isrVo) {
		return template.update("petIns.goApplyJoin" ,isrVo );
	}


	/**
	* Method : goCompanionJoin
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_id
	* @return
	* Method 설명 :보험신청/가입자관리 화면 : 신청 승인 버튼을 클릭하였을때 가입여부를 반려로 변경해주는 부분
	*/
	@Override
	public int goCompanionJoin(InsuranceVo isrVo) {
		return template.update("petIns.goCompanionJoin" ,isrVo );
	}


	/**
	* Method : terminationList
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_id
	* @return
	* Method 설명 : 보험신청/가입자관리 화면 : 보험반려내역 나오는 부분
	*/
	@Override
	public List<InsuranceVo> terminationList() {
		return template.selectList("petIns.terminationList" );
	}


	/**
	* Method : goJoinCheck
	* 작성자 : Yumint
	* 변경이력 :
	* @param isrVo
	* @return
	* Method 설명 :관리자용 - 보험 상품 id를 줘서 해당 보험상품 정보가지고 오기 ( 보험상품 내용 & 가입자 정보
	*/
	@Override
	public InsuranceVo goJoinCheck(InsuranceVo isrVo) {
		return template.selectOne("petIns.goJoinCheck" , isrVo );
	}


	/**
	* Method : goJoinTermination
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_id
	* @return
	* Method 설명 :보험가입자 관리 화면에서 보험해지하기 버튼을 클릭하였을 경우 해당 보험목록 해지로 변경하기
	*/
	@Override
	public int goJoinTermination(String ins_id) {
		return template.update("petIns.goJoinTermination" , ins_id );
	}


	/**
	* Method : handling
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_id
	* @return
	* Method 설명 :보험가입자 관리 화면에서 보험해지하기 버튼을 클릭하였을 경우 사고 테이블에서 해당 보험가입상품 아이디로 줘서 반려처리하기
	*/
	@Override
	public int handling(String ins_id) {
		return template.update("petIns.handling" , ins_id );
	}


	/**
	* Method : noticList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 :보험 공지사항 나오게 설정하기 
	*/
	@Override
	public List<InsuranceNoticeVo> noticList() {
		return template.selectList("petIns.noticList");
	}


	/**
	* Method : goNoticeInsert
	* 작성자 : Yumint
	* 변경이력 :
	* @param notice
	* @return
	* Method 설명 :공지사항 글 등록하는 부분
	*/
	@Override
	public int goNoticeInsert(InsuranceNoticeVo notice) {
		return template.insert("petIns.goNoticeInsert", notice);
	}


	/**
	* Method : goNoticeCheck
	* 작성자 : Yumint
	* 변경이력 :
	* @param inot_id
	* @return
	* Method 설명 :공지사항 글 확인하는 부분
	*/
	@Override
	public InsuranceNoticeVo goNoticeCheck(String inot_id) {
		return template.selectOne("petIns.goNoticeCheck" , inot_id );
	}


	/**
	* Method : goNoticeDel
	* 작성자 : Yumint
	* 변경이력 :
	* @param inot_id
	* @return
	* Method 설명 :게시글 삭제하는 쿼리문 
	*/
	@Override
	public int goNoticeDel(String inot_id) {
		return template.delete("petIns.goNoticeDel" , inot_id);	
	}


	/**
	* Method : goNoticeUpdateInsert
	* 작성자 : Yumint
	* 변경이력 :
	* @param insNoticeVo
	* @return
	* Method 설명 :공지사항 글 수정한 내용 입력시키기
	*/
	@Override
	public int goNoticeUpdateInsert(InsuranceNoticeVo insNoticeVo) {
		return template.update("petIns.goNoticeUpdateInsert", insNoticeVo);
	}


	/**
	* Method : goClaim
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험금 청구 관리 : 보험금 청구 (신청)리스트 나오는 부분
	*/
	@Override
	public List<AccidentVo> goClaim() {
		return template.selectList("petIns.goClaim");
	}


	/**
	* Method : goCompanion
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험금 청구 관리 : 보험금 청구 (반려)리스트 나오는 부분
	*/
	@Override
	public List<AccidentVo> goCompanion() {
		return template.selectList("petIns.goCompanion");
	}


	/**
	* Method : goCompleted
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험금 청구 관리 : 보험금 청구 (완료)리스트 나오는 부분
	*/
	@Override
	public List<AccidentVo> goCompleted() {
		return template.selectList("petIns.goCompleted");
	}


	/**
	* Method : memBlacklist
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 :보험금 청구 관리 : 블랙 리스트인 회원 조회하는부분
	*/
	@Override
	public List<MemberVo> memBlacklist() {
		return template.selectList("petIns.memBlacklist");
	}


	/**
	* Method : goBlackAdd
	* 작성자 : Yumint
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 :관리자용 - 보험청구관리 :해당 회원을 블랙리스트에 추가하는 부분  
	*/
	@Override
	public int goBlackAdd(String mem_id) {
		return template.update("petIns.goBlackAdd", mem_id);
	}


	/**
	* Method : handlingMemAll
	* 작성자 : Yumint
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 관리자용 - 보험청구관리 :해당 회원을 블랙리스트 하였을떄 회원이 신청한 보험건이 신청에서 반려로 변경되는 부분
	*/
	@Override
	public int handlingMemAll(String accd_mem) {
		return template.update("petIns.handlingMemAll", accd_mem);
	}


	/**
	* Method : goBlackRelease
	* 작성자 : Yumint
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 :관리자용 - 보험청구관리 :해당 회원을 블랙리스트에 해제하는 부분  
	*/
	@Override
	public int goBlackRelease(String mem_id) {
		return template.update("petIns.goBlackRelease", mem_id);
	}


	/**
	* Method : accidentApply
	* 작성자 : Yumint
	* 변경이력 :
	* @param accd_id
	* @return
	* Method 설명 :관리자용 - 보험청구관리 :해당 회원을 블랙리스트에 해제하는 부분
	*/
	@Override
	public AccidentVo accidentApply(String accd_id) {
		return template.selectOne("petIns.accidentApply" , accd_id );
	}


	/**
	* Method : insPayment
	* 작성자 : Yumint
	* 변경이력 :
	* @param acdVo
	* @return
	* Method 설명 :관리자용 - 보험청구관리(신청) : 결과를 완료로 입력하는 부분
	*/
	@Override
	public int insPayment(AccidentVo acdVo) {
		return template.update("petIns.insPayment", acdVo);
	}


	/**
	* Method : unpaid
	* 작성자 : Yumint
	* 변경이력 :
	* @param acdVo
	* @return
	* Method 설명 :관리자용 - 보험청구관리(신청) : 결과를 반려로 입력하는 부분
	*/
	@Override
	public int unpaid(AccidentVo acdVo) {
		return template.update("petIns.unpaid", acdVo);
	}


	/**
	* Method : insprodCancel
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_id
	* @return
	* Method 설명 :나의 펫 보험 화면에서 해당 펫의 가입되어 있는 보험상품 신청 취소 버튼을 클릭하였을 경우
	*/
	@Override
	public int insprodCancel(String ins_id) {
		return template.update("petIns.insprodCancel", ins_id);
	}


	/**
	* Method : goPaymentSucces
	* 작성자 : Yumint
	* 변경이력 :
	* @param accd_id
	* @return
	* Method 설명 :나의 펫 보험 화면에서 해당 펫의 가입되어 있는 보험상품 결재하기 버튼을 클릭하였을 경우 보험가입상태를 결재완료로 변경 
	*/
	@Override
	public int goPaymentSucces(String accd_id) {
		return template.update("petIns.goPaymentSucces", accd_id);
	}


	/**
	* Method : insCnt
	* 작성자 : Yumint
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 플랜정보 이미 등록된 가입 상품일 경우 
	*/
	@Override
	public MypetVo insCnt(MypetVo mpVo) {
		// TODO Auto-generated method stub
		return template.selectOne("petIns.insCnt" , mpVo);
	}
}
