<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 해당 화면에서 페이지를 선택하는지 확인하는 부분 -->

<!-- 보험상품 전체 뿌려주는부분 -->
<c:choose>
			<c:when test="${pageSelect == 0}">
				<!-- 화면에서 페이지수 나오는 부분  -->
				<c:forEach begin="1" end="${pageCnt }" var="page">
						<li><a href="javascript:getProdListHtml(${page});">${page}</a></li>
				</c:forEach>
			</c:when>
</c:choose>

<!-- 조회조건을 주었을때 나오는 부분 -->
<c:choose>
			<c:when test="${pageSelect == 1}">
				<!-- 화면에서 페이지수 나오는 부분  -->
				<c:forEach begin="1" end="${pageCnt }" var="page">
						<li><a href="javascript:getProdKindPageListAjaxHtml(${page},'${petKind}',${pageSize});">${page}</a></li>
				</c:forEach>
			</c:when>
</c:choose>

<!-- 우리아이 보험추천 부분을 선택하였을때 -->
<c:choose>
			<c:when test="${pageSelect == 2}">
				<!-- 화면에서 페이지수 나오는 부분  -->
				<c:forEach begin="1" end="${pageCnt }" var="page">
						<li><a href="javascript:getProdRecommendation(${page},${pageSize},'${petKind}','${birth}','${petSick}');">${page}</a></li>
				</c:forEach>
			</c:when>
</c:choose>



