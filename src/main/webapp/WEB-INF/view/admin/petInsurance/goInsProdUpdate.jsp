<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goInsProdInsert.jsp(보험상품 내용 수정하는 화면)</title>
<style type="text/css">

#nextBtn11{
	margin-top:25px;
	margin-bottom:30px;
	width: 1200px;
	height: 50px;
}

#nextBtn12{
	width: 200px;
	height: 50px;
	margin-left: 215px;
	float: left;
}

#nextBtn2{
	background-color: black;
    color: white;
    width: 200px;
    height: 50px;
    font-family: 'Jeju Gothic', sans-serif;
    font-size: 18px;
    border-radius: 50px;
    outline: none;
}
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	// 수정이 완료되었을때 나오는 부분
	var updateS = '${updateS}';
	if(updateS == 1){
		alert("수정이 완료되었습니다.");
	}
	
	// 해당 보험상품의 질병여부 현재 입력되어 있는 상태 받기
	var prodSick = '${prodSick}';
	if(prodSick == 'Y'){
		$("#sickY").attr('checked', true);
	}else{
		$("#sickN").attr('checked', true);
	}
	
	// 질병여부 input에 값 담아주기
	$("#petSickSelect").val(prodSick);
	// 만약 질병여부 값을 변경하였을 경우 값 변경해주기
	$(".petSick").click(function(){
		prodSick = $(this).val();
		$("#petSickSelect").val(prodSick);
	});	
	
	// 내용수정완료 하기 버튼을 클릭하였을떄 반응하는 부분
	$("#nextBtn2").click(function(){

		// 수정한 내용이 없을 경우 확인하기 
		// 월보험료
		var prodFee = '${prodVo.insp_fees}';
		// 입력한 월보혐료
		var prodFee2 = $("#prodFee").val();
		
		//최대 보험금
		var insp_maxins = '${prodVo.insp_maxins}';
		// 입력한 최대 보험금
		var insp_maxins2 = $("#insp_maxins").val();
		
		//가입연령(최소)
		var insp_minage = '${prodVo.insp_minage}';
		// 입력한 가입연령(최소)
		var insp_minage2 = $("#joinMinins").val();
		
		//가입연령(최대)
		var insp_maxage = '${prodVo.insp_maxage}';
		// 입력한 가입연령(최대)
		var insp_maxage2 = $("#joinMaxins").val();
		
		//보장기간
		var insp_period = '${prodVo.insp_period}';
		// 입력한 보장기간
		var insp_period2 = $("#guaranteePeriod").val();
		
		//질별이력여부
		var insp_sick = '${prodVo.insp_sick}';
		// 선택한 질별이력여부
		var insp_sick2 = $("#petSickSelect").val();
		
		if(prodFee == prodFee2 && insp_maxins == insp_maxins2 && insp_minage == insp_minage2 && 
				insp_maxage == insp_maxage2 && insp_period == insp_period2 && insp_sick == insp_sick2){
			alert("변경된 내용이 없습니다.")
		}else{
			$("#frm").submit();
		}
			
	});
	
});

	// 목록으로 가는 부분
	function goBack(){
		location.href = '/isr/goProdManager';
	}
	
</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<body>
<div id="main">	

	<div id="adminMain">
		<!-- 관리자 메뉴 -->
		<%@include file="../adminHeader.jsp"%>
					
			<!-- 관리자용 펫 보험 메뉴  -->
			<%@include file="insMenuSelect.jsp"%>
		
	
	<div id="claimMain">
			<div id="claimTitle">
				<div id="claimTitle1">
					보험 상품 내용 수정하기
				</div>
			</div>
			
<form action="/isr/goInsProdUpdateS" id="frm" method="post">
<input type="hidden" name="prodId" value="${prodVo.insp_id}">

				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">이미 입력되어 있는 값은 해당 보험상품의 현재 저장되어 있는 입력값입니다. 수정을 원하실때에는 입력칸을 클릭한후 수정하시기 바랍니다.</div>
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1">
						<div class="claimTitle4_2">Step1 . 펫 종류 선택</div>
					</div>
				</div>
				
				<div id="petSelect0">
					<div id="petSelect1">
						<div class="accident2">
							<div class="petSelect2">
								상품 종류 선택
							</div>
							<div class="accident2_2_1">
								<label class="insurer2_4">${prodVo.insp_name }</label>
							</div>
						</div>
					</div>
				</div>

				<div class="claimTitle4">
					<div class="claimTitle4_1">
						<div class="claimTitle4_2">Step2. 보험상품 정보 입력</div>
					</div>
				</div>
				
				<div id="accident">
					<div id="accident1">
						<div class="accident2">
							<div class="petSelect2">
								보험상품 이름
							</div>
							<div class="accident2_2">
								<label class="insurer2_4">${prodVo.insp_kind }</label>
							</div>
						</div>
					<div id="moneySelcet">
						<div id="insurer1">
							<div class="petSelect2">
								월보험료
							</div>
							<div class="petSelect3">
								<input type="text" name ="prodFee" id="prodFee" value="${prodVo.insp_fees}"> &nbsp;원
							</div>
							<div class="petSelect2">
								최대보험금
							</div>
							<div class="insurer2_3">
								<input type="text" name ="insp_maxins" id="insp_maxins" value="${prodVo.insp_maxins }" > &nbsp;원
							</div>
							
						</div>
					</div>
						<div class="accident2">
							<div class="petSelect2">
								가입연령
							</div>
							<div class="petSelect2_2">
								<input type="text" name ="joinMinins" id="joinMinins" value="${prodVo.insp_minage }" > &nbsp;세<div id="insp_maxins2"> ~ </div>
								<input type="text" name ="joinMaxins" id="joinMaxins" value="${prodVo.insp_maxage }" >
							</div>
						</div>
						
						<div class="accident2">
							<div class="petSelect2">
								보장기간
							</div>
							<div class="petSelect3">
								<div id="guaranteePeriod0">가입일로 부터 &nbsp; ~ &nbsp;</div>
								<input type="text" name ="guaranteePeriod" id="guaranteePeriod" value="${prodVo.insp_period }">년
							</div>
						</div>
						<div class="accident2">
							<div class="petSelect2">
								질병이력 여부
							</div>
							<div class="accident2_2_1">
								<input type="hidden" id="petSickSelect" name="petSickSelect">
								<input  type="radio" class="wr1_2_2 petSick" name="petSick" value="Y" id="sickY" /> 예
								<input type="radio" class="wr1_2_2 petSick" name="petSick" value="N" id="sickN" /> 아니요
							</div>
						</div>
						
					</div>
				</div>
</form>

			<div id="nextBtn11">
				<div id="nextBtn12">
					<input type="button" id="nextBtn2" value="내용 수정완료하기">
				</div>
				<div id="nextBtn1_1">
					<input type="button" id="nextBtn2_1" value="목록으로 가기" onclick="goBack()">
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