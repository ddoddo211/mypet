<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>history.jsp(보험금 청구 내역)</title>

<style type="text/css">
.memAccidentSelect{
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 18px;
	width: 100px;
	text-align: center;
	outline: none;
	height: 30px;
    border-radius: 5px;
    line-height: 30px;
    margin-left: 10px;
    float: left;
}

#account{
	outline: none;
}
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	// 보험금 입금계좌 클릭하였을때 값을 담아주는 부분
	$(".memAccidentSelect").click(function(){
		var selectAccident = $(this).val();
		$("#selectAc").val(selectAccident);
	});
	
	
	// 계좌번호 수정하기 버튼을 클릭할시 
		$("#nextBtn2").click(function(){
			var selectAccident = $("#selectAc").val();
			var account = $("#account").val();
			
			// 원래 계좌번호 
			var act = '${history.accd_act}';
			var actChk = selectAccident+account;
			
			// 숫자와 특수문자만 입력하였는지 확인
			var regexp = /[0-9;\-]/;
				v = account;
				if( selectAccident == "" || selectAccident == 0){
					alert("수정하실 은행을 선택하시기 바랍니다.");
					return;
				}else if(account == ""){
					alert("계좌번호를 입력하시기 바랍니다.");
					return;
				}else if( !regexp.test(v) ) {
					alert("계좌번호는 숫자 , 특수문자(-)로  입력하세요");
					return;
				}else if(act == actChk ){
					alert("이전에 등록되었던 계좌번호입니다.");
					return;
				}else{
					$("#account2").val(account);
					$("#frm").submit();
					}
		});
	
		// 진단서(필수)의 첨부파일을 클릭하였을 경우
		$("#pdf").click(function(){
			// 진단서 넣어주기
			var file = '${history.accd_recp}';
			goPdf(file);
		});
		
		// 진단서(필수)의 첨부파일을 클릭하였을 경우
		$("#pdf2").click(function(){
			// 진단서 넣어주기
			var file = '${history.accd_img}';
			goPdf(file);
		});

});

function goBack(){
	location.href ='/isr/goisrApply';
}

//pdf으로 가는 부분
function goPdf(fileName){
	var fileName = fileName;
	location.href = '/isr/fileDown?fileName='+fileName;
}
</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<body>
<!-- 변경할 계좌번호를 담아서 보내주기 -->
<form action="/isr/accountChange" id="frm" method="post">
	<input type="hidden" name="selectAc" id="selectAc" value="" />
	<input type="hidden" name="account2" id="account2" value="" />
	<input type="hidden" name="accd_id" value="${history.accd_id}">
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
		
	<div id="claimMain">
			<div id="claimTitle">
				<div id="claimTitle1">
					보험금 신청 내역 확인
				</div>
			</div>

				<div id="claimPetInfo">
					보험금 신청 진행하는 펫 : ${history.myp_name}&nbsp;&nbsp;/&nbsp;&nbsp;<fmt:formatDate value="${history.myp_birth}" pattern="yy년 MM월 dd일"></fmt:formatDate>&nbsp;&nbsp;/&nbsp;&nbsp;${history.myp_gender}&nbsp;&nbsp;/&nbsp;&nbsp;${history.myp_sick}
				</div>
				
				<div id="isrApplyTitle3_1_1">
					<div id="isrApplyTitle3_1_2">
						[보험금 내역 확인]화면에서는 계좌번호만 변경이 가능합니다. 만약, 내용 수정을 원하실 시에는 보험금 신청 취소를 하신 후 다시 신청하시기 바랍니다.
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1">
						<div class="claimTitle4_2">현재 청구 진행중인 "${history.myp_name}"의 보험상품</div>
					</div>
				</div>
				
				<div id="claimTitle5">
					<div id="claimTitle5_1">
						<div class="claimTitle5_1_1">
							청구 진행 상품
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
						<div class="claimTitle4_2">보험금 입금계좌 선택</div>
					</div>
				</div>
				
				<div id="isrApplyTitle3_1_1">
					<div id="isrApplyTitle3_1_2">
						보험금 입금계좌는 고객님께서 청구신청하실때 입력하신 계좌번호입니다. 만약, 변경을 원하실경우에는 "변경을 원하는 계좌번호"를 입력하시기 바랍니다.
					</div>
				</div>
				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">보험금 입금계좌 입력시에는 올바르게 입력하시기 바랍니다. 올바르지 않을 경우에는 입금이 안될수 있습니다.(-입력)</div>
					</div>
				</div>
				
				<div id="deposit">
						<div id ="accountInfo">
							<div id="accountInfo1">
								<div id="accountInfo2">
									보험금 입금계좌
								</div>
								<div id="historyAct">
									<label>${history.accd_act}</label>
								</div>
								
								<div class="history2_2">
									변경할 입금 계좌
								</div>
								<div id="accountInfo3">
									<select class="memAccidentSelect" name="accountSelect" >
										<option selected value="0">은행 선택</option>
											<option value="농협">농협</option>
											<option value="국민">국민</option>
											<option value="우리">우리</option>
											<option value="하나">하나</option>
									</select>
								</div>

								<div >
									<input id="account" name="account" type="text" >
								</div>
							</div>
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
								<c:choose>
									<c:when test="${history.accd_recp != ''}">
										<div class="document2_2">
											<img id="pdf" alt="pdf파일" src="/img/petInsurance/PDF.png">
										</div>
									</c:when>
									<c:otherwise>
										<div class="document2_2">
											<label class="insurer2_4">회원께서 진단서를 첨부하지 않았습니다.</label>
										</div>
									</c:otherwise>
								</c:choose>	
						
						</div>
						<div id="document3">
							<div class="document2_1">
								사고사진
							</div>
									<c:choose>
										<c:when test="${history.accd_img != '/img/petimg/noimg.jpg'}">
											<div class="document2_2">
												<img id="pdf2" alt="pdf파일" src="/img/petInsurance/PDF.png">
											</div>
										</c:when>
										<c:otherwise>
											<div class="document2_2">
												<label class="insurer2_4">회원께서 사고사진을 첨부하지 않았습니다.</label>
											</div>
										</c:otherwise>
									</c:choose>				
						</div>
					</div>
				</div>
			
			<div id="nextBtn">
				<div id="nextBtn1">
					<input type="button" id="nextBtn2" value="계좌번호 수정하기">
				</div>
				<div id="nextBtn1_1">
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