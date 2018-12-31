<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>history2.jsp(보험금 청구 내역- 반려)</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
$(document).ready(function(){


});

function goBack(){
	location.href ='/isr/gocompanion';
}
</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<body>
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
					반려된 보험금 청구 내역
				</div>
			</div>

				<div id="claimPetInfo">
					보험금 신청을 진행했던 펫 : ${history.myp_name}&nbsp;&nbsp;/&nbsp;&nbsp;<fmt:formatDate value="${history.myp_birth}" pattern="yy년 MM월 dd일"></fmt:formatDate>&nbsp;&nbsp;/&nbsp;&nbsp;${history.myp_gender}&nbsp;&nbsp;/&nbsp;&nbsp;${history.myp_sick}
				</div>
				
				<div id="isrApplyTitle3_1_1">
					<div id="isrApplyTitle3_1_2">
						해당 보험금 청구 내역에서는 반려된 보험금 청구 상세 내역 확인이 가능하십니다.
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1">
						<div class="claimTitle4_2">반려처리된 "${history.myp_name}"의 보험상품</div>
					</div>
				</div>
				
				<div id="claimTitle5">
					<div id="claimTitle5_1">
						<div class="claimTitle5_1_1">
							청구  상품
						</div>
						<div class="claimTitle5_1_2">
							<label class="history2_4">${history.insp_kind}</label>
						</div>
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1">
						<div class="claimTitle4_2">청구한 사고 정보</div>
					</div>
				</div>
				
				<div id="history">
					<div id="accident1">
						<div class="accident2">
							<div class="accident2_1">
								사고 일자
							</div>
							<div class="accident2_2">
								<label class="insurer2_4"><fmt:formatDate value="${history.accd_date}" pattern="yyyy년 MM월 dd일"></fmt:formatDate></label>
							</div>
						</div>
						<div class="accident2">
							<div class="accident2_1">
								사고 장소
							</div>
							<div class="accident2_2_1">
								<label class="insurer2_4">${history.accd_addr}</label>
							</div>
						</div>
						<div class="accident2">
							<div class="accident2_1">
								사고 내용
							</div>
							<div class="history2_2_1_1">
								<label class="insurer2_4">${history.accd_text}</label>
							</div>
						</div>
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1">
						<div class="claimTitle4_2">보험자의 정보 확인</div>
					</div>
				</div>
				
				<div id="insurer">
					<div id="insurer1">
						<div class="insurer2">
							이메일
						</div>
						<div class="insurer2_1">
							<label class="insurer2_4" >${memVo.mem_id }</label>
						</div>
						<div class="insurer2_2">
							연락처
						</div>
						<div class="insurer2_3">
							<label class="insurer2_4">${memVo.mem_hp }</label>
						</div>
						
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1">
						<div class="claimTitle4_2">보험금 입금계좌 </div>
					</div>
				</div>
				
				<div id="deposit">
						<div id ="accountInfo">
							<div id="accountInfo1">
								<div id="accountInfo2">
									보험금 입금계좌
								</div>
								<div id="historyAct">
									<label>(${history.act_bank})${history.act_num} 예금주 : ${history.act_name}</label>
								</div>
							</div>
						</div>	
				</div>
				
				<div id="history2">
					<div class="claimTitle4">
						<div class="claimTitle4_1">
							<div class="claimTitle4_2">반려사유</div>
						</div>
					</div>
					<div class="history2_1">
							반려 사유
					</div>
						<div class="history2_1_1">
							<label class="insurer2_4" >${history.accd_res}</label>
						</div>
					
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1">
						<div class="claimTitle4_2">첨부하신 서류</div>
					</div>
				</div>
				
				<form action="/isr/claimApply" method="post" id="frm" enctype="multipart/form-data">

					<input type="hidden" id="selectProd"  name="selectProd" value="">
					<input type="hidden" id="petId" name="petId" value="${mypetInfo.myp_id}">
					<input type="hidden" id="accidentDate" name="accidentDate" value="">
					<input type="hidden" id="accidentPlace"  name="accidentPlace" value="">
					<input type="hidden" id="accidentContent" name="accidentContent"  value="">
					<input type="hidden" id="selectAccident" name="selectAccident" value="">
				<div id="document">
					<div id="document1">
						<div id="document2">
							<div class="document2_1">
								진단서(필수)
							</div>
							<div class="document2_2">
								<label>${history.accd_recp}</label>
							</div>
						
						</div>
						<div id="document3">
							<div class="document2_1">
								사고사진
							</div>
							<div class="document2_2">
								<label>${history.accd_img}</label>
							</div>						
						</div>
					</div>
				</div>
			
			<div id="nextHistoryBtn">
				<div id="nextHistoryBtn1_1">
					<input type="button" id="nextBtn2_1" value="목록으로 가기" onclick="goBack()">
				</div>
			</div>
			
			
			</form>
			
			
	</div>

</div>
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>