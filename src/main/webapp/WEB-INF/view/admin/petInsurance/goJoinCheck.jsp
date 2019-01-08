<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goJoinCheck.jsp(관리자용 : 보험상품관리 - 보험확인하기 버튼)</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
		//해당화면에 전체 checkbox들을 체크해준다 
		$("input[class=YesNo]").prop("checked",true);
		//해당화면에 전체 checkbox들을 체크해준다 
		$("input[type=checkbox]").prop("checked",true);
	
});

function goBack(){
	location.href = '/isr/goApplyJoinManager';
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
		
		<!--  펫 보험 가입하는 화면 시작 -->
		<div id="petJoinForm">
			<div id="petJoinForm2">
				<!-- 펫의 정보가 나오는 부분 -->
				<div id="petInfoForm">
					<div id="petInfoForm1">
						"${mypetInfo.myp_name}"님이 가입한 보험내역
					</div>
					<div id="petInfoForm2">
						${mypetInfo.myp_name}&nbsp;&nbsp;/&nbsp;&nbsp;<fmt:formatDate value="${mypetInfo.myp_birth}" pattern="yy년 MM월 dd일"></fmt:formatDate>&nbsp;&nbsp;/&nbsp;&nbsp;${mypetInfo.petk_name}&nbsp;&nbsp;/&nbsp;&nbsp;${mypetInfo.myp_gender}&nbsp;&nbsp;/&nbsp;&nbsp;${mypetInfo.myp_sick}
					</div>
					<div id="petTable2">
						<table>
							<tr class="tr7">
								<th class="td9">보험상품</th>
								<th class="td9">가입대상</th>
								<th class="td9">보험이름</th>
								<th class="td9">월보험료</th>
								<th class="td12">가입연령</th>
								<th class="td9">보장기간</th>
								<th class="td12">질병여부</th>
							</tr>
							<tr class="tr7">
								<td class="td9">${prodJoin.insp_name}</td>
								<c:choose>
									<c:when test = "${prodJoin.insp_join == '강아지'}">
										<td class="td9"><img alt="이미지가 없습니다" src="/img/petInsurance/petKind.jpg" width="40px" height="40px">${prodJoin.insp_join}</td>
									</c:when>
									<c:otherwise>
										<td class="td9"><img alt="이미지가 없습니다" src="/img/petInsurance/petKind2.jpg" width="40px" height="40px">${prodJoin.insp_join}</td>
									</c:otherwise>
								</c:choose>
								<td class="td9">${prodJoin.insp_kind}</td>
								<td class="td9"><%="월 "%>${prodJoin.insp_fees}<%="원"%></td>
								<td class="td12">${prodJoin.insp_minage}<%="~"%>${prodJoin.insp_maxage}<%="세"%></td>
								<td class="td9"><%="가입부터 ~"%>${prodJoin.insp_period}<%="세 까지"%></td>
								<td class="td12">${prodJoin.insp_sick}</td>
							</tr>
					</table>
				</div>
				
				<!-- 계약자 정보 -->
				<div id="isrJoinInfo">
					<div id="isrJoinInfo2">
						가입 되어 있는계약자의 정보
					</div>
					<div id="isrJoinInfo3">
						<div class="isrJoinMem" id="isrJoinMem1">이름</div> 
						<label class="isrJoinInfoLabel" id="memJoinName2">${insVoList.mem_name}</label>
					</div>
					<div class="isrJoinInfo5">
						<div id="memJoinPhone" class="isrJoinMem">전화번호</div>
						<label class="isrJoinInfoLabel" id="memJoinPhone2">${insVoList.mem_hp}</label>
					</div>
					<div class="isrJoinInfo5">
						<div id="memJoinPhone" class="isrJoinMem">보험가입일</div>
						<label class="isrJoinInfoLabel" id="memJoinPhone2"><fmt:formatDate value="${insVoList.ins_start}" pattern="yyyy년 MM월 dd일"></fmt:formatDate></label>
					</div>
					<div id="isrJoinInfo4" class="isrJoinInfo5">
						보험료계산 / 가입을 위해 본인의 개인(신용)정보를 수집,이용하는 것에 동의합니다.<input id="isrJoinInfo5_1" type="checkbox" checked onclick="return false;"/>
					</div>
				</div>
				
				<!-- 고지사항 -->
				<div id="isrJoinNotice">
					<div id="isrJoinNotice2">
						보험가입을 위해 고지사항을 확인한 내역
					</div>
					<div class="isrJoinNotice3">
						* 애완/ 반려  목적으로 양육하고 있습니까?
						<span class="isrJoinNotice3_1">
							<input class="YesNo" type="radio" value="Y" name="name" onclick="return false;"/><label>예</label>
							<input class="isrJoinNotice3_1_1 YesNo" type="radio" value="N" name="name" onclick="return false;"/><label>아니요</label>
						</span> 
					</div>
					<div class="isrJoinNotice3">
						* 보험가입이 완료될시에는 나의 펫의 고의적인 상해를 가하는 경우에는 형사처벌을 받을것을 동의하시겠습니까?
						<span class="isrJoinNotice3_1">
							<input class="YesNo" type="radio" value="Y" name="name1" onclick="return false;"/><label>예</label>
							<input class="isrJoinNotice3_1_1 YesNo" type="radio" value="N" name="name1" onclick="return false;"/><label>아니요</label>
						</span>
					</div>
					<div class="isrJoinNotice3">
						* 현재 작성한 내용을 거짓없이 사실 내용에 의해서 작성하셨습니까? 
						<span class="isrJoinNotice3_1">
							<input class="YesNo" type="radio" value="Y" name="name2" onclick="return false;"/><label>예</label>
							<input class="isrJoinNotice3_1_1 YesNo" type="radio" value="N" name="name2" onclick="return false;"/><label>아니요</label>
						</span>
					</div>
					
				<div id="contractorInfo">
						<!-- 계약자의 계좌정보입력하기 -->
						<div id="contractor">
							보험료를 납부할 계좌 내역
						</div>
						
						<!-- 회원의 계좌번호 select박스 나오는곳 -->
						<div id ="accountInfo">
							<div id="accountInfo1">
								<div id="accountInfo2">
									계좌번호 
								</div>
								<div id="accountInfo3">
									<div class="isrJoinNotice3">
										<span class="isrJoinNotice3_1">
										(${insVoList.act_bank })${insVoList.act_num }${insVoList.act_name }
										</span>
									</div>
								</div>
							</div>
						</div>									
				</div>
					
					<!-- 보험가입 버튼 -->
					<div id="isrJoinBtn">
						<div id="isrJoinBtn2">
							<input id="isrJoinBtn3" type="submit" onclick="goBack()" value="목록으로 가기">
						</div>
					</div>			
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