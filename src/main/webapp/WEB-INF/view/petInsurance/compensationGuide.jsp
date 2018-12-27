<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>compensationGuide.jsp(보상안내)</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function()
		 {
		  $("#btn1").toggle(
		  function()
		  {
		   $("#content").css("display",'none');
		  },
		  function()
		  {
		   $("#content").css("display","block");

		  });
});

function goInsuranceClaim(){
	location.href = '/isr/insuranceClaim';
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
		
		<div id="guideMain">
			<div id="guideMain1">
				<img alt="이미지가 없습니다." src="/img/petInsurance/guideMain.jpg" width="1200px;">
			</div>
			
			<div id="compensationBtn">
				<div id="compensationBtn1">
					<input type="button" value="인터넷 보험청구" class="compensationBtn1_1" id="compensationBtn1_2" onclick="goInsuranceClaim()">
					<input type="button" value="보험 청구 현황" class="compensationBtn1_1" id="compensationBtn1_2">
					<a href="#name01"><input type="button" value="자주하는 질문(FAQ)" class="compensationBtn1_1" id="compensationBtn1_2"></a>
				</div>
			</div>
			
			<div id="guideMain2">
				<div id="guideMain2_1">
					'보험금청구(서류전송)' 이렇게 입력하세요 ! 아래 이용 화면은 예시화면입니다.
				</div>
				<div id="guideMain2_2">
					<img alt="이미지가 없습니다." src="/img/petInsurance/compensation.jpg"  width="970px;">
				</div>
				<div id="guideMain2_3">
					<img alt="이미지가 없습니다." src="/img/petInsurance/compensation2.jpg" width="970px;">
				</div>
				
				<div id="guideNotice">
					<div id="guideNoticeTitle">
						<div id="guideNoticeTitle1">
							<a name="name01"></a>펫 보험 자주하는 질문(FAQ)
						</div>
					</div>
					<div id="guideNotice1">
						<table>
								<tr>
									<th id="guideNotice2">문의내용</th>
								</tr>
								<c:forEach items="${insNoiceList}" var="insNoice">
								<tr>
									<td id="guideNotice2_2"><img alt="이미지가 없습니다." src="/img/petInsurance/icon.png">&nbsp &nbsp ${insNoice.inot_title}</td>
								<tr>
								<tr>
									<td id="guideNotice3" colspan="2">답변 : ${insNoice.inot_text}</td>
								</tr>
								</c:forEach>
								
						</table>
					</div>
				</div>
			</div>
			
		</div>
		
		
		

</div>
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>