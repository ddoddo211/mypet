<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="/css/commonCss.css" rel ="stylesheet">
<link href="/css/petSitter.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Work+Sans" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 결재 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style type="text/css">
	#resMain{
		width : 1000px;
		overflow: hidden;
		margin : 0 auto;
	}
	#resTitle{
		width : 100%;
	}
	
	#resTitle1{
		border-bottom : 1px solid black;
	}
	
	.res  {
		font-size : 26px;
		font-weight: bold;
		font-family: 'Work Sans', sans-serif;
	}
	
	#resTitle2{
		margin : 0 auto;
		height : 250px;
		text-align: center;
		line-height: 250px;	
	}
	
	.resWord{
		font-size : 42px;
		font-family : 'Work Sans', sans-serif;
	}
	
	.resColor{
		color : red;
		font-weight: bold;
	}
	
	#resMid{
		border-top : 1px solid black;
		border-bottom : 1px solid black;
		overflow : hidden;
	}
	
	#resLeft{
		float : left;
		border-right : 1px solid black;
		margin-right : 10px;
		width : 55%;
	}
	
	#resRight {
		float : left;
		width : 35%;
	}
	
	.resInfoWord{
		font-size : 18px;
		font-family: 'Work Sans', sans-serif;
	}
	
	#resBottom{
		margin-top : 30px;
		text-align: center;
		overflow:hidden;
		height : 80px;
	}
	
	#resOk{
		float:left;
	}
	
	#resHome{
		margin-left : 20px;
		float:left;
	}
	
	.resBtn{
		padding : 5px 30px 5px 30px;
		font-size : 30px;
		font-family: 'Work Sans', sans-serif; 
		color : #fff;
		background-color: #b1b1b1;
		border-radius: 10px;
		box-shadow: 2px 2px 0px #868686;
		cursor: pointer;
	}
	
	.resBtn:active{
		padding : 5px 30px 5px 30px;
		font-size : 30px;
		font-family: 'Work Sans', sans-serif; 
		color : #fff;
		background-color: #2f2f2f;
		border-radius: 10px;
		box-shadow: -2px -2px 0px #868686;
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	function Home(){
		$("#resHomeBtn").click(function(){
			location.href="/sit/sitMain";
		});
	}	
	$(document).ready(function(){
		//im'port 결제모듈
		var IMP = window.IMP; // 생략가능
		IMP.init('imp09203705'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	});
	function Ok(){
		var totalPrice = ${nomalPrice*mypetCnt + addPrice*mypetCnt*timeChk };
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '펫시터 집으로 부르기', //물건이름
		    amount : totalPrice, // 물건가격
		    buyer_email : '${memVo.mem_id}',
		    buyer_name : '${memVo.mem_name}',
		    buyer_tel : '${memVo.mem_hp}',
		    buyer_addr : '${memVo.mem_addr}',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) { //결재 성공 후
		        var msg = '';
		        msg +='${memVo.mem_name}'+'님 선택하신';
		        msg += name+'  에 대한  ';
		        msg += rsp.paid_amount + '원 의 ';
		        msg += '결제가 완료되었습니다.  \n\n';
		        msg += '@ 결제완료   카드 승인번호 : ' + rsp.apply_num;
		    } else { // 결재 실패
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    
		    if(rsp.success){ //결재 성공 시 페이지 이동
		    	
		    	$("#pay_chk").val("0");
		    	$("#pay_price").val(totalPrice);
		    	$("#successFrm").submit();
		    }
		    
		});
	}
</script>
</head>
<body>
<form action="/sit/paymentSuccess" method="post" id="successFrm">
	<input type="hidden" id="pay_chk" name="pay_chk" />
	<input type="hidden" id="pay_price" name="pay_price" />
</form>
<%@include file="/WEB-INF/view/common/header.jsp"%>

<!-- 각자 화면 -->
	<div id="">
		<!-- header -->
		<div id="header">
			<!-- main -->
			<div id="logo">
				<a href="/petSitter.jsp"><img alt="이미지가 없습니다"
					src="/img/petSitterLogo2.jpg" width="200px;" /></a>
			</div>
			<div id="petSearch">
				<div id="word">
					<input type="text" id="search" value="검색어를 입력하세요" onfocus="this.value=''" style="color: #c1c1c1" />
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
			<%@include file="/WEB-INF/view/petSitter/petSitterMenu.jsp" %>
		</div>
		<div id="resMain">
			<form id="frm" action="/sit/payment" method="post">
<%-- 			<c:choose> --%>
<%-- 				<c:when test=""> --%>
					<div id="resTitle">
						<div id="resTitle1">
							<span class="res">예약 완료</span>
						</div>
						<div id="resTitle2">
							<span class="resWord">고객님의 <span class="resWord resColor">예약이 정상적으로 완료</span>되었습니다.</span>
						</div>
					</div>
					<div id="resMid">
						<div id="resLeft">
							<span class="res">⊙예약정보</span> <br><br>
							<span class="resInfoWord">
									▶예약일  <br>
									&nbsp;&nbsp;&nbsp;&nbsp;-. ${date }</span> <br>
							<span class="resInfoWord">	
									▶예약자 정보  <br>
									&nbsp;&nbsp;&nbsp;&nbsp;-. ${memVo.mem_name } / ${memVo.mem_hp } / ${memVo.mem_id }</span> <br>
							<span class="resInfoWord">
									▶반려동물 정보  <br>
								<c:forEach items="${list }" var="mypet">
									&nbsp;&nbsp;&nbsp;&nbsp;<span class="resInfoWord">-. ${mypet.myp_name } / <fmt:formatDate pattern = "yy.MM.dd" value = "${mypet.myp_birth}" /> / ${mypet.myp_gender } </span><br>
								</c:forEach>
							</span> <br>
						</div>
						<div id="resRight">
							<span class="res">⊙결제금액</span><br><br>
							<span class="resInfoWord">
								▶기본요금  <br>
								&nbsp;&nbsp;&nbsp;&nbsp;${nomalPrice } x ${mypetCnt }마리  = <fmt:formatNumber value="${nomalPrice * mypetCnt }" pattern="###,###"/>원  </span><br>
							<c:if test="${timeChk > 0}">
								<span class="resInfoWord">
									▶추가요금  <br>
									&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${addPrice }" pattern="###,###"/> x ${mypetCnt }마리 x ${timeChk }시간  = <fmt:formatNumber value="${addPrice * mypetCnt * timeChk }" pattern="###,###" />원 </span><br>
							</c:if>
							<span class="resInfoWord" style="font-weight: bold;">
								▶총 합계금액  <br>
								&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${nomalPrice*mypetCnt + addPrice*mypetCnt*timeChk }" pattern="###,###"/>원</span>
						</div>
					</div>
					</form>
					<div id="resBottom">
						<div style="margin : 0 auto; overflow:hidden; width:355px; height:55px;">
							<div id="resOk">
								<button class="resBtn" id="resOkBtn" onclick="Ok()">결제하기</button>
							</div>
							<div id="resHome">
								<button class="resBtn" id="resHomeBtn" onclick="Home()">홈으로</button>
							</div>
						</div>
					</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>