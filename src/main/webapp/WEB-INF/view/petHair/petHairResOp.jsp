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
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


<%-- daum 지도 관련 api --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e12a015bea1b6b11bb0fd0d1e78cc44c&libraries=services,clusterer"></script>




<%-- 스크립트 위치 --%>

<script type="text/javascript">

		
	$(document).ready(function(){
		
		var today = new Date();
		var mm = today.getMonth()+1;
		var dd = today.getDate()+1;
		var yyyy = today.getFullYear();
		
		var mindt = yyyy+"-"+mm+"-"+dd;
		
		//datepicker
		$( function() {
		    $( "#datepicker" ).datepicker({
		    		dateFormat:"yy-mm-dd",
		    		minDate:mindt,
		    		maxDate:"+10D"
		    });
		 } );
		
		var has_id=$("#hiddenId").val();
		
		//datepicker select event 
		$("#datepicker").datepicker({
			  onSelect: function(dateText) {
				  //select event 
				   $(".resPickBlock").hide();
				  $(".resPickBlockR").hide();
				  
				  $.ajax({
						url : "/hair/resDate",
						type : "get",
						data : "date=" + dateText+"&has_id="+has_id,
						success : function(dt) {
							$(".resPickContainer").html(dt);
						}
					});
				  
				  $(".resPickBlock").show();
				  $(".resPickBlockR").show();
				  
			  }
			});
		
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
	
	<input type="hidden" value="${has_id }" id="hiddenId"/>
	
	<%-- 전체 틀 div --%>
	<div id="mainmid">
		<div class="selOpTop">
			예약하기
		</div>
		
		<p>스타일 선택</p>
		
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
			
			<div class="labelBlock">
			<div class="label" >oo컷 - 35000원</div>
			<div class="label" >oo컷 - 35000원</div>
			<div class="label" >oo컷 - 35000원</div>
			<div class="label" >oo컷 - 35000원</div>
			<div class="label" >oo컷 - 35000원</div>
			</div>
		
		</div>
		
		<div class="testBtnBlock">
			<button class="w3-button w3-display-left" onclick="plusDivs(-3)">&#10094;</button>
			<button class="w3-button w3-display-right" onclick="plusDivs(+3)">&#10095;</button>
			
		</div>
		
		
		<p>날짜 / 시간 선택</p>
		<div class="tdblock">
			<div id="datepicker"></div>
		</div>
		
	<div class="resPickContainer">	
		<!-- 예약자리 -->
	</div>
		
		<div id="btnBlock">
		<input type="button" id="resBtn" value="예약결제"/>
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

//무브버튼 눌렀을때 
function showDivs(n) {
  var i;
  x = new Array();
  var x = document.getElementsByClassName("mySlides");
  y = new Array();
  var y = document.getElementsByClassName("radiod");
  z = new Array();
  var z = document.getElementsByClassName("label");
  if (n > x.length) {slideIndex = 1} 
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none"; 
    y[i].style.display= "none";
    z[i].style.display= "none";
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
  
  z[slideIndex-1].style.display = "inline"; 
  
  if(z[slideIndex]!=null){
  	z[slideIndex].style.display = "inline"; 
  }
  
  if(z[slideIndex+1]!=null){
	  z[slideIndex+1].style.display = "inline"; 
  }
  
}


</script>
</html>

























