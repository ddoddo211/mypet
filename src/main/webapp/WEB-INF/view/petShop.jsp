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
<link href="https://fonts.googleapis.com/css?family=Karla" rel="stylesheet">
<style type="text/css">
	*{margin:0; padding: 0; }
	@import url('https://fonts.googleapis.com/css?family=Bungee|Gamja+Flower');
	
	<%@include file="/css/commonCss.css"%>
	
	#mainbody{
		width:1200px;
		margin: 0 auto;
	}
	
	#shopmenu {
		text-align : center;
		height: 50px;
	}
	.mainmenu-li {
	background-color: #ff8800;
	width: 120px;
	float: left;
	padding: 0px;
	margin: 0px;
	margin-top: 5px;
	margin-left: 5px;
	color: white;
	text-align: center;
	border-radius:50px;
	padding: 7px;
	border:1px solid #e8932c;
	}

	.mainmenu-li:hover{
	color: black;
	background-color: white;
	border:1px solid #ff8800;
	width: 120px;
	}
	
	#maintop{
		width: 1200px;
		height : 300px;
	}
	
	.maintop-left{
		width : 907px;
		height:260px;
		float: left;
		border: 1px solid #eee;
		position:relative;
		padding:10px;
	}
	
	.maintop-right{
		padding-top:5px;
		width : 270px;
		background-color : #ff8800;
		float: left;
		text-align: center;
		height:278px;
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
	}
	#mainmid > p{text-align:center;font-size:30px;font-weight:normal;padding-bottom:15px;}
	#mainmid > ul {
		margin:0 auto;
		border-top:1px solid #000;
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
		margin-top:20px;
	}
	.productBtn > a {		
		display:block;width:100px; height:30px; border:1px solid #000;
		border-radius:5px; line-height:30px;text-align:center;margin:0 auto;
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
</style>

</head>

<body>
<!-- header 시작 -->
<%@include file="/WEB-INF/view//common/header.jsp"%>
<!-- header 끝-->
	<div id="headerMain">
	<!-- 여기서 부터 각자 -->
		<!-- header -->
		<div id="header">
			<div id="logo">
				<img alt="" src="/img/petShopLogo.jpg" width="200">
			</div>
		</div>
	</div>
	
	<!-- body -->
	<div id = "mainbody">
		
		<div id="shopmenu">
			<ul class="meinmenul-ul">
				<li class="mainmenu-li">강아지</li>
				<li class="mainmenu-li">고양이</li>
				<li class="mainmenu-li">베스트</li>
				<li class="mainmenu-li">최근 본 상품</li>
				<li class="mainmenu-li">장바구니</li>
				<li class="mainmenu-li">마이페이지</li>
			</ul>
		</div>
		<br/>
		<br/>
		<div id="maintop">
			<div class="maintop-left">
				<img src="/shopimg/notice1.jpg" class="mySlides" width="917" height="270">
				<img src="/shopimg/notice2.jpg" class="mySlides" width="917" height="270">
				<img src="/shopimg/notice3.jpg" class="mySlides" width="917" height="270">
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
					 setTimeout(carousel, 2000); // Change image every 2 seconds
					}
				</script>
			</div>
			<div class="maintop-right">
				<img alt="간편 사료 찾기" src="/shopimg/shopsaryo.png" width="190">
				<select class="mainSearch">
					<option>품종선택</option>
					<option>강아지</option>
					<option>고양이</option>
				</select>
				<br/>
				<select class="mainSearch">
					<option>브랜드선택</option>
					<option>건강백서</option>
					<option>개사료</option>
				</select>
				<br>
				<a href="#" class="saryoSearch">사료 검색하기</a>
			</div>
		</div>
		
		<div id="mainmid">
			<p>베스트 상품</p>
			<ul>
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
		</div>
		<div class="productBtn">
			<a href="#" onclick="return false;">더보기</a>
		</div>
		
		
	</div>
	
<!-- footer 시작 -->
<%@include file="/WEB-INF/view/common/footer.jsp"%>
<!-- footer 끝 -->
		
</body>

</html>
