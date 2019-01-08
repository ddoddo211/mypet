<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goClaim(관리자용 보험금 청구 관리화면)</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	//사고 청구 결과를 변경(완료)한후 해당 화면에 왔을떄 나오는 메세지 팝업창 설정
	var insPayment = '${insPayment}';
	if(insPayment == "Y"){
		alert("보험청구건이 완료 처리 되었습니다.");
	}
	
	//사고 청구 결과를 변경(반려)한후 해당 화면에 왔을떄 나오는 메세지 팝업창 설정
	var unpaid = '${unpaid}';
	if(unpaid == "Y"){
		alert("보험청구건이 반려 처리 되었습니다.");
	}
	
	// 블랙리스트를 추가한후 해당 화면에 왔을떄 나오는 메세지 팝업창 설정
	var blackListS = '${blackListS}';
	if(blackListS == "Y"){
		alert("해당 회원이 블랙리스트에 추가되었습니다.");
	}
	
	// 블랙리스트를 해제한후 해당 화면에 왔을떄 나오는 메세지 팝업창 설정
	var blackListR = '${blackListR}';
	if(blackListR == "Y"){
		alert("해당 회원이 블랙리스트에 해제되었습니다.");
	}
	
	// 보험금 청구 신청
	// radio박스를 클릭하였는지 확인하기 
	$(".check").click(function(){
			// 블랙리스트 선택 (회원의 id 담기)
			var accd_mem = $(this).data("accd_mem");
			// 블랙리스트 추가할때 사용할 회원의 아이디pk
			$("#accd_mem").val(accd_mem);
			
			// 보험금 신청 관리(사고 id 담기)
			var accd_id = $(this).val();
			$("#accd_id").val(accd_id);
	});
	
	// 보험금 청구 반려
	// radio박스를 클릭하였는지 확인하기 
	$(".check1").click(function(){
			// 보험금 신청 관리(사고 id 담기)
			var accd_id2 = $(this).val();
			$("#breakdownId").val(accd_id2);
	});
	
	// 보험금 청구 관리 (반려) 내역 확인하는 부분
	$("#companion").click(function(){
		var breakdownId = $("#breakdownId").val();
		// 체크박스를 클릭하였는지 확인하기 
		if(breakdownId == ""){
			alert("반려내역을 확인할 목록을 클릭하시기 바랍니다.");
			return;
		}else{
			$("#breakdown").submit();
		}
	});
	
	// 보험금 청구 완료
	// radio박스를 클릭하였는지 확인하기 
	$(".check2").click(function(){
			// 보험금 신청 관리(사고 id 담기)
			var accd_id = $(this).val();
			$("#completionId").val(accd_id);
	});
	
	// 보험금 청구 관리 (완료) 내역 확인하는 부분
	$("#completionHistory").click(function(){
		var completionHistory = $("#completionId").val();
		// 체크박스를 클릭하였는지 확인하기 
		if(completionHistory == ""){
			alert("완료내역을 확인할 목록을 클릭하시기 바랍니다.");
			return;
		}else{
			$("#completion").submit();
		}
	});
	
	
	
	
	
	// 블랙리스트 관리
	// radio박스를 클릭하였는지 확인하기 
	$(".check3").click(function(){
			// 블랙리스트 선택 (회원의 id 담기)
			var accd_mem = $(this).val();
			
			// 블랙리스트 해제할때 사용할 회원의 아이디pk
			$("#accd_mem2").val(accd_mem);
	});
	
	
	// 보험금 청구 신청 화면에서 "블랙리스트 추가"버튼을 클릭하였을 경우 
	$("#blackListInsert").click(function(){
		// 체크 박스가 클릭되었는지 확인하기
		var black = $("#accd_mem").val();
		if(black == ""){
			alert("블랙리스트에 추가할 회원의 목록을 클릭하시기 바랍니다.");
			return ;
		}else{
			$("#goBlackAdd").submit();
		}
	});
	
	
	// 보험금청구 신청 화면에서 신청내역확인 버튼을 클릭하였을떄 나오는 부분 
	$("#accidentApply").click(function(){
		// 체크 박스가 클릭되었는지 확인하기
		var accd_id = $("#accd_id").val();
		if(accd_id == ""){
			alert("신청내역을 확인할  목록을 클릭하시기 바랍니다.");
			return ;
		}else{
			$("#accidentApply2").submit();
		}
	});
	
	//블랙리스트 해제하기 버튼을 클릭하였을 경우
	$("#blackListRelease").click(function(){
		// 체크 박스가 클릭되었는지 확인하기
		var blackRelease = $("#accd_mem2").val();
		if(blackRelease == ""){
			alert("블랙리스트에 해제할 회원의 목록을 클릭하시기 바랍니다.");
			return ;
		}else{
			$("#goBlackRelease").submit();
		}
		
	});

	
});


