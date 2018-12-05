<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
		color : #000;
		border-bottom: 1px solid #000;
	}
	
	#mainmid {
		width : 1200px;
		height : 600px;
		margin: 0 auto;
	}
	
	#mainmid .mainleft {
		width: 21%;
		height: 100%;
		background-color: #ff9010;
		border-right: 1px solid #000;
		float: left;
	}
	
	#mainmid .mainleft .listSearch{
		margin-bottom: 10px;
   		border-bottom: 1px solid #000;
	    height: 52px;
    	text-align: center;
    	padding-top: 15px;
	}
	
	#mainmid .mainleft .listSearch a{
		width: 34px;
   		height: 37px;
    	padding: 0px 18px 6px 5px;
    	background: url(http://openimage.interpark.com/.ui/pet/common/pet_searchIcon.png)no-repeat;
	}
	
	#shopSearch{
		width: 152px;
	    height: 33px;
	    padding: 0 36px 0 10px;
	    border: 1px solid #e3e6e5;
	    font-size: 12px;
	    line-height: 33px;
	    color: #555;
	    border-radius: 50px;
	}
	
	.listMenu{
		text-align: center;
	}
	
	.listMenu p {
		font-size : 25px;
		font-weight: bold;
		color : #000;
		margin-bottom: 10px;
	}
	
	.listMenu ul li{
		padding-top: 5px;
	}
	.listMenu ul li a{
		color : #fff;
		border-bottom: 1px solid;
	}
	
	.mainright{
		width: 78%;
    	float: left;	
	}
	.petAges{
		float:left;
		background-color: #ff8800;
	    border: 1px solid white;
	    border-radius: 5px;
	    color: white;
	    font-size: 15px;
	    padding: 5px;
	}
	
	.pordCheck{
		width: 850px;
		height : 200px;
		border: 1px solid #000;
		margin-left: 50px;
   		margin-top: 15px;
   		padding: 10px;
	}
	
	.ageChk ul li{
		padding: 5px 5px 0px 5px;
		float:left;
	}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header 시작 -->
	<%@include file="/WEB-INF/view/common/header.jsp"%>
	<!-- header 끝-->
	<div id="headerMain">
	<!-- 여기서 부터 각자 -->
		<!-- header -->
		<div id="header">
			<div id="logo">
				<img alt="" src="/img/petShopLogo.jpg" width="200">
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
		<p>강아지</p>
	</div>
	
	<div id="mainmid">
		<div class ="mainleft">
			<div class="listSearch">
				<input type="text" id="shopSearch" value="검색어를 입력하세요" onfocus="this.value=''" style="color:#c1c1c1" />
				<a href="#"></a>
			</div>
			<div class="listMenu">
				<p>Menu</p>
				<ul>
					<li><a href="#">사료</a></li>
					<li><a href="#">장난감</a></li>
					<li><a href="#">위생/배변</a></li>
					<li><a href="#">간식</a></li>
				</ul>
			</div>
		</div>
		
		<div class="mainright">
			<div class="pordCheck">
					<span class="petAges">연령</span>
				<div class="ageChk">
					<ul>
						<li><input type="checkbox"><span>전연령</span></li>
						<li><input type="checkbox"><span>성견</span></li>
						<li><input type="checkbox"><span>퍼피</span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- footer 시작 -->
	<%@include file="/WEB-INF/view/common/footer.jsp"%>
	<!-- footer 끝 -->
	
</body>
</html>