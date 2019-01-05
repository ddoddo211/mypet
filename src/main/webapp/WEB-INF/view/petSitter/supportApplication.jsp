<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	$("#nextBtn").click(function(){
		var mem_name = $("#mem_name").val();
		var mem_tel = $("#mem_tel").val();
		var mem_birth = $("#mem_birth").val();
		var mem_addr = $("#mem_addr").val();
		var radioVal = $('input[name="chk_job"]:checked').val();
		
		
		if(mem_name == null || mem_name == ''){
			alert("지원자 성명 및 성별을 입력하세요.");
			return;
		} else if(mem_tel == null || mem_tel == ''){
			alert("연락처를 입력하세요.");
			return;
		} else if(mem_birth == null || mem_birth == ''){
			alert("생년월일을 입력하세요.");
			return;
		} else if(mem_addr == null || mem_addr == ''){
			alert("거주지역을 입력하세요.");
			return;
		} else if(radioVal == null || radioVal == ''){
			alert("직업을 선택하세요.");
			return;
		} else{
			mem_name = "- "+mem_name;
			mem_tel = "- "+mem_tel;
			mem_birth = "- "+mem_birth;
			mem_addr = "- "+mem_addr;
			radioVal = "- "+radioVal;
			
			$("#memName").val(mem_name);
			$("#memTel").val(mem_tel);
			$("#memBirth").val(mem_birth);
			$("#memAddr").val(mem_addr);
			
			if(radioVal == '기타'){
				var mem_job = $("#mem_job").val();
				mem_job = "- "+mem_job;
				$("#memJob").val(mem_job);
			} else{
				$("#memJob").val(radioVal);
			}
			
			nextBtn();
		}
		
	});
});
function nextBtn(){
	$.ajax({
		type : "POST",
		url  : "/sit/supportApplicationAjaxHtml2",
		success : function(dt){
			$("#supportApplication").html(dt);
		}
	});
}
</script>
<div class="supportMenuMain">
	<div class="supportMenu">
		<span>지원 자격 및 조건</span>
	</div>
	<div class="supportMenuSb"></div>
</div>
<div class="supportWord">
	<div class="sWord">
		- 강아지를 키워본 경험이 있거나 키우고 계신 분 <br> - 거주환경 사진 제공 가능하신 분 <br> -
		돌봄 전 사전만남 진행 가능하신 분 <br> - 하루 5번씩 사진, 영상 공유 가능하신 분 <br> - 하루
		1번 돌봄일지 작성 가능하신 분 <br>
	</div>
</div>
<div class="supportMenuMain">
	<div class="supportMenu">
		<span>교육비 결제 및 안내</span>
	</div>
	<div class="supportMenuSb"></div>
</div>
<div class="supportWord">
	<div class="sWord">
		- 교육비 : 55,000원(VAT 포함) <br> - 지원서 작성 후 합격자에 한해 교육비 결제에 대해
		안내드립니다. <br> - 개인 사정으로 인한 취소, 환불, 일방적인 교육일정 변경은 불가합니다. <br>
		- 지원서 작성 -> 합격 후 교육비 결재 -> 온라인 및 오프라인 교육 -> 테스트 통과 -> 계약서 작성 -> 펫시터 최종등록
	</div>
</div>
<div class="supportMenuMain">
	<div class="supportMenu">
		<span>*회원가입은 하셨나요?</span>
	</div>
	<div class="supportMenuSb"></div>
</div>
<div class="supportWord">
	<div class="sWord">
		<div style="height: 30px;">
			<span style="font-weight: bold;">- 지원서를 작성하기전에 회원가입을 꼭!! 해주시기
				바랍니다.</span>
		</div>
		<div style="height: 40px; margin-top: 10px;">
			<a href="/mem/memJoin" id="memberJoin">회원가입 하러가기</a>
		</div>
	</div>
</div>

<div class="supportMenuMain">
	<div class="supportMenu">
		<span>*질의 응답</span>
	</div>
	<div class="supportMenuSb"></div>
</div>
<div class="supportWord">
	<div class="sWord">
		<div class="QnA">
			<span>지원자 성명 / 성별</span>
		</div>

		<div class="page">
			<div class="page__demo">
				<label class="field a-field a-field_a1 page__field"> 
				<input class="field__input a-field__input" id="mem_name" placeholder="홍길동/남" required>
					<span class="a-field__label-wrap"> <span
						class="a-field__label">답변</span>
				</span>
				</label>
			</div>
		</div>
	</div>
</div>
<div class="supportWord">
	<div class="sWord">
		<div class="QnA">
			<span>연락처를 알려주세요.</span>
		</div>

		<div class="page">
			<div class="page__demo">
				<label class="field a-field a-field_a1 page__field"> <input
					class="field__input a-field__input" id="mem_tel" placeholder="0111112222"
					required> <span class="a-field__label-wrap"> <span
						class="a-field__label">답변</span>
				</span>
				</label>
			</div>
		</div>
	</div>
</div>
<div class="supportWord">
	<div class="sWord">
		<div class="QnA">
			<span>생년월일을 알려주세요.</span>
		</div>

		<div class="page">
			<div class="page__demo">
				<label class="field a-field a-field_a1 page__field"> <input
					class="field__input a-field__input" id="mem_birth" placeholder="812345" required>
					<span class="a-field__label-wrap"> <span
						class="a-field__label">답변</span>
				</span>
				</label>
			</div>
		</div>
	</div>
</div>
<div class="supportWord">
	<div class="sWord">
		<div class="QnA">
			<span>지원자의 거주 지역을 알려주세요.(동까지만 입력해주세요.)</span>
		</div>

		<div class="page">
			<div class="page__demo">
				<label class="field a-field a-field_a1 page__field"> <input
					class="field__input a-field__input" id="mem_addr" placeholder="서울특별시 강남구 역삼동"
					required> <span class="a-field__label-wrap"> <span
						class="a-field__label">답변</span>
				</span>
				</label>
			</div>
		</div>
	</div>
</div>
<div class="supportWord">
	<div class="sWord">
		<div class="QnA">
			<span>지원자의 직업을 선택해 주세요.</span>
		</div>
		<div style="font-size: 20px;">
			<div class="QnADiv">
				<input type="radio" class="chk_job" name="chk_job" value="직장인" /> <span>직장인</span>
			</div>                         
			<div class="QnADiv">           
				<input type="radio" class="chk_job" name="chk_job" value="주부" /> <span>주부</span>
			</div>                         
			<div class="QnADiv">           
				<input type="radio" class="chk_job" name="chk_job" value="프리랜서" /> <span>프리랜서</span>
			</div>                         
			<div class="QnADiv">           
				<input type="radio" class="chk_job" name="chk_job" value="무직" /> <span>무직</span>
			</div>                         
			<div class="QnADiv">           
				<input type="radio" class="" name="chk_job" value="기타" /> <span>기타<label
					class="field a-field a-field_a1 page__field" style="padding: 0;"><input
						class="field__input a-field__input" id="mem_job" placeholder="학생" required></label></span>
			</div>
		</div>
	</div>
</div>
<div style="margin: 0 auto; height: 60px;">
	<div style="width: 300px; margin: 0 auto; text-align: center;">
		<input type="button" id="nextBtn"onclick="nextBtn()" value="다음" />
	</div>
</div>