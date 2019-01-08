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
		min-height: 596px;
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
		cursor: pointer;
	} 
	
	.prodId{
		display: none;
	}
</style>
<script type="text/javascript">

	$(document).ready(function() {
		$(".delete").click(function() {
			var chk = $(this).parent().parent().children()[0].innerHTML;
			$("#prod_id").val(chk);
			$("#fm").submit();
		})
	})
	
</script>
<title>Insert title here</title>
</head>
<body>
<form id="fm" action="/shop/recentProdDel">
	<input type="hidden" name = "prod_id" id="prod_id">
</form>

	<%@include file="/WEB-INF/view/petshop/petShopH.jsp"%>
	<div id="maintop">
		<p>최근 본 상품</p>
	</div>
	
	<div id="mainmid">
		<table>
			<thead>
				<tr>
					<th class="prodId">상품아이디 숨기기</th>
					<th width="950" height="30" colspan="2">상품 기본정보</th>
					<th width="150">가격</th>
					<th width="100">삭제</th>
				</tr>
			</thead>
			<tbody id="recpList">
				<c:choose>
					<c:when test="${memVo == null }">
						<tr>
							<td colspan="5">
								<span>로그인 정보가 없습니다.</span>
							</td>
						<tr>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${recpList.size() == 0 }">
								<tr>
									<td colspan="5">
										<span>최근 본 상품이 존재 하지 않습니다.(최근 본 상품 저장기간은 7일)</span>
									</td>
								<tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${recpList }" var="list">
									<tr>
										<td class="prodId">${list.prod_id }</td>
										<td width="80" height="70">
											<a href="/shop/prodDetail?prod_id=${list.prod_id}">
												<img src="${list.prod_pimg }" width="80" height="70">
											</a>
										</td>
										<td><a href="/shop/prodDetail?prod_id=${list.prod_id}">${list.prod_name }</a></td>
										<c:choose>
											<c:when test="${list.prod_sprice == 0 }">
												<td>${list.prod_price }원</td>
											</c:when>
											<c:otherwise>
												<td>${list.prod_sprice }원</td>
											</c:otherwise>
										</c:choose>
										<td><a class="delete">삭제</a></td>
									<tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
	<!-- footer 시작 -->
	<%@include file="/WEB-INF/view/common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>