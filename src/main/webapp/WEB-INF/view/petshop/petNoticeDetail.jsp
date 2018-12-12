<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script" rel="stylesheet">
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
		padding-bottom : 20px;
		border-bottom: 1px solid #000;
		color : #000;
	}
	
	#maintop .topMenu ul li{
		float: left;
		margin-top:10px;
		padding-left: 10px;
		font-size: 15px;
	}
	
	#mainmid {
		margin: 0 auto;
		width: 1200px;
		border-bottom: 1px solid #000;
	}
	#mainmid .snot_title{
		margin : 0 auto;
		padding : 10px 0px 10px 0px;
		font-size: 20px;
		float: left;
		width: 850px;
	}
	
	#mainmid .snot_date{
		margin : 0 auto;
		padding : 10px 0px 10px 0px;
		font-size: 20px;
	}
	
	 .title{
		background-color: #ff8800;
		border: 1px solid white;
		border-radius: 5px;
		color : white;
		font-size: 15px;
    	padding: 5px;
	}
	
	.title2{
		font-family: 'Nanum Pen Script', cursive;
		font-size: 25px;
	}
	
    #mainbottom{
		width : 1200px;
		margin : 0 auto;
	}
	
	.snot_text {
		margin-top: 10px;
	}
	
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/view/petshop/petShopH.jsp"%>
		
	<div id="maintop">
		<p>Event</p>
	</div>
	
	<div id="mainmid">
		<div>
			<div class ="snot_title">
				<span class = "title">제목</span>
				<span class="title2">${snotVo.snot_title }</span>
			</div>
			<div class="snot_date">
				<span class="title">이벤트 기간</span>
				<span class="title2">${snotVo.snot_date }</span>
			</div>
		</div>
	</div>
	
	<div id="mainbottom">
		<div class="snot_text">
			<img src="${snotVo.snot_dimg }">
		</div>
	</div>
	
	<!-- footer 시작 -->
	<%@include file="/WEB-INF/view/common/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>