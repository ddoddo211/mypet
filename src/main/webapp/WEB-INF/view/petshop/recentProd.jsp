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
		min-height: 575px;
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
		padding: 5px; */
		background-color: #f1f1f1;
		border: 1px solid;
		border-radius: 5px;
	} 
</style>
<script type="text/javascript">
	function bulListHtml(page,bul_brd,search,bulText) {
		var pageSize = 10;
	
		$.ajax({
			url : "/bulListHtml",
			type : "get",
			data : "page=" + page + "&pageSize=" + pageSize + "&bul_brd="+bul_brd+"&search="+search+"&bulText="+bulText,
			success : function(dt) {
				console.log(dt);
				$("#lastList").html(dt);
				bulPaginationHtml(page,bul_brd,search,bulText);
			}
		});
	}
	
	
	function bulPaginationHtml(page,bul_brd,search,bulText) {
		var pageSize = 10;
		
		$.ajax({
			url : "/bulPaginationHtml",
			type : "get",
			data : "page="+page+"&pageSize="+pageSize+ "&bul_brd="+bul_brd+"&search="+search+"&bulText="+bulText,
			success : function(dt) {
				console.log(dt);
				$(".pagination").html(dt);
			}
		});
		
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/view/petshop/petShopH.jsp"%>
	<div id="maintop">
		<p>최근 본 상품</p>
	</div>
	
	<div id="mainmid">
		<table>
			<thead>
				<tr>
					<th width="950" height="30" colspan="2">상품 기본정보</th>
					<th width="150">가격</th>
					<th width="100">삭제</th>
				</tr>
			</thead>
			<tbody id="lastList">
				<tr>
					<td width="80" height="70">
						<a href="/shop/prodDetail">
							<img src="" width="80" height="70">
						</a>
					</td>
					<td><a href="/shop/prodDetail"></a></td>
					<td>원</td>
					<td><a href="#" class="delete">삭제</a></td>
				<tr>
			</tbody>
		</table>
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