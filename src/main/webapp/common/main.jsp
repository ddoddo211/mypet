<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>

<style type="text/css">

<%@include file="/common/commonCss.jsp"%>

</style>

</head>

<body>

<!-- header 시작 -->
<%@include file="/common/header.jsp"%>
<!-- header 끝-->

	<!-- main content -->
		<div id="header">
			<!-- main -->
			<div id="logo">
				<img alt="이미지가 없습니다" src="/img/mainLogo.jpg" width="200px;">
			</div>
			<div id="petSearch">
				<input type="text" id="search" value="검색어를 입력하세요" onfocus="this.value=''" style="color:#c1c1c1" />
				<a href="#" id="searchButton"></a>
			</div>
			
			<!-- 우리 아이 등록하기 -->
			<div id="petInsert">
				<a href="#"><img alt="이미지가 없습니다" src="/img/petInsert.jpg" width="170px;"></a>
			</div>
		</div>

	<!-- main에서 각자의 메뉴구성 -->
		<div id="menu">
			<div class="menu1">
				<a href="/petSitter.jsp" class="innerborder"><img alt="이미지가 없습니다" src="/img/petnav1.jpg" width="230px" height="500px"></a> 
			</div>
			<div class="menu1">
				<a href="petHair.jsp" class="innerborder"><img alt="이미지가 없습니다" src="/img/petnav2.jpg" width="230px" height="500px"></a> 
			</div>
			<div class="menu1">
				<a href="/petShop.jsp" class="innerborder"><img alt="이미지가 없습니다" src="/img/petnav3.jpg" width="230px" height="500px"></a> 
			</div>
			<div class="menu1">
				<a href="/petInsurance.jsp" class="innerborder"><img alt="이미지가 없습니다" src="/img/petnav4.jpg" width="230px" height="500px"></a> 
			</div>
		</div>
	
	<!-- main content 끝  -->
	
<!-- footer 시작 -->
<%@include file="/common/footer.jsp"%>
<!-- footer 끝 -->

</body>

</html>
