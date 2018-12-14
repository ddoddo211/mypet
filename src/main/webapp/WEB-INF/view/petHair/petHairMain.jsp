<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link  href="/css/petHair.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>
	<!-- header 시작 -->
	<%@include file="../common/header.jsp"%>
	<!-- header 끝-->
	
	<!-- header 시작 -->
	<%@include file="petHairHeader.jsp"%>
	<!-- header 끝-->
	
	<%-- 전체 틀 div --%>
	<div id="mainmid">
		
		<%-- 상단 주소 선택 div --%>
		<div id="shopAddr">
			<div id="zipMent"><div class="innerMent">지역을 선택해 주세요</div> <div class="innerMent"><img src="/img/petHair/arrowO.jpg"/></div> </div>
			
			<div id="zipCon">
				<select  class="zipSelect" name="zip_high">
					<option value="">:: 광역(특별)시 / 도 :: </option>
				</select>
				
				<select class="zipSelect" name="zip_low"> 
					<option value=""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :: 구  / 시 :: </option>
				</select>
			</div>
		</div>
		
		<%-- 왼쪽에 쭉 내려줄 미용실 list div --%>
		<div id="shopList">
		shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>
		shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>
		shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>
		shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>
		shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>
		shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>
		shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>
		shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>
		shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>
		shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>
		shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>shoplist<br>
		</div>
		
		<%-- 오른쪽에 클릭한 미용실의 요약정보를 보여주는 div --%>
		<div id="shopDetail">
		shopdetail
		</div>
		
	</div>
	
	
	<!-- footer 시작 -->
	<%@include file="../common/footer.jsp"%>
	<!-- footer 끝 -->


</body>
</html>