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

});
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
		
		<!--  펫 보험 가입하는 화면 시작 -->
		<div id="petJoinForm">
			<div id="petJoinForm2">
				<!-- 펫의 정보가 나오는 부분 -->
				<div id="petInfoForm">
					<div id="petInfoForm1">
						을 위한 보험료 안내
					</div>
					<div id="petInfoForm2">
						이름 /생년월일/품종/성별/질병여부
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
					<c:forEach items="${memIsrList}" var="prodVo">
							<tr class="tr7">
								<td class="td9">${prodVo.insp_name}</td>
								<c:choose>
									<c:when test = "${prodVo.insp_join == '강아지'}">
										<td class="td9"><img alt="이미지가 없습니다" src="/img/petInsurance/petKind.jpg" width="40px" height="40px">${prodVo.insp_join}</td>
									</c:when>
									<c:otherwise>
										<td class="td9"><img alt="이미지가 없습니다" src="/img/petInsurance/petKind2.jpg" width="40px" height="40px">${prodVo.insp_join}</td>
									</c:otherwise>
								</c:choose>
								<td class="td9">${prodVo.insp_kind}</td>
								<td class="td9"><%="월 "%>${prodVo.insp_fees}<%="원"%></td>
								<td class="td12">${prodVo.insp_minage}<%="~"%>${prodVo.insp_maxage}<%="세"%></td>
								<td class="td9"><%="가입부터 ~"%>${prodVo.insp_period}<%="세 까지"%></td>
								<td class="td12">${prodVo.insp_sick}</td>

							</tr>
						</c:forEach>
					</table>
				</div>
				
				<!-- 계약자 정보 -->
				<div id="isrJoinInfo">
					<div id="isrJoinInfo2">
						가입 진행을 위해 계약자의 정보를 입력하세요
					</div>
					<div id="isrJoinInfo3" class="isrJoinMem">
						이름 <label class="isrJoinInfoLabel">${memVo.mem_name}</label>
					</div>
					<div class="isrJoinMem">
						전화번호 <label class="isrJoinInfoLabel">${memVo.mem_hp}</label>
					</div>
					<div id="isrJoinInfo4">
						보험료계산 / 가입을 위해 본인의 개인(신용)정보를 수집,이용하는 것에 동의합니다.<input id="isrJoinInfo5" type="checkbox" />
					</div>
				</div>
				
				<!-- 고지사항 -->
				<div id="isrJoinNotice">
					<div id="isrJoinNotice2">
						보험가입을 위해 고지사항을 확인해주세요
					</div>
					<div class="isrJoinNotice3">
						* 애완/ 반려 외의 목적으로 양육하고 있습니까?
						<span class="isrJoinNotice3_1">
							<input type="radio" value="Y"/><label>예</label>
							<input class="isrJoinNotice3_1_1" type="radio" value="N"/><label>아니요</label>
						</span> 
					</div>
					<div class="isrJoinNotice3">
						* 보험가입이 완료될시에는 나의 펫의 고의적인 상해를 가하는 경우에는 형사처벌을 받을것을 동의하시겠습니까?
						<span class="isrJoinNotice3_1">
							<input type="radio" value="Y"/><label>예</label>
							<input class="isrJoinNotice3_1_1" type="radio" value="N"/><label>아니요</label>
						</span>
					</div>
					<div class="isrJoinNotice3">
						* 현재 작성한 내용을 거짓없이 사실 내용에 의해서 작성하셨습니까? 
						<span class="isrJoinNotice3_1">
							<input type="radio" value="Y"/><label>예</label>
							<input class="isrJoinNotice3_1_1" type="radio" value="N"/><label>아니요</label>
						</span>
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