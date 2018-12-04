<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>main.jsp</title>
<link href="/css/commonCss.css" rel ="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="/css/petSitter.css" rel="stylesheet">
<style type="text/css">
	#gateway_con .gnbArea_left li a{
		box-sizing: content-box !important;
	}
</style>
</head>
<body>
<!-- header 시작 -->
<%@include file="/common/header.jsp"%>
<!-- header 끝-->

	<!-- 각자 화면 -->
	<div id="">
		<!-- header -->
		<div id="header">
			<!-- main -->
			<div id="logo">
				<a href="/petSitter.jsp"><img alt="이미지가 없습니다" src="/img/petSitterLogo2.jpg" width="200px;" /></a>
			</div>
			<div>
				<a></a>
			</div>
			
		</div>
	</div>
	
	<div id="body">
		<div class="dimpetSitting"></div>
		<div id="petSittingWord">
			<span>당신의 반려동물을 <br>
				  믿을 수 있는 펫시터가 <br>
			       대신 돌봐드립니다. </span> <br>
			<a href="#"><button id="reservation">
				펫시터 예약하러 가기
				<i class="icon-arrow-right icons"></i>
			</button></a>
		</div>
		<div id="petSittingHome">
			<img class="mainImg1" src="/img/petSitterImg/petSitterMain1.jpg" alt="당신의 반려동물을 돌봐드립니다."/>
		</div>
		
		<div id="petSittingFromHome">
			<div id="fromHome1">
				<img class="mainImg2" alt="펫시터 집으로 부르기" src="/img/petSitterImg/petSitterMain2.png" />
			</div>
			<div id="fromHome2">
				<span id="fromWord">펫시터 집으로 부르기</span><br>
				<p>도그메이트 펫시터가 집으로 찾아와 반려동물을 돌봐드려요.</p><br>
				<a><button id="detail1">자세히 알아보기<i class="icon-arrow-right icons"></i> </button></a>
			</div>
		</div>
		<div id="petSittingToHome">
			<div id="toHome1">
				<span id="fromWord">펫시터 집에 맡기기</span><br>
				<p>도그메이트 펫시터의 가정집에서 편안하고 자유롭게 지낼 수 있어요.</p><br>
				<a><button id="detail1">자세히 알아보기<i class="icon-arrow-right icons"></i> </button></a>
			</div>
			<div id="toHome2">
				<img class="mainImg2" alt="펫시터 집으로 부르기" src="/img/petSitterImg/petSitterMain3.jpg" />
			</div>
		</div>
		
		<div id="postscript">
			<div id="post">
				<div id="">
					<span>평점 높은 펫시팅 후기들을 확인해보세요.</span>
				</div>
			</div>
			<div id="postImage">
				<div id="pList">
					<div class="pNotice">
						<div id="post1Image">
							<img class="pImg" name="pos1" alt="이미지" src="/img/petSitterImg/petSitterPost1.jpg" />
						</div>
						<div>
							<span> 
							     하루종일 같이 놀아주시고, 배식과 간식 먹는 사진과 즐겁게 노는 사진을 <br> 
							     많이 보내주셔서 안심하고 맡길 수 있어서 너무 안심이 됐습니다.
							</span>
						</div>
					</div>
					<div class="pNotice">
						<div id="post1Image">
							<img class="pImg" name="pos2" alt="이미지" src="/img/petSitterImg/petSitterPost2.jpg" />
						</div>
						<div>
							<span> 
								하루종일 같이 놀아주시고, 배식과 간식 먹는 사진과 즐겁게 노는 사진을 <br> 
								많이	보내주셔서 안심하고 맡길 수 있어서 너무 안심이 됐습니다.
							</span>
						</div>
					</div>
					<div class="pNotice">
						<div id="post1Image">
							<img class="pImg" name="pos3" alt="이미지" src="/img/petSitterImg/petSitterPost3.jpg" />
						</div>
						<div>
							<span> 
								하루종일 같이 놀아주시고, 배식과 간식 먹는 사진과 즐겁게 노는 사진을 <br> 
								많이	보내주셔서 안심하고 맡길 수 있어서 너무 안심이 됐습니다.
							</span>
						</div>
					</div>
				</div>
					
				<div id="slide">
					<input type="radio" name="pos" id="pos1" checked>
					<input type="radio" name="pos" id="pos2" >
					<div id="slide_ul">
						<p class="pos">
							<label for="pos1"></label>
							<label for="pos2"></label>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer 시작 -->
<%@include file="/common/footer.jsp"%>
<!-- footer 끝 -->
		
</body>

</html>
