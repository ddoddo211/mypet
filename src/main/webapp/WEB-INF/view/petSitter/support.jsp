<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="/css/commonCss.css" rel ="stylesheet">
<link href="/css/petSitter.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	$(document).ready(function(){
		getSupportApplication();
		
	});

	function getSupportApplication(){
		$.ajax({
			type : "POST",
			url  : "/sit/supportApplicationAjaxHtml",
			success : function(dt){
				$("#supportApplication").html(dt);
			}
		});
	}
	
	
</script>
</head>
<body>
<%@include file="/WEB-INF/view/common/header.jsp"%>

<!-- 각자 화면 -->
	<div id="">
		<!-- header -->
		<div id="header">
			<!-- main -->
			<div id="logo">
				<a href="/petSitter.jsp"><img alt="이미지가 없습니다"
					src="/img/petSitterLogo2.jpg" width="200px;" /></a>
			</div>
			<div id="petSearch">
				<div id="word">
					<input type="text" id="search" value="검색어를 입력하세요" onfocus="this.value=''" style="color: #c1c1c1" />
				</div>
				<div id="searchButton">
					<a href="#" id="searchButton"></a>
				</div>
			</div>

			<!-- 우리 아이 등록하기 -->
			<div id="petInsert">
				<a href="#"><img alt="이미지가 없습니다" src="/img/petInsert.jpg"
					width="240px;" height="100px;"></a>
			</div>
		</div>
	</div>
	<div id="menu">
		<div id="petSitterMenu">
			<%@include file="/WEB-INF/view/petSitter/petSitterMenu.jsp" %>
		</div>
		
	</div>
	<div style="width:100%;">
		<div style="width:1200px; min-height:680px; margin:0 auto;">
			<div style="margin : 0 auto; width:800px; background-color: #fff; border : 1px solid #c1c1c1;">
				<div style="width:100%; text-align: center;">
					<span style="font-size:40px; font-weight: bold;">MYPET 펫시터 지원서</span>
				</div>
				<div style="height:5px; background-color: #000bff"></div>
				<form action="/sit/supportInsert" method="post" id="supportFrm">
					<input type="hidden" id="memName" name="memName" />
					<input type="hidden" id="memTel" name="memTel" />
					<input type="hidden" id="memBirth" name="memBirth" />
					<input type="hidden" id="memAddr" name="memAddr" />
					<input type="hidden" id="memJob" name="memJob" />
					<input type="hidden" id="memQna1" name="memQna1" />
					<input type="hidden" id="memQna2" name="memQna2" />
					<input type="hidden" id="memQna3" name="memQna3" />
					<input type="hidden" id="memQna4" name="memQna4" />
					<input type="hidden" id="memQna5" name="memQna5" />
					<div id="supportApplication" style="width:100%; overflow: hidden;">
							
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>