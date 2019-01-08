<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goApplyJoinManeger(관리자용 보험신청/가입자관리화면)</title>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 체크박스를 클릭하였을때 상품의 id 담아주기 (신청자 관리)
	$(".check").click(function(){
			var apply = $(this).val();
			// 가입승인할때 사용할 pk
			$("#applyJoinProd").val(apply);
			
			// 반려할때 사용할 pk
			$("#applyJoinProd2").val(apply);
			
			// 보험상품의 펫 아이디를 담아주기
			var petIdSelect= $(this).data("myp_id");
			$("#petIdProd").val(petIdSelect);
			
			// 보험상품의 아이디담아주기
			var prodIdSelect= $(this).data("inssp_id");
			$("#prodIdSelect").val(prodIdSelect);
			
			// 회원이 블랙리스트인지 확인하는 부분
			var mem_black = $(this).data("mem_black");
			$("#mem_black").val(mem_black);
			
	});
	
	// 가입자 관리 화면에서 체크박스를 클릭하였을떄 상품의 id 담아주기
	$(".check1").click(function(){
			var joinCheck = $(this).val();
			// 보험확인하기 버튼을 클릭하였을떄 보험상품을 id를 담아주기
			$("#joinCheck").val(joinCheck);
			
			// 보험해지하기 버튼을 클릭할떄 보험상품 id를 담아주기
			$("#joinTermination").val(joinCheck);
			
			
			// 보험상품의 회원 아이디를 담아주기
			var mem_id= $(this).data("mem_id");
			$("#mem_id").val(mem_id);
			
			// 보험상품의 계좌 아이디를 담아주기
			var act_id= $(this).data("act_id");
			$("#act_id").val(act_id);
			
			// 보험상품의 보험상품 아이디를 담아주기
			var inssp_id= $(this).data("inssp_id");
			$("#inssp_id").val(inssp_id);
			
			// 보험상품의 펫 아이디를 담아주기
			var myp_id= $(this).data("myp_id");
			$("#myp_id").val(myp_id);
			
			
	});
	
	
	//신청자관리 화면에서 신청승인 버튼을 클릭하였을때
	$("#prodSelectBtn1_1_1_1").click(function(){
		var applyJoinProd = $("#applyJoinProd").val();
		
		// 회원이 블랙리스트인지 확인하는 부분
		var mem_black = $("#mem_black").val();
		
		if(applyJoinProd == ""){
			alert("가입신청 승인할 가입목록을 선택하시기 바랍니다.");
			return ;
		}else if(mem_black == 2){
			alert("가입신청하는 대상자는 블랙리스트임으로\n신청 승인을 진행하실수 없습니다.");
			//해당화면에 모든 radio들의 체크를해제시킨다. 
			$("input[type=radio]").prop("checked",false);
			return ;
		}else{
			$("#frm").submit();
		}
	});
	
	// 신청자관리 화면에서 신청 반려 버튼을 클릭하였을때
	$("#prodSelectBtn1_1_2_1").click(function(){
		var applyJoinProd = $("#applyJoinProd").val();
		if(applyJoinProd == ""){
			alert("가입신청 반려할 가입목록을 선택하시기 바랍니다.");
			return ;
		}else{
			$("#frm2").submit();
		}
	});
	
	
	// 가입자관리 화면에서 보험확인하기 버튼을 클릭하였을때
	$("#prodSelectBtn1_1_2").click(function(){
		var joinCheck = $("#joinCheck").val();
		
		if(joinCheck == ""){
			alert("확인할 보험목록의 선택박스를 선택하시기 바랍니다.");
			return ;
		}else{
			$("#frm3").submit();
		}
		
	});
	
	// 가입자관리화면에서 보험해지하기 버튼을 클릭하였을 경우 
	$("#prodSelectBtn1_1_1").click(function(){
		var joinTermination = $("#joinTermination").val();
		
		if(joinTermination == ""){
			alert("해지할 보험내역목록을 선택하시기 바랍니다.");
			return ;
		}else{
			$("#frm4").submit();
		}
	});
	
});

</script>
<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<body>
<!-- 회원이 블랙리스트인지 확인하는 부분 -->
<input type="hidden" value="" id="mem_black">

