<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- header 시작 -->
	<%@include file="/WEB-INF/view/common/header.jsp"%>
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
				<a href="/shop/petShopList?page=1&pagesize=12&dvs_id=DVS1&dvs_parent=DVS3">
					<li class="mainmenu-li">강아지</li>
				</a>
				<a href="/shop/petShopList?page=1&pagesize=12&dvs_id=DVS2&dvs_parent=DVS11">
					<li class="mainmenu-li">고양이</li>
				</a>
				<a href="/shop/prodBest">
					<li class="mainmenu-li">베스트</li>
				</a>
				<a href="/shop/recentProd">
					<li class="mainmenu-li">최근 본 상품</li>
				</a>
				<a href="/shop/cartList">
					<li class="mainmenu-li">장바구니</li>
				</a>
				<a href="/shop/prodEvent">
					<li class="mainmenu-li">이벤트</li>
				</a>
				<c:if test="${memVo != null }">
					<a href="/shop/shopMypage">
						<li class="mainmenu-li">마이페이지</li>
					</a>
				</c:if>
			</ul>
		</div>
	</div>
