<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="/css/commonCss.css" rel ="stylesheet">
<link href="/css/petSitter.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Work+Sans" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	$(document).ready(function(){
		var memId = "${memVo.mem_id}";
		if(memId == ""){
			alert("로그인이 되어있지 않습니다.");
			history.back();
		}
		
		if(memId == "admin"){
			getMypageADReservation(1);
		} else{
			getMypageReservation();
		}
		
		
	});
	<%-- 일반,펫시터 마이페이지 화면 --%>
	function getMypageReservation(){
		$.ajax({
			type : "POST",
			url  : "/sit/mypageReservationAjaxHtml",
			success : function(dt){
				$("#mypageRight").html(dt);
			}
		});
	}
	
	function getMypageNotice(){
		$.ajax({
			type : "POST",
			url  : "/sit/mypageNoticeAjaxHtml",
			success : function(dt){
				$("#mypageRight").html(dt);
			}
		});
	}
	
	
	
	function getMypageMypet(){
		$.ajax({
			type : "POST",
			url  : "/sit/mypageMypetAjaxHtml",
			success : function(dt){
				$("#mypageRight").html(dt);
			}
		});
	}
	
	function getMypageSupport(){
		$.ajax({
			type : "POST",
			url  : "/sit/mypageSupportAjaxHtml",
			success : function(dt){
				$("#mypageRight").html(dt);
			}
		});
	}
	
	function supportDelete(sta_id){
		$.ajax({
			type : "POST",
			url  : "/sit/supportCancle",
			data : "sta_id="+sta_id,
			success : function(dt){
				$("#mypageRight").html(dt);
			}
		});
	}
	
	function mypetDelete(mypet_id){
		$.ajax({
			type : "POST",
			url  : "/sit/mypetDel?cnt=1",
			data : "mypet_id="+mypet_id,
			success : function(dt){
				$("#mypageRight").html(dt);
			}
		});
	}
	
	function reserv(){
		getMypageReservation();
	}
	
	function notice(){
		getMypageNotice();
	}
	
	function mypet(){
		getMypageMypet();		
	}
	
	function Support(){
		getMypageSupport();
	}
	
	<%-- 관리자 마이페이지 화면 --%>
	function getMypageFaq(){
		$.ajax({
			type : "POST",
			url  : "/sit/mypageFaqAjaxHtml",
			success : function(dt){
				$("#mypageRight").html(dt);
			}
		});
	}
	
	function getFaqDelete(faq_id){
		$.ajax({
			type : "POST",
			url  : "/sit/mypageFaqDelete",
			data : "faq_id="+faq_id,
			success : function(dt){
				$("#mypageRight").html(dt);
			}
		});
	}
	
	function fileDownload(fileName){
		$.ajax({
			type : "POST",
			url  : "/sit/supportPDFfileViewer",
			data : "fileName="+fileName,
			success : function(dt){
				$("#mypageRight").html(dt);
			}
		});
	}
	
	function getMypageADReservation(page){
		var pageSize = 5;
		$.ajax({
			type : "POST",
			url  : "/sit/mypageADReservationAjaxHtml",
			data : "page="+page+"&pageSize="+pageSize,
			success : function(dt){
				$("#mypageRight").html(dt);
				getMypageADReservationPage(page);
			}
		});
	}
	
	function getMypageADReservationPage(page){
		var pageSize = 5;
		$.ajax({
			type : "POST",
			url  : "/sit/mypageADReservationPageAjaxHtml",
			data : "page="+page+"&pageSize="+pageSize,
			success : function(dt){
				$(".pagination").html(dt);
			}
		});
		
	}
	
	function getMypageADSupport(page){
		var pageSize = 10;
		$.ajax({
			type : "POST",
			url  : "/sit/mypageADSupportAjaxHtml",
			data : "page="+page+"&pageSize="+pageSize,
			success : function(dt){
				$("#mypageRight").html(dt);
				getMypageADSupportPage(page);
			}
		});
	}
	
	function getMypageADSupportPage(page){
		var pageSize = 10;
		$.ajax({
			type : "POST",
			url  : "/sit/mypageADSupportPageAjaxHtml",
			data : "page="+page+"&pageSize="+pageSize,
			success : function(dt){
				$(".supPage").html(dt);
			}
		});
	}
	
	function faq(){
		getMypageFaq();
	}
	
	function adreserv(){
		getMypageADReservation(1);
	}
	
	function adSupport(){
		getMypageADSupport(1);
	}
	
	