<!--신청자관리 화면에서 신청으로 변경할 가입상품 아이디 담아주기 -->
<form action="/isr/goApplyJoin" method="post" id="frm">
	<input type="hidden" value="" id="applyJoinProd" name="applyJoinProd">
	<input type="hidden" value="" id="petIdProd" name="petIdProd">
	<input type="hidden" value="" id="prodIdSelect" name="prodIdSelect">
</form>

<!--신청자관리 화면에서 반려로 변경할 가입상품 아이디 담아주기 -->
<form action="/isr/goCompanionJoin" method="post" id="frm2">
<input type="hidden" value="" id="applyJoinProd2" name="applyJoinProd">
</form>


<!--가입자관리화면에서 보험확인하기 버튼을 클릭하였을 경우 -->
<form action="/isr/goJoinCheck" id="frm3" method="post">
	<input type="hidden" id="joinCheck" name="joinCheck" value="" >
	<input type="hidden" id="mem_id" name="mem_id" value="" >
	<input type="hidden" id="act_id" name="act_id" value="" >			
	<input type="hidden" id="inssp_id" name="inssp_id" value="" >			
	<input type="hidden" id="myp_id" name="myp_id" value="" >			
</form>

<!-- 가입자관리 화면에서 보험해지하기 버튼을 클릭하였을 경우 -->
<form action="/isr/goJoinTermination" id="frm4" method="post">
	<input type="hidden" id="joinTermination" name="joinTermination" value="" >
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
								<th class="currentStatus1">보험 신청 수</th>
								<th class="currentStatus1">보험 반려 수</th>
								<th class="currentStatus1">보험 가입자 수</th>
							</tr>
							<tr>
								<td><a class="prod">${applyListSize}개</a></td>
								<td><a class="prod">${terminationListSize }개</a></td>
								<td><a class="prod">${completeListSize }개</a></td>
							</tr>
						</table>
					</div>
			
				<div id="productManagement1">
					<div id="productManagement1_1">보험 신청자 관리</div>
				</div>
				
				<div id="productManagement">
						<div id="productList">
							<table id="example-table-1">
								<tr>
									<th class="tabel1">선택</th>
									<th class="tabel1">보험 신청자</th>
									<th class="tabel1">펫이름</th>
									<th class="tabel1">보험이름</th>
									<th class="tabel1">펫 질병 이력</th>
									<th class="tabel1">가입상태</th>
								</tr>
<c:choose>
	<c:when test="${applyListSize == 0}">
		<td class="tdh" colspan="6">회원께서 신청한 내역이 없습니다.</td>	
	</c:when>
	<c:otherwise>
								

								<c:forEach items="${applyList }" var="list">
									<tr>
										<td class="tdh"><input class="check" type="radio" name="check" value="${list.ins_id}" data-myp_id="${list.myp_id}" data-inssp_id="${list.inssp_id}" data-mem_black="${list.mem_black}"></td>									
										<c:choose>
											<c:when test="${list.mem_black == 1}">
												<td class="tdh">${list.mem_name}</td>	
											</c:when>
											<c:otherwise>
												<td class="tdh1">${list.mem_name}(블랙리스트)</td>	
											</c:otherwise>
										</c:choose>										
										<td class="tdh">${list.myp_name}</td>									
										<td class="tdh">${list.insp_kind}</td>									
										<td class="tdh">${list.myp_sick}</td>									
										<td class="tdh">${list.ins_stat}</td>									
									</tr>
								</c:forEach>
	</c:otherwise>
</c:choose>
							</table>
						</div>
						
						<div id="prodSelectBtn">
							<div id="applySelectBtn1">
								<div class="prodSelectBtn1_1" id="prodSelectBtn1_2">
									<input class="prodSelectBtn1_1" id="prodSelectBtn1_1_1_1" type="button" value="신청 승인">
								</div>
								<div class="prodSelectBtn1_1">
									<input class="prodSelectBtn1_1" id="prodSelectBtn1_1_2_1" type="button" value="신청 반려">
								</div>
							</div>
						</div>
				</div>
				
				
					<div id="productManagement1">
						<div id="productManagement1_1">보험 신청 반려내역 관리</div>
					</div>
					
					<div id="productManagement">
						<div id="productList">
							<table id="example-table-1">
								<tr>
									<th class="tabel1">보험 신청자</th>
									<th class="tabel1">펫이름</th>
									<th class="tabel1">보험이름</th>
									<th class="tabel1">펫 질병 이력</th>
									<th class="tabel1">신청 일자</th>
									<th class="tabel1">상태</th>
								</tr>
								
