<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<body>
<!-- header 시작 -->
<%@include file="./common/header.jsp"%>
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
		
		<%--보험메뉴 --%>
		<div id="petInsuranceHeader">
					<ul class="menu_ul">
						<li class="mainmenu-li"><a href="/isr/isrMain" >펫 보험소개</a></li>
						<li class="mainmenu-li"><a href="/isr/productInfo">상품안내</a></li>
						<li class="mainmenu-li"><a href="/petInsurance/view/planInformation.jsp" >플랜정보</a></li>
						<li class="mainmenu-li"><a href="/petInsurance/view/compensationGuide.jsp" >보상안내</a></li>
						<li class="mainmenu-li"><a href="/petInsurance/view/myPetInsurance.jsp" >나의 펫 보험</a></li>
					</ul>
		</div>
	
		<%--펫보험소개 --%>
		<div id="introduction">
			<div id="introduction1">
				<img alt="펫보험소개안내글" src="/img/petInsurance/Introduction.jpg" width="1000px">
			</div>
		</div>
	
</div>
	
	<!-- footer 시작 -->
	<%@include file="./common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>