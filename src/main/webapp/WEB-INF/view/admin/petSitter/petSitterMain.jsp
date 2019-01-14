<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petSitterMain(관리자용 펫시터 메인화면)</title>
<!-- 결재 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		getMypageADReservation(1);
	});
	
	function getMypageFaq(){
		$.ajax({
			type : "POST",
			url  : "/sit/mypageFaqAjaxHtml",
			success : function(dt){
				$("#mypage2").html("");
				$(".pagination2").html("");
				$("#mypage").html(dt);
			}
		});
	}
	
	function getFaqDelete(faq_id){
		$.ajax({
			type : "POST",
			url  : "/sit/mypageFaqDelete",
			data : "faq_id="+faq_id,
			success : function(dt){
				$("#mypage2").html("");
				$(".pagination2").html("");
				$("#mypage").html(dt);
			}
		});
	}
	
	function reservationDelete(date){
		$.ajax({
			type : "POST",
			url  : "/sit/mypageReservationDelete",
			data : "date="+date,
			success : function(dt){
				$("#mypage2").html("");
				$(".pagination2").html("");
				getMypageADReservation(1);
			}
		});
	}
	
	function fileDownload(fileName){
		$.ajax({
			type : "POST",
			url  : "/sit/supportPDFfileViewer",
			data : "fileName="+fileName,
			success : function(dt){
				$("#mypage2").html("");
				$(".pagination2").html("");
				$("#mypage").html(dt);
			}
		});
	}
	
	function getMypageADReservation(page){
		var pageSize = 10;
		$.ajax({
			type : "POST",
			url  : "/sit/mypageADReservationAjaxHtml",
			data : "page="+page+"&pageSize="+pageSize,
			success : function(dt){
				$("#mypage2").html("");
				$(".pagination2").html("");
				$("#mypage").html(dt);
				getMypageADReservationPage(page);
			}
		});
	}
	
	function getMypageADReservationPage(page){
		var pageSize = 10;
		$.ajax({
			type : "POST",
			url  : "/sit/mypageADReservationPageAjaxHtml",
			data : "page="+page+"&pageSize="+pageSize,
			success : function(dt){
				$("#mypage2").html("");
				$(".pagination2").html("");
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
				$("#mypage2").html("");
				$(".pagination2").html("");
				$("#mypage").html(dt);
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
				$("#mypage2").html("");
				$(".pagination2").html("");
				$(".pagination").html(dt);
			}
		});
	}
	
	function supportPDF(staId, sta_mem, page){
		var pageSize = 10;
		$.ajax({
			type : "POST",
			url  : "/sit/supportPDF",
			data : "page="+page+"&pageSize="+pageSize+"&staId="+staId+"&sta_mem="+sta_mem,
			success : function(dt){
				$("#mypage2").html("");
				$(".pagination2").html("");
				getMypageADSupport(page);
			}
		});
	}
	
	function getMypageADNotice(page){
		var pageSize = 5;
		$.ajax({
			type : "POST",
			url  : "/sit/mypageADNoticeAjaxHtml",
			data : "page="+page+"&pageSize="+pageSize,
			success : function(dt){
				$("#mypage").html(dt);
				getMypageADNoticePage(page);
			}
		});
	}
	
	function getMypageADNoticePage(page){
		var pageSize = 5;
		$.ajax({
			type : "POST",
			url  : "/sit/mypageADNoticePageAjaxHtml",
			data : "page="+page+"&pageSize="+pageSize,
			success : function(dt){
				$(".pagination").html(dt);
			}
		});
	}
	
	function deleteReview(stv_id, page){
		var pageSize = 5;
		$.ajax({
			type : "POST",
			url  : "/sit/mypageDeleteReview",
			data : "stv_id="+stv_id+"&page="+page+"&pageSize="+pageSize,
			success : function(dt){
				getMypageADNotice(page);
			}
		});
	}
	
	function getMypageSitterTo(page){
		var pageSize = 5;
		$.ajax({
			type : "POST",
			url  : "/sit/mypageSitterToAjaxHtml",
			data : "page="+page+"&pageSize="+pageSize,
			success : function(dt){
				$("#mypage2").html(dt);
				getMypageSitterToPage(page);
			}
		});
	}
	
	function getMypageSitterToPage(page){
		var pageSize = 5;
		$.ajax({
			type : "POST",
			url  : "/sit/mypageSitterToPageAjaxHtml",
			data : "page="+page+"&pageSize="+pageSize,
			success : function(dt){
				$(".pagination2").html(dt);
			}
		});
	}
	
	function deleteSitterTo(pst_id, page){
		var pageSize = 5;
		$.ajax({
			type : "POST",
			url  : "/sit/mypageDeleteSitterTo",
			data : "page="+page+"&pageSize="+pageSize+"&pst_id="+pst_id,
			success : function(dt){
				$("#mypage2").html("");
				$(".pagination2").html("");
				getMypageSitterTo(page);
			}
		});
	}
	
	function getMypagePetListAll(page){
		var pageSize = 8;
		$.ajax({
			type : "POST",
			url  : "/sit/mypagePetListAll",
			data : "page="+page+"&pageSize="+pageSize,
			success : function(dt){
				$("#mypage2").html("");
				$(".pagination2").html("");
				$("#mypage").html(dt);
				getMypagePetListAllPage(page);
			}
		});
	}
	
	function getMypagePetListAllPage(page){
		var pageSize = 8;
		$.ajax({
			type : "POST",
			url  : "/sit/mypagePetListAllPage",
			data : "page="+page+"&pageSize="+pageSize,
			success : function(dt){
				$("#mypage2").html("");
				$(".pagination2").html("");
				$(".pagination").html(dt);
			}
		});
	}
	
	function deletePet(page, myp_id){
		var pageSize = 8;
		$.ajax({
			type : "POST",
			url  : "/sit/mypageDeletePet",
			data : "page="+page+"&pageSize="+pageSize+"&myp_id="+myp_id,
			success : function(dt){
				getMypagePetListAll(page);
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
	
	function adNotice(){
		getMypageADNotice(1);
		getMypageSitterTo(1);
	}
	
	function admypet(){
		getMypagePetListAll(1);
	}

</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

<style type="text/css">
.adpetSitterMenu {
	width: 150px;
	height: 30px;
	line-height: 30px;
	font-size: 18px;
	font-family: 'Jeju Gothic', sans-serif;
	text-align: center;
	float: left;
	margin-right: 20px;
	margin-left: 20px;
	background-color: #565656;
	border-radius: 10px;
	color: white;
	outline: none;
	cursor: pointer;
}

#main {
	width: 1200px;
	margin: 0 auto;
	margin-bottom: 20px;
	min-height: 820px;
}

#mypage {
	width: 100%;
	margin-top: 30px;
}

#mypage2 {
	width: 100%;
	margin-top: 30px;
}

#reservationTable {
	margin-top: 10px;
	width: 100%;
	border-collapse: collapse;
}

