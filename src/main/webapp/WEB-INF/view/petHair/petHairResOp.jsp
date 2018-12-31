<%@page import="kr.co.mypet.common.model.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link  href="/css/petHair.css" rel="stylesheet"/>
<link  href="/css/petHairRev.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<%-- daum 지도 관련 api --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e12a015bea1b6b11bb0fd0d1e78cc44c&libraries=services,clusterer"></script>




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
		<div class="selOpTop">
			예약하기
		</div>
		
		<div class="testBlock">
			<img class="mySlides" src="/hairimg/testImg.jpg">
			<img class="mySlides" src="/hairimg/teststyle1.jpg">
			<img class="mySlides" src="/hairimg/teststyle2.png">
			<img class="mySlides" src="/hairimg/teststyle3.png">
			<img class="mySlides" src="/hairimg/teststyle3.png">
			
			<div class="radioBlock">
			<input type="radio" class="radiod" value="" name="has_id"/>
			<input type="radio" class="radiod" value="" name="has_id"/>
			<input type="radio" class="radiod" value="" name="has_id"/>
			<input type="radio" class="radiod" value="" name="has_id"/>
			<input type="radio" class="radiod" value="" name="has_id"/>
			</div>
		
		</div>
		
		<div class="testBtnBlock">
			<button class="w3-button w3-display-left" onclick="plusDivs(-3)">&#10094;</button>
			<button class="w3-button w3-display-right" onclick="plusDivs(+3)">&#10095;</button>
			
		</div>
		
	</div>
		
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->
	
	


</body>

<script>
var slideIndex = 1;
showDivs(slideIndex);


function plusDivs(n) {
  $(".mySlides").animate({left:'1200'},100);
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var y = document.getElementsByClassName("radiod");
  if (n > x.length) {slideIndex = 1} 
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none"; 
    y[i].style.display= "none";
  }
  x[slideIndex-1].style.display = "block";
  
  if(x[slideIndex]!=null){
  x[slideIndex].style.display = "block"; 
  }
  if(x[slideIndex+1]!=null){
  x[slideIndex+1].style.display = "block"; 
  }
  y[slideIndex-1].style.display = "inline"; 
  if(y[slideIndex]!=null){
  y[slideIndex].style.display = "inline"; 
  }
  
  if(y[slideIndex+1]!=null){
	  y[slideIndex+1].style.display = "inline"; 
	 }
  
}


</script>
</html>

























