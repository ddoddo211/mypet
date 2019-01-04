<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 보험상품이 없을떄 설정 -->
<c:choose>
	<c:when test = "${pageSize == 0}">
		<tr class="tr1" >
			<td colspan="7">보험상품이 없습니다.</td>
		<tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${pageList}" var="prod">
			<tr class="tr1">
				<td>
					<input class="check" type="radio" name="prodSelect" value="${prod.insp_id}">
				</td>
				<c:choose>
					<c:when test = "${prod.insp_join == '강아지'}">
						<td><img alt="이미지가 없습니다" src="/img/petInsurance/petInfo.jpg" width="40px" height="40px">${prod.insp_join}</td>
					</c:when>
					<c:otherwise>
						<td><img alt="이미지가 없습니다" src="/img/petInsurance/petInfo2.jpg" width="40px" height="40px">${prod.insp_join}</td>
					</c:otherwise>
				</c:choose>
				<td>${prod.insp_kind}</td>
				<td><%="월 "%>${prod.insp_fees}<%="원"%></td>
				<td>${prod.insp_minage}<%="~"%>${prod.insp_maxage}<%="세"%></td>
				<td><%="가입부터 ~"%>${prod.insp_period}<%="세 까지"%></td>
				<td>${prod.insp_sick}</td>
				

				<c:choose>
					<c:when test="${prod.insp_del == 'Y'}">
						<td>보험상품 만료</td>
					</c:when>
					<c:otherwise>
						<td>가입가능</td>
					</c:otherwise>
				</c:choose>
				
				<td>가입자수</td>
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>