</script>
<style type="text/css">
	#mypageMain{
		width : 100%;
		margin : 0 auto;
		overflow : hidden;
	}
	
	#mypageLeft{
		border : 1px solid #c1c1c1;
		width : 25%;
		min-height : 658px; 
		float: left;
		background-color : #f1f1f1;
	}
	
	#mypageRight{
		width : 72%;
		min-height : 658px; 
		margin-left : 25px;
		float : left;
	}
	
	#profile{
		width : 100%;
		overflow : hidden;
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
		border-bottom : 1px solid black;
		width : 100%;
		margin-top : 20px;
		text-align: center;
		cursor: pointer;
	}
	
	.menu > span {
		font-size : 20px;
		font-family: 'Work Sans', sans-serif;
	}
	
	#reservationTable{
		width : 100%;
		border-collapse : collapse;
	}
	
	.th {
		border : 1px solid #d1d1d1;
		font-size : 20px;
		background-color: #fff3f3;
	}
		
	.td {
		border : 1px solid #d1d1d1;
		text-align: center;
		vertical-align: middle;
		font-size : 16px;
		height : 30px;
	}
	
	.mypageBtn{
		width : 100px;
		height : 40px;
		border : 1px solid black;
		background-color: #000;
		color : #fff;
		font-size : 16px;
		border-radius: 15px;
		box-shadow: 2px 2px #a1a1a1;
		outline: none;
	}
	
	.mypageBtn:active{
		width : 100px;
		height : 40px;
		border : 1px solid #a1a1a1;
		background-color: #a1a1a1;
		color : #fff;
		font-size : 16px;
		border-radius: 15px;
		box-shadow: 2px 2px #000;
		outline: none;
	}
	.pagination{
  	padding : 0;
  	font-family: 'Work Sans', sans-serif;
  	font-size : 20px;
  	text-align: center;
  }
  
  .pagination > li {
  	display: inline-block;
  }
  
  .pagination > li > a {
  	float : left;
  	margin : 0 auto;
  }
  
  .supPage{
  	padding : 0;
  	font-family: 'Work Sans', sans-serif;
  	font-size : 20px;
  	text-align: center;
  }
  
  .supPage > li {
  	display: inline-block;
  }
  
  .supPage > li > a {
  	float : left;
  	margin : 0 auto;
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
					<c:choose>
						<c:when test="${memVo.mem_id == 'admin' }">
							<div class="menu">
								<span onclick="adreserv()">예약 관리</span>
							</div>
							<div class="menu"> 
								<span onclick="faq()">FAQ 관리</span>
							</div>
							<div class="menu">
								<span onclick="adSupport()">펫시터 지원 관리</span>
							</div>
							<div class="menu">
								<span onclick="adnotice()">게시글 관리</span>
							</div>
							<div class="menu">
								<span onclick="admypet()">반려동물 관리</span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="menu">
								<span onclick="reserv()">예약 관리</span>
							</div>
							<div class="menu">
								<span onclick="notice()">게시글 관리</span>
							</div>
							<div class="menu">
								<span onclick="mypet()">반려동물 관리</span>
							</div>
							<div class="menu">
								<span onclick="Support()">펫시터 지원 관리</span>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div id="mypageRight">
				
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/view/common/footer.jsp" %>
</body>
</html>