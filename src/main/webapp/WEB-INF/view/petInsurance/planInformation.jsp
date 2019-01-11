<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>planInformation.jsp(플랜정보)</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<script type="text/javascript">

var joinFail = <%=request.getParameter("joinFail")%>;
	if(joinFail == "0"){
		alert("보험상품 조건에 맞지 않습니다. 확인하시기 바랍니다.");
	}
	
$(document).ready(function(){
	
	var blackMem = '${blackMem}';
	
	if(blackMem == 'no'){
		alert("현재 회원은 블랙리스트임으로 보험신청을 진행하실수 없습니다.\n관리자에게 문의하시기 바랍니다.");
	}
	
	
	$(".option").change(function(){
		$("#petSelectMenu").hide();
	});
	
	
	// 나의 펫 선택할떄 값 담아주기
	$(".cb1_label").click(function(){
		var petId = $(this).data("myp_id");
		
		// 체크박스 반복문 돌려서 클릭한 아이디에 회색 색 주기 
		for(var i = 1; i<= ${mypetListSize}; i++){
			if($("#label"+i).data("label")== petId){
				// 이미 선택되어 있는데 다시 클릭한다면 
				//hasClass -> 클래스가 있는지 확인하는것
				if($(this).hasClass("activeCb")){
					$("#petId").val("");
				}else{
					// 클릭한 아이디하고 선택한 펫의 아이디하고 맞다면 회색 배경색 주기                     
					$("#petId").val(petId);
				}
				//toggleClass -> 해당 요소가 있으면 이를 제거합니다. 반대로 해당 요소가 없다면 이를 부여하는 매우 유용한 메소드입니다
				$("#label"+i).toggleClass("activeCb");
			}else {
				// 클릭한 아이디하고 선택한 펫이 맞지 않을떄에는 배경색 흰색 주기 
				$("#label"+i).removeClass("activeCb");
			}
		}
	});

	$(".cb2_label").click(function(){
		// 보험상품 선택할떄 값 담아주기
		var prodId = $(this).data("inssp_insp");
		var prodId2 = $(this).data("insp_id");
		
			for(var i = 1; i <= ${memIsrListSize}; i++){
					if($("#prodLabel"+i).data("inssp_insp") == prodId){
								// 원래 체크 되어 있다면 또 다시 클릭한다면 해제하는 부분
								if($(this).hasClass("activeCb")){
									$("#prodId").val("");
									$("#prodJoinId").val("");
									
								}else{
									// 선택한 보험 상품 pk 담아주기 
									$("#prodId").val(prodId);
									$("#prodJoinId").val(prodId2);
									
								}							
								$("#prodLabel"+i).toggleClass("activeCb");
								
					}else {
							// 클릭한 아이디하고 선택한 펫이 맞지 않을떄에는 배경색 흰색 주기 
							$("#prodLabel"+i).removeClass("activeCb");
					}
			}
	});
	
	
	// 선택한 상품 가입하기 버튼을 클릭하였을때 
	var select = null;
	
	$(".option").click(function(){
		// 선택한 펫의 id 담아주기 
		select = $(this).val();
		// 마이펫 id 넘겨주기
		$("#mypetId").val(select);
	
	});
	
	// 보험가입할떄 펫 선택하는 부분 
	$(".selectPet").click(function(){
		var selectPetRow =  $(this).data("ins_id2");
		$("#selectPetRow").val(selectPetRow);
	});
	
	// 보험가입할떄 보험상품 선택하는 부분
	$(".cb2_label").click(function(){
		var selectProdRow = $(this).data("ins_id");
		$("#selectProdRow").val(selectProdRow);
	});
	
	$("#insuranceJoinBtn").click(function(){
		var prodId = $("#prodId").val();
		var prodId2 = $("#prodJoinId").val();
		
		// 같은행을 클릭했는지 확인하기 위해서 입력 
		var selectProdRow = $("#selectProdRow").val();
		var selectPetRow = $("#selectPetRow").val();
	
		
		// 나의 펫 선택 부분이 선택을 안했을때 나오는 알림창
		if(select == null || select == "나의 펫 선택"){
			alert("보험에 가입하실 나의 펫을 선택하시기 바랍니다.");
			return ;
		}else if(prodId == ""){
			// 체크 박스를 클릭하지 않았을 경우 
			alert("가입할 보험의 상품을 체크하시기 바랍니다.");
			return ;
		}else if(selectProdRow != selectPetRow){
		
			$(".cb2_label").removeClass("activeCb");
			$("select option").prop("selected", false);
			alert("펫과 동일한 보험상품 행의 체크박스를 선택하시기 바랍니다.");
			select = null;
			$("#prodId").val("");
			return;
			
		}else if(true){
			
			// 동일한 값이 있는지 확인하는 변수
			var chkDu = 0;
		
			// 해당 펫의 이미 가입되어 있는 상품이 있을떄에는 변수의 값을 1씩 증가한다
			for(var i = 1 ; i < ${mypetIsrJoinSize}; i++){
				//prodId2 보험상품에서 선택한 부분
				if(prodId2 == $("#isr"+i+select).val()){
					chkDu += 1;
				}
				
			}
			
			// 가입되어 있는 보험상품이 없을때에는 아래 부분이 실행된다
			if(chkDu==0){
				$("#frm2").submit();
			} else {
				alert("이미 가입된 상품입니다");
				//해당화면에 모든 radio들의 체크를해제시킨다. 
				$("input[type=checkbox]").prop("checked",false);
				return;
			}
			
		}
		
	});
	
	
});


