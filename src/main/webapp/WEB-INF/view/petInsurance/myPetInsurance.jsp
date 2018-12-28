<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPetInsurance.jsp(나의 펫 보험)</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	

});

function gopetInsert(){
	location.href ='/isr/petInsert2';
}
</script>

<link rel="stylesheet" href="/css/petInsuranceMenu.css">
<link href="/css/commonCss.css" rel="stylesheet">
<link rel="stylesheet" href="/css/petInsurance.css">

</head>
<body>


<!-- header 시작 -->
<%@include file="../common/header.jsp"%>
<!-- header 끝-->

	<div id="headerMain">
		<!-- main content -->
			<div id="header">
				<%--main --%>
				<div id="logo">
					<a href="/common/main.jsp"><img alt="이미지가 없습니다" src="/img/petInsuranceLogo2.jpg" width="200px;"></a>
				</div>
				<div id="petSearch">
					<div id="word">
						<input type="text" id="search" value="검색어를 입력하세요" onfocus="this.value=''" style="color:#c1c1c1" />
					</div>
					<div id="searchButton">
						<a href="#" id="searchButton"></a>
					</div>
				</div>
				
				<!-- 우리 아이 등록하기 -->
				<div id="petInsert">
					<a href="#"><img alt="이미지가 없습니다" src="/img/petInsert.jpg" width="240px;" height="100px;"></a>
				</div>
			</div>
	</div>
	
<div id="main">	
	<!-- 여기부터 나의 body -->

		<!-- petInsuranceHeaderMain -->
		<%@include file="./petInsuranceHeaderMain.jsp"%>
		<!-- petInsuranceHeaderMain 끝 -->
		
		<div id="mypetPage">
			<div id="mypetPageTitle">
				<div id="mypetPageTitle1">
					나의 펫 보험
				</div>
			</div>
			<div id="mypetPage1">
				<div id="mypetPage2">
					<div id="mypetPage2_1">
						등록되어 있는 나의 펫					
					</div>
					<div id="mypetPage2_1_1">
						펫을 클릭하시면 펫의 정보를 보실수 있습니다.				
					</div>
					<div class="mypetPage2_2">
						<input type="button" value="펫 추가하기" id="mypetPage2_2_1" onclick="gopetInsert()">					
					</div>
					
					<div id="mypetPage2_3">
						<c:forEach items="${mypetList}" var="pet">
							<div class="mypetPage2_3_1"><img class="petImg" alt="이미지가 없습니다" src="${pet.myp_img}"></div>
							<div class="mypetPage2_3_2">
								${pet.myp_name}
							</div>
						</c:forEach>
					</div>
				</div>
				<div id="mypetPage3">
					<div id="mypetPage3_1">
					
					</div>
				</div>
			</div>
		</div>
		
	
			
			

</div>
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->

</body>

</html>