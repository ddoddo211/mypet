<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>support.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="/css/commonCss.css" rel ="stylesheet">
<link href="/css/petSitter.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Work+Sans" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	$(document).ready(function(){
		if(${memVo.mem_id == null}){
			alert("로그인이 되어있지 않습니다.");
			history.back();
		}
	});
	
</script>
<style type="text/css">
	#mypageMain{
		width : 100%;
		margin : 0 auto;
		border : 1px solid blue;
		overflow : hidden;
	}
	
	#mypageLeft{
		border : 1px solid #c1c1c1;
		width : 25%;
		min-height : 658px; 
		float: left;
	}
	
	#mypageRight{
		border : 1px solid pink;
		width : 72%;
		min-height : 658px; 
		margin-left : 25px;
		float : left;
	}
	
	#profile{
		width : 100%;
		overflow : hidden;
		background-color : #f1f1f1;
		border-bottom : 1px solid #c1c1c1;
		padding-top : 10px;
	}
	
	#profileImg{
		width : 50%;
		height : 150px;
		border-radius: 50%;
		overflow : hidden;
		margin : 0 auto;
	}
	
	#proImg{
		width : 100%;
		height : 150px;
	}
	
	#profileInfo{
		margin : 0 auto;
		width : 90%;
		text-align: center;
		height : 50px;
		margin-top : 10px;
		margin-bottom : 20px;
	}
	
	#profileInfo > span{
		font-family: 'Work Sans', sans-serif;
		font-size : 24px;
	}
	
	#menuList {
		width : 90%;
		margin : 0 auto;
	}
	
	.menu{
		border : 1px solid black;
		width : 100%;
		margin-bottom : 10px;
		text-align: center;
	}
	
	.menu > span {
		font-size : 20px;
		font-family: 'Work Sans', sans-serif;
	}
</style>
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
	<div id="body">
		<div id="petSitterMenu">
			<%@include file="/WEB-INF/view/petSitter/petSitterMenu.jsp" %>
		</div>
		
		<div id="mypageMain">
			<div id="mypageLeft">
				<div id="profile">
					<div id="profileImg">
						<img src="/img/member/kanghanna.jpg" id="proImg" />
					</div>
					<div id="profileInfo">
						<span>${memVo.mem_name }</span>
					</div>				
				</div>
				<div id="menuList">
					<div class="menu">
						<span>예약 내역 관리</span>
					</div>
					<div class="menu">
						<span>포인트 관리</span>
					</div>
					<div class="menu">
						<span>게시글 관리</span>
					</div>
				</div>
			</div>
			<div id="mypageRight">
				
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>