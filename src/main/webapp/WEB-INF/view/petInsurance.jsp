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
		
		<!-- petInsuranceHeaderMain -->
		<%@include file="./petInsurance/petInsuranceHeaderMain.jsp"%>
		<!-- petInsuranceHeaderMain 끝 -->
	
		<%--펫보험소개 --%>
		<div id="introduction">
			<div id="introduction1">
				<img alt="펫보험소개안내글" src="/img/petInsurance/Introduction.jpg" width="1200px">
			</div>
		</div>
	
</div>
	
	<!-- footer 시작 -->
	<%@include file="./common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>