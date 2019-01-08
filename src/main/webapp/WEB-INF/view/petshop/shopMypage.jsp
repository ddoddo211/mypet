<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petShopCss.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#maintop{
		width: 1200px;
		margin: 0 auto;
	}
	
	#maintop p {
		font-size: 20px;
		font-weight: bold;
		padding-bottom : 20px;
		border-bottom: 1px solid #000;
		color : #000;
	}
	
	#mainmid{
		margin: 0 auto;
		width: 1200px;
		min-height: 606px;
	}
	
	#mypageMenu{
		margin-top: 10px;
	}
	
	.tab {
	  overflow: hidden;
	  border: 1px solid #ccc;
	  background-color: #f1f1f1;
	}

	.tab button {
	  background-color: inherit;
	  float: left;
	  border: none;
	  outline: none;
	  cursor: pointer;
	  padding: 14px 16px;
	  transition: 0.3s;
	}

	.tab button:hover {
	  background-color: #ddd;
	}
	
 	.tab button.active { 
 	  background-color: #ccc; 
 	} 
	
	.tabcontent {
	  display: none;
	  border: 1px solid #ccc;
	  border-top: none;
	}
	
	.orderList{
		width: 1200px;
		margin: 0 auto;
		overflow: hidden;
		margin-top: 5px;
		border-bottom: 1px solid #f1f1f1;
		border-top: 1px solid #f1f1f1;
	}
	
	.orderA{
		float:left;
		width: 200px;
		height: 150px;
		border-right: 1px solid #f1f1f1;
		display: flex;
	}
	
	.orderB{
		float:left;
		width: 600px;
		height: 150px;
		padding-left: 20px;
	}
	
	.orderC{
		float: left;
		width: 200px;
		height: 150px;
		display: flex;
	    justify-content: center;
	    align-items: center;
	    border-left: 1px solid #f1f1f1;
	    border-right: 1px solid #f1f1f1;
	}
	
	.orderD{
		float: left;
	    width: 150px;
	    height: 150px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    padding-left: 12px;
	}
	
	.orderCancle{
		padding: 5px;
		border-radius: 10px;
		background-color: #f1f1f1;
		cursor: pointer;
	}
	
	.orderName{
		height: 40px;
	    display: flex;
	    align-items: center;
	    margin-top: 10px;
	}
	
	.order{
		height: 15px;
		margin-top: 5px;
	}
	
	.prodName{
		font-size: 20px;
		font-weight: bold;
	}
	
	#topMove{
		position : fixed;
	    right: 250px;
	    bottom: 140px;
	}
	
	.orderE{
		float: left;
	    width: 150px;
	    height: 110px;
	    margin-top: 26px;
	    margin-left: 10px;
	}
	
	.orderBtn{
		width: 150px;
	    height: 30px;
	    text-align: center;
	}
	
	.decide{
		width: 60px;
		height: 25px;
	}
	
	.swap{
		width: 60px;
		height: 25px;
	}
	
	.return{
		width: 60px;
		height: 25px;
	}
	
	.orderWhite{
		width: 1200px;
	    height: 50px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    font-size: 20px;
	    font-weight: bold;
	}
	
	.orderChk{
		display: flex;
	    align-items: center;
	    justify-content: center;
	    height: 94px;
	}
	
	.prodRep{
	    cursor: pointer;
	}
	
	#myProd{
	    overflow: hidden;
	    margin-top: 10px;
	}
	
	.marketerLeft{
	    float: left;
	    width: 595px;
	}
	
	.marketerRight{
	    float: left;
	    width: 595px;
	    margin-left: 4px;
	}
	
	.marketerMenu{
	    text-align: center;
	    font-size: 15px;
	    background-color: #95c5ca;
	    color: white;
	    font-weight: bold;
	}
	
	.marketerInfo{
		border: 1px solid black;
		overflow: hidden;
		display: flex;
	    align-items: center;
	    justify-content: center;
	    margin-top: 10px;
	}
	
	.marketerList{
		float: left;
	    width: 275px;
	    height: 100px;
	}
	
	.marketerBtn{
		float: left;
	    width: 243px;
	    height: 98px;
	    display: flex;
	    align-items: center;
	}
	
	.maketUpDel{
		width: 150px;
	    height: 30px;
	    background-color: #dbdee4;
	    border: 1px solid #d0d9ec;
	    cursor: pointer;
	}
	
	.prodDelivery{
		width: 150px;
	    height: 30px;
	    background-color: #dbdee4;
	    border: 1px solid #d0d9ec;
	    cursor: pointer;
	}
	
	.menuName{
		font-size: 15px;
	}
	
	.marketName{
		font-size : 15px;
		font-weight: bold;
	}
	
	.marketerA{
		float: left;
	    width: 200px;
	    height: 100px;
	    display: flex;
	    margin-top: 6px;
	}
	
	.marketerB{
		float:left;
	}
	
	.marketerOrderList{
		border: 1px solid black;
		overflow: hidden;
		height: 130px;
		margin-top: 10px;
	}
	
	.orderProdInfo{
		width: 375px;
		height: 85px;
	}
	
	.marketerCre{
		width: 
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#orderInfo").show();	
		
		// 구매취소
		$(".orderCancle").click(function() {
			if (confirm("구매를 취소하시겠습니까?")){ 
				$("#ords_id").val($(this).parent().children(".ords_id").val());
				$(".cancleOrder").submit();
			}else{   
				return;
			}
		});
		
		// 보류 상품후기 이동
		$(".prodRep").click(function() {
			$("#prod_id").val($(this).parent().children(".ords_prod").val());
			$(".revOrder").submit();
		})
		
		// 구매확정
		$(".decide").click(function name() {
			if (confirm("구매를 확정하시면 포인트가 적립됩니다.")){ 
				$("#ords_decide").val($(this).parent().children(".ords_id").val());
				$(".decideOrder").submit();
			}else{   
				return;
			}
		})
		
		// 상품 수정/삭제 상품후기로 이동
		$(".maketUpDel").click(function() {
			$("#prod_id").val($(this).parent().children(".prod_id").val());
			$(".revOrder").submit();
		})
		
		// 배송완료로 변경
		$(".prodDelivery").click(function() {
			$("#market_id").val($(this).parent().children(".ords_id").val());
			$(".marketOrder").submit();
		})
		
		// 교환으로 변경
		$(".swap").click(function() {
			
			$("#swap_id").val($(this).parent().children(".ords_id").val());
			$(".swapOrder").submit();
		})
		
		$(".return").click(function() {
			$("#return_id").val($(this).parent().children(".ords_id").val());
			$(".returnOrder").submit();
		})
		
		
	})
	
