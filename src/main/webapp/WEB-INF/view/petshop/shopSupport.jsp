<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원서 뷰</title>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petShopCss.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<style type="text/css">
.supportMenuMain {
	margin-top: 30px;
	width: 100%;
	overflow: hidden;
}

.supportMenu {
	background-color: #ffac34;
	width: 200px;
	color: #fff;
	height: 35px;
	font-size: 20px;
	font-weight: bold;
	line-height: 35px;
	text-align: center;
	float: left;
}

.supportMenuSb {
	width: 0;
	height: 0;
	border-top: 35px solid #ffac34;
	border-right: 20px solid transparent;
	float: left;
}

.supportWord {
	width: 100%;
	font-size: 14px;
	margin-top: 10px;
	margin-bottom: 30px;
	margin-left : 10px;
}

#memberJoin {
	padding: 10px 40px 10px 40px;
	background-color: #6a5d82;
	text-decoration: underline;
	border: 1px solid #000;
	color: #fff;
	border-radius: 15px;
}
.QnA{
	font-size : 28px;
}

.QnAinput{
	border : none;
	text-decoration: underline;
	width : 250px;	
}
.field{
  --uiFieldPlaceholderColor: var(--fieldPlaceholderColor, #767676);
}

.field__input{ 
  background-color: transparent;
  border-radius: 0;
  border: none;

  -webkit-appearance: none;
  -moz-appearance: none;

  font-family: inherit;
  font-size: 1em;
}

.field__input:focus::-webkit-input-placeholder{
  color: var(--uiFieldPlaceholderColor);
}

.field__input:focus::-moz-placeholder{
  color: var(--uiFieldPlaceholderColor);
  opacity: 1;
}

/*
=====
LEVEL 2. CORE STYLES
=====
*/

.a-field{
  display: inline-block;
}

.a-field__input{ 
  display: block;
  box-sizing: border-box;
  width: 100%;
}

.a-field__input:focus{
  outline: none;
}

/*
=====
LEVEL 3. PRESENTATION STYLES
=====
*/

/* a-field */

.a-field{
  --uiFieldHeight: var(--fieldHeight, 40px);  
  --uiFieldBorderWidth: var(--fieldBorderWidth, 2px);
  --uiFieldBorderColor: var(--fieldBorderColor);

  --uiFieldFontSize: var(--fieldFontSize, 1em);
  --uiFieldHintFontSize: var(--fieldHintFontSize, 1em);

  --uiFieldPaddingRight: var(--fieldPaddingRight, 15px);
  --uiFieldPaddingBottom: var(--fieldPaddingBottom, 15px);
  --uiFieldPaddingLeft: var(--fieldPaddingLeft, 15px);   

  position: relative;
  box-sizing: border-box;
  font-size: var(--uiFieldFontSize);
  padding-top: 1em;  
}

.a-field .a-field__input{
  height: var(--uiFieldHeight);
  padding: 0 var(--uiFieldPaddingRight) 0 var(--uiFieldPaddingLeft);
  border-bottom: var(--uiFieldBorderWidth) solid var(--uiFieldBorderColor);  
  width: 300px;
}

.a-field .a-field__input::-webkit-input-placeholder{
  opacity: 0;
  transition: opacity .2s ease-out;
}

.a-field .a-field__input::-moz-placeholder{
  opacity: 0;
  transition: opacity .2s ease-out;
}

.a-field .a-field__input:not(:placeholder-shown) ~ .a-field__label-wrap .a-field__label{
  opacity: 0;
  bottom: var(--uiFieldPaddingBottom);
}

.a-field .a-field__input:focus::-webkit-input-placeholder{
  opacity: 1;
  transition-delay: .2s;
}

.a-field .a-field__input:focus::-moz-placeholder{
  opacity: 1;
  transition-delay: .2s;
}

.a-field .a-field__label-wrap{
  box-sizing: border-box;
  width: 100%;
  height: var(--uiFieldHeight);	

  pointer-events: none;
  cursor: text;

  position: absolute;
  bottom: 0;
  left: 0;
}

.a-field .a-field__label{
  position: absolute;
  left: var(--uiFieldPaddingLeft);
  bottom: calc(50% - .5em);

  line-height: 1;
  font-size: var(--uiFieldHintFontSize);

  pointer-events: none;
  transition: bottom .2s cubic-bezier(0.9,-0.15, 0.1, 1.15), opacity .2s ease-out;
  will-change: bottom, opacity;
}

.a-field .a-field__input:focus ~ .a-field__label-wrap .a-field__label{
  opacity: 1;
  bottom: var(--uiFieldHeight);
}

/* a-field_a1 */

.a-field_a1 .a-field__input{
  transition: border-color .2s ease-out;
  will-change: border-color;
}

.a-field_a1 .a-field__input:focus{
  border-color: var(--fieldBorderColorActive);
}

/* a-field_a2 */

.a-field_a2 .a-field__label-wrap:after{
  content: "";
  box-sizing: border-box;
  width: 0;
  height: var(--uiFieldBorderWidth);
  background-color: var(--fieldBorderColorActive);

  position: absolute;
  bottom: 0;
  left: 0;  

  will-change: width;
  transition: width .285s ease-out;
}

.a-field_a2 .a-field__input:focus ~ .a-field__label-wrap:after{
  width: 100%;
}

/* a-field_a3 */

.a-field_a3{
  padding-top: 1.5em;
}

.a-field_a3 .a-field__label-wrap:after{
  content: "";
  box-sizing: border-box;
  width: 100%;
  height: 0;

  opacity: 0;
  border: var(--uiFieldBorderWidth) solid var(--fieldBorderColorActive);

  position: absolute;
  bottom: 0;
  left: 0;

  will-change: opacity, height;
  transition: height .2s ease-out, opacity .2s ease-out;
}

.a-field_a3 .a-field__input:focus ~ .a-field__label-wrap:after{
  height: 100%;
  opacity: 1;
}

.a-field_a3 .a-field__input:focus ~ .a-field__label-wrap .a-field__label{
  bottom: calc(var(--uiFieldHeight) + .5em);
}

/*
=====
LEVEL 4. SETTINGS
=====
*/

.field{
  --fieldBorderColor: #D1C4E9;
  --fieldBorderColorActive: #673AB7;
}
<!-- -->
#nextBtn{
	padding : 10px 50px 10px 50px;
	border : 1px solid #c1c1c1;
	background-color: #4cfff5;
	color : #fff;
	border-radius: 15px;
	box-shadow: 1px 1px #b7ffea;
	outline: none;
}

