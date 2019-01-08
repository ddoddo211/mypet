<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/commonCss.css" rel="stylesheet">
<link href="/css/petShopCss.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
	#maintop{
		width: 1200px;
		margin: 0 auto;
		
	}
	
	#maintop p {
		font-size: 20px;
		font-weight: bold;
		padding-bottom : 10px;
		color : #000;
		border-bottom: 1px solid #000;
	}
	
	#mainmid{
		width: 1200px;
		margin:0 auto;
		min-height:626px;
	}
	
	#mainmid > ul {
		margin: 0 auto;
	    width: 1200px;
	    padding-top: 20px;
	    overflow: hidden;
	    text-align: center;
	    margin-left: 23px;
	}
	
	#mainmid > ul > li {
		float: left;
	    margin-left: 15px;
	    margin-top: 15px;
	    width: 210px;
	    height: 270px;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/view/petshop/petShopH.jsp"%>
	
	
	
	<div id="maintop">
		<p>Best30</p>
	</div>
	
	<div id="mainmid">
		<ul>
			<c:forEach items="${bestList }" var="list">
				<c:choose>
					<c:when test="${list.rownum < 6 }">
						<li>
							<a href="/shop/prodDetail?prod_id=${list.prod_id }">
								<img src="${list.prod_pimg }"height="250" width="210">
								<span class="bestA">${list.prod_name }</span>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="/shop/prodDetail?prod_id=${list.prod_id }">
								<img src="${list.prod_pimg }"height="250" width="210">
								<span class="bestA">${list.prod_name }</span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
	</div>
	
	
	
<!-- footer 시작 -->
<%@include file="/WEB-INF/view/common/footer.jsp"%>
<!-- footer 끝 -->
</body>
</html>