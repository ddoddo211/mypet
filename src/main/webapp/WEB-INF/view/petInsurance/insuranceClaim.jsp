<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insuranceClaim.jsp(인터넷보험청구화면)</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	// 나의 펫 선택할떄 값 담아주기
	$(".cb1_label").click(function(){
		// 선택한 펫의 pk를 저장해주는 부분 
		var petId = $(this).data("myp_id");
		
		// 현재 가입되어 있는 보험상품이 있는지 확인하기
		var petProd = $("#petIsrNumber${pet.myp_id}")
		
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
	
	// 다음버튼을 클릭하였을떄 진행해야 하는것들 
	// 1. 펫선택이 안되어 있을때 메세지 창이 나와야 한다
	// 2. 체크박스를 아무것도 선택하지 않았을때에는 진행이 되지 않아야 한다.
	// 3. 체크박스에 예로 선택되어 있을시에는 나의 펫보험의 보험금 신청 현황을 보여준다 
	$("#nextBtn2").click(function(){
		
		// 펫이 선택되었는지 확인하는 부분
		var petSelect = $("#petId").val();
		
		// 펫선택이 안되어 있을때 메세지 창이 나와야 한다
		if(petSelect == ""){
			alert("보험청구 할 펫이 선택되지 않았습니다.");
			return;
		}else{
			for(var i = 0 ; i < ${mypetListSize}; i++){
				if(!$("input[name='noticeY']:checked").val()){
					// 2. 체크박스를 아무것도 선택하지 않았을때에는 진행이 되지 않아야 한다.
					alert("이전 신청 이력을 확인하는 부분에 맞게 선택하시기 바랍니다.");
					return;
				}else if($("input[id='answerY']:checked").val()){
				// 체크박스에 아무것도 선택하지 않았을떄 경고창 나오게 설정
					alert("동일한건으로 인터넷 보험청구를 하신 이력이 있다면 \n 해당 사건은 청구하실수 없습니다.");
					return;
				}else{
					$("#frm").submit();
				}
			}
		}
		
	});
		
	
});


</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<body>
<form action="/isr/claim2" id="frm" >
	<input type="hidden" id="petId" name="petId" value="">
</form>

<!-- header 시작 -->
<%@include file="../common/header.jsp"%>
<!-- header 끝-->

	<div id="headerMain">
		<!-- main content -->
			<div id="header">
				<%--main --%>
				<div id="logo">
					<a href="/common/main.jsp"><img alt="이미지가 없습니다" src="/img/petInsuranceLogo2.jpg" width="200px;"></a>
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
		
		<div id="claimMain">
			<div id="claimTitle">
				<div id="claimTitle1">
					인터넷 보험 청구
				</div>
			</div>
				<div id="claimTitle2">
					<img id="claimTitle2_1" alt="이미지가 없습니다." src="/img/petInsurance/claim.jpg" width="850px">
				</div>
				<div id="claimTitle3">
					<div id="claimTitle3_1">
						<div id="claimTitle3_2">Step1. 피보험자 선택</div>
					</div>
				</div>

			<div id="petInfoTable">
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
										<td class="td6">
											<input type="checkbox" name="cb1" class="cb1" value="${pet.myp_id}">
											<label class="cb1_label" id="label${index.count}" data-label="${pet.myp_id}" data-myp_id="${pet.myp_id}"></label></td>
										<!-- 펫의 이미지가 없을때 실행되는 부분 -->
										<c:choose>
											<c:when test="${pet.myp_img == null}">
												<td class="td3"><img class="td13" alt="이미지가 없습니다"
													src="/insimg/noimg.jpg"></td>
											</c:when>
											<c:otherwise>
												<td class="td3"><img class="td13" alt="이미지가 없습니다"
													src="${pet.myp_img}"></td>
											</c:otherwise>
										</c:choose>
										<td class="td2">${pet.myp_name}</td>
										<td class="td2">${pet.myp_gender}</td>
										<td class="td2"><fmt:formatDate value="${pet.myp_birth}"
												pattern="yy년 MM월 dd일"></fmt:formatDate></td>
										<td class="td2">${pet.myp_sick}</td>

										<!-- 가입가능한 나의 펫 부분에서 고양이 일때에는 입력되지 견종크기 나오지 않게 설정 -->
										<c:choose>
											<c:when test="${pet.petk_am == 1 }">
												<td class="td2">${pet.petk_name}<br>(${pet.petk_size})
												</td>
											</c:when>
											<c:otherwise>
												<td class="td2">${pet.petk_name}<br>(고양이)
												</td>
											</c:otherwise>
										</c:choose>

										<!-- 가입되어 있는 보험상품 -->
										<td class="td4">
												<!-- 펫의 가입보험 부분에 값이 있다면 -->
												<input type="hidden" id="petIsrNumber${pet.myp_id}" value="${pet.myp_id}">
												<span> ${pet.insp_kind }</span>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>

					</table>
				</div>
			</div>
			
			<div id="notice">
				<div id="notice1"> * 해당 피보험자를 동일한건으로 인터넷 보험청구를 하신 이력이 있으십니까?</div>
				<div id="notice2">
					<input type="radio" name="noticeY" class="noticeY" value="Y" id="answerY"/>예
					<input type="radio" name="noticeY" class="noticeY" value="N" />아니요
				</div>
			</div>
			
			<div id="nextBtn">
				<div id="nextBtn1">
					<input type="button" id="nextBtn2" value="다음">
				</div>
			</div>
			
		</div>
</div>
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>