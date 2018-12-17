<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petShopCss.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
	html,body{
		height: 100%;
	}
	
	#maintop{
		width: 1200px;
		margin: 0 auto;
	}
	
	#maintop p {
		font-size: 20px;
		font-weight: bold;
		padding-bottom : 20px;
		color : #000;
		border-bottom: 1px solid #000;
	}
	
	#mainmid {
		width : 1200px;
		margin: 0 auto;
		overflow: hidden;
		min-height: 658px;
	}
	
	.mainleft {
		width: 21%;
		min-height: 658px;
		float: left;
		background-color: #f1f1f1;
	}
	
	#mainmid .mainleft .listSearch{
		margin-bottom: 10px;
   		border-bottom: 1px solid darkgray;
	    height: 52px;
    	text-align: center;
    	padding-top: 15px;
	}
	
	#mainmid .mainleft .listSearch a{
		width: 34px;
   		height: 37px;
    	padding: 0px 18px 6px 5px;
    	background: url(http://openimage.interpark.com/.ui/pet/common/pet_searchIcon.png)no-repeat;
	}
	
	#shopSearch{
		width: 152px;
	    height: 33px;
	    padding: 0 36px 0 10px;
	    border: 1px solid #e3e6e5;
	    font-size: 12px;
	    line-height: 33px;
	    color: #555;
	    border-radius: 50px;
	}
	
	.listMenu{
		text-align: center;
	}
	
	.listMenu p {
		font-size : 25px;
		font-weight: bold;
		color : #000;
		margin-bottom: 10px;
	}
	
	.listMenu ul li{
		padding-top: 5px;
		padding-bottom: 10px;
	}
	.listMenu ul li a{
		color : #000;
		font-size:15px;
		border-bottom: 1px solid;
	}
	
	.mainright{
		width: 79%;
		height:100%;
    	float: left;
    	background-color: #fff;
	}
	.petchk{
		float:left;
	    color: white;
	    font-size: 15px;
	}
	
	.pordCheck{
		width: 850px;
		margin: auto;
   		margin-top: 15px;
   		padding: 10px;
   		background-color: #f1f1f1;
   		border: 1px solid darkgray;
	}
	
	.chk{
		height: 30px;
	}
	
	.chkName{
		width: 65px;
	    height: 26px;
	    float: left;
	    background: darkgray;
	    border: 1px solid white;
	    border-radius: 5px;
	    display: flex;
    	justify-content: center;
    	align-items: center;
	}
	
	.ageChk {
		floot:left;
	}
	
	.ageChk ul li{
		padding: 6px 5px 0px 5px;
    	float: left;
    	font-size: 13px;
	}
	
	.prodMenu{
		width: 870px;
	    margin: auto;
	    text-align:center;
	    margin-top: 15px;
	    border-bottom: 1px solid #efefef;
    	overflow: hidden;
    	padding-bottom: 20px;
	}
	
	.prodMenu ul {
		display:block;
		width:813px;
		padding:10px;
		margin:auto;
	}
	
	.prodMenu ul li {
		padding-left: 11px;
		float: left;
	}
	
	.page{
		display:flex;
		justify-content:center;
		align-items:center;
		height: 45px;
	}
	
	.page ul{
	}
	
	.page ul li {
		float:left;
	}
	
	.chkbox {
		margin-top: 0px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/view/petshop/petShopH.jsp"%>
		
	<div id="maintop">
		<p>강아지</p>
	</div>
	
	<div id="mainmid">
		<div class ="mainleft">
			<div class="listSearch">
				<input type="text" id="shopSearch" value="검색어를 입력하세요" onfocus="this.value=''" style="color:#c1c1c1" />
				<a href="#"></a>
			</div>
			<div class="listMenu">
				<p>Menu</p>
				<ul>
					<c:forEach items="${pddList }" var="list">
						<li><a href="/shop/petShopList?pdd_id=${list.pdd_id}&pdd_am=${list.pdd_am}">${list.pdd_name }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<div class="mainright">
			<div class="pordCheck">
				<div class="chk">
					<div class="chkName">
						<span class="petchk">브랜드</span>
					</div>
					<c:forEach items="${brdList}" var="list">
						<div class="ageChk">
							<ul>
								<li><input type="checkbox" class="chkbox"><span>${list.brd_name }</span></li>
							</ul>
						</div>
					</c:forEach>
				</div>
				<c:if test="${ageList != null}">
					<div class="chk">
						<div class="chkName">
								<span class="petchk">연령</span>
						</div>
						<c:forEach items="${ageList}" var="list">
							<div class="ageChk">
								<ul>
									<li><input type="checkbox" class="chkbox"><span>${list.page_name }</span></li>
								</ul>
							</div>
						</c:forEach>
					</div>
				</c:if>
			</div>
			
			<div class="prodMenu">
				<ul>
					<c:forEach items="${prodList }" var = "list">
						<li>
							<a href="/shop/prodDetail?prod_id=${list.prod_id }">
								<img src="${list.prod_pimg }" width="250" height="250">
							<br>
							<span>${list.prod_name }</span>
							<br>
							<span>${list.prod_price }원</span>
							<span>${list.prod_sprice }원</span>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="page">
				<ul>
					<li><a href="#">1</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- footer 시작 -->
	<%@include file="/WEB-INF/view/common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>