.th {
	border: 1px solid #d1d1d1;
	font-size: 20px;
	background-color: #fff3f3;
}

.td {
	border: 1px solid #d1d1d1;
	text-align: center;
	vertical-align: middle;
	font-size: 14px;
	height: 30px;
}

.mypageBtn {
	width: 120px;
	height: 40px;
	border: 1px solid black;
	background-color: #000;
	color: #fff;
	font-size: 16px;
	border-radius: 15px;
	box-shadow: 2px 2px #a1a1a1;
	outline: none;
}

.mypageBtn:active {
	width: 120px;
	height: 40px;
	border: 1px solid #a1a1a1;
	background-color: #a1a1a1;
	color: #fff;
	font-size: 16px;
	border-radius: 15px;
	box-shadow: 2px 2px #000;
	outline: none;
}

.pagination {
	padding: 0;
	font-family: 'Work Sans', sans-serif;
	font-size: 20px;
	text-align: center;
}

.pagination>li {
	display: inline-block;
}

.pagination>li>a {
	float: left;
	margin: 0 auto;
}

.pagination2 {
	padding: 0;
	font-family: 'Work Sans', sans-serif;
	font-size: 20px;
	text-align: center;
}

.pagination2>li {
	display: inline-block;
}

.pagination2>li>a {
	float: left;
	margin: 0 auto;
}
</style>

</head>
<body>

<!-- header 시작 -->
<%@include file="../../common/header.jsp"%>
<!-- header 끝-->

<div id="main">	
	<div id="adminMain">
		<!-- 관리자 메뉴 -->
		<%@include file="../adminHeader.jsp"%>
		<div id="insTitle">펫 시터 관리자용</div>
		<div id="insMenu">
			<div>
				<input class="adpetSitterMenu" id="insMenu3" onclick="adreserv()" type="button" value="1.예약관리">
			</div>
			<div>
				<input class="adpetSitterMenu" type="button" onclick="faq()" value="2.FAQ관리">
			</div>
			<div>
				<input class="adpetSitterMenu" type="button" onclick="adSupport()" value="3.펫시터 지원관리">
			</div>
			<div>
				<input class="adpetSitterMenu" type="button" onclick="adNotice()" value="4.게시글 관리">
			</div>
			<div>
				<input class="adpetSitterMenu" type="button" onclick="admypet()" value="5.반려동물관리">
			</div>
		</div>
	</div>
	
	<div id="mypage">
	
	</div>
	
	<div id="mypage2">
	
	</div>
</div>
	
	
<!-- footer 시작 -->
<%@include file="../../common/footer.jsp"%>
<!-- footer 끝 -->

</body>
</html>