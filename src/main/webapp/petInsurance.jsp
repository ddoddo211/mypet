<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		$('.mainmenu-li').mouseenter(function() {
			//$(this).find('.submenu').removeClass('hidden'); 
			if (!$($(this).find('.submenu')).is(':animated'))
				$(this).find('.submenu').slideDown('fast');
		});

		$('.mainmenu-li').mouseleave(function() {
			//$(this).find('.submenu').addClass('hidden'); 
			$(this).find('.submenu').slideUp('fast');
		});
	});
</script>

<title>main.jsp</title>

<style type="text/css">

<%@include file ="/css/commonCss.css"%>

.mainmenu-ul {
	list-style: none;
	margin: 0px;	
}

.mainmenu-li {
	background-color: #7c6ee9;
	width: 120px;
	float: left;
	padding: 0px;
	margin: 0px;
	margin-top: 20px;
	margin-left: 5px;
	color: white;
	text-align: center;
	border-radius:50px;
	padding: 7px;
	border:1px solid #7c6ee9;
}

.mainmenu-li:hover{
	color: black;
	background-color: white;
	border:1px solid #7c6ee9;
	width: 120px;
}

#mainmenu-li1{
	margin-left: 60px;
}

#logo{
 margin-bottom: 6px;
}

</style>
</head>
<body>
<!-- header 시작 -->
<%@include file="/common/header.jsp"%>
<!-- header 끝-->
	
	<!-- 공동적인 부분 끝-->
	
	<!-- 각자 화면 -->
	<!-- header -->
	<div id="header">
	
		<!-- main -->
		
		<!-- main logo -->
		<div id="logo">
			<img alt="이미지가 없습니다" src="/img/petInsuranceLogo2.jpg" width="200px;">
		</div>
		
		<!-- menubar -->
		<div class="panel panel-info">
			<div class="panel-body">
				<div class="mainmenu">
					<ul class="mainmenu-ul">
						<li class="mainmenu-li" id="mainmenu-li1">펫 보험소개</li>
						<li class="mainmenu-li">보험상품</li>
						<li class="mainmenu-li">플랜정보</li>
						<li class="mainmenu-li">보상안내</li>
						<li class="mainmenu-li">나의 펫보험</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- menubar 끝 -->
		
	</div>
	
<!-- footer 시작 -->
<%@include file="/common/footer.jsp"%>
<!-- footer 끝 -->
		
</body>

</html>