/*보험상품 추가 버튼을 클릭하면 상품 리스트로 이동한다*/
function prodAdd(){
	location.href = '/isr/productInfo';
}

/*보험상품삭제 form으로 보내기*/
function prodDelete(){
	// 만약 체크 박스를 아무것도 클릭하지 않았을 경우 작동되는 부분
	if($("#prodId").val()== ""){
		alert("선택된 보험상품이 없습니다.");
		return;
	}else{
		$("#frm").submit();
	}
}

/*펫 삭제 form으로 보내기*/
function petDelete(){
	// 만약 체크 박스를 아무것도 클릭하지 않았을 경우 작동되는 부분
	if($("#petId").val()== ""){
		alert("선택된 나의펫이 없습니다.");
		return;
	}else if(true){
		var select = $("#petId").val();
		for(var i = 1 ; i < ${mypetListSize}; i++){
			if($("#petIsrNumber"+select).val() == select){
			// 해당 반려견이 가입보험상품이 있을떄에는 삭제되지 않아야 한다
			// 반려견하고 반려견이 가입되어 있는 사이즈 만큼 구하면 된다 
				// 체크박스 회색 없애기 
				$("#label"+i).removeClass("activeCb");
				alert("해당 펫은 보험에 가입되어 있는 펫입니다.\n나의 펫에서 삭제하실수 없습니다.");
				$(".cb1_label").removeClass("activeCb");
				$("#petId").val("");
				//해당화면에 모든 radio들의 체크를해제시킨다. 
				$("input[type=checkbox]").prop("checked",false);
				return ;
				
				
			}else{
				$("#frm1").submit();
			}
		}
	}
}

/*펫 추가 화면으로 이동하기*/
function petInsert(){
	location.href = '/isr/petInsert';
}

</script>
<body>

<!-- 보험상품 가입할때 같은행을 클릭했는지 확인하려고 만든것 -->
<input type="hidden" id="selectProdRow" value="">
<input type="hidden" id="selectPetRow" value="">

<!-- 상품아이디를 받아서 넘겨주는 폼(보험상품 삭제버튼에 이용) -->
<form action="/isr/productShoppingDel" method="get" id="frm">
	<input type="hidden" id="prodId"  name="prodId" value="">
</form>


<!-- 나의펫 id를 받아서 넘겨주는 폼(펫 삭제하기에 이용) -->
<form action="/isr/mypetDel" method="get" id="frm1">
	<input type="hidden" id="petId"  name="petId" value="">
</form>

<!-- 플랜정보에서 보험가입하는 화면으로 이동 -->
<form action="/isr/prodJoin" method="get" id="frm2">
	<!--마이펫의 id 넘겨주기-->
	<input type="hidden" id="mypetId" name="mypetId" value="">
	<!--보험상품 id 넘겨주기-->
	<input type="hidden" id="prodJoinId" name="prodJoinId" value="">
</form>



<!-- header 시작 -->
<%@include file="../common/header.jsp"%>
<!-- header 끝-->
	<div id="headerMain">
		<!-- main content -->
			<div id="header">
				<%--main --%>
				<div id="logo">
					<a href="/isr/isrMain"><img alt="이미지가 없습니다" src="/img/petInsuranceLogo2.jpg" width="200px;"></a>
				</div>
				<div id="petSearch">
					<div id="word">
						<input type="text" id="search" value="검색어를 입력하세요" onfocus="this.value=''" style="color:#c1c1c1" />
					</div>
					<div id="searchButton">
						<a href="#" id="searchButton"></a>
					</div>
				</div>
				
				<!-- 우리 아이 등록하기 -->
				<div id="petInsert">
					<a href="#"><img alt="이미지가 없습니다" src="/img/petInsert.jpg" width="240px;" height="100px;"></a>
				</div>
			</div>
	</div>
	
