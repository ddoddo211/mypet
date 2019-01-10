<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPetInsurance.jsp(나의 펫 보험)</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%-- im'port 결제 스크립트 --%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	
	// 이부분은 제일 위쪽에 설정해 놔야 함
	//im'port 결제모듈
    var IMP = window.IMP; // 생략가능
    IMP.init('imp09203705'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    
	// 나의 펫 보험을 시작을 했을때 펫 정보에는 무조건 실행되어야 하기때문에 설정 
	getPetInfoFormHtml();
	
	// 이전화면에서 model에 값을 담아준다면 실행되게 설정 (보험해지를 한후 다시 화면으로 접속되어야 하기 때문에 설정)
	var petIdRelay = '${petId}';
	if(petIdRelay != ''){
		getPetInfoHtml(petIdRelay);
	}
	
	// 펫의 사진을 클릭하였을때 
	$(".petImg").click(function(){
		var petId = $(this).parents(".mypetPage2_3_1").children(".petId").val();
		getPetInfoHtml(petId);
	});
	
});

// 처음에 나의 펫 보험 페이지가 실행되었을때 셋팅되는 부분
function getPetInfoFormHtml() {
	$.ajax({
		url : "/isr/petInfoFormAjaxHtml",
		type : "get",
		success : function(dt) {
			$("#petInfo").html(dt);
		}
	});
}

// 나의펫을 클릭할시 나의 펫 정보에 나와야 하기 때문에 
function getPetInfoHtml(petId) {
	$.ajax({
		url : "/isr/petInfoAjaxHtml",
		type : "get",
		data : "petId="+ petId ,
		success : function(dt) {
			$("#petInfo").html(dt);
		}
	});
}

// 펫 추가하는 화면으로 이동하기 
function gopetInsert(){
	location.href ='/isr/petInsert2';
}

// 펫 정보 수정하는 화면으로 이동하기
function goMypetInfoUpdate(petId){
	$.ajax({
		url : "/isr/petInfoUpdateAjaxHtml",
		type : "get",
		data : "petId="+ petId ,
		success : function(dt) {
			$("#petInfo").html(dt);
		}
	});	
}

// 보험신청 현황 부분에서 해당 신청 상태의 건수를 확인하는 화면으로 이동하게 설정
function goisrApply(){
	location.href ='/isr/goisrApply';
}

// 보험신청 현황 부분에서 해당 반려 상태의 건수를 확인하는 화면으로 이동하게 설정
function gocompanion(){
	location.href ='/isr/gocompanion';
}

// 보험신청 현황 부분에서 해당 심사완료 상태의 건수를 확인하는 화면으로 이동하게 설정
function gocompleted(){
	location.href ='/isr/gocompleted';
}


</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

