<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(document).ready(function(){
	
	//신청한 보험 건을 취소하는 부분
	$("#cancel").click(function(){
		var prodId = $(this).data("ins_id");
		$("#prodId").val(prodId);
		$("#frm2").submit();
	});
	
	// 체크 박스 클릭한 부분
	$(".petProdSelect").click(function(){
		var petProdSelect = $(this).val();
		$("#petProdSelect").val(petProdSelect);
	});
	
	// 보험해지 하기 버튼을 클릭할시에 적용되는 부분
	$("#Termination").click(function(){
		
		// 보험해지시 해지를 원하는 체크박스를 클릭하였는지 확인할때 필요
		var petProdSelect = $("#petProdSelect").val();
		
		// 보험해지버튼 클릭시 보험금 신청을 해 놓은 건이 있는지 확인
		var petAc = ${acVoSize};
		
		if(petAc != 0){
			alert("해당 펫은 보험금 신청을 한 건이 있습니다.\n보험금을 받지 않는다면 보험금 (신청)현황에서 \n보험금 신청 취소를 하신후 보험해지를 진행하시기 바랍니다.");
			//해당화면에 모든 radio들의 체크를해제시킨다. 
			$("input[type=radio]").prop("checked",false);
			return;
		}else if(petProdSelect == ""){
			alert("보험해지를 원하시는 보험상품을 선택하시기 바랍니다.");
			return;
		}else{
			$("#frm").submit();
		}
		
	});
	
	// 펫 삭제하기 버튼을 클릭하였을때 
	$("#petDel").click(function(){
		// 펫 삭제하기 클릭시 보험에 가입되어 있다면 삭제가 안되도록 한 부분 
		var petIsrJoin = ${isrVoListSize};
		
		// 펫 삭제하기 클릭시 보험금 신청을 해 놓은 건이 있는지 확인
		var petAc = ${acVoSize};
		
		if(petAc != 0){
			alert("해당 펫은 보험금 신청을 한 건이 있습니다.\n보험금을 받지 않는다면 보험금 (신청)현황에서 \n보험금 신청 취소를 하신후 펫 삭제를 진행하시기 바랍니다.");
			return;
		}else if(petIsrJoin != 0){
			alert("해당 펫은 보험에 가입(신청/완료)되어 있는 펫입니다.\n보험을 해지한후 삭제하시기 바랍니다.");
			return;
		}else{
			$("#frm2").submit();
		}
	});
	
	
});


</script>
<form action="/isr/mypetIsrDel" method="get" id="frm">
	<input type="hidden" id="petProdSelect" name="petProdSelect" value="">
	<input type="hidden" id="petId" name="petId" value="${mypetInfo.myp_id}">
</form>

<!-- 보험신청 취소하는 부분 -->
<form action="/isr/insprodCancel" method="get" id="frm2">
	<input type="hidden" id="prodId" name="prodId" value="">
	<input type="hidden" id="petId" name="petId" value="${mypetInfo.myp_id}">
