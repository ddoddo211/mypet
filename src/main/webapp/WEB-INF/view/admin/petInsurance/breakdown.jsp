<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>breakdown.jsp(관리자 - 보험청구 관리(반려))</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//해당화면에 전체 checkbox들을 체크해준다 
	$("input[type=checkbox]").prop("checked",true);
	
	// 진단서(필수)의 첨부파일을 클릭하였을 경우
	$("#pdf").click(function(){
		// 진단서 넣어주기
		var file = '${acdVo.accd_recp}';
		goPdf(file);
	});
	
	// 진단서(필수)의 첨부파일을 클릭하였을 경우
	$("#pdf2").click(function(){
		// 진단서 넣어주기
		var file = '${acdVo.accd_img}';
		goPdf(file);
	});
	
});

// 목록으로 가는 부분
function goBack(){
	location.href = '/isr/goClaim';
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


<!-- header 시작 -->
<%@include file="../../common/header.jsp"%>
<!-- header 끝-->


<div id="main">	
	<div id="adminMain">
		<!-- 관리자 메뉴 -->
		<%@include file="../adminHeader.jsp"%>
					
			<!-- 관리자용 펫 보험 메뉴  -->
			<%@include file="insMenuSelect.jsp"%>
		
			<div id="adminInsMenu">
		
			<div id="claimMain">
					<div id="claimTitle">
						<div id="claimTitle1">
							보험금 청구 반려 내역
						</div>
					</div>

						<div id="claimPetInfo">
							보험금 반려처리된 펫 : ${acdVo.myp_name}&nbsp;&nbsp;/&nbsp;&nbsp;<fmt:formatDate value="${acdVo.myp_birth}" pattern="yy년 MM월 dd일"></fmt:formatDate>&nbsp;&nbsp;/&nbsp;&nbsp;${acdVo.myp_gender}&nbsp;&nbsp;/&nbsp;&nbsp;${acdVo.myp_sick}
						</div>
						
						<div class="claimTitle4">
							<div class="claimTitle4_1">
								<div class="claimTitle4_2">Step1. "${acdVo.mem_name}"께서 반려된 보험금 청구상품</div>
							</div>
						</div>
						
						<div id="claimTitle5">
							<div id="claimTitle5_1">
								<div class="claimTitle5_1_1">
									보험금 청구 상품
								</div>
								<div class="claimTitle5_1_2 optionProd">
									<label class="isrJoinInfoLabel" id="memJoinPhone2">${acdVo.insp_kind}</label>
								</div>
							</div>
						</div>
						
						<div class="claimTitle4">
							<div class="claimTitle4_1">
								<div class="claimTitle4_2">Step2. 사고 정보 </div>
							</div>
						</div>
						
						<div id="accident">
							<div id="accident1">
								<div class="accident2">
									<div class="accident2_1">
										사고 일자
									</div>
									<div class="accident2_2">
										<label class="isrJoinInfoLabel"><fmt:formatDate value="${acdVo.accd_date}" pattern="yyyy년 MM월 dd일"/></label>
									</div>
								</div>
								<div class="accident2">
									<div class="accident2_1">
										사고 장소
									</div>
									<div class="accident2_2_1">
										<label class="isrJoinInfoLabel">${acdVo.accd_addr}</label>
									</div>
								</div>
								<div class="accident2">
									<div class="accident2_1">
										사고 내용
									</div>
									<div class="accident2_2_1_1">
										<input type="text" id="accidentInput2" class="insurer2_5" value="${acdVo.accd_text }" readonly="readonly">
									</div>
								</div>
							</div>
						</div>
						
						<div class="claimTitle4">
							<div class="claimTitle4_1">
								<div class="claimTitle4_2">Step3. 보험자의 정보 확인</div>
							</div>
						</div>
						
						<div id="insurer">
							<div id="insurer1">
								<div class="insurer2">
									이메일
								</div>
								<div class="insurer2_1">
									<label class="insurer2_4" >${acdVo.mem_id}</label>
								</div>
								<div class="insurer2_2">
									연락처
								</div>
								<div class="insurer2_3">
									<label class="insurer2_4">${acdVo.mem_hp}</label>
								</div>
								
							</div>
						</div>
						
						<div class="claimTitle4">
							<div class="claimTitle4_1">
								<div class="claimTitle4_2">Step4. 보험금 요청계좌 </div>
							</div>
						</div>
						
						<div id="deposit">
								<div id ="accountInfo">
									<div id="accountInfo1">
										<div id="accountInfo2">
											보험금 요청계좌
										</div>
										<div id="accountInfo3">
											<label class="insurer2_4">${acdVo.accd_act}</label>
										</div>
									</div>
								</div>	
			
						</div>
						
						<div class="claimTitle4">
							<div class="claimTitle4_1">
								<div class="claimTitle4_2">Step5. 필요서류 입력</div>
							</div>
						</div>
						
						<div class="claimTitle4">
							<div class="claimTitle4_1_2">
								<div class="claimTitle4_2">진단서 & 사고사진에 첨부된 파일이 있을 경우 해당 아이콘을 클릭하여 파일을 다운받아 확인하실수 있습니다.</div>
							</div>
						</div>
						<div id="document">
							<div id="document1">
								<div id="document2">
									<div class="document2_1">
										진단서(필수)
									</div>
								<c:choose>
										<c:when test="${acdVo.accd_recp != ''}">
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
										<c:when test="${acdVo.accd_img != '/img/petimg/noimg.jpg'}">
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
						
						
						<div class="claimTitle4">
							<div class="claimTitle4_1">
								<div class="claimTitle4_2">Step6. 보험금 지급을 위한 개인정보 처리 동의 입력</div>
							</div>
						</div>
						
						<div id="agree">
						<textarea rows="20" cols="167" id="agreeWrite">
		개인정보 수집 안내
		○ 개인정보의 수집․이용 목적
		․채용 절차의 진행 및 관리, 경력·자격 등 확인(조회 및 검증), 채용 여부의 결정 
		․민원처리, 분쟁해결, 법령상 의무이행
		
		○ 수집 항목 
		․성명, 성별, 연령, 국적, 현주소, 연락처, 전자우편, 생년월일, 보훈대상여부, 장애우 대상여부, 병역, 학력, 성적, 경력사항, 자격․면허 및 포상 내역, 어학, 단체가입 및 활동사항
		   ※ 주민등록번호 등 고유식별번호는 수집하지 않습니다.
		
		○ 개인정보의 보유 및 이용기간
		․위 정보는 수집ㆍ이용에 관한 동의일로부터 5년 동안 위 이용목적을 위하여 보유ㆍ이용됩니다.
		․다만, 채용에 탈락한 경우에는 민원처리, 분쟁 해결, 법령상 의무이행을 위하여 필요한 범위 내에서만 보유·이용됩니다.
		   ※ 5년 이내라도 응시자 본인의 삭제의사가 있을 경우, 지원서 삭제를 통해 모든 개인정보가 파기됩니다. 
		
		○ 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
		․위 정보의 수집·이용에 관한 동의는 채용 심사를 위하여 필수적이므로, 위 사항에 동의하셔야만 지원이 가능합니다. 
		․위 정보의 수집·이용에 관한 동의는 거부하실 수 있으며, 다만 동의하지 않으시는 경우 채용심사상의 불이익을 받으실 수 있습니다.
		   </textarea> <br> 
		   			<input type="checkbox" name="req" id="agreeCheck" onclick="return false;"> 개인정보 수집 및 이용에동의합니다.
					</div>
					
					
						<div class="claimTitle4">
							<div class="claimTitle4_1">
								<div class="claimTitle4_2">Step7. 사고 처리 결과 </div>
							</div>
						</div>
						
						<div id="he1">
							<div id="accident1">
								<div class="accident2 hide">
									<div class="accident2_1">
										반려 사유
									</div>
									<div class="accident2_2_1">
										<label class="insurer2_4" >${acdVo.accd_res}</label>
									</div>
								</div>
					
							</div>
						</div>
		
				
					
					<div id="isrJoinBtn">
						<div id="isrJoinBtn2">
							<input id="isrJoinBtn3" type="submit" onclick="goBack()" value="목록으로 가기">
						</div>
					</div>	
					
					</div>
					</div>
	</div>

</div>

	<!-- footer 시작 -->
	<%@include file="../../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>