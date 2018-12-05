<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<link href="https://fonts.googleapis.com/css?family=Karla" rel="stylesheet">
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petShopCss.css" rel="stylesheet">
<style type="text/css">
	#maintop{
		width: 1200px;
		height : 300px;
	}
	
	.maintop-left{
		width : 907px;
		height:280px;
		float: left;
		position:relative;
	}
	
	.maintop-right{
		width : 270px;
		background-color : #ff8800;
		float: left;
		text-align: center;
		height: 280px;
	}
	
	.mainSearch{
		border: 1px solid;
		width: 150px;
	}
	
	p {
		font-size: 20px;
		font-weight: bold;
	}
	
	#mainmid{
		width: 1200px;
		border: 1px solid #eee;
		margin-bottom: 10px;
	}
	
	.bestP p{
		width:1200px;
		text-align:center;
		font-size:30px;
		font-weight:normal;
		padding-bottom:15px;
	}
	#mainmid > ul {
		margin:0 auto;
		width:1200px;
		padding-top:20px;
	}
	#mainmid > ul > li {
		float:left;margin-left:10px;margin-top:15px;
		width:250px;height:270px;margin-bottom:20px;
		display:flex;justify-content:center;flex-direction:column;
	}
	#mainmid > ul > li > a{text-align:center;margin:0 auto;font-size:20px;margin-top:10px;}
	#mainmid > ul > li:first-child{margin-left:90px;}
	#mainmid > ul > li:nth-child(5){margin-left:90px;}
	#mainmid > ul > li:nth-child(9){margin-left:90px;}
	
	.shopnotice{
		list-style: disc;
		margin-left: 20px;
		padding: 15px;
	}
	.shopnotice > li{
		padding: 5px 0px 5px 0px;
	}
	
	.noticebtn{
		margin-left:20px;
		width: 100px;
		height: 70px;
		border: 1px solid #000;
		color:#000;
		padding:10px;
		transition: 0.5s;
		border-radius:5px;
	}
	.noticebtn:hover{transion:0.5s;background-color:#000;color:#fff;}
	
	.productBtn {
		width:100px;height:70px;padding:3px;border-radius:5px;font-size:15px;
		clear:left;
	}
	.productBtn {
		width:1200px;height:50px;margin:0 auto;text-align:center;padding-top:50px;
	}
	.productBtn > a {		
		display:block;width:100px; height:30px; border:1px solid #000;
		border-radius:5px; line-height:30px;text-align:center;margin:0 auto;
	}
	
	.search{
		width: 200px;
		margin: 0 auto;
	}
	
	.mainSearch {
		width: 150px;
	    height: 20px;
 	    padding-left: 31px; 
	    font-size: 13px;
	    color: #0e135e;
	    border: 1px solid black;
	    border-radius: 5px;
	    margin-top: 5px;
	    font-family: 'Karla', sans-serif;
	}
	
	.saryoSearch{
		background-color: #ff8800;
		border: 1px solid black;
		border-radius:5px;
		font: black;
		background-color: white;
		color: #0e135e;
		font-size: 13px;
		padding: 1.5px 34px 1.5px 34px;
		font-family: 'Karla', sans-serif;
	}
	
	.saryogo{
		padding-right: 4px;
		margin-top: 4px;
	}
</style>

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
		<br/>
		<br/>
		<div id="maintop">
			<div class="maintop-left">
				<c:forEach items="${snotList }" var="list">
					<a href="/shop/shopNoticeDetail?snot_id=${list.snot_id }"><img src="${list.snot_profile }" class="mySlides" width="907" height="280"></a>
				</c:forEach>
				<script type="text/javascript">
					var slideIndex = 0;
					carousel();
					
					function carousel() {
					 var i;
					 var x = document.getElementsByClassName("mySlides");
					 for (i = 0; i < x.length; i++) {
					   x[i].style.display = "none"; 
					 }
					 slideIndex++;
					 if (slideIndex > x.length) {slideIndex = 1} 
					 x[slideIndex-1].style.display = "block"; 
					 setTimeout(carousel, 4000); // Change image every 2 seconds
					}
				</script>
			</div>
			
			<div class="maintop-right">
				<img alt="간편 사료 찾기" src="/shopimg/shopsaryo.png" width="190">
				<div class="search">
					<form method="get" action="/shop/petShopList">
						<select class="mainSearch" name="">
							<option>품종선택</option>
							<option>강아지</option>
							<option>고양이</option>
						</select>
						<br/>
						<select class="mainSearch" name="">
							<option>브랜드선택</option>
							<option>건강백서</option>
							<option>개사료</option>
						</select>
						<br>
						<div class="saryogo">
							<button class="saryoSearch" type="submit">사료 검색하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<div class = "bestP">
			<p>베스트 상품</p>
		</div>
		<div id="mainmid">
				<ul class="mainmid_ul">
					<li>
						<a href="#">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="#">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="#">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="#">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="#">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="#">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="#">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="#">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="#">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="#">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="#">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="#">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
				</ul>
				<br>
				<div class="productBtn">
					<a href="#" onclick="return false;">더보기</a>
				</div>
		</div>
	</div>
	
<!-- footer 시작 -->
<%@include file="/WEB-INF/view/common/footer.jsp"%>
<!-- footer 끝 -->
		
</body>

</html>
