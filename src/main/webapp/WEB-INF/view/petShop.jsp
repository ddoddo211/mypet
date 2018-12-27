<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<link href="https://fonts.googleapis.com/css?family=Karla" rel="stylesheet">
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petShopCss.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
	#maintop{
		width: 1200px;
		height : 300px;
		margin: 0 auto;
	}
	
	.maintop-left{
		width : 907px;
		height:280px;
		float: left;
		position:relative;
	}
	
	.maintop-right{
		width : 270px;
		background-color : #ff8800;
		float: left;
		text-align: center;
		height: 280px;
	}
	
	.petSearch{
		width: 150px;
	    height: 20px;
	    font-size: 13px;
	    color: #0e135e;
	    border: 1px solid black;
	    border-radius: 5px;
	    margin-top: 5px;
	    font-family: 'Karla', sans-serif;
	}
	
	.brdSearch{
		width: 150px;
	    height: 20px;
	    font-size: 13px;
	    color: #0e135e;
	    border: 1px solid black;
	    border-radius: 5px;
	    margin-top: 5px;
	    font-family: 'Karla', sans-serif;
	}
	
	p {
		font-size: 20px;
		font-weight: bold;
	}
	
	#mainmid{
		width: 1200px;
		border: 1px solid #eee;
		margin:0 auto;
		margin-bottom: 10px;
	}
	
	.bestP{
		width: 1200px;
		margin: 0 auto;
	}
	
	.bestP p{
		text-align:center;
		font-size:30px;
		font-weight:normal;
		padding-bottom:15px;
	}
	#mainmid > ul {
		margin:0 auto;
		width:1200px;
		padding-top:20px;
	}
	#mainmid > ul > li {
		float:left;margin-left:10px;margin-top:15px;
		width:250px;height:270px;margin-bottom:20px;
		display:flex;justify-content:center;flex-direction:column;
	}
	#mainmid > ul > li > a{text-align:center;margin:0 auto;font-size:20px;margin-top:10px;}
	#mainmid > ul > li:first-child{margin-left:90px;}
	#mainmid > ul > li:nth-child(5){margin-left:90px;}
	#mainmid > ul > li:nth-child(9){margin-left:90px;}
	
	.shopnotice{
		list-style: disc;
		margin-left: 20px;
		padding: 15px;
	}
	.shopnotice > li{
		padding: 5px 0px 5px 0px;
	}
	
	.noticebtn{
		margin-left:20px;
		width: 100px;
		height: 70px;
		border: 1px solid #000;
		color:#000;
		padding:10px;
		transition: 0.5s;
		border-radius:5px;
	}
	.noticebtn:hover{transion:0.5s;background-color:#000;color:#fff;}
	
	.productBtn {
		width:100px;height:70px;padding:3px;border-radius:5px;font-size:15px;
		clear:left;
	}
	.productBtn {
		width:1200px;height:50px;margin:0 auto;text-align:center;padding-top:50px;
	}
	.productBtn > a {		
		display:block;width:100px; height:30px; border:1px solid #000;
		border-radius:5px; line-height:30px;text-align:center;margin:0 auto;
	}
	
	.search{
		width: 200px;
		margin: 0 auto;
	}
	
	.saryoSearch{
		background-color: #ff8800;
		border: 1px solid black;
		border-radius:5px;
		font: black;
		background-color: white;
		color: #0e135e;
		font-size: 13px;
		padding: 1.5px 34px 1.5px 34px;
		font-family: 'Karla', sans-serif;
	}
	
	.saryogo{
		padding-right: 4px;
		margin-top: 4px;
	}
</style>
<script type="text/javascript">
	
	$(document).ready(function() {
		
		if($("#searchPet").val() == 'ani'){
			$("#brdSearch").prop("disabled",true);
		}
		
		$("#searchPet").change(function() {
			if($("#searchPet").val() == 'ani'){
				$("#dvs_id").val($("#searchPet").val());
				$("#brdSearch").val("brd").prop("selected",true);
				$("#frm").submit();
			}else{
				$("#brdSearch").prop("disabled",false);
				$("#dvs_id").val($("#searchPet").val());
				$("#frm").submit();
			}
		})
		
		$(".saryoSearch").click(function() {
			if($("#searchPet").val() == 'ani'){
				alert("품종을 선택해주세요");
			}else{
				if($("#brdSearch").val()== 'brd'){
					alert("브랜드를 선택해주세요")
				}else{
					location.href = "/shop/petShopList?dvs_id=${dvs_id }&dvs_parent=${dvs_parent }&value="+$("#brdSearch").val();
				}
			}
		})

	});
	
</script>
</head>

<body>
<!-- 사료검색에서 동물 선택시 이동 -->
<form action="/shop/saryoSearch" id="frm">
	<input type="hidden" id="dvs_id" name="dvs_id">
</form>
		<%@include file="/WEB-INF/view/petshop/petShopH.jsp"%>
		
		<div id="maintop">
			<div class="maintop-left">
				<c:forEach items="${snotList }" var="list">
					<a href="/shop/shopNoticeDetail?snot_id=${list.snot_id }"><img src="${list.snot_pimg }" class="mySlides" width="907" height="280"></a>
				</c:forEach>
				<script type="text/javascript">
					var slideIndex = 0;
					carousel();
					
					function carousel() {
					 var i;
					 var x = document.getElementsByClassName("mySlides");
					 for (i = 0; i < x.length; i++) {
					   x[i].style.display = "none"; 
					 }
					 slideIndex++;
					 if (slideIndex > x.length) {slideIndex = 1} 
					 x[slideIndex-1].style.display = "block"; 
					 setTimeout(carousel, 4000); // Change image every 2 seconds
					}
				</script>
			</div>
			
			<div class="maintop-right">
				<img alt="간편 사료 찾기" src="/shopimg/shopsaryo.png" width="190">
				<div class="search">
					<form method="get" action="/shop/petShopList">
						<select class="petSearch" id = "searchPet" name="searchPet">
							<option value="ani">품종선택</option>
							<c:forEach items="${aniList }" var="list">
								<c:choose>
									<c:when test="${dvs_id==list.dvs_id }">
										<option value="${list.dvs_id }" selected="selected">${list.dvs_name }</option>
									</c:when>
									<c:otherwise>
										<option value="${list.dvs_id }">${list.dvs_name }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
						<br/>
						<select class="brdSearch" name="brdSearch" id="brdSearch">
							<option value="brd">브랜드선택</option>
							<c:forEach items="${brdList }" var="list">
								<option value="${list.dvs_id }">${list.dvs_name }</option>
							</c:forEach>
						</select>
						<br>
						<div class="saryogo">
							<a class="saryoSearch">사료 검색하기</a>
<!-- 							<input type="submit" id="saryoSearch" name="saryoSearch" class="saryoSearch"/> -->
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<div class = "bestP">
			<p>베스트 상품</p>
		</div>
		<div id="mainmid">
				<ul class="mainmid_ul">
					<li>
						<a href="/shop/prodDetail">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="/shop/prodDetail">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="/shop/prodDetail">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="/shop/prodDetail">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="/shop/prodDetail">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="/shop/prodDetail">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="/shop/prodDetail">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="/shop/prodDetail">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="/shop/prodDetail">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="/shop/prodDetail">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="/shop/prodDetail">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
					<li>
						<a href="/shop/prodDetail">
						<img src="http://placehold.it/250x250">
							<span>상품명</span>
						</a>
					</li>
				</ul>
				<br>
				<div class="productBtn">
					<a href="#" onclick="return false;">더보기</a>
				</div>
		</div>
	</div>
	
<!-- footer 시작 -->
<%@include file="/WEB-INF/view/common/footer.jsp"%>
<!-- footer 끝 -->
		
</body>

</html>
