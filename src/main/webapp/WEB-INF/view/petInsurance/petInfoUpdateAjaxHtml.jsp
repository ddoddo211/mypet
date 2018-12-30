<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	// 달력 옵션 설정
	$("#petBirthSelect").datepicker({ // 달력에 옵션 설정하기
		dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ], // 요일에 표시되는 형식 설정
		dateFormat : "yy-mm-dd", //날짜 형식 설정
		monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
		"8월", "9월", "10월", "11월", "12월" ], //월표시 형식 설정
		showAnim : "fold", //애니메이션효과
		maxDate : "0D"
	});
		
	// 펫 사진을 선택했을때 미리 보이게 설정하는 부분 
	var sel_file;
	
	$("#input_filePet").on("change" , handleImgFileSelect);
	
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				$("#input_filePet").val("");
				$(".mypetPage4_2_2_1").attr("src","/img/petimg/noimg.jpg");
				return;
			}			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$(".mypetPage4_2_2_1").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
			
		});
	}
	
	// 성별을 담아서 보내주는 부분
	var petGender = '${petGender}';
	if(petGender == '남'){
		$("#manG2").attr('checked', true);
	}else{
		$("#womenG2").attr('checked', true);
	}
	
	// 질병 여부를 담아서 보내주는 부분
	var petSick = '${petSick}';
	if(petSick == 'Y'){
		$("#petSickY1").attr('checked',true);
	}else{
		$("#petSickN2").attr('checked',true);
	}
	
	// 중성화 여부 담아서 보내주는 부분
	var petNeu = '${petNeu}';
	if(petNeu == 'Y'){
		$("#neuYnChk").attr('checked',true);
	}
	
	// 성별 부분을 원래 선택되어 있는 값이 아닌 다른 부분으로 클릭하여 선택하였다면 담아주기 
		$(".wr1_2_2").click(function(){
			var petGender = $(this).val();
			$("#petGender").val(petGender);
		});	
		
	// 질병여부 부분을 원래 선택되어 있는 값이 아닌 다른 부분으로 클릭하여 선택하였다면 담아주기 	
		$(".wr1_2_2_1").click(function(){
			var petSick = $(this).val();
			$("#petSick").val(petSick);
		});
	
	// 중성화 부분을 원래 선택되어 있는 값이 아닌 다른 부분으로 클릭하여 선택하였다면 담아주기
		var petNeutralization = null;
		// 중성화 부분이 체크 되지 않았을때는 N으로 넘겨진다. 체크되었다면 Y로 담긴다.
		if ($("input[id='neuYnChk']:checked").val()== 'Y') {
			petNeutralization = $("input[id='neuYnChk']:checked").val();
			$("#petNeu").val(petNeutralization);
		}else{
			petNeutralization = "N";
			$("#petNeu").val(petNeutralization);
		}
		
		$("#petBirthSelect").click(function(){
			var petBirth = $("#petBirthSelect").val();
			$("#petBirth").val(petBirth);
		});
				
</script>

<!-- form에 input에 name을 담아서 submit으로 보내기 -->
<form id="frm" action="/isr/mypetInfoUpdateS" method="post">
<input type="hidden" name="petId" value="${mypetInfo.myp_id}">		
<input type="hidden" id="petBirth" name="petBirth" value="${mypetInfo.myp_id}">		

						<div class="mypetPageBtn">
							<div id="mypetPageBtn">
							
								<div id="mypetPageBtn1">
									<input class="mypetPageBtn1_1" type="submit" value="수정 완료 하기">
								</div>
								
								<div id="mypetPageBtn2">
									<input class="mypetPageBtn1_1" type="button" value="취소" id="updateCancle" onclick="getPetInfoHtml(${mypetInfo.myp_id})">
								</div>
							</div>
						</div>
				
						<div id="mypetPage4">
							<div id="mypetPage4_1">
								<div id="mypetPage4_2">
									<div id="mypetPage4_2_1">
											<!--button-->
											<div id="upload-btnPet_wrap">
											  <button type="button" title="사진변경">
											   <span>사진변경</span>  
											  </button>
											  <input type="file" id="input_filePet" title="사진변경" name="diagnosis">
											</div>
									</div>
				
									<div class="mypetPage4_2_2">
										<img class="mypetPage4_2_2_1" alt="이미지가 없습니다" src="${mypetInfo.myp_img}">
									</div>
								</div>
								<div id="mypetPage4_3">
									<div class="mypetPage4_3_1">
										<div class="mypetPage4_3_2">
											이름
										</div>
										<div class="mypetPage4_3_2_1">
											<input id="petUpdateName" type="text" value="${mypetInfo.myp_name }" name="petName">
										</div>
										<div class="mypetPage4_3_2_2">
											생년월일
										</div>
										<div class="mypetPage4_3_2_3">
											<input type="text" name ="petBirthSelect" value="" id="petBirthSelect" readonly="readonly" placeholder="<fmt:formatDate value='${petBirth}' pattern='yyyy년 MM월 dd일'></fmt:formatDate>">
										</div>
									</div>
									<div class="mypetPage4_3_1">
										<div class="mypetPage4_3_2">
											품종(수정불가)
										</div>
										<div class="mypetPage4_3_2_1">
											${mypetInfo.petk_name }(${mypetInfo.petk_size })
										</div>
										<div class="mypetPage4_3_2_2">
											성별
										</div>
										<div class="mypetPage4_3_2_3">
											<input type="hidden" value="" id="petGender" name="petGender">
											<input  type="radio" class="wr1_2_2" name="gender" value="여" id="womenG2" /> 여
											<input type="radio" class="wr1_2_2" name="gender" value="남" id="manG2" /> 남
										</div>
									</div>
									<div class="mypetPage4_3_1">
										<div class="mypetPage4_3_2">
											질병여부
										</div>
										<div class="mypetPage4_3_2_1">
											<input type="hidden" value="" id="petSick" name="petSick">
											<input class="wr1_2_2_1" name="petSick" type="radio" value="Y" id="petSickY1"/> Y 
											<input class="wr1_2_2_1" name="petSick" type="radio" value="N" id="petSickN2"/> N
										</div>
										<div class="mypetPage4_3_2_2">
											중성화 여부
										</div>
										<div class="mypetPage4_3_2_3">
											<input type="hidden" value="" id="petNeu" name="petNeu">
											<input type="checkbox" value="Y" id="neuYnChk"> Y
											<label id="neuYn">(*중성화 수술을 했을경우 체크)</label>
										</div>
									</div>
								</div>
							</div>
						</div>
</form>