<c:choose>
	<c:when test="${terminationListSize == 0}">
		<td class="tdh" colspan="6">신청 반려된 내역이 없습니다.</td>	
	</c:when>
	<c:otherwise>
								<c:forEach items="${terminationList}" var="list1">
									<tr>
										<td class="tdh">${list1.mem_name}</td>									
										<td class="tdh">${list1.myp_name}</td>									
										<td class="tdh">${list1.insp_kind}</td>									
										<td class="tdh">${list1.myp_sick}</td>	
										<td class="tdh"><fmt:formatDate value='${list1.ins_start}' pattern='yyyy년 MM월 dd일'></fmt:formatDate>	</td>									
										<td class="tdh">${list1.ins_stat}</td>									
									</tr>
								</c:forEach>
								
	</c:otherwise>
</c:choose>
							</table>
						</div>
					
				</div>
				
				
				
				<div id="productManagement1">
					<div id="productManagement1_1">보험 가입자 관리</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">블랙리스트로 등록되어 있는 대상자는 미납금액이 있는 대상자입니다.</div>
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">관리자께서 보험해지하기 버튼을 클릭할시 보험해지가 가능합니다. 보험해지를 클릭할시에는 해지된 보험상품  신청건이 모두 반려처리 됩니다.</div>
					</div>
				</div>
				
					<div id="productManagement">
						<div id="productList">
							<table id="example-table-1">
								<tr>
									<th class="tabel1">선택</th>
									<th class="tabel1">보험 가입자</th>
									<th class="tabel1">펫이름</th>
									<th class="tabel1">보험이름</th>
									<th class="tabel1">펫 질병 이력</th>
									<th class="tabel1">상태</th>
									<th class="tabel1">보험 가입 일자</th>
									<th class="tabel1">보험 만료 일자</th>
								</tr>
								
<c:choose>
	<c:when test="${completeListSize == 0}">
		<td class="tdh" colspan="6">회원께서 가입한 내역이 없습니다.</td>	
	</c:when>
	<c:otherwise>
								<c:forEach items="${completeList}" var="clist">
									<tr>
										<td class="tdh"><input class="check1" type="radio" name="check1" value="${clist.ins_id}" data-mem_id="${clist.mem_id}" data-act_id="${clist.act_id}" data-inssp_id="${clist.inssp_id}" data-myp_id="${clist.myp_id}"></td>									
									<c:choose>
										<c:when test="${clist.mem_black == 1}">
											<td class="tdh">${clist.mem_name}</td>	
										</c:when>
										<c:otherwise>
											<td class="tdh1">${clist.mem_name}(블랙리스트)</td>	
										</c:otherwise>
									</c:choose>									
										<td class="tdh">${clist.myp_name}</td>									
										<td class="tdh">${clist.insp_kind}</td>									
										<td class="tdh">${clist.myp_sick}</td>									
										<td class="tdh">${clist.ins_stat}</td>									
										<td class="tdh"><fmt:formatDate value='${clist.ins_start}' pattern='yyyy년 MM월 dd일'></fmt:formatDate>	</td>
										<td class="tdh"><fmt:formatDate value='${clist.ins_end}' pattern='yyyy년 MM월 dd일'></fmt:formatDate>	</td>																																				
									</tr>
								</c:forEach>
								
	</c:otherwise>
</c:choose>
							</table>
						</div>
						
					
						
						<div id="prodSelectBtn">
							<div id="applySelectBtn1">
								<div class="prodSelectBtn1_1" id="prodSelectBtn1_2">
									<input class="prodSelectBtn1_1" id="prodSelectBtn1_1_1" type="button" value="보험 해지하기">
								</div>
								<div class="prodSelectBtn1_1">
									<input class="prodSelectBtn1_1" id="prodSelectBtn1_1_2" type="button" value="보험 확인하기">
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