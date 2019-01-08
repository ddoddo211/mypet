<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petInsuranceMain(관리자용 펫보험 메인화면)</title>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

//보험상품 관리 버튼을 클릭하였을때  보험상품 관리 화면으로 이동
function goProdManager(){
	location.href ='/isr/goProdManager';
}

//보험신청/가입자 관리 버튼을 클릭하였을때  보험신청/가입자 관리 화면으로 이동
function goApplyJoin(){
	location.href ='/isr/goApplyJoinManager';
}

//보험 청구 버튼을 클릭하였을때  보험신청/가입자 관리 화면으로 이동
function goClaim(){
	location.href ='/isr/goClaim';
}

// 공지사항 관리 버튼을 클릭하였을때 공지사항 관리 화면으로 이동
function goNoticeBoard(){
	location.href ='/isr/goNoticeBoard';
}

</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<body>

<!-- header 시작 -->
<%@include file="../../common/header.jsp"%>
<!-- header 끝-->

<div id="main">	

	<div id="adminMain">
		<!-- 관리자 메뉴 -->
		<%@include file="../adminHeader.jsp"%>
		
		<!-- 입력하여 content 넣는 부분 -->
			<div id="insTitle">
				펫 보험 관리자용
			</div>
			<div id="insTitle2">
				원하시는 항목의 버튼을 클릭하시면 이동됩니다.
			</div>
		
			<div id="adminInsMenu">
				<div id="adminInsMenu1">
					<div id="adminInsMenu1_1">
						<div class="adminInsMenu2">
							<input type="button" class="prodManagement" onclick="goProdManager()" value="보험 상품 관리">
						</div>
						<div class="adminInsMenu2">
							<input type="button" class="prodManagement" onclick="goApplyJoin()" value="보험 신청 /가입자 관리">
						</div>
						<div class="adminInsMenu2">
							<input type="button" class="prodManagement" onclick="goClaim()" value="보험금 청구 /입금 관리">
						</div>
						<div class="adminInsMenu2">
							<input type="button" class="prodManagement" onclick="goNoticeBoard()" value="보험 공지사항 관리">
						</div>
					</div>				
				</div>
			</div>
			
		
	</div>

</div>
	
	
	<!-- footer 시작 -->
	<%@include file="../../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>