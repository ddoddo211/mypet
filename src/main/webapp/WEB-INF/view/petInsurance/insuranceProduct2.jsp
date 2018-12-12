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
		location.href = '/isr/productInfo';
	}

	function prodAdd() {
		if ('${memVo.mem_id}' == '') {
			alert("로그인이 되어 있지 않습니다.\n로그인하시기 바랍니다.");
			location.href = '/mem/loginPage';
		} else if ('${mypetSize}' == '0') {
			alert("펫이 등록되어 있지 앖습니다. 펫을 등록하시기 바랍니다");
			location.href = '/isr/petInsert';
		} else {
			location.href = '/isr/prodAdd?prodId=' + $
			{
				prodVo.insp_id
			}
			;
		}
	}
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
				
				<div id="plan">
					<button id="planButton" onclick="prodAdd()">플랜정보 추가</button>
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
	
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>