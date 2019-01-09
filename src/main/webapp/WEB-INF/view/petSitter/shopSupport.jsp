<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원서 뷰</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="/css/petSitter.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<style type="text/css">
.supportMenuMain {
	margin-top: 30px;
	width: 100%;
	overflow: hidden;
}

.supportMenu {
	background-color: #ffc168;
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
	border-top: 35px solid #ffc168;
	border-right: 20px solid transparent;
	float: left;
}

.supportWord {
	width: 100%;
	font-size: 14px;
	margin-top: 10px;
	margin-bottom: 30px;
}

#memberJoin {
	padding: 10px 40px 10px 40px;
	background-color: #6a5d82;
	text-decoration: underline;
	border: 1px solid #000;
	color: #fff;
	border-radius: 15px;
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
		}
	}
</script>
</head>
<body>
<%@include file="/WEB-INF/view/common/header.jsp"%>
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
</body>
</html>