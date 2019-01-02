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
			//상품 이름과 가격합쳐놓은거
			var name_price = $(':input[name=has_id]:radio:checked').val();
			//상품 이름 분리
			var strArray = "";
			
			//받아온값이 있을때만
			if(name_price!=null){
				strArray = name_price.split("/");
			} else {
				alert("스타일을 선택해주세요");
				return;
			}
			
			var selName = strArray[0];
			var selPrice = strArray[1];
			
			
			console.log("상품이름 : "+selName);
			console.log("상품가격 : "+selPrice);
			
			console.log("선택한 날짜 : "+selDate);
			
			var selTime = selTime = $(':input[name=selRes]:radio:checked').val();
			
			if(selTime==null){
				alert("날짜 / 시간을 선택해주세요");
				return;
				
			} 
			
			console.log("선택 시간 : "+selTime);

			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : selName,
			    amount : selPrice,
			    buyer_email : '${memVo.mem_id}',
			    buyer_name : '${memVo.mem_name}',
			    buyer_tel : '${memVo.mem_hp}',
			    buyer_addr : '${memVo.mem_addr}',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '';
			        msg +='${memVo.mem_name}'+'님 선택하신';
			        msg += selName+'  에 대한  ';
			        msg += rsp.paid_amount + '원 의 ';
			        msg += '결제가 완료되었습니다.  \n\n';
			        msg += '@ 결제완료   카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			    
			    if(rsp.success){
			    	$("#hres_pts").val(
			    		strArray[2]
			    	);
			    	
			    	$("#hres_date").val(
			    		selDate	
			    	);
			    	
			    	$("#hres_price").val(
			    		selPrice
			    	);
			    	
			    	$("#hres_time").val(
			    		selTime		
			    	);
			    	
			    	$("#insrfrm").submit();
			    	
			    	
			    }
			    
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
	
	<%--미용실 id 참조용 input hidden --%>
	<input type="hidden" value="${has_id }" id="hiddenId"/>
	
	<%-- 예약 완성용 예약 id --%>
	<form action="/hair/insertRev" method="post" id="insrfrm">
		<input type="hidden" name="hres_pts" id="hres_pts" />
		<input type="hidden" name="hres_has" id="hres_has" value="${has_id }"/>
		<input type="hidden" name="hres_mem" id="hres_mem" value="${memVo.mem_id }"/>
		<input type="hidden" name="hres_date" id="hres_date" />
		<input type="hidden" name="hres_price" id="hres_price" />
		<input type="hidden" name="hres_time" id="hres_time" />
	</form>
	
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
							<input type="radio" class="radiod" value="${sl.pts_name}/${sl.pts_price}/${sl.pts_id}" name="has_id"/>
							
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

























