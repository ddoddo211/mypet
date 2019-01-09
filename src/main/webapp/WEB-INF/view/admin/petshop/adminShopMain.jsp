<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petshopAdmin.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
		width: 115px;
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
		min-height: 528px;
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
	
	.prodMarketer{
		float:left;
		width: 150px;
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
		width: 80px;
	    height: 30px;
	    background-color: #7b7676;
	    border: 1px solid #7b7676;
	    color: white;
	    cursor: pointer;
	 }
	 
	 .pageInfo{
	 	width: 1200px;
	    overflow: hidden;
	    display: flex;
	    align-items: center;
	    height: 30px;
	 }
	 
	 .page{
	 	float: left;
	    margin-right: 10px;
	    font-size: 13px;
	 }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$(".animalSel").change(function() {
			if($(".animalSel").val() == 'a'){
				alert("동물을 선택해주세요");
				$("#menuid").submit();
			}else{
				$("#dvs_id").val($(this).val())
				$("#menuid").submit();
			}
		})
		
		$(".menuSel").change(function() {
			if($(".menuSel").val() == 'a'){
				alert("해당 메뉴를 선택해주세요");
			}else{
				$("#dvs_parent").val($(this).val())
				$("#page").val(1)
				$("#pageSize").val(10);
				$("#menuList").submit();
			}
		})
		
		$(".delProd").click(function() {
			if(confirm("상품을 삭제하시겠습니까?")){
				$("#prod_id").val($(this).parent().parent().children(".prodId").children(".pId").text());
				$("#prodDelete").submit();
			}else{
				return;
			}
		})
	})
</script>
</head>
<body>
<form  id="menuid" action="/shopAdmin/menuSelect" method="post" >
	<input type="hidden" id="dvs_id" name="dvs_id">
</form>

<form  id="menuList" action="/shopAdmin/menuList" method="get" >
	<input type="hidden" id="menu_id" name="dvs_id" value=${dvs_id }>
	<input type="hidden" id="dvs_parent" name="dvs_parent">
	<input type="hidden" id="page" name="page">
	<input type="hidden" id="pageSize" name="pageSize" value="10">
</form>

<form id="prodDelete" action="/shopAdmin/prodDelete" method="post">
	<input type="hidden" id="del_id" name="dvs_id" value=${dvs_id }>
	<input type="hidden" id="del_parent" name="dvs_parent" value=${dvs_parent }>
	<input type="hidden" id="page" name="page" value="1">
	<input type="hidden" id="pageSize" name="pageSize" value="10">
	<input type="hidden" id="prod_id" name="prod_id">
</form>
	

<%@include file="/WEB-INF/view/admin/petshop/adminShopH.jsp"%>
	
	<div id="mainMid">
		<div class="animalSelect">
			<select class="animalSel">
				<option value="a">동물선택</option>
				<c:forEach items="${aniList }" var="list">
					<option value="${list.dvs_id }" ${dvs_id==list.dvs_id ? 'selected' :''}>${list.dvs_name }</option>
				</c:forEach>
			</select>
		</div>
		
		<div class="menuSelect">
			<select class="menuSel">
				<option value="a">메뉴 선택</option>
				<c:forEach items="${menuList }" var="list"> 
					<option value="${list.dvs_id }" ${dvs_parent==list.dvs_id ? 'selected' :''}>${list.dvs_name }</option>
				</c:forEach>
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
			<div class="prodPrice">
				<span>판매가격</span>
			</div>
			<div class="prodMarketer">
				<span>판매자</span>
			</div>
			<div class="prodDel">
				<span>삭제</span>
			</div>
		</div>
		
		<c:forEach items="${prodList }" var="list">
			<div class="prodList">
				<div class="prodId">
					<span class="pId">${list.prod_id }</span>
				</div>
				<div class="prodName">
					<span>${list.prod_name }</span>
				</div>
				<div class="prodQty">
					<span>${list.prod_qty }</span><span>개</span>
				</div>
				<c:choose>
					<c:when test="${list.prod_sprice == 0 }">
						<div class="prodPrice">
							<span>${list.prod_price }원</span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="prodPrice">
							<span>${list.prod_sprice }원</span>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="prodMarketer">
					<span>${list.prod_mem }</span>
				</div>
				<div class="prodDel">
					<input type="button" value="삭제" class="delProd">
				</div>
			</div>
		</c:forEach>
		
		<c:if test="${prodList != null }">
			<div class="pageInfo">
				<ul class="pagination">
					<li class="page">
						<a href="/shopAdmin/menuList?dvs_id=${dvs_id }&dvs_parent=${dvs_parent }&page=1&pageSize=10"> 
							<span>&laquo;</span>
						</a>
					</li>
					<c:choose>
						<c:when test="${page != 1 }">
							<li class="page">
								<a href="/shopAdmin/menuList?dvs_id=${dvs_id }&dvs_parent=${dvs_parent }&page=${page-1 }&pageSize=10"> 
									<span>&lt;</span>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page">
								<a href="/shopAdmin/menuList?dvs_id=${dvs_id }&dvs_parent=${dvs_parent }&page=1&pageSize=10"> 
									<span>&lt;</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach begin="1" end="${prodSize}" var="i">
						<li class="page">
							<a href="/shopAdmin/menuList?dvs_id=${dvs_id }&dvs_parent=${dvs_parent }&page=${i }&pageSize=10">
								<span>${i}</span>
							</a>
						</li>
					</c:forEach>
					<c:choose>
						<c:when test="${page == prodSize }">
							<li class="page">
								<a href="/shopAdmin/menuList?dvs_id=${dvs_id }&dvs_parent=${dvs_parent }&page=${prodSize }&pageSize=10"> 
									<span>&gt;</span>
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class= "page">
								<a href="/shopAdmin/menuList?dvs_id=${dvs_id }&dvs_parent=${dvs_parent }&page=${page+1 }&pageSize=10"> 
									<span>&gt;</span>
								</a>
							</li>
						</c:otherwise>
					</c:choose>
					<li class="page">
						<a href="/shopAdmin/menuList?dvs_id=${dvs_id }&dvs_parent=${dvs_parent }&page=${prodSize }&pageSize=10">
							 <span>&raquo;</span>
						</a>
					</li>
				</ul>
			</div>
		</c:if>
	</div>
	
	
	
	
<!-- footer 시작 -->
<%@include file="../../common/footer.jsp"%>
<!-- footer 끝 -->
</body>
</html>