</form>

	<div class="mypetPageBtn">
		<div id="mypetPageBtn">
			<form action="/isr/mypageMypetDel" method="get" id="frm2">
				<input type="hidden" value="${mypetInfo.myp_id}" name="mypetId">
			</form>
			<div id="mypetPageBtn1">
				<input class="mypetPageBtn1_1" id="petDel" type="button"
					value="펫 삭제하기">
			</div>

			<div id="mypetPageBtn2">
				<input class="mypetPageBtn1_1" id="petInfoUpdate" type="button"
					value="펫 정보 수정하기" onclick="goMypetInfoUpdate(${mypetInfo.myp_id})">
			</div>
		</div>
	</div>

	<div id="mypetPage4">
		<div id="mypetPage4_1">
			<div id="mypetPage4_2">
				<div id="mypetPage4_2_1">
					<사진>
				</div>
				<div class="mypetPage4_2_2">
					<img class="mypetPage4_2_2_1" alt="이미지가 없습니다"
						src="${mypetInfo.myp_img}">
				</div>
			</div>
			<div id="mypetPage4_3">
				<div class="mypetPage4_3_1">
					<div class="mypetPage4_3_2">이름</div>
					<div class="mypetPage4_3_2_1">${mypetInfo.myp_name }</div>
					<div class="mypetPage4_3_2_2">생년월일</div>
					<div class="mypetPage4_3_2_3">
						<fmt:formatDate value="${mypetInfo.myp_birth}"
							pattern="yyyy년 MM월 dd일"></fmt:formatDate>
					</div>
				</div>
				<div class="mypetPage4_3_1">
					<div class="mypetPage4_3_2">품종</div>
					<div class="mypetPage4_3_2_1">${mypetInfo.petk_name }(${mypetInfo.petk_size })
					</div>
					<div class="mypetPage4_3_2_2">성별</div>
					<div class="mypetPage4_3_2_3">${mypetInfo.myp_gender }</div>
				</div>
				<div class="mypetPage4_3_1">
					<div class="mypetPage4_3_2">질병여부</div>
					<div class="mypetPage4_3_2_1">${mypetInfo.myp_sick }</div>
					<div class="mypetPage4_3_2_2">중성화 여부</div>
					<div class="mypetPage4_3_2_3">${mypetInfo.myp_neu }</div>
				</div>
			</div>
			<!-- 펫의 보험가입 정보  -->
			<div id="mypetIsrJoin">
				<div id="mypetIsrJoin1">
					<div id="mypetIsrJoin1_1">해당 펫에 신청/가입되어 있는 보험</div>

					<div id="mypetIsrJoin2">
						<table>
							<tr>
								<th class="mypetTd0">체크</th>
								<th class="mypetTd2">가입대상</th>
								<th>보험상품</th>
								<th class="mypetTd7">월 보험료 가격</th>
								<th class="mypetTd2">가입연령</th>
								<th class="mypetTd1">보장기간</th>
								<th class="mypetTd2">질병여부(Y/N)</th>
								<th>가입일</th>
								<th class="mypetTd3">보험상품 만료여부</th>
								<th class="mypetTd2">보험가입상태</th>
								<th class="mypetTd2">보험신청취소</th>
							</tr>

							<!-- 펫에 신청/가입되어 있는 상품이 없을 경우 -->
							<c:choose>
								<c:when test="${isrVoListSize == 0 }">
									<tr class="mypetTr">
										<td colspan="11">해당 펫에 신청/가입되어 있는 보험상품이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>

									<c:forEach items="${isrVoList}" var="list">
										<tr>
											<td class="tdh"><input type="radio" name="petProd"
												class="petProdSelect" value="${list.ins_id}"></td>
											<td class="tdh">${list.insp_join}</td>
											<td class="tdh">${list.insp_kind}</td>
											<td class="tdh"><%="월 "%>${list.insp_fees}<%="원"%></td>
											<td class="tdh">${list.insp_minage}<%="~"%>${list.insp_maxage}<%="세"%></td>
											<td class="tdh"><%="가입부터 ~"%>${list.insp_period}<%="세 까지"%></td>
											<td class="tdh">${list.insp_sick}</td>
											<td class="tdh"><fmt:formatDate
													value="${list.ins_start}" pattern="yy년 MM월 dd일"></fmt:formatDate></td>
											<td class="tdh">${list.ins_dis}</td>
											<td class="tdh">${list.ins_stat}</td>
											<c:choose>
												<c:when test="${list.ins_stat == '신청'}">
													<td class="tdh"><input id="cancel" type="button" value="취소" data-ins_id="${list.ins_id}"></td>
												</c:when>
												<c:otherwise>
													<td class="tdh"></td>
												</c:otherwise>
											</c:choose>
										<tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>

					<div id="mypetIsrJoin3">
						<div id="mypetIsrJoin3_1">
							<div id="mypetIsrJoin3_1_1">
								<input type="button" id="Termination" value="보험해지하기">
							</div>
						</div>
					</div>
					
					<!-- 펫의 보험가입 정보  -->
					<div id="mypetIsrJoin">
						<div id="mypetIsrJoin1">
							<div id="mypetIsrJoin1_1">해당 펫이 신청(반려)/ 신청취소처리된 보험가입 내역</div>

							<div id="mypetIsrJoin2">
								<table>
									<tr>
										<th class="mypetTd4">가입대상</th>
										<th class="mypetTd">보험상품</th>
										<th class="mypetTd">월 보험료 가격</th>
										<th class="mypetTd5">가입연령</th>
										<th class="mypetTd1">보장기간</th>
										<th class="mypetTd4">질병여부(Y/N)</th>
										<th class="mypetTd">반려일</th>
										<th class="mypetTd6">보험상품 만료여부</th>
										<th class="mypetTd4">상태</th>
									</tr>

									<!-- 펫에 가입되어 있는 상품이 없을 경우 -->
									<c:choose>
										<c:when test="${joinHListSize == 0 }">
											<tr class="mypetTr">
												<td colspan="9">해당 펫에 신청 반려되어 있는 보험상품이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>

											<c:forEach items="${joinHList}" var="list">
												<tr>
													<td class="mypetTd2">${list.insp_join}</td>
													<td class="mypetTd2">${list.insp_kind}</td>
													<td class="mypetTd2"><%="월 "%>${list.insp_fees}<%="원"%></td>
													<td class="mypetTd2">${list.insp_minage}<%="~"%>${list.insp_maxage}<%="세"%></td>
													<td class="mypetTd2"><%="가입부터 ~"%>${list.insp_period}<%="세 까지"%></td>
													<td class="mypetTd2">${list.insp_sick}</td>
													<td class="mypetTd2"><fmt:formatDate
															value="${list.ins_start}" pattern="yy년 MM월 dd일"></fmt:formatDate></td>
													<td class="mypetTd2">${list.ins_dis}</td>
													<td class="mypetTd2">${list.ins_stat}</td>
												<tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
						</div>
					</div>

					<!-- 펫의 보험가입 정보  -->
					<div id="mypetIsrJoin">
						<div id="mypetIsrJoin1">
							<div id="mypetIsrJoin1_1">해당 펫이 해지된 보험가입 내역</div>

							<div id="mypetIsrJoin2">
								<table>
									<tr>
										<th class="mypetTd4">가입대상</th>
										<th class="mypetTd">보험상품</th>
										<th class="mypetTd">월 보험료 가격</th>
										<th class="mypetTd5">가입연령</th>
										<th class="mypetTd1">보장기간</th>
										<th class="mypetTd4">질병여부(Y/N)</th>
										<th class="mypetTd">가입일</th>
										<th class="mypetTd6">보험상품 만료여부</th>
										<th class="mypetTd4">해지상태</th>
									</tr>

									<!-- 펫에 가입되어 있는 상품이 없을 경우 -->
									<c:choose>
										<c:when test="${isrVoList2Size == 0 }">
											<tr class="mypetTr">
												<td colspan="9">해당 펫에 해지되어 있는 보험상품이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>

											<c:forEach items="${isrVoList2}" var="list">
												<tr>
													<td class="mypetTd2">${list.insp_join}</td>
													<td class="mypetTd2">${list.insp_kind}</td>
													<td class="mypetTd2"><%="월 "%>${list.insp_fees}<%="원"%></td>
													<td class="mypetTd2">${list.insp_minage}<%="~"%>${list.insp_maxage}<%="세"%></td>
													<td class="mypetTd2"><%="가입부터 ~"%>${list.insp_period}<%="세 까지"%></td>
													<td class="mypetTd2">${list.insp_sick}</td>
													<td class="mypetTd2"><fmt:formatDate
															value="${list.ins_start}" pattern="yy년 MM월 dd일"></fmt:formatDate></td>
													<td class="mypetTd2">${list.ins_dis}</td>
													<td class="mypetTd2">${list.ins_dis}</td>
												<tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
						</div>
					</div>
					
				</div>	

				</div>
				
				

			</div>
			
		</div>
		