<style type="text/css">
#main { display: table;}
#mypetPage1 { height: auto !important; display: table;}
#mypetPage {display: table;}
#mypetPage3 {height: auto !important; display: inline-block; margin-left: 20px;}
.mypetPage3_1 { height: auto !important; background: #fff; }
.mypetPage3_1_1 { background: #ffefef; margin-left: 0; padding-left: 30px;}

.mypetPage3_2 { box-sizing: border-box; border-left: none; border-right: none;}

#mypetPage4 { height: auto !important; min-height: 200px;}
</style>

</head>
<body>


<!-- 나의 펫을 클릭하였을때 아이디를 담아주는 input -->
<input type="hidden" id="petIdInput" value="" >


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
		
		<div id="mypetPage">
			<div id="mypetPageTitle">
				<div id="mypetPageTitle1">
					나의 펫 보험
				</div>
			</div>
			<div id="mypetPage1">
				<div id="mypetPage2">
					<div id="mypetPage2_1">
						등록되어 있는 나의 펫					
					</div>
					<div id="mypetPage2_1_1">
						펫을 클릭하시면 펫의 정보를 보실수 있습니다.				
					</div>
					<div class="mypetPage2_2">
						<input type="button" value="펫 추가하기" id="mypetPage2_2_1" onclick="gopetInsert()">					
					</div>
					
					<div id="mypetPage2_3">
						<c:forEach items="${mypetList}" var="pet" varStatus="index">
							<div class="mypetPage2_3_1">
								<img class="petImg" alt="이미지가 없습니다" src="${pet.myp_img}">
								<input class="petId" type="hidden" value="${pet.myp_id}">
							</div>
							
<!-- 가입가능한 나의 펫 부분에서 고양이 일때에는 입력되지 견종크기 나오지 않게 설정 -->
							<div class="mypetPage2_3_2">
								<c:choose>
									<c:when test="${pet.petk_am == 1 }">				
										${pet.myp_name}
									</c:when>
									<c:otherwise>
										${pet.myp_name}
									</c:otherwise>
								</c:choose>		
							</div>
							
						</c:forEach>
					</div>
				</div>
				<div id="mypetPage3">
					<div class="mypetPage3_1">
						<div class="mypetPage3_1_1">
							나의 보험금 / 보험료 현황
						</div>
						
						<div id="mypetPage3_1_2">
							<div id="mypetPage3_1_2_1">
								<div id="mypetPage3_1_2_1_1">
									<img id="mypetPage3_1_2_1_1Img" alt="이미지가 없습니다." src="/img/petInsurance/money2.jpg">
								</div>
								<div id="mypetPage3_1_2_1_2">
									<div id="mypetPage3_1_2_1_2_1">
										<label id="mypetPage3_1_2_1_2_2">현재 까지 받은 보험금 현황</label>
										<div class="isrMoney">
										<label id="mypetPage3_1_2_1_2_3">${money}원</label>
										</div>
									</div>
								</div>
							</div>
							<div id="mypetPage3_1_2_2">
								<div id="mypetPage3_1_2_2_1">
									<div id="mypetPage3_1_2_2_2">
										전체 월 보험료 
									</div>
								</div>
								<div id="mypetPage3_1_2_3">
									<div class="isrMoney">
									<label id="mypetPage3_1_2_3_1">${money2}원</label>
									</div>
								</div>
							</div>
						</div>
						
						<div class="mypetPage3_2">
							<div class="mypetPage3_2_1">
								현재 보험금 신청 현황
							</div>
						</div>
						<div class="mypetPage3_3">
							<div class="mypetPage3_2_2">
								건수를 클릭하면 상세 내용을 확인 하실 수 있습니다.
							</div>
						</div>
						
						<div id="mypetPage3_2_3">
							<table id="currentStatus">
								<tr>
									<th class="currentStatus1">신청</th>
									<th class="currentStatus1">반려</th>
									<th class="currentStatus1">심사완료</th>
								</tr>
								<tr>
									<td><a class="isrApplySize" onclick="goisrApply()">${isrApplySize}건</a></td>
									<td><a class="isrApplySize" onclick="gocompanion()">${ueSize}건</a></td>
									<td><a class="isrApplySize" onclick="gocompleted()">${isrCompleteSize}건</a></td>
								</tr>
							</table>
						</div>
						
						<div class="mypetPage3_2">
							<div class="mypetPage3_2_1">
								나의 펫 정보
							</div>
						</div>
						
						<div class="mypetPage3_3">
							<div class="mypetPage3_2_2">
								등록되어 있는 나의 펫을 선택하시면 나의 펫 정보에서 펫의 정보를 확인하실 수 있습니다.
							</div>
						</div>
						
<!-- ajax 처리해야 하는곳(시작) -->	
				<div id="petInfo">
					<!-- 보험상품 리스트 아작스 처리한곳 -->
				</div>	
<!-- ajax 처리해야 하는곳(끝) -->
						
					</div>
				</div>
			</div>
		</div>
		
	
			
			

</div>
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>