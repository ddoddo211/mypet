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
	* Method 설명 : 나의 펫 보험 - 현재보험금현황(반려)
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
	
	
	/**
	* Method : goAccidentDel
	* 작성자 : Yumint
	* 변경이력 :
	* @param accd_id
	* @return
	* Method 설명 : 보험금 신청 현황 화면에서 보험금 신청 취소를 클릭하였을떄 적용되는 부분
	*/
	int goAccidentDel(String accd_id);
	
	
	
	/**
	* Method : history
	* 작성자 : Yumint
	* 변경이력 :
	* @param accd_id
	* @return
	* Method 설명 :보험금 내역 확인 버튼을 클릭하였을때 나오는 부분
	*/
	AccidentVo history(String accd_id);
	
	/**
	* Method : accountChange
	* 작성자 : Yumint
	* 변경이력 :
	* @param acdVo
	* @return
	* Method 설명 :보험금내역 부분에서 계좌번호를 변경하였을떄 실행
	*/
	int accountChange(AccidentVo acdVo);
	
	
	/**
	* Method : claimPetJoinProd1
	* 작성자 : Yumint
	* 변경이력 :
	* @param isrVo
	* @return
	* Method 설명 : 나의 펫 보험 부분에서 가입이 완료된 상품만 나오게 설정
	*/
	List<InsuranceVo> claimPetJoinProd1 (InsuranceVo isrVo);
	
	/**
	* Method : mypetIsrDel
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_id
	* @return
	* Method 설명 :나의 펫 보험 화면에서 해당 펫의 가입되어 있는 보험상품 해지 하는 부분
	*/
	int mypetIsrDel(String ins_id);
	
	/**
	* Method : claimPetJoinProd2
	* 작성자 : Yumint
	* 변경이력 :
	* @param isrVo
	* @return
	* Method 설명 : 나의 펫 보험 - 보험 해지 되어 있는 가입내역이 나오는 부분
	*/
	List<InsuranceVo> claimPetJoinProd2 (InsuranceVo isrVo);
	
	
	/**
	* Method : claimPetJoinHandling
	* 작성자 : Yumint
	* 변경이력 :
	* @param isrVo
	* @return
	* Method 설명 : 나의 펫 보험 - 보험 신청 반려 되어 있는 가입내역이 나오는 부분
	*/
	List<InsuranceVo> claimPetJoinHandling (InsuranceVo isrVo);
	
	/**
	* Method : mypetInfoUpdate
	* 작성자 : Yumint
	* 변경이력 :
	* @param petVo
	* @return
	* Method 설명 :나의 펫 보험 화면에서 펫의 정보 수정하는 부분
	*/
	int mypetInfoUpdate (MypetVo petVo);
	
	/**
	* Method : petDelCondition
	* 작성자 : Yumint
	* 변경이력 :
	* @param accd_myp
	* @return
	* Method 설명 : 나의 펫 보험 - 펫 삭제할떄 보험금 청구 신청을 하였을때 삭제 못하도록 하는것
	*/
	List<AccidentVo> petDelCondition (String accd_myp);
	
	/**
	* Method : caninsured
	* 작성자 : Yumint
	* 변경이력 : 
	* @return
	* Method 설명 : 관리자용 - 보험상품관리 : 전체 가입가능한 보험상품 수
	*/
	public List<InsProdVo> caninsured();
	
	/**
	 * Method : dogProd
	 * 작성자 : Yumint
	 * 변경이력 : 
	 * @return
	 * Method 설명 : 관리자용 - 보험상품관리 : 강아지 보험 상품 수가 나오는 부분
	 */
	public List<InsProdVo> dogProd();
	
	/**
	 * Method : catProd
	 * 작성자 : Yumint
	 * 변경이력 : 
	 * @return
	 * Method 설명 : 관리자용 - 보험상품관리 : 고양이 보험 상품 수가 나오는 부분
	 */
	public List<InsProdVo> catProd();
	
	/**
	 * Method : catProd
	 * 작성자 : Yumint
	 * 변경이력 : 
	 * @return
	 * Method 설명 : 관리자용 - 보험상품관리 : 가입만료된 보험상품 수가 나오는 부분
	 */
	public List<InsProdVo> expiration();
	
	/**
	* Method : prodPageJoinList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 관리자용 - 보험상품관리 : 가입자수 나오는 리스트목록
	*/
	public List<InsProdVo> prodPageJoinList(InsurancePageVo pageVo);
	
	
	/**
	* Method : goInsProdDelUpdate
	* 작성자 : Yumint
	* 변경이력 :
	* @param prodId
	* @return
	* Method 설명 :관리자용 - 보험상품관리 : 가입여부 상태 만료로 변경하는 부분
	*/
	int goInsProdDelUpdate(String prodId);
	
	/**
	* Method : goInsProdDelRelease
	* 작성자 : Yumint
	* 변경이력 :
	* @param prodId
	* @return
	* Method 설명 :관리자용 - 보험상품관리 : 가입여부 상태 해제로 변경하는 부분
	*/
	int goInsProdDelRelease(String prodId);
	
	
	/**
	* Method : prodKindPageListM
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 관리자용 - 보험상품관리 : 조회조건을 주었을때 조회되는 리스트 부분
	*/
	public List<InsProdVo> prodKindPageListM(InsurancePageVo pageVo);
	
	/**  * Method   : getInsProductKindCntM
	  * 작성자 : PC 
	  * 변경이력 :  
	  * @return
	  * Method 설명 :  관리자용 - 보험상품관리 : 보험상품 총갯수(조건)
	*/
	int getInsProductKindCntM(String petKind);
	
	
	/**
	* Method : prodNameSame
	* 작성자 : Yumint
	* 변경이력 :
	* @param insp_kind
	* @return
	* Method 설명 : 관리자용 - 보험상품관리 : 보험상품을 등록할때 이름이 동일한건이 있는지 확인
	*/
	List<InsProdVo> prodNameSame(InsProdVo insProdVo);
	
	
	/**
	* Method : prodInsert
	* 작성자 : Yumint
	* 변경이력 :
	* @param insProdVo
	* @return
	* Method 설명 :관리자용 - 보험상품관리 : 보험상품 추가해주는 쿼리문
	*/
	int prodInsert(InsProdVo insProdVo);
	
	
	/**
	* Method : completed
	* 작성자 : Yumint
	* 변경이력 :
	* @param inssp_id
	* @return
	* Method 설명 : 관리자용 - 보험상품관리(보험상세화면) : 보험상품 가입완료자 수가 있는지 확인 
	*/
	List<InsProdVo> completed (String inssp_id);
	
	/**
	 * Method : applicant
	 * 작성자 : Yumint
	 * 변경이력 :
	 * @param inssp_id
	 * @return
	 * Method 설명 : 관리자용 - 보험상품관리(보험상세화면) : 보험상품 가입신청자 수가 있는지 확인 
	 */
	List<InsProdVo> applicant (String inssp_id);
	
	/**
	* Method : goInsProdUpdateS
	* 작성자 : Yumint
	* 변경이력 :
	* @param insProdVo
	* @return
	* Method 설명 :보험상품관리(보험내용수정) : 보험상품 내용수정하기
	*/
	int goInsProdUpdateS(InsProdVo insProdVo);
	
	
	/**
	* Method : applyList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 :보험신청/가입자관리 화면 : 보험신청자 나오는 부분 
	*/
	List<InsuranceVo> applyList ();
	
	/**
	 * Method : completeList
	 * 작성자 : Yumint
	 * 변경이력 :
	 * @return
	 * Method 설명 :보험신청/가입자관리 화면 : 보험가입자 나오는 부분 
	 */
	List<InsuranceVo> completeList();
	
	/**
	* Method : goApplyJoin
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_id
	* @return
	* Method 설명 :보험신청/가입자관리 화면 : 신청 승인 버튼을 클릭하였을때 가입여부를 완료로 변경해주는 부분
	*/
	int goApplyJoin (InsuranceVo isrVo);
	
	/**
	* Method : goCompanionJoin
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_id
	* @return
	* Method 설명 :보험신청/가입자관리 화면 : 신청 승인 버튼을 클릭하였을때 가입여부를 반려로 변경해주는 부분
	*/
	int goCompanionJoin (InsuranceVo isrVo);
	
	/**
	* Method : terminationList
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_id
	* @return
	* Method 설명 : 보험신청/가입자관리 화면 : 보험반려내역 나오는 부분
	*/
	List<InsuranceVo> terminationList ();
	
	
	
	/**
	* Method : goJoinCheck
	* 작성자 : Yumint
	* 변경이력 :
	* @param isrVo
	* @return
	* Method 설명 :관리자용 - 보험 상품 id를 줘서 해당 보험상품 정보가지고 오기 ( 보험상품 내용 & 가입자 정보
	*/
	InsuranceVo goJoinCheck(InsuranceVo isrVo);
	
	
	/**
	* Method : goJoinTermination
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_id
	* @return
	* Method 설명 :보험가입자 관리 화면에서 보험해지하기 버튼을 클릭하였을 경우 해당 보험목록 해지로 변경하기
	*/
	int goJoinTermination(String ins_id);
	
	/**
	* Method : handling
	* 작성자 : Yumint
	* 변경이력 :
	* @param ins_id
	* @return
	* Method 설명 :보험가입자 관리 화면에서 보험해지하기 버튼을 클릭하였을 경우 사고 테이블에서 해당 보험가입상품 아이디로 줘서 반려처리하기
	*/
	int handling(String ins_id);
	
	
	/**
	* Method : noticList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 :보험 공지사항 나오게 설정하기 
	*/
	List<InsuranceNoticeVo> noticList ();
	
	/**
	* Method : goNoticeInsert
	* 작성자 : Yumint
	* 변경이력 :
	* @param notice
	* @return
	* Method 설명 :공지사항 글 등록하는 부분
	*/
	int goNoticeInsert(InsuranceNoticeVo notice);
	
	
	/**
	* Method : goNoticeCheck
	* 작성자 : Yumint
	* 변경이력 :
	* @param inot_id
	* @return
	* Method 설명 :공지사항 글 확인하는 부분
	*/
	InsuranceNoticeVo goNoticeCheck (String inot_id);
	
	/**
	* Method : goNoticeDel
	* 작성자 : Yumint
	* 변경이력 :
	* @param inot_id
	* @return
	* Method 설명 :게시글 삭제하는 쿼리문 
	*/
	int goNoticeDel (String inot_id);
	
	/**
	* Method : goNoticeUpdateInsert
	* 작성자 : Yumint
	* 변경이력 :
	* @param insNoticeVo
	* @return
	* Method 설명 :공지사항 글 수정한 내용 입력시키기
	*/
	int goNoticeUpdateInsert(InsuranceNoticeVo insNoticeVo);
	
	
	/**
	* Method : goClaim
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험금 청구 관리 : 보험금 청구 (신청)리스트 나오는 부분
	*/
	List<AccidentVo> goClaim();
	
	/**
	* Method : goCompanion
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험금 청구 관리 : 보험금 청구 (반려)리스트 나오는 부분
	*/
	List<AccidentVo> goCompanion();
	
	/**
	* Method : goCompleted
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 보험금 청구 관리 : 보험금 청구 (완료)리스트 나오는 부분
	*/
	List<AccidentVo> goCompleted();
	
	/**
	* Method : memBlacklist
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 :보험금 청구 관리 : 블랙 리스트인 회원 조회하는부분
	*/
	List<MemberVo> memBlacklist();
	
	/**
	* Method : goBlackAdd
	* 작성자 : Yumint
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 :관리자용 - 보험청구관리 :해당 회원을 블랙리스트에 추가하는 부분  
	*/
	int goBlackAdd(String mem_id);
	
	/**
	* Method : handlingMemAll
	* 작성자 : Yumint
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 관리자용 - 보험청구관리 :해당 회원을 블랙리스트 하였을떄 회원이 신청한 보험건이 신청에서 반려로 변경되는 부분
	*/
	int handlingMemAll(String accd_mem);
	
	/**
	* Method : goBlackRelease
	* 작성자 : Yumint
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 :관리자용 - 보험청구관리 :해당 회원을 블랙리스트에 해제하는 부분  
	*/
	int goBlackRelease(String mem_id);
	
}