</script>
<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<body>

<!-- 보험금 청구 신청항목에서 블랙리스트 추가 버튼을 클릭할시 -->
<form action="/isr/goBlackAdd" method="post" id="goBlackAdd">
	<input type="hidden" id="accd_mem" name="accd_mem" value="">
</form>

<!-- 보험금 청구 신청항목에서 신청내역확인 버튼을 클릭할시(사고테이블의 pk넘겨주기) -->
<form action="/isr/accidentApply" method="post" id="accidentApply2">
	<input type="hidden" id="accd_id" name="accd_id" value="">
</form>

<!-- 보험금 청구 신청항목에서 반려내역확인 버튼을 클릭할시(사고테이블의 pk넘겨주기) -->
<form action="/isr/breakdown" method="post" id="breakdown">
	<input type="hidden" id="breakdownId" name="breakdownId" value="">
</form>

<!-- 보험금 청구 신청항목에서 완료내역확인 버튼을 클릭할시(사고테이블의 pk넘겨주기) -->
<form action="/isr/completion" method="post" id="completion">
	<input type="hidden" id="completionId" name="completionId" value="">
</form>

<!-- 보험금 청구 신청항목에서 블랙리스트 해제 버튼을 클릭할시 -->
<form action="/isr/goBlackRelease" method="post" id="goBlackRelease">
	<input type="hidden" id="accd_mem2" name="accd_mem2" value="">
</form>

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
			
					<div id="productManagement2">
						<table id="currentStatus2">
							<tr>
								<th class="currentStatus1">보험금 신청 수</th>
								<th class="currentStatus1">보험금 반려 수</th>
								<th class="currentStatus1">보험금 완료 수</th>
								<th class="currentStatus1">블랙리스트 회원수</th>
							</tr>
							<tr>
								<td><a class="prod">${accidentListSize}개</a></td>
								<td><a class="prod">${companionListSize }개</a></td>
								<td><a class="prod">${completedListSize }개</a></td>
								<td><a class="prod">${memBlacklistSize }개</a></td>
							</tr>
						</table>
					</div>
			
				<div id="productManagement1">
					<div id="productManagement1_1">보험금 청구 관리(신청)</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">회원이 신청한 보험금 청구 내역에 대한 결과는 "신청내역 확인"화면에서 상태 변경이 가능합니다.</div>
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">관리자의 권한으로 해당 회원을 블랙리스트로 추가할수 있습니다. 블랙리스트인 회원은  현재 신청한 보험금 청구건은 모두 반려되게 됩니다.</div>
					</div>
				</div>
				
								<div id="productManagement">
						<div id="productList">
							<table id="example-table-1">
								<tr>
									<th class="tabel1">선택</th>
									<th class="tabel1">보험금 신청자</th>
									<th class="tabel1">펫이름</th>
									<th class="tabel1">보험이름</th>
									<th class="tabel1">사고일자</th>
									<th class="tabel1">상태</th>
								</tr>
<c:choose>
	<c:when test="${accidentListSize == 0}">
		<td class="tdh" colspan="6">회원께서 신청한 보험금 신청 내역이 없습니다.</td>	
	</c:when>
	<c:otherwise>
								

								<c:forEach items="${accidentList }" var="list">
									<tr>
										<td class="tdh"><input class="check" type="radio" name="check" value="${list.accd_id}" data-accd_mem="${list.accd_mem}" ></td>									
										<td class="tdh">${list.mem_name}(보험금 반려 숫자)</td>									
										<td class="tdh">${list.myp_name}</td>									
										<td class="tdh">${list.insp_name}</td>
										<td class="tdh"><fmt:formatDate value="${list.accd_date}" pattern="yyyy년 MM월 dd일"/></td>									
										<td class="tdh">${list.accd_stat}</td>									
									</tr>
								</c:forEach>
	</c:otherwise>
</c:choose>
							</table>
						</div>
						
						<div id="prodSelectBtn">
							<div id="applySelectBtn1">
								<div class="prodSelectBtn1_1" id="prodSelectBtn1_2">
									<input class="prodSelectBtn1_1" id="blackListInsert" type="button" value="블랙리스트 추가">
								</div>
								<div class="prodSelectBtn1_1">
									<input class="prodSelectBtn1_1" id="accidentApply" type="button" value="신청내역 확인">
								</div>
							</div>
						</div>
				</div>
				
				<div id="productManagement1">
					<div id="productManagement1_1">보험금 청구 관리(반려)</div>
				</div>
								
					<div id="productManagement">
						<div id="productList">
							<table id="example-table-1">
								<tr>
									<th class="tabel2">선택</th>
									<th class="tabel1">보험금 신청자</th>
									<th class="tabel6">펫이름</th>
									<th class="tabel1">보험이름</th>
									<th class="tabel7">반려사유</th>
									<th class="tabel6">사고일자</th>
									<th class="tabel6">상태</th>
								</tr>