<div id="main">	
	<!-- 여기부터 나의 body -->

		<!-- petInsuranceHeaderMain -->
		<%@include file="./petInsuranceHeaderMain.jsp"%>
		<!-- petInsuranceHeaderMain 끝 -->
		
		<div id="petInfoTable">
			<div id="petInfoTableTop">
				<div id="pettitle">
					가입 가능한 나의 펫 
				</div>
				<div id="petBtn">
					<div id="petInsert2">
						<button id="petIsBtn" onclick="petInsert()">펫 추가하기</button>
					</div>
					<div id="petDelete">
						<button id="petdBtn" onclick="petDelete()">펫 삭제하기</button>
					</div>
				</div>
			</div>
				<div id="pettitle2">
					* 원하시는 나의 펫이 없을때에는 펫 추가하시기 바랍니다.
				</div>
				<div id="pettitle3">
					* 가입보험에 빨간색으로 표시된 부분은 신청자가 보험가입을 완료하였더라도 관리자가 승인을 해야 정상적인 가입완료가 됩니다.
				</div>
				<div id="pettitle4">
					* 가입보험이 있는 나의 펫의 경우에는 "펫 삭제"를 하실수 없습니다.
				</div>
			<div id="petTable">
				<table>
						<tr class="tr2">
							<th class="td6">선택</th>
							<th class="td3">가입대상</th>
							<th class="td2">이름</th>
							<th class="td2">성별</th>
							<th class="td2">생년월일</th>
							<th class="td2">질병이력</th>
							<th class="td2">종류</th>
							<th class="td4">가입보험</th>
						</tr>

<!-- 펫이 한마리도 없을떄 실행되는 부분 -->
<c:choose>
	<c:when test="${petListSize == 0}">
		<tr class="tr2" id="td5">
			<td colspan="8">회원의 펫이 없습니다</td>
		</tr>
	</c:when>
	<c:otherwise>				
						<c:forEach items="${mypetList}" var="pet" varStatus="index">
							<tr class="tr2" id="td5">
								<td class="td6"><input type="checkbox" name="cb1" class="cb1" value="${pet.myp_id}"><label class="cb1_label" id="label${index.count}" data-label="${pet.myp_id}" data-myp_id="${pet.myp_id}"></label></td>
<!-- 펫의 이미지가 없을때 실행되는 부분 -->
						<c:choose>	
							<c:when test="${pet.myp_img == null}">
								<td class="td3">
									<img class="td13" alt="이미지가 없습니다" src="/insimg/noimg.jpg">
								</td>
							</c:when>
							<c:otherwise>
								<td class="td3">
									<img class="td13" alt="이미지가 없습니다" src="${pet.myp_img}">
								</td>
							</c:otherwise>
						</c:choose>							
								<td class="td2">${pet.myp_name}</td>
								<td class="td2">${pet.myp_gender}</td>
								<td class="td2">
									<fmt:formatDate value="${pet.myp_birth}" pattern="yy년 MM월 dd일"></fmt:formatDate>
								</td>
								<td class="td2">${pet.myp_sick}</td>
					
<!-- 가입가능한 나의 펫 부분에서 고양이 일때에는 입력되지 견종크기 나오지 않게 설정 -->
						<c:choose>
							<c:when test="${pet.petk_am == 1 }">				
								<td class="td2">${pet.petk_name}<br>(${pet.petk_size})</td>
							</c:when>
							<c:otherwise>
								<td class="td2">${pet.petk_name}<br>(고양이)</td>
							</c:otherwise>
						</c:choose>		

<!-- 가입되어 있는 보험상품 -->						
											<td class="td4">
												<c:forEach items="${mypetIsrJoin}" var="mypetIsr" varStatus="index">
													<c:choose>
														<c:when test="${mypetIsr.myp_id == pet.myp_id}">
														
															<!-- 펫의 가입보험 부분에 값이 있다면 -->
															<input type="hidden" id="petIsrNumber${pet.myp_id}" value="${pet.myp_id}">
																	<c:choose>
																		<c:when test="${mypetIsr.ins_stat == '신청'}">
																			* <span id="isrCondition"> ${mypetIsr.insp_kind }(${mypetIsr.ins_stat})</span><br>
																			<input id="isr${index.count}${pet.myp_id}" type="hidden" value="${mypetIsr.inssp_id }"/>
																		</c:when>
																		<c:when test="${mypetIsr.ins_stat == '반려'}">
																			* <span id="isrCondition2"> ${mypetIsr.insp_kind }(${mypetIsr.ins_stat})</span><br>
																			<input id="isr${index.count}${pet.myp_id}" type="hidden" value="${mypetIsr.inssp_id }"/>
																		</c:when>
																		<c:otherwise>
																			* <span> ${mypetIsr.insp_kind }(${mypetIsr.ins_stat})</span><br>
																			<input id="isr${index.count}${pet.myp_id}" type="hidden" value="${mypetIsr.inssp_id }"/>
																		</c:otherwise>
																	</c:choose>
														</c:when>
														<c:otherwise>

														</c:otherwise>
													</c:choose>
												</c:forEach>
											</td>
						</tr>
				</c:forEach>	
	</c:otherwise>					
