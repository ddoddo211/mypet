<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petInsert.jsp(펫추가하기)</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
			// 페이지가 처음에 실행될때에는 강아지로 선택이 되어 있게 설정
			$("#petK1").addClass("activePetKind");
			var petKind = $("#petK1").val();
			getPetKindHtml(petKind);
						
					// 강아지, 고양이 선택한 부분 색 유지 해주는 부분
					$(".petK").click(function(){
						//기존 체크되어 있는 체크박스 전체 해제
						$(".petK").removeClass("activePetKind");
						// 원래 체크 되어 있다면 또 다시 클릭한다면 해제하는 부분
						if($(this).hasClass("activePetKind")){
							$(".petK").removeClass("activePetKind");
						}else{
							$(this).addClass("activePetKind");
						}
						var petKind = $(this).val();
						// 클릭하면 그 값이 아작스로 전달하여 처리해주기
						getPetKindHtml(petKind);
						
					});
					
					// 펫의 품종이 나오는 부분
					function getPetKindHtml(petKind) {
						$.ajax({
							url : "/isr/petKindHtml",
							type : "get",
							data : "petKind=" + petKind,
							success : function(dt) {
								$("#petKindAjax").html(dt);
								
								
								// ajax 실행될때 같이 작업되는 부분  - > 애견 추가될떄 값 뽑아 오는 부분
								// 선택한 애견 번호 뽑아오기
									// 품종 값 넘겨주기
								$('select[name=petKindSelect]').change(function() {
									var petKind = $(this).val();
								
									$("#petKindForm").val(petKind);
								});
							}
						});
					}
					
					// 달력 옵션 설정
					$("#wr1_2_3").datepicker({ // 달력에 옵션 설정하기
						dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ], // 요일에 표시되는 형식 설정
						dateFormat : "yy-mm-dd", //날짜 형식 설정
						monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
						"8월", "9월", "10월", "11월", "12월" ], //월표시 형식 설정
						showAnim : "fold", //애니메이션효과
						maxDate : "0D"
					});
					
					// 여자아이 , 남자아이 선택한 부분 색 유지 해주는 부분
					$(".wr1_2_2").click(function(){
						//값을 초기화
						$("#gender").val("");
						
						//기존 체크되어 있는 체크박스 전체 해제
						$(".wr1_2_2").removeClass("activePet");
						
						// 원래 체크 되어 있다면 또 다시 클릭한다면 해제하는 부분
						if($(this).hasClass("activePet")){
							$("#gender").val("");
							$(".wr1_2_2").removeClass("activePet");
						}else{
							$(this).addClass("activePet");
						}
					});
					
					var petSick = null;
					// 질병여부 선택한 부분 색 유지 해주는 부분
					$(".wr1_2_2_1").click(function(){
						
						//값을 초기화
						petSick = $("#petSick").val("");
						petSick = $(this).val();
						
						//기존 체크되어 있는 체크박스 전체 해제
						$(".wr1_2_2_1").removeClass("activePet");
						
						// 원래 체크 되어 있다면 또 다시 클릭한다면 해제하는 부분
						if($(this).hasClass("activePet")){
							$("#petSick").val("");
							$(".wr1_2_2_1").removeClass("activePet");
						}else{
							$(this).addClass("activePet");
						}
						
					});
					
					

					// 펫 등록하기 버튼을 클릭할시에 내용을 입력한후 추가되도록 값을 담아준는 기능 
						// 성별 담아주기
						var petGender = null;
						$(".wr1_2_2").click(function(){
							petGender = $(this).val();
						});					
					
					// 펫추가하는 버튼
					$("#petJoin").click(function(){
						// 이름담기
						var petName = $("#wr1_2_1").val();
						// 중성화 부분 체크하기
						var petNeutralization = null;
						// 중성화 부분이 체크 되지 않았을때는 N으로 넘겨진다. 체크되었다면 Y로 담긴다.
						if ($("input[id='wr3_1']:checked").val()== 'Y') {
							petNeutralization = $("input[id='wr3_1']:checked").val();
						}else{
							petNeutralization = "N";
						}
						
						// 생일 값 넘겨주기
						var petBirth = $("#wr1_2_3").val();
						
						// ajax에 품종 담아줌 
						
						var petImg = null;
						petImg = $("#petPs").val();
						
						var petKind = $("#petKindForm").val();
						
						// 이름 입력안했을시
						if(petName == ""){
							alert("이름을 입력하시기 바랍니다.");
							return;
						}else if(petGender == null){
							alert("성별 부분이 선택되지 않았습니다.");
							return;
						}else if(petBirth == ""){
							alert("생일을 선택해주시기 바랍니다.");
							return;
						}else if(petKind == "0"){
							alert("품종을 선택하시기 바랍니다.");
							return;
						}else if(petSick == null){
							alert("질병여부 부분에 체크 되지 않았습니다.");
							return;
						}
						
						$("#petName").val(petName);
						$("#petGender").val(petGender);
						$("#petBirthForm").val(petBirth);
						$("#petNTL").val(petNeutralization);
						$("#petSick").val(petSick);
						
						$("#frm").submit();
					});
					
					
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

		<div id="petInfoInsert">
			<div id="petInfoForm">
				<div id="petInfoFormTop">
					<div id="petInfoTitle">나의 펫 추가(반려동물에 대한 정보입력)</div>
				</div>
					<div class="wr1">
						<input id="petK1" class="petK" type="button" value="강아지">
						<input class="petK" type="button" value="고양이">
					</div>
				<div id="petInfoWrite" >
						<div class="wr1" id="wr1_1">사랑스런 우리 아이의 이름은<input type="text" id="wr1_2_1" class="ip1"/> 입니다</div>
						<div class="wr1" id="gender0">성별은
							<input  type="button" class="wr1_2_2 ip1" value="여" id="womenG" /> 
							<input type="button" class="wr1_2_2 ip1" value="남" id="manG" /> 입니다
						</div>
						<div class="wr1"><label id="wr3">* 중성화 수술을 했을 경우에는 체크해주세요</label><input id="wr3_1" type="checkbox" value="Y"></div>
						<div class="wr1">생일은
							<input type="text" name ="petBirth" id="wr1_2_3" readonly="readonly"> 입니다
						</div>
						<div class="wr1" id="petKindAjax">
<!-- ajax 처리한곳 -->				
<!-- 품종나오는 부분 -->
					</div>
					<div class="wr1">질병여부							
						<input  type="button" class="wr1_2_2_1 ip1" value="Y" id="petSickY" /> 
						<input type="button" class="wr1_2_2_1 ip1" value="N" id="petSickN" /> 
					</div>
					
					<form action="/isr/mypetInsert" id="frm" method="post" enctype="multipart/form-data">
						<input type="hidden" id="petName" name="petName" value="">
						<input type="hidden" id="petGender" name="petGender" value="">
						<input type="hidden" id="petNTL" name="petNTL" value="">
						<input type="hidden" id="petBirthForm" name="petBirthForm" value="">
						<input type="hidden" id="petKindForm" name="petKindForm" value="0">
						<input type="hidden" id="petSick" name="petSick" value="">
						<div class="wr1">반려동물사진<input type="file" id="petPs" name="petImgForm"> </div>
						<div class="wr1" id="petPrH"><img alt="이미지가 없습니다" src="/insimg/noimg.jpg" id="petPr"> </div>
						<div class="wr2"><input type="button" value="펫 등록 " id="petJoin"> </div>
					</form>
					
				 </div>

			</div>
		</div>


</div>
	
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>