</script>
</head>
<body>
<!-- 구매취소 -->
<form method="post" action="/shop/orderCancle" class="cancleOrder">
	<input type="hidden" id="ords_id" name="ords_id">
</form>

<!-- 구매확정 -->
<form method="post" action="/shop/orderDecide" class="decideOrder">
	<input type="hidden" id="ords_decide" name="ords_id">
</form>

<!-- 상품후기 보러가기 -->
<form method="get" action="/shop/prodRev" class="revOrder">
	<input type="hidden" id="prod_id" name="prod_id">
</form>

<!-- 주문자가 배송보내기 -->
<form method="post" action="/shop/prodDelivery" class="marketOrder">
	<input type="hidden" id="market_id" name="ords_id">
</form>

<!-- 교환  -->
<form method="post" action="/shop/swapUpdate" class="swapOrder">
	<input type="hidden" id="swap_id" name="ords_id">
</form>

<!-- 반품 -->
<form method="post" action="/shop/returnUpdate" class="returnOrder">
	<input type="hidden" id="return_id" name="ords_id">
</form>

<%@include file="/WEB-INF/view/petshop/petShopH.jsp"%>
	<div id="totalMain">
		<div id="maintop">
			<p>마이페이지</p>
		</div>
		
		<div id="mainmid">
			<div id="mypageMenu">
				<div class="tab">
				  <button class="tablinks active" onclick="openCity(event,'orderInfo')" id="buy">주문내역</button>
				  <button class="tablinks" onclick="openCity(event,'buyInfo')">구매내역</button>
				  <button class="tablinks" onclick="openCity(event,'cencleInfo')">취소/반품/교환</button>
				  <c:if test="${memVo.mem_shop == 2 }">
				  	 <button class="tablinks" onclick="openCity(event,'myProd')">등록 상품관리</button>
				  </c:if>
				</div>
			</div>
			<div id="orderInfo" class="tabcontent">
				<c:choose>
					<c:when test="${orderList.size() == 0 }">
						<div class="orderWhite">
							<span>주문 내역이 없습니다.</span>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${orderList }" var="list">
							<div class="orderList">
							  	<div class="orderA">
							  		<img src="${list.prod_pimg }" width="150" height="150">
							  	</div>
							  	<div class="orderB">
							  		<div class="orderName">
							  			<span class="prodName">${list.prod_name }</span>
							  		</div>
							  		<div class="order">
							  			<span>(구매수량${list.ords_qty }개)</span>
							  		</div>
							  		<div class="order">
							  			<span>구매가격 : </span><span>${list.ords_price }</span>
							  		</div>
							  		<div class="order">
							  			<span>구매날짜 : </span><span>${list.ords_date }</span>
							  		</div>
							  	</div>
							  	<div class="orderC">
							  		<div>
							  			<span>${list.ords_stat }</span>
							  		</div>
							  	</div>
							  	<div class="orderD">
								  	<input type="hidden" class="ords_id"  value="${list.ords_id }"/>
								  	<input type="button" class="orderCancle" value="구매취소">
							  	</div>
						  	</div>
					  	</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			
			<div id="buyInfo" class="tabcontent">
				<c:choose>
					<c:when test="${buyList.size() == 0 }">
						<div class="orderWhite">
							<span>구매한 내역이 없습니다.</span>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${buyList }" var="list">
					  		<div class="orderList">
							  	<div class="orderA">
							  		<img src="${list.prod_pimg }" width="150" height="150">
							  	</div>
							  	<div class="orderB">
							  		<div class="orderName">
							  			<span class="prodName">${list.prod_name }</span>
							  		</div>
							  		<div class="order">
							  			<span>(구매수량${list.ords_qty }개)</span>
							  		</div>
							  		<div class="order">
							  			<span>구매가격 : </span><span>${list.ords_price }</span>
							  		</div>
							  		<div class="order">
							  			<span>구매날짜 : </span><span>${list.ords_date }</span>
							  		</div>
							  	</div>
							  	<div class="orderC">
							  		<div>
							  			<span>${list.ords_stat }</span>
							  		</div>
							  	</div>
							  	<c:choose>
							  		<c:when test="${list.ords_stat == '배송완료' }">
							  			<div class="orderE">
									  		<div class="orderBtn">
										  		<input type="hidden" class="ords_id" value="${list.ords_id }"/>
										  		<input type="button" class="decide" value="구매확정">
									  		</div>
									  		<div class="orderBtn">
									  			<input type="hidden" class="ords_id" value="${list.ords_id }"/>
									  			<input type="button" class="return" value="반품" >
									  		</div>
									  		<div class="orderBtn">
									  			<input type="hidden" class="ords_id" value="${list.ords_id }"/>
									  			<input type="button" class="swap" value="교환" >
									  		</div>
							  			</div>
							  		</c:when>
							  		<c:when test="${list.ords_stat == '구매확정' }">
							  			<div class="orderE">
									  		<div class="orderChk">
										  		<input type="hidden" class="ords_prod" value="${list.ords_prod }"/>
										  		<input type="button" class="prodRep" value="상품후기쓰기">
									  		</div>
							  			</div>
							  		</c:when>
							  	</c:choose>
						  	</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			
			<div id="cencleInfo" class="tabcontent">
				<c:forEach items="${cancleList }" var="list">
					<div class="orderList">
						 <div class="orderA">
						 	<img src="${list.prod_pimg }" width="150" height="150">
						 </div>
						 <div class="orderB">
						 	<div class="orderName">
						 		<span class="prodName">${list.prod_name }</span>
						 	</div>
						 	<div class="order">
						 		<span>(구매수량 ${list.ords_qty }개)</span>
						 	</div>
						 	<div class="order">
						 		<span>구매가격 : </span><span>${list.ords_price }</span>
						 	</div>
						 	<div class="order">
						 		<span>구매날짜 : </span><span>${list.ords_date }</span>
						 	</div>
						 </div>
						 <div class="orderC">
						 	<div>
						 		<span>${list.ords_stat }</span>
						 	</div>
						 </div>
					</div>
				</c:forEach>
			</div>
			
			<div id="myProd" class="tabcontent">
			 	<div class="marketerLeft">
			 		<div class="marketerMenu">
			 			<p class="menuName">내가 등록한 상품목록</p>
			 		</div>
			 		
					<c:forEach items="${marketerList }" var="list">
						<div class="marketerInfo">
							<div class="marketerList">
								<div>
							 		<span class="marketName">${list.prod_name }</span>
								</div>
							 	<div>
							 		<span>(총 수량 ${list.prod_qty }개)</span>
							 	</div>
							 	<c:choose>
							 		<c:when test="${list.prod_sprice == 0}">
							 			<div>
									 		<span>등록가격 : </span><span>${list.prod_price }</span>
									 	</div>
							 		</c:when>
							 		<c:otherwise>
							 			<div>
									 		<span>등록가격 : </span><span>${list.prod_price }</span>
									 	</div>
										<div>
									 		<span>할인가 : </span><span>${list.prod_sprice }</span>
									 	</div>
							 		</c:otherwise>
							 	</c:choose>
								<div>
									<span>등록날짜 : </span><span>${list.prod_date }</span>
								</div>
							</div>
							<div class="marketerBtn">
								<input type="hidden" class="prod_id" name = "prod_id" value="${list.prod_id }"/>
								<input type="button" class="maketUpDel" value="수정/삭제 하러가기 ▶">
							</div>
						</div>
					</c:forEach>
				</div>
				
				<div class="marketerRight">
					<div class="marketerMenu">
			 			<p class="menuName">주문 받은 상품목록</p>
			 		</div>
					
					<c:forEach items="${marketOrderList }" var="list">
						<div class="marketerOrderList">
							<div class="marketerA">
								<img src="${list.prod_pimg }" width="100" height="100">
							</div>
							
							<div class="marketerB">
								<div class="orderProdInfo">
									<div>
										<span class="marketName">${list.prod_name }</span>
									</div>
								 	<div>
								 		<span>(수량 ${list.ords_qty }개)</span>
								 	</div>
								 	<div>
								 		<span>결제금액 : </span><span>${list.ords_price }</span>
								 	</div>
								 	<div>
										<span>구매날짜 : </span><span>${list.ords_date }</span>
									</div>
								</div>
								
								<div class="marketerC">
									<input type="hidden" class="ords_id" name = "ords_id" value="${list.ords_id }"/>
									<input type="button" class="prodDelivery" value="배송">
								</div>
							</div>
						</div>
					</c:forEach>
					
				</div>
				
				
			</div>
			
				
		</div>
	</div>
	<div id="topMove">
		<a href="#header">
			<img alt="화살표" src="/shopimg/high.png" width=50px height=50px>
		</a>
	</div>
	<script>
		function openCity(evt, cityName) {
		  var i, tabcontent, tablinks;
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }
		  document.getElementById(cityName).style.display = "block";
		  evt.currentTarget.className += " active";
		}
		
	</script>
<!-- footer 시작 -->
<%@include file="/WEB-INF/view/common/footer.jsp"%>
<!-- footer 끝 -->
</body>
</html>