#nextBtn:active{
	padding : 10px 50px 10px 50px;
	border : 1px solid #f1f1f1;
	background-color: #b7ffea;
	color : #000;
	border-radius: 15px;
	box-shadow: 1px 1px #f1f1f1;
	outline: none;s
}
</style>
<script type="text/javascript">

	function nextBtn(){
		var mem_name = $("#mem_name").val();
		var mem_tel = $("#mem_tel").val();
		var compChk = $('input[name="chk_comp"]:checked').val();
		var compName = $("#comp_name").val();
		var compNumber = $("#comp_number").val();
		
		if(mem_name == null || mem_name == ''){
			alert("지원자 이름을 입력해주세요.");
			return;
		} else if(mem_tel == null || mem_tel == ''){
			alert("연락처를 입력해주세요.");
			return;
		} else if(compChk == null || compChk == ''){
			alert("사업자 구분을 체크해주세요.");
			return;
		} 
		
		if(compChk == '회사'){
			if(compName == null || compName == ''){
				alert("회사명을 입력해주세요.");
				return;
			} else if(compNumber == null || compNumber == ''){
				alert("사업자 등록번호를 입력해주세요.");
				return;
			}
			$("#memName").val(mem_name);
			$("#memTel").val(mem_tel);
			$("#compChk").val(compChk);
			$("#compName").val(compName);
			$("#compNum").val(compNumber);
			
			$("#supFrm").submit();
		} else{
			$("#memName").val(mem_name);
			$("#memTel").val(mem_tel);
			$("#compChk").val(compChk);
			$("#compName").val("");
			$("#compNum").val("");
			
			$("#supFrm").submit();
		}
		
	
		
	}