<c:choose>
	<c:when test="${companionListSize == 0}">
		<td class="tdh" colspan="6">회원께서 보험금 반려 내역이 없습니다.</td>	
	</c:when>
	<c:otherwise>
								

								<c:forEach items="${companionList }" var="list">
									<tr>
										<td class="tdh"><input class="check1" type="radio" name="check1" value="${list.accd_id}" ></td>									
										<td class="tdh">${list.mem_name}</td>									
										<td class="tdh">${list.myp_name}</td>									
										<td class="tdh">${list.insp_name}</td>
										<td class="tdh">${list.accd_res}</td>
										<td class="tdh"><fmt:formatDate value="${list.accd_date}" pattern="yyyy년 MM월 dd일"/></td>									
										<td class="tdh">${list.accd_stat}</td>									
									</tr>
								</c:forEach>
	</c:otherwise>
</c:choose>
							</table>
						</div>
						
						<div id="prodSelectBtn">
							<div id="selectBtn1">
								<div class="selectBtn1_1" id="prodSelectBtn1_2">
									<input class="selectBtn1_1" id="companion"  type="button" value="반려내역 확인">
								</div>
							</div>
						</div>
				</div>
				
				<div id="productManagement1">
					<div id="productManagement1_1">보험금 청구 관리(완료)</div>
				</div>
								
					<div id="productManagement">
						<div id="productList">
							<table id="example-table-1">
								<tr>
									<th class="tabel1">선택</th>
									<th class="tabel1">보험금 신청자</th>
									<th class="tabel1">펫이름</th>
									<th class="tabel1">보험이름</th>
									<th class="tabel1">사고일자</th>
									<th class="tabel1">지급금액</th>
									<th class="tabel1">지급일자</th>
									<th class="tabel1">상태</th>
								</tr>
<c:choose>
	<c:when test="${completedListSize == 0}">
		<td class="tdh" colspan="6">회원께서 보험금 완료 내역이 없습니다.</td>	
	</c:when>
	<c:otherwise>
								

								<c:forEach items="${completedList }" var="list">
									<tr>
										<td class="tdh"><input class="check2" type="radio" name="check2" value="${list.accd_id}" ></td>									
										<td class="tdh">${list.mem_name}</td>									
										<td class="tdh">${list.myp_name}</td>									
										<td class="tdh">${list.insp_name}</td>
										<td class="tdh"><fmt:formatDate value="${list.accd_date}" pattern="yyyy년 MM월 dd일"/></td>									
										<td class="tdh">${list.accd_insp}원</td>									
										<td class="tdh"><fmt:formatDate value="${list.accd_pay}" pattern="yyyy년 MM월 dd일"/></td>									
										<td class="tdh">${list.accd_stat}</td>									
									</tr>
								</c:forEach>
	</c:otherwise>
</c:choose>
							</table>
						</div>
						
						<div id="prodSelectBtn">
							<div id="selectBtn1">
								<div class="selectBtn1_1" id="prodSelectBtn1_2">
									<input class="selectBtn1_1" id="completionHistory" type="button" value="완료내역 확인">
								</div>
							</div>
						</div>
				</div>
				
				<div id="productManagement1">
					<div id="productManagement1_1">블랙리스트 관리</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">블랙리스트로 추가된 회원은 보험가입이나 보험금 청구 이용이 제한됩니다.</div>
					</div>
				</div>
								
					<div id="productManagement">
						<div id="productList">
							<table id="example-table-1">
								<tr>
									<th class="tabel1">선택</th>
									<th class="tabel1">회원이름</th>
									<th class="tabel1">보험금 반려 횟수</th>
								</tr>
<c:choose>
	<c:when test="${memBlacklistSize == 0}">
		<td class="tdh" colspan="6">블랙리스트 대상자가 없습니다.</td>	
	</c:when>
	<c:otherwise>
								

								<c:forEach items="${memBlacklist }" var="list">
									<tr>
										<td class="tdh"><input class="check3" type="radio" name="check3" value="${list.mem_id}" ></td>									
										<td class="tdh">${list.mem_name}</td>									
										<td class="tdh">반려횟수</td>									
									</tr>
								</c:forEach>
	</c:otherwise>
</c:choose>
							</table>
						</div>
						
						<div id="prodSelectBtn">
							<div id="selectBlackBtn1">
								<div class="selectBtn1_1" id="prodSelectBtn1_2">
									<input class="selectBtn1_1" id="blackListRelease" type="button" value="블랙리스트 해제">
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