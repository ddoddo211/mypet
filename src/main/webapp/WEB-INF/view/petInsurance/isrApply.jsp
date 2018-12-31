<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>isrApply.jsp(보험금 신청현황 - 신청)</title>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 체크박스 클릭한 부분으로 보험금청구 신청 취소 하게 설정
	$(".isrApplyChk").click(function(){
		var accd_id = $(this).val();
		$("#accd_id").val(accd_id);
		$("#accd_id2").val(accd_id);
	});
	
	// 보험금 신청 취소 버튼을 클릭하였을떄 적용되는 부분
	$("#isrApplyBtn1_1").click(function(){
		var accd_id = $("#accd_id").val();
		if(accd_id == ""){
			alert("보험금 취소를 원하시는 목록의 체크박스를 선택하시기 바랍니다.");
		}else{
			$("#frm").submit();
		}
	});
	
	// 보험금 내역 확인 버튼을 클릭하였을떄 이동되는 부분
	$("#isrApplyBtn0").click(function(){
		var accd_id2 = $("#accd_id2").val();
		if(accd_id2 == ""){
			alert("보험금 내역 확인을 원하시는 목록의 체크박스를 선택하시기 바랍니다.");
		}else{
			$("#frm2").submit();
		}
	});
	
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
<!-- 보험금 신청 취소 버튼을 클릭하였을때 나오는 부분 -->
<form action="/isr/goisrApplyDel" id="frm" method="get">
	<input type="hidden" id="accd_id" name="accd_id" value="">
</form>

<!-- 보험금 내역 확인 버튼을 클릭하였을떄 작동하는 부분 -->
<form action="/isr/gohistory" id="frm2" method="get">
	<input type="hidden" id="accd_id2" name="accd_id2" value="">
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

		<div id="isrApplyMain">
		
			<div id="isrApplyTitle">
				<div id="isrApplyTitle1">
					보험금 청구 현황
				</div>
			</div>
			
			<div id="isrApplyTitle2">
				<div id="isrApplyTitle2_1">
					보험금 신청중인 내역
				</div>
			</div>
			
			<div id="isrApplyTitle3">
				<div id="isrApplyTitle3_1">
					보험금 청구가 "신청"상태인 내역은 보험금 청구 신청 취소를 하실수 있습니다.
				</div>
			</div>
			
			<div id="isrApplyTitle3_1_1">
				<div id="isrApplyTitle3_1_2">
					[보험금 내역 확인]화면에서는 계좌번호만 변경이 가능합니다. 만약, 내용 수정을 원하실 시에는 보험금 신청 취소를 하신 후 다시 신청하시기 바랍니다.
				</div>
			</div>
			
			<div id="isrApplyTable">
						<table id="isrApplyTable1">
								<tr class="tr2">
									<th class="td6">선택</th>
									<th class="td3">보험금청구대상</th>
									<th class="td2">보험상품</th>
									<th class="td2">사고일자</th>
									<th class="td2">사고장소</th>
									<th class="td2">상태</th>
									<th class="td2">보험금 입금 요청<br>계좌번호</th>
								</tr>
<!-- 만약 신청되어 있는 건이 하나도 없다면 나와야 하기 떄문에 설정 -->
<c:choose>	
	<c:when test="${isrApplySize == 0}">
		<tr class="tdTable4">
			<td colspan="6" class="tdTable3">현재 신청되어 있는 보험금 청구건이 없습니다.</td>
		</tr>
	</c:when>
	<c:otherwise>		
							<c:forEach items="${isrApply}" var="list">
								<tr>
									<td class="td1"><input class="isrApplyChk" type="radio" name="isrApplyChk" value="${list.accd_id }"/></td>
									<td class="td1">${list.myp_name}</td>
									<td class="td1">${list.insp_name}</td>
									<td class="td1"><fmt:formatDate value="${list.accd_date}" pattern="yyyy년 MM월 dd일"></fmt:formatDate></td>
									<td class="td1">${list.accd_addr}</td>
									<td class="td1">${list.accd_stat}</td>
									<td class="td1">(${list.act_bank}) ${list.act_num}</td>
								</tr>
							</c:forEach>
	</c:otherwise>	
</c:choose>
				</table>
				
				
			</div>
			
			<div id="isrApplyBtn">
				<div>
					<input type="button" id="isrApplyBtn0" value="보험금 내역  확인"/>
				</div>
				<div>
					<input type="button" id="isrApplyBtn1_1" value="보험금 신청 취소" />
				</div>
				<div id="isrApplyBtn2_1" onclick="goMypet()">
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