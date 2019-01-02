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

<%-- im'port 결제 스크립트 --%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>



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
		var selDate="";
		
		//datepicker select event 
		$("#datepicker").datepicker({
			  onSelect: function(dateText) {
				  selDate = dateText;
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
		
		//예약하기 클릭 event
		$("#resBtn").click(function(){
			var name_price = $(':input[name=has_id]:radio:checked').val();
			alert(name_price);
			alert(selDate);
			
			var selTime = $(':input[name=selRes]:radio:checked').val();
			alert(selTime);

			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 111,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		});
		
		//im'port 결제모듈
		var IMP = window.IMP; // 생략가능
		IMP.init('imp09203705'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		
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
		
			<c:choose>
				<c:when test="${styleList!=null }">
					<c:forEach items="${styleList }" var="sl">
						<img class="mySlides" src="/hairimg/${sl.pts_img }">
					
					</c:forEach>
						<div class="radioBlock">
					<c:forEach items="${styleList }" var="sl">
							<input type="radio" class="radiod" value="${sl.pts_name}/${sl.pts_price}" name="has_id"/>
							
					</c:forEach>
						</div>
						<div class="labelBlock">
					<c:forEach items="${styleList }" var="sl">
						<div class="label" >${sl.pts_name}/${sl.pts_price }원</div>
					</c:forEach>
						</div>
				</c:when>
				<c:otherwise>
					등록된 펫 스타일이 없습니다 
				</c:otherwise>
			</c:choose>
		
			
		
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
  if (n < 1) {slideIndex = 1} ;
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

























