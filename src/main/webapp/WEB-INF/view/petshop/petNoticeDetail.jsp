<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script" rel="stylesheet">
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petShopCss.css" rel="stylesheet">
<style type="text/css">
	#maintop{
		width: 1200px;
		margin: 0 auto;
	}
	
	#maintop p {
		font-size: 20px;
		font-weight: bold;
		padding-bottom : 20px;
		border-bottom: 1px solid #000;
		color : #000;
	}
	
	#maintop .topMenu ul li{
		float: left;
		margin-top:10px;
		padding-left: 10px;
		font-size: 15px;
	}
	
	#mainmid {
		margin: 0 auto;
		width: 1200px;
		border-bottom: 1px solid #000;
	}
	#mainmid .snot_title{
		margin : 0 auto;
		padding : 10px 0px 10px 0px;
		font-size: 20px;
		float: left;
		width: 850px;
	}
	
	#mainmid .snot_date{
		margin : 0 auto;
		padding : 10px 0px 10px 0px;
		font-size: 20px;
	}
	
	 .title{
		background-color: #ff8800;
		border: 1px solid white;
		border-radius: 5px;
		color : white;
		font-size: 15px;
    	padding: 5px;
	}
	
	.title2{
		font-family: 'Nanum Pen Script', cursive;
		font-size: 25px;
	}
	
    #mainbottom{
		width : 1200px;
		margin : 0 auto;
	}
	
	.snot_text {
		margin-top: 10px;
	}
	
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- header 시작 -->
<%@include file="../common/header.jsp"%>
<!-- header 끝-->
	<div id="headerMain">
	<!-- 여기서 부터 각자 -->
		<!-- header -->
		<div id="header">
			<div id="logo">
				<a href="/shop/shopMain">
					<img alt="" src="/img/petShopLogo.jpg" width="200">
				</a>
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
	
	<!-- body -->
	<div id = "mainMenu">
		<div id="shopmenu">
			<ul class="meinmenul-ul">
				<li class="mainmenu-li">강아지</li>
				<li class="mainmenu-li">고양이</li>
				<li class="mainmenu-li">베스트</li>
				<li class="mainmenu-li">최근 본 상품</li>
				<li class="mainmenu-li">장바구니</li>
				<li class="mainmenu-li">이벤트</li>
				<li class="mainmenu-li">마이페이지</li>
			</ul>
		</div>
	</div>
	
	<div id="maintop">
		<p>Event</p>
	</div>
	
	<div id="mainmid">
		<div>
			<div class ="snot_title">
				<span class = "title">제목</span>
				<span class="title2">${snotVo.snot_title }</span>
			</div>
			<div class="snot_date">
				<span class="title">이벤트 기간</span>
				<span class="title2">${snotVo.snot_date }</span>
			</div>
		</div>
	</div>
	
	<div id="mainbottom">
		<div class="snot_text">
			<img src="${snotVo.snot_dimg }">
		</div>
	</div>
	
	<!-- footer 시작 -->
	<%@include file="/WEB-INF/view/common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>