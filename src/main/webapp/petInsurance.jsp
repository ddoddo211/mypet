<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<link href="/css/slideshow.css" rel="stylesheet">   

<style type="text/css">

   *{margin:0; padding: 0; }
   
   <%@include file="/css/commonCss.css"%>
   
   <%@include file="/petInsurance/css/petInsuranceCss.css"%>
</style>

</head>

<body>
<!-- header 시작 -->
<%@include file="/common/header.jsp"%>
<!-- header 끝-->
	<div id="headerMain">
		<!-- 여기서 부터 각자 -->
		<!-- header -->
		<div id="header">
			<div id="logo">
				<img alt="" src="/img/petInsuranceLogo2.jpg" width="200">
			</div>
			<div id="petSearch">
				<input type="text" id="search" value="검색어를 입력하세요"
					onfocus="this.value=''" style="color: #c1c1c1" /> <a href="#"
					id="searchButton"></a>
			</div>

			<!-- 우리 아이 등록하기 -->
			<div id="petInsert">
				<a href="#"><img alt="이미지가 없습니다" src="/img/petInsert.jpg"
					width="170px;"></a>
			</div>

		</div>

		<!-- 펫보험소개 헤더 -->
		<%@include file="/petInsurance/petInsuranceHeader.jsp"%>
		
		<!--  펫보험 소개 -->
		<div id="Introduction"  width="500px;">
		<img alt="펫보험소개안내글" src="/petInsurance/img/Introduction.jpg">
		</div>
	<!-- body -->
	</div>
	
<!-- footer 시작 -->
<%@include file="/common/footer.jsp"%>
<!-- footer 끝 -->
      
</body>

</html>