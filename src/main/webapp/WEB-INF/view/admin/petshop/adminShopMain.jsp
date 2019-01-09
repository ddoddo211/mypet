<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petshopAdmin.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<head>
<style type="text/css">
	#mainMid{
		width: 1200px;
	    margin: 0 auto;
	    overflow: hidden;
	    height: 50px;
	    display: flex;
	    align-items: center;
	}
	
	.animalSelect{
		float:left;
		width: 130px;
	}
	
	.animalSel{
		width: 100px;
		height: 30px;
	}
	
	.menuSelect{
		float:left;
		width: 130px;
	}
	
	.menuSel{
		width: 100px;
		height: 30px;
	}
	
	#mainbottom{
		width: 1200px;
		margin: 0 auto;
	}
	
	.prodMenu{
		overflow: hidden;
	    background-color: #7b7676;
	    border: 1px solid #ffffff;
	    color: white;
	}
	
	.prodList{
		margin-top : 5px;
		border-top: 1px solid #f1f1f1;
		border-bottom : 1px solid #f1f1f1;
		overflow: hidden;
	}
	
	.prodId{
		float:left;
		width: 100px;
   		height: 50px;
   		display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	.prodName{
		float:left;
		width: 400px;
		height:50px;
		display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	.prodQty{
		float:left;
		width: 60px;
		height:50px;
		display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	.prodPrice{
		float:left;
		width: 100px;
		height: 50px;
		display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	.prodDel{
		float:left;
		width: 150px;
		height: 50px;
		display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	.delProd{
		width: 100px;
	    height: 30px;
	    background-color: #abbabf;
	    border: 1px solid #9ea4a7;
	    border-radius: 10px;	
	 }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$(".animalSel").change(function() {
			alert("확인");
		})
	})
</script>
</head>
<body>
<form  id="menuid" action="/shop/menuSelect" method="post" >
	<input type="hidden" id="menu_id" name="menu_id">
	<input type="hidden" id="dvs_id" name="dvs_id" value=${dvs_id }>
</form>
	

<%@include file="/WEB-INF/view/admin/petshop/adminShopH.jsp"%>
	
	<div id="mainMid">
		<div class="animalSelect">
			<select class="animalSel">
				<option>동물선택</option>
				<c:forEach items="${aniList }" var="list">
					<option value="${list.dvs_id }">${list.dvs_name }</option>
				</c:forEach>
			</select>
		</div>
		
		<div class="menuSelect">
			<select class="menuSel">
				<option>메뉴 선택</option>
			</select>
		</div>
	</div>
	
	<div id ="mainbottom">
		<div class="prodMenu">
			<div class="prodId">
				<span>상품ID</span>
			</div>
			<div class="prodName">
				<span>상품명</span>
			</div>
			<div class="prodQty">
				<span>수량</span>
			</div>
			<div class="prodQty">
				<span>판매량</span>
			</div>
			<div class="prodPrice">
				<span>상품가격</span>
			</div>
			<div class="prodDel">
				<span>삭제</span>
			</div>
		</div>
		
		<div class="prodList">
			<div class="prodId">
				<span>PROD1230</span>
			</div>
			<div class="prodName">
				<span>네츄럴코어 독 ECO4 슬림다운 오리고기 6kg</span>
			</div>
			<div class="prodQty">
				<span>1</span><span>개</span>
			</div>
			<div class="prodQty">
				<span>10</span><span>개</span>
			</div>
			<div class="prodPrice">
				<span>10000원</span>
			</div>
			<div class="prodDel">
				<input type="button" value="삭제" class="delProd">
			</div>
		</div>
		
	</div>
	
	
<!-- footer 시작 -->
<%@include file="../../common/footer.jsp"%>
<!-- footer 끝 -->
</body>
</html>