</c:choose>	

				</table>
			</div>
		</div>
		
		<div id="insuranceProdTable">
			<div id="insuranceProdTableTop">
				<div id="isTitle">
					플랜정보에 추가한 보험상품 
				</div>
				<div id="prodBtn">
					<div id="insuranceProdInsert">
						<button id="insuranceProdIsBtn" onclick="prodAdd()">보험상품 추가</button>
					</div>
					<div id="insuranceProdDelete">
						<button id="insuranceProdDlBtn" type="button" onclick="prodDelete()">보험상품 삭제</button>
					</div>
					<div id="insuranceJoin">
						<button id="insuranceJoinBtn" type="button">선택한 보험가입하기</button>
					</div>
				</div>
			</div>
			
			<div id="insuranceProdTableTop2">
				&nbsp;&nbsp;* "플랜 정보에 추가한 보험상품"부분은 회원님이 상품안내에서 추가한 보험상품입니다.
			</div>
			<div id="insuranceProdTableTop3">
				&nbsp;&nbsp;* 보험상품 가입은 한개씩 선택하여 보험가입을 진행하시기 바랍니다.
			</div>
			
			<div id="petTable">
				<table>
						<tr class="tr7">
							<th class="td11">선택</th>
							<th class="td8">나의펫선택</th>
							<th class="td9">보험상품</th>
							<th class="td9">가입대상</th>
							<th class="td9">보험이름</th>
							<th class="td9">월보험료</th>
							<th class="td12">가입연령</th>
							<th class="td9">보장기간</th>
							<th class="td12">질병이력여부</th>
						</tr>

<!-- 보험상품이 없을떄 if 실행되기 -->	
<c:choose>	
	<c:when test="${isrListSize == 0}">
		<tr class="tr7" id="td5">
			<td colspan="10">플랜정보에 추가된 보험상품이 없습니다</td>
		</tr>
	</c:when>
	<c:otherwise>
						<c:forEach items="${memIsrList}" var="prodVo" varStatus="index">
							<tr class="tr7">
								<td class="td11">
									<input type="checkbox" name="cb2" class="cb2" value="${prodVo.inssp_id}" />
									<label class="cb2_label" id="prodLabel${index.count}" data-ins_id="${index.count}" data-inssp_insp="${prodVo.inssp_id}" data-insp_id="${prodVo.insp_id}"></label>
								</td>
								<td class="td8">
									<select name="petSelect" id="select" class="option selectPet" data-ins_id2="${index.count}">
									  <option selected="selected" id="petSelectMenu">나의 펫 선택</option>
									  <c:forEach items="${mypetList}" var="petSelect" varStatus="index">
									  	<option value="${petSelect.myp_id}">${petSelect.myp_name}</option>
									  </c:forEach>
									</select>
								</td>
								<td class="td9">${prodVo.insp_name}</td>
								<c:choose>
									<c:when test = "${prodVo.insp_join == '강아지'}">
										<td class="td9"><img alt="이미지가 없습니다" src="/img/petInsurance/petInfo.jpg" width="40px" height="40px">${prodVo.insp_join}</td>
									</c:when>
									<c:otherwise>
										<td class="td9"><img alt="이미지가 없습니다" src="/img/petInsurance/petInfo2.jpg" width="40px" height="40px">${prodVo.insp_join}</td>
									</c:otherwise>
								</c:choose>
								<td class="td9">${prodVo.insp_kind}</td>
								<td class="td9"><%="월 "%>${prodVo.insp_fees}<%="원"%></td>
								<td class="td12">${prodVo.insp_minage}<%="~"%>${prodVo.insp_maxage}<%="세"%></td>
								<td class="td9"><%="가입부터 ~"%>${prodVo.insp_period}<%="세 까지"%></td>
								<td class="td12">${prodVo.insp_sick}</td>

							</tr>
						</c:forEach>
		</c:otherwise>		
</c:choose>	
						
				</table>
			</div>
		
	</div>

</div>

</body>

	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->

</html>