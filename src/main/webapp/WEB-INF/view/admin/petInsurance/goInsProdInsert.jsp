<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goInsProdInsert.jsp(보험상품 추가하는 화면)</title>
<style type="text/css">
#nextBtn{
	margin-top:25px;
	margin-bottom:30px;
	width: 1200px;
	height: 50px;
}

#nextBtn11{
	width: 200px;
	height: 50px;
	margin-left: 205px; 
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
	
	// 상품을 추가할떄 이미 등록되어 있는 보험상품일 경우를 체크하는부분
	var prodNameSameList = '${prodNameSameList}';
	if(prodNameSameList != ""){
		alert("이미 보험상품에 등록되어 있는 상품입니다.");
		return;
	}
	
	// 강아지인지 고양이인지 선택하는부분
	var petKindSelect = $("#petKindSelect").val();
		
	// 펫종류 체크박스 선택할시에 값을 담아주기
	$(".petKind").click(function(){
		petKindSelect = $(this).val();
		$("#petKindSelect").val(petKindSelect);
	});
	
	// 질병이력여부 선택하는 부분 
	var petSickSelect = $("#petSickSelect").val();
	
	$(".petSick").click(function(){
		petSickSelect = $(this).val();
		$("#petSickSelect").val(petSickSelect);
	});

	//보험 추가하기 버튼을 클릭하였을때 입력되지 않은 값이 있을때 메세지 나오도록 설정 
	$("#nextBtn2").click(function(){
		
		// 펫 종류를 선택하였는지 확인
		if(petKindSelect == ""){
			alert("펫 상품 종류를 선택하시기 바랍니다.");
			return;
		}
		
		// 보험상품 이름이 입력되어 있는지 확인
		var prodName = $("#prodTitle").val();
		// 문자로 입력하였는지 확인
		var pattern = /([^가-힣\x20])/i; 
		var fld = prodName; 
		if (pattern.test(fld)) { 
		    alert("한글이 아닙니다. (자음, 모음만 있는 한글은 처리하지 않습니다.)");
		    return;
		}else if(prodName == ""){
			alert("펫 상품 이름을 입력하시기 바랍니다.");
			return;
		} 
		
		// 월보험료가 입력되어 있는지 확인
		var prodFee = $("#prodFee").val();
		// 숫자만 입력하였는지 확인
		var regexp = /^[0-9]*$/
			v = prodFee;
			if( !regexp.test(v) ) {
				alert("월보험료 입력칸은 숫자만 입력하세요");
				return;
			}else if(prodFee == ""){
				alert("보험상품의 월보험료를 입력하시기 바랍니다.");
				return;
			}
		
		// 최대보험금 입력되어 있는지 확인
		var insp_maxins = $("#insp_maxins").val();
		// 숫자만 입력하였는지 확인
		var regexp = /^[0-9]*$/
			v = insp_maxins;
			if( !regexp.test(v) ) {
				alert("최대보험금 입력칸은 숫자만 입력하세요");
				return;
			}else if(insp_maxins == ""){
				alert("보험상품의 최대보험금을 입력하시기 바랍니다.");
				return;
			}
		
		// 가입연령 : 최소 나이입력되어 있는지 확인
		var joinMinins = $("#joinMinins").val();
		// 숫자만 입력하였는지 확인
		var regexp = /^[0-9]*$/
			v = joinMinins;
			if( !regexp.test(v) ) {
				alert("가입연령 입력칸은 숫자만 입력하세요");
				return;
			}else if(joinMinins == ""){
				alert("보험상품의 가입연령을 입력하시기 바랍니다.");
				return;
			}
		
		// 가입연령 : 최소 나이입력되어 있는지 확인
		var joinMaxins = $("#joinMaxins").val();
		// 숫자만 입력하였는지 확인
		var regexp = /^[0-9]*$/
			v = joinMaxins;
			if( !regexp.test(v) ) {
				alert("가입연령 입력칸은 숫자만 입력하세요");
				return;
			}else if(joinMaxins == "" ){
				alert("보험상품의 가입연령을 입력하시기 바랍니다.");
				return;
			}
		
		// 보장기간 입력되어 있는지 확인
		var guaranteePeriod = $("#guaranteePeriod").val();
		// 숫자만 입력하였는지 확인
		var regexp = /^[0-9]*$/
			v = guaranteePeriod;
			if( !regexp.test(v) ) {
				alert("보장기간 입력칸은 숫자만 입력하세요");
				return;
			}else if(guaranteePeriod == ""){
				alert("보험상품의 보장기간을 입력하시기 바랍니다.");
				return;
			}
		
		if(petSickSelect == ""){
			alert("보험상품의 질병여부를 입력하시기 바랍니다.");
			return;
		}else {
			// 폼으로 전송
			$("#frm").submit();
		}
		
	});
	
});
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
					보험 상품 추가하기
				</div>
			</div>
			
<form action="/isr/goInsProdInsert2" id="frm" method="post">

				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">이미 등록된 상품은 추가하실수 없습니다.(가입만료된 상품도 보험상품 이름이 같다면 추가하실수 없습니다.)</div>
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
								<input type="hidden" name="petKindSelect" id="petKindSelect">
								<input  type="radio" class="wr1_2_2  petKind" name="petKind" value="강아지" id="dog" /> 강아지
								<input type="radio" class="wr1_2_2 petKind" name="petKind" value="고양이" id="cat" /> 고양이
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
								<input type="text" name ="prodTitle" id="prodTitle" >
							</div>
						</div>
					<div id="moneySelcet">
						<div id="insurer1">
							<div class="petSelect2">
								월보험료
							</div>
							<div class="petSelect3">
								<input type="text" name ="prodFee" id="prodFee" > &nbsp;원
							</div>
							<div class="petSelect2">
								최대보험금
							</div>
							<div class="insurer2_3">
								<input type="text" name ="insp_maxins" id="insp_maxins" > &nbsp;원
							</div>
							
						</div>
					</div>
						<div class="accident2">
							<div class="petSelect2">
								가입연령
							</div>
							<div class="petSelect2_2">
								<input type="text" name ="joinMinins" id="joinMinins" > &nbsp;세<div id="insp_maxins2"> ~ </div>
								<input type="text" name ="joinMaxins" id="joinMaxins" >
							</div>
						</div>
						
						<div class="accident2">
							<div class="petSelect2">
								보장기간
							</div>
							<div class="petSelect3">
								<div id="guaranteePeriod0">가입일로 부터 &nbsp; ~ &nbsp;</div>
								<input type="text" name ="guaranteePeriod" id="guaranteePeriod">년
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

			<div id="nextBtn">
				<div id="nextBtn11">
					<input type="button" id="nextBtn2" value="보험상품 추가하기">
				</div>
				<div id="nextBtn1_1">
					<input type="button" id="nextBtn2_1" value="취소하기" onclick="goBack()">
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