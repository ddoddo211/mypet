<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petShopCss.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
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
		width: 1200px;
		margin: 0 auto;
		margin-top: 20px;
	}
	table {
		border: 1px solid #f2f2f2;
	}
	table thead{
		background: #f1f1f1;
		font-size: 15px;
	}
	
	table tbody{
		font-size: 15px;
	}
	
	table tbody tr {
		text-align: center;
	}
	
	table tbody tr td .delete{
		padding: 5px;
		background-color: #f1f1f1;
		border: 1px solid;
		border-radius: 5px;
	}
	
	.totalPrice{
		margin-top:20px;
		border: 1px solid #f2f2f2;
		display :flex;
		align-items:center;
		justify-content:center;
		height: 55px;
	}
	
	.totalPrice span{
		font-size: 15px;
		font-weight: bold;
	}
	
	#mainbottom{
		width: 1200px;
		margin:0 auto;
		margin-top:20px;
		min-height: 575px;
	}
	
	#mainbottom .estimate{
		float:left;
		width: 1000px;
	}
	#mainbottom > .estimate > a{
		display:block;
		padding: 10px;
		background-color: #f1f1f1;
		border: 1px solid gray;
		font-size: 15px;
		width: 85px;
		
	}
	#mainbottom .bascketBuy{
		float:left;
	}
	
	#mainbottom > .bascketBuy > #orderGo > #cartBuy{
		display:block;
		padding: 10px;
		background-color: #f1f1f1;
		border: 1px solid gray;
		font-size: 15px;
		width: 82px;
	}
	
	#mainbottom .basketDel{
		float : left;
		margin-left: 20px;
	}
	
	#mainbottom > .basketDel > #cartDel > #cartDelBtn{
		padding: 10px;
	    background-color: #f1f1f1;
	    border: 1px solid gray;
	    width: 82px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#cartDelBtn").click(function() {
			var values = [];
			$("input[name=chkbox]:checked").each(function(i){
				values.push($(this).val());
			});
			if(values.length == 0){
				alert("삭제할 상품이 없습니다.")
			}else{
				$("#cart_ids").val(values);
				$("#cartDel").submit();
			}
		})
		
		$("#cartBuy").click(function() {
			var values = [];
			$("input[name=chkbox]:checked").each(function(i){
				values.push($(this).val());
			});
			if(values.length == 0){
				alert("주문하실 상품을 선택 해주세요.")
			}else{
				$("#cart_idss").val(values);
				$("#orderGo").submit();
			}
			
		})
		
		$(".chkbox").change(function() {
			var totalPrice = 0;
			$("input[name=chkbox]:checked").each(function(i){
				totalPrice += parseInt($(this).parent().parent(".orderList").children()[5].innerHTML);
			});
			var commaPirce = commify(totalPrice);
			//주문할때 보내는 가격
			$("#totalPrice").val(totalPrice);
			// 컴마찍어서 보여주는 가격
			$(".chkPrice").text(commaPirce);
		})
		
	})
	
	// 천단위마다 콤마
	function commify(n) {
		  var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
		  n += '';                          // 숫자를 문자열로 변환

		  while (reg.test(n))
		    n = n.replace(reg, '$1' + ',' + '$2');

		  return n;
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/view/petshop/petShopH.jsp"%>
	<div id="maintop">
		<p>장바구니</p>
	</div>
	
	<div id="mainmid">
		<table>
			<thead>
				<tr>
					<th width="50">선택</th>
					<th width="750" height="30" colspan="2">상품 기본정보</th>
					<th width="150">가격</th>
					<th width="100">수량</th>
					<th width="150">금액</th>
				</tr>
			</thead>
			<tbody id="lastList">
				<c:choose>
					<c:when test="${cartList == null || cartList.size() == 0}">
						<tr>
							<td colspan="6">장바구니 등록한 상품이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${cartList }" var="list">
							<tr class="orderList">
								<td>
									<input type="checkbox" value="${list.cart_id }" name="chkbox" class="chkbox"/>
								</td>
								<td width="50" height="50">
									<a href="/shop/prodDetail?prod_id=${list.cart_prod }">
										<img src="${list.prod_pimg }" width="50" height="50">
									</a>
								</td>
								<td><a href="/shop/prodDetail?prod_id=${list.cart_prod }">${list.prod_name }</a></td>
								<c:choose>
									<c:when test="${list.prod_sprice == 0 }">
										<td>${list.prod_price }</td>
									</c:when>
									<c:otherwise>
										<td>${list.prod_sprice }</td>
									</c:otherwise>
								</c:choose>
								<td>${list.cart_qty }</td>
								<td>${list.cart_price }</td>
							<tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class = "totalPrice">
			<span>총 주문 금액 : </span>&nbsp
			<span class="chkPrice">0</span><span>원</span>
		</div>
	</div>
	
	<div id ="mainbottom">
		<div class="estimate">
			<a href="#">견적서 출력</a>
		</div>
		<div class="bascketBuy">
			<form method="get" action="/shop/prodOrder" id="orderGo">
				<input type="hidden" id="totalPrice" name="totalPrice"/>
				<input type="hidden" id="cart_idss" name="cart_ids"/>
				<input type="button" value="주문하기" id="cartBuy">
			</form>
		</div>
		<div class="basketDel">
			<form method="post" id="cartDel" action="/shop/cartDel">
				<input type="hidden" id="cart_ids" name="cart_ids">
				<input type="button" value="삭제" id="cartDelBtn">
			</form>
		</div>
	</div>
	
	<div id="pagenation">
		<div id="pagenation1" >
			<ul class="pagination" id="paginationHtml">  
				<!-- 페이징 아작스 처리한곳 -->
			</ul>
		</div>
	</div>
	<!-- footer 시작 -->
	<%@include file="/WEB-INF/view/common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>