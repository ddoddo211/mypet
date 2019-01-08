<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMain.jsp(관리자용 메인화면)</title>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	

	});
	
</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">
<link href="/css/admin.css" rel="stylesheet">

</head>
<body>

<!-- header 시작 -->
<%@include file="../../common/header.jsp"%>
<!-- header 끝-->

	<div id="main">
		<div id="adminMain">
			<div id="adminMain2_1">
				<!-- 관리자 메뉴 화면 -->
				<%@include file="../adminHeader.jsp"%>
				<div class="menuCtn">
				
					<div id="hairShopApply" class="prodManagement ttemp">
						펫 미용실 등록 관리
					</div>
	
					<div id="hairShopControll" class="prodManagement ttemp">
						펫 미용실 관리
					</div>
				</div>

			</div>
		</div>

	</div>


	<!-- footer 시작 -->
	<%@include file="../../common/footer.jsp"%>
	<!-- footer 끝 -->

<script type="text/javascript">
	$("#hairShopApply").click(function(){
		//미용실 등록관리 클릭
		
		
		location.href="/mem/petHairApplyCheck";
	});
	
	
	$("#hairShopControll").click(function(){
		//미용실 관리 클릭
		
		
		location.href="/mem/petHairCon";
	});
</script>

</body>

</html>