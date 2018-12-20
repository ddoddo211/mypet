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
	
	#mainbottom > .bascketBuy > a{
		display:block;
		padding: 10px;
		background-color: #f1f1f1;
		border: 1px solid gray;
		font-size: 15px;
		width: 60px;
	}
	
	#mainbottom .basketDel{
		float : left;
		margin-left: 20px;
	}
	
	#mainbottom > .basketDel > form > #submit{
		padding: 10px;
	    background-color: #f1f1f1;
	    border: 1px solid gray;
	    width: 82px;
	}
</style>
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
				<tr>
					<td>
						<input type="checkbox" />
					</td>
					<td width="50" height="50">
						<a href="/shop/prodDetail?prod_id=${list.prod_id }">
							<img src="/shopimg/facebook.png" width="50" height="50">
						</a>
					</td>
					<td><a href=#>상품명</a></td>
					<td>5000원</td>
					<td>2개</td>
					<td>10000원</td>
				<tr>
			</tbody>
		</table>
		<div class = "totalPrice">
			<span>총 주문 금액 :</span>
			<span>　10000원</span>
		</div>
	</div>
	
	<div id ="mainbottom">
		<div class="estimate">
			<a href="#">견적서 출력</a>
		</div>
		<div class="bascketBuy">
			<a>주문하기</a>
		</div>
		<div class="basketDel">
			<form>
				<input type="submit" value="삭제" id="submit">
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