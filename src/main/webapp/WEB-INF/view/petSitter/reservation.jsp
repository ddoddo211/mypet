<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="/css/commonCss.css" rel ="stylesheet">
<link href="/css/petSitter.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Work+Sans" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style type="text/css">
	#resMain{
		border : 1px solid green;
		width : 1000px;
		overflow: hidden;
		margin : 0 auto;
	}
	#resTitle{
		width : 100%;
		border-bottom : 1px solid black;
	}
	
	#resTitle > span {
		font-size : 16px;
		font-weight: bold;
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
		<div id="resMain">
			<c:choose>
				<c:when test="">
					<div id="resTitle">
						<span>예약 완료</span>
					</div>
					<div id="">
						<span>고객님의 <p>예약이 정상적으로 완료</p>되었습니다.</span>
					</div>
					<div id="">
						<div id="">
							<span>예약정보</span>
							<span>예약번호 : </span>
							<span>예약자/반려동물 정보 : </span>
						</div>
						<div id="">
							<span>결제금액</span>
						</div>
					</div>
				</c:when>
				<c:otherwise>
				
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>