<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prodJoin.jsp(펫 보험 가입 하는 화면)</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
		// 계좌번호 관리 부분에 선택버튼을 클릭하였을때 값이 담기게 설정
		
		$('select[name=accountSelect]').change(function() {
			var  account = $(this).val();
			$("#memAccountId").val(account);
		});
			
		$("#isrJoinBtn3").click(function() {
			
			var account = $("#memAccountId").val();
			
			// 계약자 정보 체크박스
			if (!$("input[id='isrJoinInfo5_1']:checked").val()) {
				alert("계약자 정보의 체크 박스에 체크하시기 바랍니다");
				return;
			} else if (!$("input[name='name']:checked").val()) {
				alert("고지사항1번 부분에 체크되어 있지 않습니다.\n체크하시기 바랍니다");
				return;
			} else if (!$("input[name='name1']:checked").val()) {
				alert("고지사항2번 부분에 체크되어 있지 않습니다.\n체크하시기 바랍니다");
				return;
			} else if (!$("input[name='name2']:checked").val()) {
				alert("고지사항3번 부분에 체크되어 있지 않습니다.\n체크하시기 바랍니다");
				return;
			} else if ($("input[name='name']:checked").val() == 'N') {
				alert("고지사항1번 부분에 Y로 체크되어 있지 않습니다.\nY로 입력하셔야만 가입 진행이 가능하십니다.");
				return;
			} else if ($("input[name='name1']:checked").val() == 'N') {
				alert("고지사항2번 부분에 Y로 체크되어 있지 않습니다.\nY로 입력하셔야만 가입 진행이 가능하십니다.");
				return;
			} else if ($("input[name='name2']:checked").val() == 'N') {
				alert("고지사항3번 부분에 Y로 체크되어 있지 않습니다.\nY로 입력하셔야만 가입 진행이 가능하십니다.");
				return;
			}else {
				$("#frm").submit();
			}
		});

	});
</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<body>
<!-- form에  내 반려동물 id , 회원 id(이메일) , 보험상품 id , 선택한 계좌번호 담아서 보내주기-->
<form action="/isr/isrProdMypetJoin" method="post" id="frm">
	<input type="hidden" name="petId" value="${petId}"/>
	<input type="hidden" name="memId" value="${memVo.mem_id}"/>
	<input type="hidden" name="prodJoinId" value="${prodJoinId}"/>
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
		
		<!--  펫 보험 가입하는 화면 시작 -->
		<div id="petJoinForm">
			<div id="petJoinForm2">
				<!-- 펫의 정보가 나오는 부분 -->
				<div id="petInfoForm">
					<div id="petInfoForm1">
						"${mypetInfo.myp_name}"을 위한 보험료 안내
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
						가입 진행을 위해 계약자의 정보를 입력하세요
					</div>
					<div id="isrJoinInfo3">
						<div class="isrJoinMem" id="isrJoinMem1">이름</div> 
						<label class="isrJoinInfoLabel" id="memJoinName2">${memVo.mem_name}</label>
					</div>
					<div class="isrJoinInfo5">
						<div id="memJoinPhone" class="isrJoinMem">전화번호</div>
						<label class="isrJoinInfoLabel" id="memJoinPhone2">${memVo.mem_hp}</label>
					</div>
					<div id="isrJoinInfo4" class="isrJoinInfo5">
						보험료계산 / 가입을 위해 본인의 개인(신용)정보를 수집,이용하는 것에 동의합니다.<input id="isrJoinInfo5_1" type="checkbox" />
					</div>
				</div>
				
				<!-- 고지사항 -->
				<div id="isrJoinNotice">
					<div id="isrJoinNotice2">
						보험가입을 위해 고지사항을 확인해주세요
					</div>
					<div class="isrJoinNotice3">
						* 애완/ 반려  목적으로 양육하고 있습니까?
						<span class="isrJoinNotice3_1">
							<input class="YesNo" type="radio" value="Y" name="name"/><label>예</label>
							<input class="isrJoinNotice3_1_1 YesNo" type="radio" value="N" name="name"/><label>아니요</label>
						</span> 
					</div>
					<div class="isrJoinNotice3">
						* 보험가입이 완료될시에는 나의 펫의 고의적인 상해를 가하는 경우에는 형사처벌을 받을것을 동의하시겠습니까?
						<span class="isrJoinNotice3_1">
							<input class="YesNo" type="radio" value="Y" name="name1"/><label>예</label>
							<input class="isrJoinNotice3_1_1 YesNo" type="radio" value="N" name="name1"/><label>아니요</label>
						</span>
					</div>
					<div class="isrJoinNotice3">
						* 현재 작성한 내용을 거짓없이 사실 내용에 의해서 작성하셨습니까? 
						<span class="isrJoinNotice3_1">
							<input class="YesNo" type="radio" value="Y" name="name2"/><label>예</label>
							<input class="isrJoinNotice3_1_1 YesNo" type="radio" value="N" name="name2"/><label>아니요</label>
						</span>
					</div>
					
				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">회원께서 신청하신 보험은 관리자께서 가입완료로 변경해야 보험료 결재가 가능합니다.</div>
					</div>
				</div>
					
					<!-- 보험가입 버튼 -->
					<div id="isrJoinBtn">
						<div id="isrJoinBtn2">
							<input id="isrJoinBtn3" type="submit" value="가입하기">
						</div>
					</div>			
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