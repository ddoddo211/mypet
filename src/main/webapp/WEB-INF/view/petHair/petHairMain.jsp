<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link  href="/css/petHair.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		
		//대분류 값변화시 소분류 목록을 불러오기위해 form 태그 발동
		$("#zipHigh").change(function(){
			$("#hiddenZipInput").val(
				$("#zipHigh").val()		
			);
			
			$("#zipfrm").submit();
			
		});
		
		
		//소분류를 선택하면 그 지역의 전체 목록이 출력된다
		$("#zipLow").change(function(){
			
			
		});
		
	});

</script>

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
	
	<%-- 주소 데이터 전송  hidden form--%>
	<form id="zipfrm" action="/hair/selectLow" method="post">
		<input type="hidden" name="zip_high" id="hiddenZipInput"/>
	</form>
	
		
		<%-- 상단 주소 선택 div --%>
		<div id="shopAddr">
			<div id="zipMent"><div class="innerMent">지역을 선택해 주세요</div> <div class="innerMent"><img src="/img/petHair/arrowO.jpg"/></div> </div>
			
			<div id="zipCon">
				<select id="zipHigh"  class="zipSelect" name="zip_high">
					<option value="">:: 광역(특별)시 / 도 :: </option>
					<c:forEach items="${zipHighList }" var="zl">
						<c:choose>
							<c:when test="${zip_high==zl.zip_high }">
								<option value="${zl.zip_high }" selected="selected">${zl.zip_high }</option>
							
							</c:when>
							
							<c:otherwise>
								<option value="${zl.zip_high }">${zl.zip_high }</option>
							
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				
				<select id="zipLow" class="zipSelect" name="zip_low"> 
					<option value=""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :: 구  / 시 :: </option>
					<c:forEach items="${zipLowList }" var="zll">
						<option value="${zll.zip_low }">${zll.zip_low }</option>
					</c:forEach>
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