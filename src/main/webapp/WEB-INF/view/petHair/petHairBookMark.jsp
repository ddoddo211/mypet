<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link  href="/css/petHair.css" rel="stylesheet"/>
<link  href="/css/petHairMyPage.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>




<%-- 스크립트 위치 --%>

<script type="text/javascript">
	$(document).ready(function(){
		
		
	});

</script>

</head>
<body>
	<!-- header 시작 -->
	<%@include file="../common/header.jsp"%>
	<!-- header 끝-->
	
	<!-- header 시작 -->
	<%@include file="petHairHeader.jsp"%>
	<!-- header 끝-->
	
	<%-- 전체 틀 div --%>
	<div id="mainmid">
		
		<%-- mypage 전용 left 메뉴 --%>
		<%@include file="petMypageLeft.jsp"%>
		<%-- left menu 끝 --%>
		
		<%-- main content 부분 --%>
		<div class="mpMain">
			<p>즐겨찾기 카페 목록</p>
			
			<%-- bookmark 리스트 --%>
			<div class="bmList">
				<div class="bmImg">
					<img src="/hairimg/testImg.jpg"/>
				</div>
				<div class="bmRight">
					<div class="bmName">
						가게이름
					</div>
					<div class="bmAddr">
						가게주소
					</div>
				</div>
			</div>
			<div class="bmList">
				<div class="bmImg">
					<img src="/hairimg/testImg.jpg"/>
				</div>
				<div class="bmRight">
					<div class="bmName">
						가게이름
					</div>
					<div class="bmAddr">
						가게주소
					</div>
				</div>
			</div>
			<div class="bmList">
				<div class="bmImg">
					<img src="/hairimg/testImg.jpg"/>
				</div>
				<div class="bmRight">
					<div class="bmName">
						가게이름
					</div>
					<div class="bmAddr">
						가게주소
					</div>
				</div>
			</div>
			  
		
		</div>
		
	</div>
			
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
	
	


</body>


</html>
























