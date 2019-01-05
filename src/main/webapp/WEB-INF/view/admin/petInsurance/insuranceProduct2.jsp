<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insuranceProduct2(상품 상세보기)</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">
// 목록 버튼을 클릭하였을때 이전화면으로 보내는 함수 
function listClick() {
	location.href = '/isr/goProdManager';
}

function prodAdd(){
	if('${memVo.mem_id}' == ''){
		alert("로그인이 되어 있지 않습니다.\n로그인하시기 바랍니다.");
		location.href ='/mem/loginPage';
	}else if('${insShList}' != 0){
		alert("이미 플랜정보에 추가된 보험상품입니다.\n이미 추가된 상품은 추가되지 않습니다.");
		return ;
	}else{
			$("#frm").submit();
	}
}
</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<body>
	

<!-- header 시작 -->
<%@include file="../../common/header.jsp"%>
<!-- header 끝-->

<div id="main">	

	<div id="adminMain">
		<!-- 관리자 메뉴 -->
		<%@include file="../adminHeader.jsp"%>
		
		<!-- 입력하여 content 넣는 부분 -->
			<div id="insTitle">
				펫 보험 관리자용
			</div>
			<div id="insTitle2">
				원하시는 항목의 버튼을 클릭하시면 이동됩니다.
			</div>
			
			<!-- 관리자용 펫 보험 메뉴  -->
			<%@include file="insMenuSelect.jsp"%>
		

		<!-- 보험상품 상세정보 나오는 부분 -->
		<div id="detail">
			<div id="detailtop">
				<div id="prodInfo">
					<c:choose>
						<c:when test = "${prodVo.insp_join == '강아지'}">
							<img class="prodInfo1" alt="이미지가 없습니다" src="/img/petInsurance/petInfo.jpg" width="40px" height="40px">
						</c:when>
						<c:otherwise>
							<img class="prodInfo1" alt="이미지가 없습니다" src="/img/petInsurance/petInfo2.jpg" width="40px" height="40px">
						</c:otherwise>
					</c:choose>
				</div>
				<div id="detailName">
					<label>${prodVo.insp_name}</label>
				</div>
				<div id="list">
					<button id="listButton" onclick="listClick()">목록으로 가기</button>
				</div>
			</div>
			
			<div id="detailWrite">
				<div id="detailWrite1">
					<div id="dW1" class="dWclass">
						<label id="dWlabel">보험가입대상</label>
						<label class="whiteLb">${prodVo.insp_join}</label>
					</div>
					<div id="dW2" class="dWclass">
						<label id="dWlabel1">보험가입 가능 연령</label>
						<label class="whiteLb">${prodVo.insp_minage}<%="세 ~"%>${prodVo.insp_maxage}<%="세"%></label>
					</div>
					<div id="dW3" class="dWclass">
						<label id="dWlabel2">보험보장기간</label>
						<label class="whiteLb"><%="가입부터 ~"%>${prodVo.insp_period}<%="세 까지"%></label>
					</div>
					<div id="dW4" class="dWclass">
						<label id="dWlabel3">질병여부</label>
						<label class="whiteLb">${prodVo.insp_sick}</label>
					</div>
					<div id="dW5" class="dWclass">
						<label id="dWlabel4">월 보험료 가격</label>
						<label class="whiteLb"><%="월 "%>${prodVo.insp_fees}<%="원"%></label>
					</div>
				</div>
				
			</div>
			
			<div id="insuranceGuide">
				<div id="idDiv">
					<div id="ig1">
						<button id="igBt"><a href="#name01">상세내용</a></button>
					</div>
					<div id="ig2">
						<button id="igBt2"><a href="#name02">보험내용</a></button>
					</div>
					<div id="ig3">
						<button id="igBt3"><a href="#name03">가입예시</a></button>
					</div>
					<div id="ig4">
						<button id="igBt4"><a href="#name04">꼭 알아두실사항</a></button>
					</div>
				</div>
			</div>
			
			<div id="insuranceGuide2">
				 위의 항목을 클릭하시면 해당 항목으로 이동하여 확인하실 수 있습니다.
			</div>
			
			<div class="prodImg">
				<a name="name01"></a><img id="prodImg1" alt="이미지가 없습니다" src="/img/petInsurance/prod.jpg">
			</div>
			
			<div class="prodImg">
				<a name="name02"></a><img id="prodImg2" alt="이미지가 없습니다" src="/img/petInsurance/prod2.jpg">
			</div>
			
			<div class="prodImg">
				<a name="name03"></a><img id="prodImg3" alt="이미지가 없습니다" src="/img/petInsurance/prod3.jpg">
			</div>
			
			<div class="prodImg">
				<a name="name04"></a><img id="prodImg4" alt="이미지가 없습니다" src="/img/petInsurance/prod4.jpg">
			</div>

		</div>

		
</div>

		`</div>
			
		
	</div>

</div>
	
	<!-- footer 시작 -->
	<%@include file="../../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>