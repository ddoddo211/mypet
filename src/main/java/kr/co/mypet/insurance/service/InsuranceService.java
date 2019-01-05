package kr.co.mypet.insurance.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import kr.co.mypet.common.model.AccountVo;
import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.common.model.PetkindVo;
import kr.co.mypet.insurance.dao.InsuranceDaoInf;
import kr.co.mypet.insurance.model.AccidentVo;
import kr.co.mypet.insurance.model.InsProdVo;
import kr.co.mypet.insurance.model.InsshoppingVo;
import kr.co.mypet.insurance.model.InsuranceNoticeVo;
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
	* Method 설명 : 조회조건으로 페이지 리스트 나오는 부분
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
		return insuranceDao.mypetInfo(mem_id);
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
		return insuranceDao.insertPet(mypetVo);
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
		return insuranceDao.petKindVo(petk_id);
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
		return insuranceDao.isrProdMypetJoin(isrVo);
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
		return insuranceDao.shoppingJoinProd(deleteProd);
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
		return insuranceDao.memAccountList(mem_id);
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
		return insuranceDao.insNotice();
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
		return insuranceDao.claimPetJoinProd(isrVo);
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
		return insuranceDao.insuredPerson(memId);
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
		return insuranceDao.accidentInsert(acdVo);
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
		return insuranceDao.isuranceStatus(memId);
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
		return insuranceDao.monthlyPremium(memId);
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
		return insuranceDao.isrApply(memId);
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
		return insuranceDao.underExamination(memId);
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
		return insuranceDao.isrComplete(memId);
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
		return insuranceDao.goAccidentDel(accd_id);
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
		return insuranceDao.history(accd_id);
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
		return insuranceDao.accountChange(acdVo);
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
		return insuranceDao.claimPetJoinProd1(isrVo);
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
		return insuranceDao.mypetIsrDel(ins_id);
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
		return insuranceDao.claimPetJoinProd2(isrVo);
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
		return insuranceDao.mypetInfoUpdate(petVo);
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
		return insuranceDao.petDelCondition(accd_myp);
	}

	
	/**
	* Method : caninsured
	* 작성자 : Yumint
	* 변경이력 : 
	* @return
	* Method 설명 : 관리자용 - 보험상품관리 : 전체 가입가능한 보험상품 수
	*/
	@Override
	public  List<InsProdVo> caninsured() {
		return insuranceDao.caninsured();
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
		return insuranceDao.dogProd();
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
		return insuranceDao.catProd();
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
		return insuranceDao.expiration();
	}

	
	/**
	* Method : prodPageList
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 관리자용 - 보험상품관리 : 가입자수 나오는 리스트목록
	*/
	@Override
	public Map<String, Object> prodPageJoinList(InsurancePageVo pageVo) {

		// 페이지에 해당 하는 유저 리스트(1~10건) 
		List<InsProdVo> pageList = insuranceDao.prodPageJoinList(pageVo);
		
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
	* Method : goInsProdDelUpdate
	* 작성자 : Yumint
	* 변경이력 :
	* @param prodId
	* @return
	* Method 설명 :관리자용 - 보험상품관리 : 가입여부 상태 만료로 변경하는 부분
	*/
	@Override
	public int goInsProdDelUpdate(String prodId) {
		return insuranceDao.goInsProdDelUpdate(prodId);
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
		return insuranceDao.goInsProdDelRelease(prodId);
	}

	
	/**
	* Method : prodKindPageListM
	* 작성자 : Yumint
	* 변경이력 :
	* @return
	* Method 설명 : 관리자용 - 보험상품관리 : 조회조건을 주었을때 조회되는 리스트 부분
	*/
	@Override
	public Map<String, Object> prodKindPageListM(InsurancePageVo pageVo) {
		// 페이지에 해당 하는 유저 리스트(1~10건) 
		List<InsProdVo> pageList = insuranceDao.prodKindPageListM(pageVo);
		
		// 페이지 내비게이션을 위한 전체 유저 리스트 조회 
		int totalInsProductCnt = insuranceDao.getInsProductKindCntM(pageVo.getPetKind());
		
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
	* Method : prodNameSame
	* 작성자 : Yumint
	* 변경이력 :
	* @param insp_kind
	* @return
	* Method 설명 : 관리자용 - 보험상품관리 : 보험상품을 등록할때 이름이 동일한건이 있는지 확인
	*/
	@Override
	public List<InsProdVo> prodNameSame(InsProdVo insProdVo) {
		return insuranceDao.prodNameSame(insProdVo);
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
		return insuranceDao.prodInsert(insProdVo);
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
		return insuranceDao.completed(inssp_id);
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
		return insuranceDao.applicant(inssp_id);
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
		return insuranceDao.goInsProdUpdateS(insProdVo);
	}
	
	
}
