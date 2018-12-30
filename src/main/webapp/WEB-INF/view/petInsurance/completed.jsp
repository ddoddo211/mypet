<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>completed.jsp(보험금 신청현황 - 심사완료)</title>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
});

// 목록으로 가는 화면으로 이동하는 부분
	function goMypet() {
		location.href = '/isr/mypetPage';
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

		<div id="isrApplyMain">
		
			<div id="isrApplyTitle">
				<div id="isrApplyTitle1">
					보험금 청구 현황
				</div>
			</div>
			
			<div id="isrApplyTitle2">
				<div id="isrApplyTitle2_1">
					보험금 심사완료인 내역
				</div>
			</div>
			
			<div id="isrApplyTitle3">
				<div id="isrApplyTitle3_1">
					보험금 청구가 "완료"상태인 청구건은 다음달 1일에 보험금이 지급됩니다.
				</div>
			</div>
			
			<div id="isrApplyTitle3_1_1">
				<div id="isrApplyTitle3_1_2">
					보험금 청구 상태가 "완료"상태인 청구건은 [보험금내역]을 확인하실수 있습니다.
				</div>
			</div>
			
			<div id="completedTable">
						<table id="isrApplyTable1">
								<tr class="tr2">
									<th class="td2">선택</th>
									<th class="td3">보험금청구대상</th>
									<th class="td2">보험상품</th>
									<th class="td2">사고일자</th>
									<th class="td2">사고장소</th>
									<th class="td2">상태</th>
									<th class="td2">보험료 금액</th>
									<th class="td2">지급일</th>
								</tr>
<!-- 만약 신청되어 있는 건이 하나도 없다면 나와야 하기 떄문에 설정 -->
<c:choose>	
	<c:when test="${completedSize == 0}">
		<tr class="tdTable4">
			<td colspan="6" class="tdTable3">현재 심사완료된 보험금 청구건이 없습니다.</td>
		</tr>
	</c:when>
	<c:otherwise>		
							<c:forEach items="${completed}" var="list">
								<tr>
									<td class="td1"><input class="isrApplyChk" type="radio" name="isrApplyChk" value="${list.accd_id }"/></td>
									<td class="td1">${list.myp_name}</td>
									<td class="td1">${list.insp_name}</td>
									<td class="td1"><fmt:formatDate value="${list.accd_date}" pattern="yyyy년 MM월 dd일"></fmt:formatDate></td>
									<td class="td1">${list.accd_addr}</td>
									<td class="td1">${list.accd_stat}</td>
									<td class="td1">${list.accd_insp}원</td>
									<td class="td1"><fmt:formatDate value="${list.accd_pay}" pattern="yyyy년 MM월 dd일"></fmt:formatDate></td>
								</tr>
							</c:forEach>
	</c:otherwise>	
</c:choose>
				</table>
				
				
			</div>
			
			<div id="isrApplyBtn">
				<div>
					<input type="button" id="isrApplyBtn1" value="보험금 내역  확인" />
				</div>
				<div id="isrApplyBtn2" onclick="goMypet()">
				 	목록으로 이동
				</div>
			</div>
		
		
		
		</div>

</div>
	
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>