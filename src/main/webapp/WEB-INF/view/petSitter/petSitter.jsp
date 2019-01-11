<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>main.jsp</title>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css">
<link href="/css/petSitter.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/css/swiper.min.css">
<style type="text/css">
#gateway_con .gnbArea_left li a {
	box-sizing: content-box !important;
}

html, body {
	position: relative;
	height: 100%;
}

body {
	margin: 0;
	padding: 0;
}

.swiper-container {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
	flex-direction: column;
}

.swiper-pagination {
	margin-top: 50px !important;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
	});
</script>
</head>
<body>
	<!-- header 시작 -->
	<%@include file="/WEB-INF/view/common/header.jsp"%>
	<!-- header 끝-->

	<!-- 각자 화면 -->
	<div id="">
		<!-- header -->
		<div id="header">
			<!-- main -->
			<div id="logo">
				<a href="/sit/sitMain"><img alt="이미지가 없습니다"
					src="/img/petSitterLogo2.jpg" width="200px;" /></a>
			</div>
			<div id="petSearch">
				<div id="word">
					<input type="text" id="search" value="검색어를 입력하세요"
						onfocus="this.value=''" style="color: #c1c1c1" />
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
			<%@include file="/WEB-INF/view/petSitter/petSitterMenu.jsp"%>
		</div>
		<div class="dimpetSitting"></div>
		<div id="petSittingWord">
			<span>당신의 반려동물을 <br> 믿을 수 있는 펫시터가 <br> 대신 돌봐드립니다.
			</span> <br> <a href="/sit/sitterFrom"><button id="reservation">
					펫시터 예약하러 가기 <i class="icon-arrow-right icons"></i>
				</button></a>
		</div>
		<div id="petSittingHome">
			<img class="mainImg1" src="/img/petSitterImg/petSitterMain1.jpg"
				alt="당신의 반려동물을 돌봐드립니다." />
		</div>

		<div id="petSittingFromHome">
			<div id="fromHome1">
				<img class="mainImg2" alt="펫시터 집으로 부르기"
					src="/img/petSitterImg/petSitterMain2.png" />
			</div>
			<div id="fromHome2">
				<span id="fromWord">펫시터 집으로 부르기</span><br>
				<p>도그메이트 펫시터가 집으로 찾아와 반려동물을 돌봐드려요.</p>
				<br> <a href="/sit/sitterFrom"><button class="detail1" id="detail1">
						자세히 알아보기<i class="icon-arrow-right icons"></i>
					</button></a>
			</div>
		</div>
		<div id="petSittingToHome">
			<div id="toHome1">
				<span id="fromWord">펫시터 집에 맡기기</span><br>
				<p>도그메이트 펫시터의 가정집에서 편안하고 자유롭게 지낼 수 있어요.</p>
				<br> <a href="/sit/sitterTo"><button class="detail1" id="detail2">
						자세히 알아보기<i class="icon-arrow-right icons"></i>
					</button></a>
			</div>
			<div id="toHome2">
				<img class="mainImg2" alt="펫시터 집으로 부르기"
					src="/img/petSitterImg/petSitterMain3.jpg" />
			</div>
		</div>

		<div id="postscript">
			<div id="post">
				<div id="">
					<span>평점 높은 펫시팅 후기들을 확인해보세요.</span>
				</div>
			</div>
			
			<div id="slide">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div id="post1Image">
								<img class="pImg" name="pos3" alt="이미지"
									src="/img/petSitterImg/petSitterPost1.jpg" />
							</div>
							<div>
								<span> 하루종일 같이 놀아주시고, 배식과 간식 먹는 사진과 즐겁게<br>
									    노는 사진을 많이 보내주셔서 안심하고 맡길 수 있어서 너무<br>
									    안심이 됐습니다.
								</span>
							</div>
						</div>
						<div class="swiper-slide">
							<div id="post1Image">
								<img class="pImg" name="pos3" alt="이미지"
									src="/img/petSitterImg/petSitterPost2.jpg" />
							</div>
							<div>
								<span> 하루종일 같이 놀아주시고, 배식과 간식 먹는 사진과 즐겁게<br>
									    노는 사진을 많이 보내주셔서 안심하고 맡길 수 있어서 너무<br>
									    안심이 됐습니다.
								</span>
							</div>
						</div>
						<div class="swiper-slide">
							<div id="post1Image">
								<img class="pImg" name="pos3" alt="이미지"
									src="/img/petSitterImg/petSitterPost1.jpg" />
							</div>
							<div>
								<span> 하루종일 같이 놀아주시고, 배식과 간식 먹는 사진과 즐겁게<br>
									    노는 사진을 많이 보내주셔서 안심하고 맡길 수 있어서 너무<br>
									    안심이 됐습니다.
								</span>
							</div>
						</div>
						<div class="swiper-slide">
							<div id="post1Image">
								<img class="pImg" name="pos3" alt="이미지"
									src="/img/petSitterImg/petSitterPost2.jpg" />
							</div>
							<div>
								<span> 하루종일 같이 놀아주시고, 배식과 간식 먹는 사진과 즐겁게<br>
									    노는 사진을 많이 보내주셔서 안심하고 맡길 수 있어서 너무<br>
									    안심이 됐습니다.
								</span>
							</div>
						</div>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				</div>

				<!-- Swiper JS -->
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.min.js"></script>

				<!-- Initialize Swiper -->
				<script>
					var swiper = new Swiper('.swiper-container', {
						slidesPerView : 3,
						spaceBetween : 30,
						pagination : {
							el : '.swiper-pagination',
							clickable : true,
						},
					});
				</script>
			</div>
		</div>
	</div>
	<div id="topMove">
		<a href="#header">
			<img alt="화살표" src="/img/petSitterImg/top.jpg" width=50px height=50px>
		</a>
	</div>
	<!-- footer 시작 -->
	<%@include file="/WEB-INF/view/common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>