</script>
</head>
<body>
<form action="/shop/supportInsert" method="post" id="supFrm">
	<input type="hidden" id="memName" name="memName" />
	<input type="hidden" id="memTel" name="memTel" />
	<input type="hidden" id="compChk" name="compChk" />
	<input type="hidden" id="compName" name="compName" />
	<input type="hidden" id="compNum" name="compNum" />
</form>
<%@include file="/WEB-INF/view/petshop/petShopH.jsp"%>
	<div
		style="margin: 0 auto; width: 800px; background-color: #fff; border: 1px solid #c1c1c1; font-family: 'Nanum Gothic', sans-serif;">
		<div style="width: 100%; text-align: center;">
			<span style="font-size: 40px; font-weight: bold;">MYPET 펫 쇼핑몰
				판매자 지원서</span>
		</div>
		<div class="supportMenuMain">
			<div class="supportMenu">
				<span>지원 자격 및 조건</span>
			</div>
			<div class="supportMenuSb"></div>
		</div>
		<div class="supportWord">
			<div class="sWord">
				- 사업자등록번호를 소지한 자 <br>
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
					<span style="font-weight: bold;">- 지원서를 작성하기전에 회원가입을 꼭!!
						해주시기 바랍니다.</span>
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
					<span>지원자 성명</span>
				</div>

				<div class="page">
					<div class="page__demo">
						<label class="field a-field a-field_a1 page__field"> <input
							class="field__input a-field__input" id="mem_name"
							placeholder="홍길동" required> <span
							class="a-field__label-wrap"> <span class="a-field__label">답변</span>
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
							class="field__input a-field__input" id="mem_tel"
							placeholder="0111112222" required> <span
							class="a-field__label-wrap"> <span class="a-field__label">답변</span>
						</span>
						</label>
					</div>
				</div>
			</div>
		</div>
		<div class="supportWord">
			<div class="sWord">
				<div class="QnA">
					<span>사업자 구분을 선택해 주세요.</span>
				</div>
				<div style="font-size: 20px;">
					<div class="QnADiv">
						<input type="radio" class="chk_job" name="chk_comp" value="개인" />
						<span>개인</span>
					</div>
					<div class="QnADiv">
						<input type="radio" class="chk_job" name="chk_comp" value="회사" />
						<span>회사</span>
					</div>
				</div>
			</div>
		</div>
		<div class="supportWord">
			<div class="sWord">
				<div class="QnA">
					<span>사업자 구분이 '회사'라면 회사명과 사업자등록번호를<br> 입력해 주세요. </span>
				</div>
				<div class="page">
					<div class="page__demo">
						<label class="field a-field a-field_a1 page__field"> <input
							class="field__input a-field__input" id="comp_name"
							placeholder="812345" required> <span
							class="a-field__label-wrap"> <span class="a-field__label">회사명</span>
						</span>
						</label>
					</div>
					<div class="page__demo">
						<label class="field a-field a-field_a1 page__field"> <input
							class="field__input a-field__input" id="comp_number"
							placeholder="812345" required> <span
							class="a-field__label-wrap"> <span class="a-field__label">사업자등록번호</span>
						</span>
						</label>
					</div>
				</div>
			</div>
		</div>
		<div style="margin: 0 auto; height: 60px;">
			<div style="width: 300px; margin: 0 auto; text-align: center;">
				<input type="button" id="nextBtn" onclick="nextBtn()" value="지원하기" />
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/view/common/footer.jsp"%>
</body>
</html>