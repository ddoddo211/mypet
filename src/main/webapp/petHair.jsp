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
	
	<!-- 각자 화면 -->
		<div id="header">
		
			<!-- main -->
			<div id="logo">
				<img alt="이미지가 없습니다" src="/img/petHairLogo.jpg" width="200px;">
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
		
<!-- footer 시작 -->
<%@include file="/common/footer.jsp"%>
<!-- footer 끝 -->

</body>

</html>
