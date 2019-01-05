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
	
	// 글씨가 나왔다가 사라지게 만들기

	var element = $(".blink");
		var shown = true;

		setInterval(toggle, 800);

		function toggle() {
			if (shown) {
				element.hide();
				shown = false;
			} else {
				element.show();
				shown = true;
			}
		}

	});
	
</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<body>

<!-- header 시작 -->
<%@include file="../common/header.jsp"%>
<!-- header 끝-->

	<div id="main">
		<div id="adminMain">
			<div id="adminMain2_1">
				<!-- 관리자 메뉴 화면 -->
				<%@include file="adminHeader.jsp"%>
				
				<div id="adminMain2_1_1">
					<div id="adminMain2_1_1_1">
						<span class="blink" id="fontChange">"마이펫"</span>
					</div>
					<div id="adminMain2_1_1_2">
						<span class="blink" id="fontChange2">관리자 페이지 입니다.</span>
					</div>
				</div>

				<div id="adminMain2_1_2">
					<img id="adminMain2_1_2" alt="펫메인 화면" src="/img/admin/petMain2.jpg">
				</div>

			</div>
		</div>

	</div>


	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>