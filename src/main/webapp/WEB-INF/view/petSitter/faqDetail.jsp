<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqDetail.jsp</title>
<link href="/css/commonCss.css" rel ="stylesheet">
<link href="/css/petSitter.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <style type="text/css">
  	#faqDetail{
	    border: 3px dotted #f99;
    	border-radius: 30px;
    	width : 1000px;
    	margin : 0 auto;
  	}
  </style>
</head>
<body>
<%@include file="/WEB-INF/view/common/header.jsp"%>

<!-- 각자 화면 -->
	<div id="">
		<!-- header -->
		<div id="header">
			<!-- main -->
			<div id="logo">
				<a href="/petSitter.jsp"><img alt="이미지가 없습니다"
					src="/img/petSitterLogo2.jpg" width="200px;" /></a>
			</div>
			<div id="petSearch">
				<div id="word">
					<input type="text" id="search" value="검색어를 입력하세요" onfocus="this.value=''" style="color: #c1c1c1" />
				</div>
				<div id="searchButton">
					<a href="#" id="searchButton"></a>
				</div>
			</div>

			<!-- 우리 아이 등록하기 -->
			<div id="petInsert">
				<a href="#"><img alt="이미지가 없습니다" src="/img/petInsert.jpg"
					width="240px;" height="100px;"></a>
			</div>
		</div>
	</div>
	<div id="body">
		<div id="petSitterMenu">
			<%@include file="/WEB-INF/view/petSitter/petSitterMenu.jsp" %>
		</div>
		
		<div id="faqDetail">
			<div id="faqDetailTop">
				<div id="faqTitle">
					<span>${fVo.psf_name }</span>
				</div>
				<div id="faqDate">
					<fmt:formatDate pattern = "yyyy-MM-dd" value = "${fVo.psf_date}" />
				</div>
			</div>
			<div id="faqDetailMain">
				<span>${fVo.psf_text }</span>
			</div>
			<div id="index">
				<c:if test="${memVo.mem_id == 'admin' }">
					<a class="indexMove" href="/sit/faqUpdateView?faq_id=${fVo.psf_id }">수정</a>
					<a class="indexMove" href="/sit/faqDelete?faq_id=${fVo.psf_id }">삭제</a>
				</c:if>
				<a class="indexMove" href="/sit/faq">목록</a>
			</div>
		</div>
	</div>
	<div id="topMove">
		<a href="#header">
			<img alt="화살표" src="/img/petSitterImg/top.jpg" width=50px height=50px>
		</a>
	</div>
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>