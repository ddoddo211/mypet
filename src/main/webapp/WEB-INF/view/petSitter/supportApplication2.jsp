<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){

	$('html, body').animate({
        scrollTop: parseInt($("#chk_qna1").offset().top)
    }, 400);
	
	$("#okBtn").click(function(){
		var radioVal1 = $('input[name="chk_qna1"]:checked').val();
		var radioVal2 = $('input[name="chk_qna2"]:checked').val();
		var radioVal3 = $('input[name="chk_qna3"]:checked').val();
		var radioVal4 = $('input[name="chk_qna4"]:checked').val();
		var radioVal5 = $('input[name="chk_qna5"]:checked').val();
		
		var mem_id = "${memVo.mem_id}";
		if(mem_id == ''){
			alert("로그인 정보가 없습니다.");
			$("#loginPopup").slideDown("fast");
			$('html, body').animate({
		        scrollTop: parseInt($("#loginPopup").offset().top)
		    }, 400);
			return;
		}
		
		if(radioVal1 == null || radioVal1 == ''){
			alert("값을 선택해주세요.");
			$('html, body').animate({
		        scrollTop: parseInt($("#chk_qna1").offset().top)
		    }, 400);
			return;
		} else if(radioVal2 == null || radioVal2 == ''){
			alert("값을 선택해주세요.");
			$('html, body').animate({
		        scrollTop: parseInt($("#chk_qna2").offset().top)
		    }, 400);
			return;
		} else if(radioVal3 == null || radioVal3 == ''){
			alert("값을 선택해주세요.");
			$('html, body').animate({
		        scrollTop: parseInt($("#chk_qna3").offset().top)
		    }, 400);
			return;
		} else if(radioVal4 == null || radioVal4 == ''){
			alert("값을 선택해주세요.");
			$('html, body').animate({
		        scrollTop: parseInt($("#chk_qna4").offset().top)
		    }, 400);
			return;
		} else if(radioVal5 == null || radioVal5 == ''){
			alert("값을 선택해주세요.");
			$('html, body').animate({
		        scrollTop: parseInt($("#chk_qna5").offset().top)
		    }, 400);
			return;
		} else{
			if(radioVal3 == 1){
				radioVal3 = "";
				radioVal3 = "전문적인 펫시터 교육을 받고 싶어서";
			} else if(radioVal3 == 2){
				radioVal3 = "";
				radioVal3 = "재택근무를 통한 수익창출";
			} else if(radioVal3 == 3){
				radioVal3 = "";
				radioVal3 = "다양한 강아지를 접해보고 싶어서";
			} else if(radioVal3 == 4){
				radioVal3 = "";
				radioVal3 = "우리집 강아지를 기르는데 도움이 될 것 같아서";
			}
			radioVal1 = "- "+radioVal1; 
			radioVal2 = "- "+radioVal2;
			radioVal3 = "- "+radioVal3;
			radioVal4 = "- "+radioVal4;
			radioVal5 = "- "+radioVal5;
			
			$("#memQna1").val(radioVal1);
			$("#memQna2").val(radioVal2);
			$("#memQna3").val(radioVal3);
			$("#memQna4").val(radioVal4);
			$("#memQna5").val(radioVal5);
			
			okBtn();
		}
		
	});
});
function okBtn(){
	$("#supportFrm").submit();
}
</script>
<div class="supportWord">
	<div class="sWord">
		<div id="chk_qna1" class="QnA">
			<span>함께 거주하고 있는 가족 및 동거인 중 15세 미만의<br> 미성년자가 있습니까?</span>
		</div>
		<div style="font-size: 20px; margin-top:5px;">
			<div class="QnADiv">
				<input type="radio" class="chk_qna1" name="chk_qna1" value="예" /> <span>예</span>
			</div>
			<div class="QnADiv">
				<input type="radio" class="chk_qna1" name="chk_qna1" value="아니오" /> <span>아니오</span>
			</div>
		</div>
	</div>
</div>
<div class="supportWord">
	<div class="sWord">
		<div id="chk_qna2" class="QnA">
			<span>다른 사이트 혹은 커뮤니티에서 펫시터 활동을 <br> 하신 적 있으신가요?</span>
		</div>
		<div style="font-size: 20px; margin-top:5px;">
			<div class="QnADiv">
				<input type="radio" class="" name="chk_qna2" value="예" /> <span>예</span>
			</div>
			<div class="QnADiv">
				<input type="radio" class="" name="chk_qna2" value="아니오" /> <span>아니오</span>
			</div>
		</div>
	</div>
</div>
<div class="supportWord">
	<div class="sWord">
		<div id="chk_qna3"class="QnA">
			<span>도그메이트 펫시터로 지원을 결심하게 된 결정적인<br> 계기는 무엇인가요?</span>
		</div>
		<div style="font-size: 20px;">
			<div class="QnADiv">
				<input type="radio" class="" name="chk_qna3" value="1" /> <span>전문적인 펫시터 교육을 받고싶어서</span>
			</div>
			<div class="QnADiv">
				<input type="radio" class="" name="chk_qna3" value="2" /> <span>재택근무를 통한 수익창출</span>
			</div>
			<div class="QnADiv">
				<input type="radio" class="" name="chk_qna3" value="3" /> <span>다양한 강아지를 접해보고 싶어서</span>
			</div>
			<div class="QnADiv">
				<input type="radio" class="" name="chk_qna3" value="4" /> <span>우리집 강아지를 기르는데 도움이 될 것 같아서</span>
			</div>
		</div>
	</div>
</div>
<div class="supportWord">
	<div class="sWord">
		<div id="chk_qna4" class="QnA">
			<span>가족 중 실내흡연자가 있으신가요?</span>
		</div>
		<div style="font-size: 20px;">
			<div class="QnADiv">
				<input type="radio" class="" name="chk_qna4" value="예" /> <span>있습니다.</span>
			</div>
			<div class="QnADiv">
				<input type="radio" class="" name="chk_qna4" value="아니오" /> <span>없습니다.</span>
			</div>
		</div>
	</div>
</div>

<div class="supportWord">
	<div class="sWord">
		<div id="chk_qna5" class="QnA">
			<span>지원자께서 반려동물을 키우신적이 있으신가요?</span>
		</div>
		<div style="font-size: 20px;">
			<div class="QnADiv">
				<input type="radio" class="" name="chk_qna5" value="예" /> <span>있습니다.</span>
			</div>
			<div class="QnADiv">
				<input type="radio" class="" name="chk_qna5" value="아니오" /> <span>없습니다.</span>
			</div>
		</div>
	</div>
</div>
<div style="margin: 0 auto; height: 60px;">
	<div style="width: 300px; margin: 0 auto; text-align: center;">
		<input type="button" id="okBtn"onclick="okBtn()" value="지원하기" />
	</div>
</div>