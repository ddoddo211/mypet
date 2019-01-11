<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insuranceClaim2.jsp(인터넷보험청구화면2)</title>

<style type="text/css">

#claimDay{
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 18px;
	width: 210px;
	text-align: center;
	outline: none;
	height: 30px;
    border-radius: 5px;
    line-height: 30px;
    margin-left: 10px;
}
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	// 달력 옵션 설정
	$("#claimDay").datepicker({ // 달력에 옵션 설정하기
		dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ], // 요일에 표시되는 형식 설정
		dateFormat : "yy-mm-dd", //날짜 형식 설정
		monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
		"8월", "9월", "10월", "11월", "12월" ], //월표시 형식 설정
		showAnim : "fold", //애니메이션효과
		maxDate : "0D"
	});

	// 첨부파일 미리 보여 주는 텍스트 떄문에 입력
	$('#upload_text').val('');
	$('#upload_text2').val('');
	
	$('#input_file').change(function() {
		var i = $(this).val();
		$('#upload_text').val(i);
	});
	
	$('#input_file2').change(function() {
		var i = $(this).val();
		$('#upload_text2').val(i);
	});
	
	
	// 진단서사진을 입력할때 jpg 파일만 넣게 설정하기
	var sel_file;
	$("#input_file").on("change" , handleImgFileSelect);
	
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				$("#upload_text").val("");
				alert("확장자는 jpg확장자만 가능합니다.");
				return;
			}else {
				// 첨부파일 미리 보여 주는 텍스트 떄문에 입력
				$('#upload_text').val('');
			}	
		});
	}
	
	// 사고사진을 입력할때 jpg 파일만 넣게 설정하기
	var sel_file;
	$("#input_file2").on("change" , handleImgFileSelect);
	
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 jpg확장자만 가능합니다.");
				$("#input_file2").val("");
				return;
			}			
		});
	}

					
	// 보험가입 상품 select를 클릭하였을때 값을 담아 주는 부분 
	$(".optionProd").click(function(){
		var selectProd = $(this).val();
		$("#selectProd").val(selectProd);
	});
	
	// 보험금 입금계좌 클릭하였을때 값을 담아주는 부분
	$(".memAccidentSelect").click(function(){
		var selectAccident = $(this).val();
		$("#selectAccident").val(selectAccident);
	});

	// 보험금 청구 하기 버튼을 클릭할시 
		$("#nextBtn2").click(function(){

			var selectProd = $("#selectProd").val();
			var accidentDate = $("#claimDay").val();
			var accidentPlace = $("#accidentInput").val();
			var accidentContent = $("#accidentInput2").val();
			var selectAccident = $("#selectAccident").val();
			var diagnosis = $("#upload_text").val();
			var accidentPhoto = $("#upload_text2").val();
			
			// 계좌번호
			var account = $("#account").val();
			// 숫자와 특수문자만 입력하였는지 확인
			var regexp = /[0-9;\-]/;
				v = account;
				if( !regexp.test(v) ) {
					alert("계좌번호는 숫자 , 특수문자(-)로  입력하세요");
					return;
				}
			
		
			// 보험가입 상품을 선택하였는지 확인하기 
			if(selectProd == 0 || selectProd == "" ){
				alert("보험금을 청구할 보험가입 상품을 선택하시기 바랍니다");
				return;
			}else if(accidentDate == ""){
				alert("사고 일자를 선택하시기 바랍니다.");
				return;
			}else if(accidentPlace == ""){
				alert("사고 장소를 선택하시기 바랍니다.");
				return;
			}else if(accidentContent == ""){
				alert("사고 내용을 입력하시기 바랍니다.");
				return;
			}else if(selectAccident == 0){
				alert("회원의 보험금 입금 은행을 선택하시기 바랍니다");
				return;
			}else if(account == ""){
				alert("회원의 보험금 입금 계좌 번호를 입력하시기 바랍니다");
				return;
			}else if(diagnosis == ""){
				alert("진단서는 필수 입니다. 첨부하시기 바랍니다.");
				return;
			}else if (!$("input[name='req']:checked").val()) {
				alert("개인정보 처리 동의 부분에 체크가 되어야 진행하실수 있습니다.\n체크하시기 바랍니다");
				return;
			}else{
				// 사고 일자 form에 담아주기 
				$("#accidentDate").val(accidentDate);
				// 사고 장소 form에 담아주기
				$("#accidentPlace").val(accidentPlace);
				// 사고 내용 form에 담아주기
				$("#accidentContent").val(accidentContent);
				// 진단서 form에 담아주기
				$("#diagnosis").val(diagnosis);
				// 진단서 form에 담아주기
				$("#accidentPhoto").val(accidentPhoto);

				
				// 계좌번호 form에 담아주기
				$("#account2").val(account);
				
				
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
		
	<div id="claimMain">
			<div id="claimTitle">
				<div id="claimTitle1">
					인터넷 보험 청구
				</div>
			</div>
				<div id="claimTitle2">
					<img id="claimTitle2_1" alt="이미지가 없습니다." src="/img/petInsurance/claim.jpg" width="850px">
				</div>
				
				<div id="claimPetInfo">
					보험금 신청 진행하는 펫 : ${mypetInfo.myp_name}&nbsp;&nbsp;/&nbsp;&nbsp;<fmt:formatDate value="${mypetInfo.myp_birth}" pattern="yy년 MM월 dd일"></fmt:formatDate>&nbsp;&nbsp;/&nbsp;&nbsp;${mypetInfo.petk_name}&nbsp;&nbsp;/&nbsp;&nbsp;${mypetInfo.myp_gender}&nbsp;&nbsp;/&nbsp;&nbsp;${mypetInfo.myp_sick}
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1">
						<div class="claimTitle4_2">Step2. "${mypetInfo.myp_name}"에게 가입되어 있는 보험상품</div>
					</div>
				</div>
				
				<div id="claimTitle5">
					<div id="claimTitle5_1">
						<div class="claimTitle5_1_1">
							보험가입상품
						</div>
						<div class="claimTitle5_1_2">
							<select class="optionProd">
								<option selected="selected" value="0">보험금 신청할 상품을 선택해주세요.</option>
								<c:forEach items="${isrVoList}" var="isrVo">
									<option value="${isrVo.ins_id}">${isrVo.insp_kind}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1">
						<div class="claimTitle4_2">Step3. 사고 정보 입력</div>
					</div>
				</div>
				
				<div id="accident">
					<div id="accident1">
						<div class="accident2">
							<div class="accident2_1">
								사고 일자
							</div>
							<div class="accident2_2">
								<input type="text" name ="claimDay" id="claimDay" readonly="readonly">
							</div>
						</div>
						<div class="accident2">
							<div class="accident2_1">
								사고 장소
							</div>
							<div class="accident2_2_1">
								<input type="text" id="accidentInput">
							</div>
						</div>
						<div class="accident2">
							<div class="accident2_1">
								사고 내용
							</div>
							<div class="accident2_2_1_1">
								<textarea  id="accidentInput2" ></textarea>
							</div>
						</div>
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1">
						<div class="claimTitle4_2">Step4. 보험자의 정보 확인</div>
					</div>
				</div>
				
				<div id="insurer">
					<div id="insurer1">
						<div class="insurer2">
							이메일
						</div>
						<div class="insurer2_1">
							<label class="insurer2_4" >${memVo.mem_id }</label>
						</div>
						<div class="insurer2_2">
							연락처
						</div>
						<div class="insurer2_3">
							<label class="insurer2_4">${memVo.mem_hp }</label>
						</div>
						
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1">
						<div class="claimTitle4_2">Step5. 보험금 입금계좌 선택</div>
					</div>
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1_2">
						<div class="claimTitle4_2">보험금 입금계좌 입력시에는 올바르게 입력하시기 바랍니다. 올바르지 않을 경우에는 입금이 안될수 있습니다.(-입력)</div>
					</div>
				</div>
				
				<div id="deposit">
						<div id ="accountInfo">
							<div id="accountInfo1">
								<div id="accountInfo2">
									보험금 입금계좌 
								</div>
								<div id="accountInfo3">
									<select class="memAccidentSelect" name="accountSelect" >
										<option selected value="0">은행를 선택하시기 바랍니다.</option>
											<option value="농협">농협</option>
											<option value="국민">국민</option>
											<option value="우리">우리</option>
											<option value="하나">하나</option>
									</select>
								</div>
								<div >
									<input id="account" name="account" type="text" >
								</div>
								
							</div>
						</div>	
	
				</div>
				
				<div class="claimTitle4">
					<div class="claimTitle4_1">
						<div class="claimTitle4_2">Step6. 필요서류 입력</div>
					</div>
				</div>
				
				<form action="/isr/claimApply" method="post" id="frm" enctype="multipart/form-data">

					<input type="hidden" id="selectProd"  name="selectProd" value="">
					<input type="hidden" id="petId" name="petId" value="${mypetInfo.myp_id}">
					<input type="hidden" id="accidentDate" name="accidentDate" value="">
					<input type="hidden" id="accidentPlace"  name="accidentPlace" value="">
					<input type="hidden" id="accidentContent" name="accidentContent"  value="">
					<input type="hidden" id="selectAccident" name="selectAccident" value="">
					<input type="hidden" id="account2" name="account2" value="">
				<div id="document">
					<div id="document1">
						<div id="document2">
							<div class="document2_1">
								진단서(필수)
							</div>
							<div class="document2_2">
								<input type="text" id="upload_text" readonly="readonly">
								<!--button-->
								<div id="upload-btn_wrap">
								  <button type="button" title="파일찾기">
								   <span>파일찾기</span>  
								  </button>
								  <input type="file" id="input_file" title="파일찾기" name="diagnosis">
								</div>
							</div>
						
						</div>
						<div id="document3">
							<div class="document2_1">
								사고사진
							</div>
							<div class="document2_2">
								<input type="text" id="upload_text2" readonly="readonly" >
								<!--button-->
								<div id="upload-btn_wrap2">
								  <button type="button" title="파일찾기">
								   <span>파일찾기</span>  
								  </button>
								  <input type="file" id="input_file2" title="파일찾기" name="accidentPhoto">
								</div>
							</div>						
						</div>
					</div>
				</div>
				
				
				<div class="claimTitle4">
					<div class="claimTitle4_1">
						<div class="claimTitle4_2">Step7. 보험금 지급을 위한 개인정보 처리 동의 입력</div>
					</div>
				</div>
				
				<div id="agree">
				<textarea rows="20" cols="167" id="agreeWrite">
개인정보 수집 안내
○ 개인정보의 수집․이용 목적
․채용 절차의 진행 및 관리, 경력·자격 등 확인(조회 및 검증), 채용 여부의 결정 
․민원처리, 분쟁해결, 법령상 의무이행

○ 수집 항목 
․성명, 성별, 연령, 국적, 현주소, 연락처, 전자우편, 생년월일, 보훈대상여부, 장애우 대상여부, 병역, 학력, 성적, 경력사항, 자격․면허 및 포상 내역, 어학, 단체가입 및 활동사항
   ※ 주민등록번호 등 고유식별번호는 수집하지 않습니다.

○ 개인정보의 보유 및 이용기간
․위 정보는 수집ㆍ이용에 관한 동의일로부터 5년 동안 위 이용목적을 위하여 보유ㆍ이용됩니다.
․다만, 채용에 탈락한 경우에는 민원처리, 분쟁 해결, 법령상 의무이행을 위하여 필요한 범위 내에서만 보유·이용됩니다.
   ※ 5년 이내라도 응시자 본인의 삭제의사가 있을 경우, 지원서 삭제를 통해 모든 개인정보가 파기됩니다. 

○ 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
․위 정보의 수집·이용에 관한 동의는 채용 심사를 위하여 필수적이므로, 위 사항에 동의하셔야만 지원이 가능합니다. 
․위 정보의 수집·이용에 관한 동의는 거부하실 수 있으며, 다만 동의하지 않으시는 경우 채용심사상의 불이익을 받으실 수 있습니다.
   </textarea> <br> 
   			<input type="checkbox" name="req" id="agreeCheck"> 개인정보 수집 및 이용에동의합니다.
			</div>

		
			
			<div id="nextBtn">
				<div id="nextBtn1">
					<input type="button" id="nextBtn2" value="보험금 청구하기">
				</div>
			</div>
			
			
			</form>
			
			
	</div>

</div>
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>