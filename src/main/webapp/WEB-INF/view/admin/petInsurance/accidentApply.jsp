<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accidentApply.jsp(관리자 - 보험청구 관리(신청))</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	// 사고 처리 결과 입력하는 부분은 첨은에는 없어져 있어야 한다
	$(".hide").hide();
	$(".hide2").hide();
	$(".hide3").hide();
	
	// 달력 옵션 설정
	$("#claimDay").datepicker({ // 달력에 옵션 설정하기
		dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ], // 요일에 표시되는 형식 설정
		dateFormat : "yy-mm-dd", //날짜 형식 설정
		monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
		"8월", "9월", "10월", "11월", "12월" ], //월표시 형식 설정
		showAnim : "fold", //애니메이션효과
		minDate : "1D"
	});
	
	//해당화면에 전체 checkbox들을 체크해준다 
	$("input[type=checkbox]").prop("checked",true);
	
	// 상태변경을 클릭할떄 상태값에 따라 아래 나오는 부분이 다르게 나와야 한다
	$(".memAccidentSelect").click(function(){
		// 결과입력 부분에 완료로 선택할 경우 
		var select = $(this).val();
		$("#select").val(select);
		
		// 완료로 클릭하였을 경우에는 미지급사유는 없어지면서 지급일만 나와야 한다.
		if(select == "완료"){
			//미지급사유input창 숨기기
			$(".hide").hide();
			$(".hide2").show();
			$(".hide3").show();
		}else if(select == "반려"){
			//지급일input창 숨기기
			$(".hide2").hide();
			$(".hide3").hide();
			$(".hide").show();
		}else{
			$(".hide").hide();
			$(".hide2").hide();
			$(".hide3").hide();
		}
	});
	
	// 청구 완료 하기 버튼을 클릭하였을 경우 
	$("#nextBtn2").click(function(){
		var select = $("#select").val();
		
		// 지급일 변수
		var payDay = $("#claimDay").val();
		
		//지급금액 
		var accd_insp = $("#price").val();
		
		// 지금 가능금액 
		var insp_maxins = $("#insp_maxins").val();
		
		// 미지급 사유 
		var unpaid = $("#accidentInput").val();
		
		// 사고 처리 결과를 선택하지 않았을떄 나와야 하는 부분
		if(select == 0){
			alert("사고처리 결과 입력 하는 부분의 상태를 선택하시기 바랍니다.");
			return;
		}else if(select == "완료"){
			// 지급일을 입력하지 않았을 경우 
			if(payDay == ""){
				alert("지급일을 입력하시기 바랍니다.");
				return;
			}else{
				if(accd_insp == ""){
					alert("지급금액을 입력하시기 바랍니다.");
					return;
				}else if(accd_insp >= insp_maxins){
					alert("지급 가능 금액보다 지급할 금액이 클수 없습니다.");
					// 값 초기화 하기
					$("#price").val("");
					return;
				}else{
					
					// 지급일 변수
					var payDay = $("#claimDay").val();
					// 지급일 값
					$("#accd_date").val(payDay);
					// 지급금액
					$("#accd_insp").val(accd_insp);
					$("#frm").submit();
				}
			}
		}else if(select == "반려"){
			// 미지급 사유
			$("#accd_res").val(unpaid);
			$("#frm2").submit();
		}
		
	});
	
	
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
<!-- 결과 상태 부분이 완료일경우 -->
<input type="hidden" id="select" value="">

<!-- 결과상태 부분에 완료 일경웨 지급 가능금액을 확인하여 이상으로 입력할때에는 입력이 안되게 설정하기 -->
<input type="hidden" id="insp_maxins" value="${acdVo.insp_maxins}">

<!-- 사고 처리 결과를 완료로 보낼경우 (사고 id , 상태변경값 , 지급일) -->
<form action="/isr/insPayment" method="post" id="frm">
	<input type="hidden" id="accd_id" name="accd_id" value="${acdVo.accd_id}">
	<input type="hidden" id="accd_date" name="accd_date" value="">
	<input type="hidden" id="accd_insp" name="accd_insp" value="">
</form>

<!-- 사고 처리 결과를 반려로 보낼경우 (사고 id , 상태변경값 , 반려사유) -->
<form action="/isr/unpaid" method="post" id="frm2">
	<input type="hidden" id="accd_id" name="accd_id" value="${acdVo.accd_id}">
	<input type="hidden" id="accd_res" name="accd_res" value="">
</form>

<!-- 사고 처리를 반려로 보낼경우 -->

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
							보험금 청구 신청 내역
						</div>
					</div>

						<div id="claimPetInfo">
							보험금 신청 진행하는 펫 : ${acdVo.myp_name}&nbsp;&nbsp;/&nbsp;&nbsp;<fmt:formatDate value="${acdVo.myp_birth}" pattern="yy년 MM월 dd일"></fmt:formatDate>&nbsp;&nbsp;/&nbsp;&nbsp;${acdVo.myp_gender}&nbsp;&nbsp;/&nbsp;&nbsp;${acdVo.myp_sick}
						</div>
						
						<div class="claimTitle4">
							<div class="claimTitle4_1">
								<div class="claimTitle4_2">Step1. "${acdVo.mem_name}"께서 신청한 보험금 청구상품</div>
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
											<label class="insurer2_4">(${acdVo.act_bank})${acdVo.act_num}/${acdVo.act_name}</label>
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
								<div class="claimTitle4_2">Step7. 사고 처리 결과 입력 </div>
							</div>
						</div>
						
						<div class="claimTitle4">
							<div class="claimTitle4_1_2">
								<div class="claimTitle4_2">상태를 완료로 할 경우에는 지급일을 입력하시기 바랍니다. 반려로 할경우에는 반려사유를 입력하시기 바랍니다.</div>
							</div>
						</div>
						
						<div id="accident">
							<div id="accident1">
								<div class="accident2">
									<div class="accident2_1">
										상태 변경
									</div>
									<div class="accident2_2">
										<div id="accountInfo3">
											<select class="memAccidentSelect" name="accountSelect" >
												<option selected value="0">보험금청구 상태 변경하시기 바랍니다.</option>
												<option value="완료">완료</option>
												<option value="반려">반려</option>
											</select>
										</div>
									</div>
								</div>
								<div class="accident2 hide">
									<div class="accident2_1">
										미지급사유
									</div>
									<div class="accident2_2_1">
										<input type="text" id="accidentInput">
									</div>
								</div>
								<div class="accident2 hide2">
									<div class="accident2_1">
										지급일
									</div>
									<div class="accident2_2_1_1">
										<input type="text" name ="claimDay" id="claimDay" readonly="readonly">
									</div>
								</div>
								<div class="accident2 hide3">
									<div class="accident2_1">
										지급금액
									</div>
									<div class="accident2_2_1_1">
										<div id="pay">지급가능 금액(${acdVo.insp_maxins}원)</div>
									</div>
									<div class="accident2_2_1_1">
										<input type="text" name ="price" id="price">원
									</div>
								</div>
							</div>
						</div>
		
				
					
					<div id="nextBtn">
						<div id="nextBtn1">
							<input type="button" id="nextBtn2" value="청구 완료하기">
						</div>
						<div id="nextBtn1_1">
							<input type="button" id="nextBtn2_1" value="목록으로 가기" onclick="goBack()">
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